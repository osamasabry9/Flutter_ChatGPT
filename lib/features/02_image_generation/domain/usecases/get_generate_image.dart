import 'package:dartz/dartz.dart';

import '../../../../app/base_usecase.dart';
import '../../../../core/error/failure.dart';
import '../entities/image.dart';
import '../repositories/repository.dart';

class ImageGenerationUseCase implements BaseUseCase<String, ImageModel> {
  final ImageRepository _repository;

  ImageGenerationUseCase(this._repository);

  @override
  Future<Either<Failure, ImageModel>> execute(String input) async {
    return await _repository.getGenerateImages(input);
  }
}