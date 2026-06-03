import 'dart:async';
import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:record/record.dart';

import 'package:rafiq_app/features/cry/data/models/cry_model.dart';
import 'package:rafiq_app/features/cry/data/repository/cry_repository.dart';

part 'cry_state.dart';

class CryCubit extends Cubit<CryState> {
  final CryRepository _repository;

  final AudioRecorder _recorder = AudioRecorder();

  Timer? _recordingTimer;

  int _elapsedSeconds = 0;

  String? _recordedFilePath;

  CryCubit(this._repository) : super(const CryInitial());

  // ====================================================
  // START RECORDING
  // ====================================================

  Future<void> startRecording() async {
    try {
      final hasPermission = await _recorder.hasPermission();

      if (!hasPermission) {
        emit(const CryError('Microphone permission denied'));
        return;
      }

      final tempDir = await getTemporaryDirectory();

      final filePath =
          '${tempDir.path}/cry_${DateTime.now().millisecondsSinceEpoch}.m4a';

      _recordedFilePath = filePath;

      await _recorder.start(
        const RecordConfig(
          encoder: AudioEncoder.aacLc,
          bitRate: 128000,
          sampleRate: 44100,
        ),
        path: filePath,
      );

      _elapsedSeconds = 0;

      emit(const CryRecording(seconds: 0));

      _recordingTimer?.cancel();

      _recordingTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
        _elapsedSeconds++;

        emit(CryRecording(seconds: _elapsedSeconds));
      });
    } catch (_) {
      emit(const CryError('Failed to start recording'));
    }
  }

  // ====================================================
  // STOP & ANALYZE
  // ====================================================

  Future<void> stopAndAnalyze({required String childId}) async {
    try {
      _recordingTimer?.cancel();

      final path = await _recorder.stop();

      if (path == null || path.isEmpty) {
        emit(const CryError('No audio recorded'));
        return;
      }

      emit(const CryUploading());

      final result = await _repository.analyzeCry(
        filePath: path,
        childId: childId,
      );

      emit(CrySuccess(result));
    } catch (_) {
      emit(const CryError('Analysis failed'));
    }
  }

  // ====================================================
  // CANCEL
  // ====================================================

  Future<void> cancelRecording() async {
    _recordingTimer?.cancel();

    try {
      await _recorder.stop();
    } catch (_) {}

    await _deleteRecordedFile();

    emit(const CryInitial());
  }

  // ====================================================
  // RESET
  // ====================================================

  void reset() {
    _recordingTimer?.cancel();

    _recordedFilePath = null;

    _elapsedSeconds = 0;

    emit(const CryInitial());
  }

  // ====================================================
  // DELETE FILE
  // ====================================================

  Future<void> _deleteRecordedFile() async {
    final path = _recordedFilePath;

    if (path == null) return;

    final file = File(path);

    if (await file.exists()) {
      await file.delete();
    }

    _recordedFilePath = null;
  }

  // ====================================================
  // CLOSE
  // ====================================================

  @override
  Future<void> close() async {
    _recordingTimer?.cancel();

    await _recorder.dispose();

    return super.close();
  }
}
