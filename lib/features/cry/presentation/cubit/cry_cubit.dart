import 'dart:async';
import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:rafiq_app/features/cry/data/models/cry_model.dart';
import 'package:rafiq_app/features/cry/data/repository/cry_repository.dart';
import 'package:record/record.dart';
import 'package:rafiq_app/core/errors/error_model.dart';

part 'cry_state.dart';

class CryCubit extends Cubit<CryState> {
  final CryRepository _repository;

  ///  FIX: Recorder واحد بس
  final AudioRecorder _recorder = AudioRecorder();

  Timer? _recordingTimer;
  int _elapsedSeconds = 0;
  String? _recordedFilePath;

  CryCubit(this._repository) : super(CryInitial());

  // ─────────────────────────────────────────────
  //  START RECORDING
  // ─────────────────────────────────────────────

  Future<void> startRecording() async {
    final status = await Permission.microphone.request();

    if (!status.isGranted) {
      emit(CryError("Microphone permission denied. Please allow access."));
      return;
    }

    try {
      final dir = await getTemporaryDirectory();
      _recordedFilePath =
          '${dir.path}/cry_${DateTime.now().millisecondsSinceEpoch}.m4a';

      await _recorder.start(
        const RecordConfig(
          encoder: AudioEncoder.aacLc,
          bitRate: 128000,
          sampleRate: 44100,
        ),
        path: _recordedFilePath!,
      );

      _elapsedSeconds = 0;
      emit(CryRecording(seconds: 0));

      _recordingTimer?.cancel();
      _recordingTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
        _elapsedSeconds++;
        emit(CryRecording(seconds: _elapsedSeconds));

        /// auto stop بعد 30 ثانية (اختياري)
        if (_elapsedSeconds >= 30) {
          stopAndAnalyze();
        }
      });
    } catch (e) {
      emit(CryError("Failed to start recording"));
    }
  }

  // ─────────────────────────────────────────────
  //  STOP + ANALYZE
  // ─────────────────────────────────────────────

  Future<void> stopAndAnalyze() async {
    _recordingTimer?.cancel();
    _recordingTimer = null;

    try {
      final path = await _recorder.stop();

      if (path == null || path.isEmpty) {
        emit(CryError("No audio recorded"));
        return;
      }

      emit(CryUploading());

      ///  TEMP FIX: لحد ما نربط Baby Profile
      const String tempChildId =
          "3fa85f64-5717-4562-b3fc-2c963f66afa6";

      final result = await _repository.analyzeCry(
        filePath: path,
        childId: tempChildId,
      );

      emit(CrySuccess(result));

      ///  delete file بعد الرفع
      final file = File(path);
      if (await file.exists()) {
        await file.delete();
      }
    } on ErrorModel catch (e) {
      emit(CryError(e.message));
    } catch (e) {
      emit(CryError("Analysis failed. Please try again."));
    }
  }

  // ─────────────────────────────────────────────
  //  CANCEL RECORDING
  // ─────────────────────────────────────────────

  Future<void> cancelRecording() async {
    _recordingTimer?.cancel();
    _recordingTimer = null;

    try {
      await _recorder.stop();
    } catch (_) {}

    _deleteRecordedFile();
    emit(CryInitial());
  }

  // ─────────────────────────────────────────────
  //  RESET
  // ─────────────────────────────────────────────

  void reset() {
    _recordingTimer?.cancel();
    _recordingTimer = null;
    _recordedFilePath = null;
    _elapsedSeconds = 0;
    emit(CryInitial());
  }

  // ─────────────────────────────────────────────
  //  DELETE FILE
  // ─────────────────────────────────────────────

  void _deleteRecordedFile() {
    if (_recordedFilePath != null) {
      final file = File(_recordedFilePath!);
      if (file.existsSync()) {
        file.deleteSync();
      }
      _recordedFilePath = null;
    }
  }

  // ─────────────────────────────────────────────
  //  CLOSE
  // ─────────────────────────────────────────────

  @override
  Future<void> close() async {
    _recordingTimer?.cancel();
    await _recorder.dispose();
    return super.close();
  }
}