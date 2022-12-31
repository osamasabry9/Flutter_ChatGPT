import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../core/network/app_api.dart';
import '../core/network/dio_factory.dart';
import '../core/network/network_info.dart';
import '../features/02_image_generation/data/datasources/remote_datasources.dart';
import '../features/02_image_generation/data/repositories/repository_impl.dart';
import '../features/02_image_generation/domain/repositories/repository.dart';
import '../features/02_image_generation/domain/usecases/get_generate_image.dart';
import '../features/02_image_generation/presentation/cubit/image_generation_cubit.dart';
import '../features/03_text_completion/data/datasources/remote_datasources.dart';
import '../features/03_text_completion/data/repositories/repository_impl.dart';
import '../features/03_text_completion/domain/repositories/repository.dart';
import '../features/03_text_completion/domain/usecases/get_text_completion_usecase.dart';
import '../features/03_text_completion/presentation/cubit/text_completion_cubit.dart';

final instance = GetIt.instance;

Future<void> initAppModule() async {
  // network info
  instance.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(InternetConnectionChecker()));

  // dio factory
  instance.registerLazySingleton<DioFactory>(() => DioFactory());

  Dio dio = await instance<DioFactory>().getDio();
  //app service client
  instance.registerLazySingleton<AppServiceClient>(() => AppServiceClient(dio));

// -------------------- Image Generation--------------------
  // remote data source
  instance.registerLazySingleton<ImageRemoteDataSource>(
      () => ImageRemoteDataSourceImpl(instance<AppServiceClient>()));

  // repository
  instance.registerLazySingleton<ImageRepository>(() => ImageRepositoryImpl(
        instance<ImageRemoteDataSource>(),
        instance<NetworkInfo>(),
      ));

  instance.registerLazySingleton<ImageGenerationUseCase>(
      () => ImageGenerationUseCase(instance()));
  //Futures bloc
  instance.registerLazySingleton<ImageGenerationCubit>(
    () => ImageGenerationCubit(
      imageGenerationUseCase: instance(),
    ),
  );

  // -------------------- Image Generation--------------------
  // remote data source
  instance.registerLazySingleton<TextCompletionRemoteDataSource>(
      () => TextCompletionRemoteDataSourceImpl(instance<AppServiceClient>()));

  // repository
  instance.registerLazySingleton<TextCompletionRepository>(
      () => TextCompletionRepositoryImpl(
            instance<TextCompletionRemoteDataSource>(),
            instance<NetworkInfo>(),
          ));

  instance.registerLazySingleton<TextCompletionUseCase>(
      () => TextCompletionUseCase(instance()));
  //Futures bloc
  instance.registerLazySingleton<TextCompletionCubit>(
    () => TextCompletionCubit(
      textCompletionUseCase: instance(),
    ),
  );
}
