import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rafiq_app/core/storage/secure_storage_service.dart';
import 'package:rafiq_app/features/auth/data/api/user_api_service.dart';
import 'package:rafiq_app/features/auth/data/models/profile_response.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  final UserApiService api;
  final SecureStorageService secureStorage;
  UserCubit(this.api, this.secureStorage) : super(UserInitial());

  Future<void> getProfile() async {
    emit(UserLoading());

    try {
      final profile = await api.getProfile();
      emit(UserLoaded(profile));
    } catch (e) {
      emit(UserError("Failed to load profile"));
    }
  }
}