import 'package:chat_gpt/features/03_text_completion/data/models/mapper/mapper.dart';
import 'package:dartz/dartz.dart';

import 'package:chat_gpt/features/03_text_completion/domain/entities/text_completion_model.dart';

import 'package:chat_gpt/core/error/failure.dart';

import '../../../../core/error/error_handler.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/repositories/repository.dart';
import '../datasources/remote_datasources.dart';

class TextCompletionRepositoryImpl implements TextCompletionRepository {
  final TextCompletionRemoteDataSource _remoteDataSource;

  final NetworkInfo _networkInfo;
  TextCompletionRepositoryImpl(
    this._remoteDataSource,
    this._networkInfo,
  );

  @override
  Future<Either<Failure, TextCompletionModel>> getTextCompletion(
      String query) async {
    if (await _networkInfo.isConnected) {
      final response = await _remoteDataSource.getTextCompletion(query);

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
