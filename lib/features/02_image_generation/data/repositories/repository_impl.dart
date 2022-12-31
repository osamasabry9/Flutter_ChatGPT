
import 'package:chat_gpt/features/02_image_generation/data/model/mapper/mapper.dart';
import 'package:dartz/dartz.dart';



import '../../../../core/error/error_handler.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/entities/image.dart';
import '../../domain/repositories/repository.dart';
import '../datasources/remote_datasources.dart';

class ImageRepositoryImpl implements ImageRepository {
  final ImageRemoteDataSource _remoteDataSource;

  final NetworkInfo _networkInfo;
  ImageRepositoryImpl(
    this._remoteDataSource,
    this._networkInfo,
  );

  @override
  Future<Either<Failure, ImageModel>> getGenerateImages(String query) async {
    if (await _networkInfo.isConnected) {
      final response = await _remoteDataSource.getGenerateImages(query);

      try {
        return Right(response.toDomain());
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }
}
