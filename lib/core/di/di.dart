import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import '../network/api_service.dart';
import '../network/dio_factory.dart';
import '../storage/secure_storage_service.dart';

final getIt = GetIt.instance;

@InjectableInit()
Future<void> configureDependencies() async {
  final dio = DioFactory.createDio();

  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));
  getIt.registerLazySingleton<SecureStorageService>(
    () => SecureStorageService(),
  );
}