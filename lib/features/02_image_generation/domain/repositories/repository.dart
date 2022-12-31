import '../../../../core/error/failure.dart';
import '../entities/image.dart';
import 'package:dartz/dartz.dart';

abstract class ImageRepository {
  Future<Either<Failure, ImageModel>> getGenerateImages(String query);
}
