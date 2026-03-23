import 'package:get_it/get_it.dart';
import '../network/api_service.dart';
import '../network/dio_factory.dart';
import '../storage/secure_storage_service.dart';
import '../storage/shared_prefs_service.dart';

final getIt = GetIt.instance;

/// ✅ Manual DI بدون @InjectableInit (اتشال الـ annotation المضللة)
/// لو عايزة تستخدم injectable بالكامل لازم تضيفي @injectable على كل class
Future<void> configureDependencies() async {
  /// Storage
  await SharedPrefsService.init();

  final secureStorage = SecureStorageService();
  getIt.registerLazySingleton<SecureStorageService>(() => secureStorage);

  /// Network - بنبعت secureStorage للـ DioFactory
  final dio = DioFactory.createDio(secureStorage);
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));
}