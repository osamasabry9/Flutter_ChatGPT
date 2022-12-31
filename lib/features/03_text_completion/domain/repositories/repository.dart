import 'package:chat_gpt/features/03_text_completion/domain/entities/text_completion_model.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';

abstract class TextCompletionRepository {
  Future<Either<Failure, TextCompletionModel>> getTextCompletion(String query);
}
