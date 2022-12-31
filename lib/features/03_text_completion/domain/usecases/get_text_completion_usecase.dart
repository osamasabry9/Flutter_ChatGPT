import 'package:chat_gpt/features/03_text_completion/domain/entities/text_completion_model.dart';
import 'package:dartz/dartz.dart';

import '../../../../app/base_usecase.dart';
import '../../../../core/error/failure.dart';
import '../repositories/repository.dart';

class TextCompletionUseCase implements BaseUseCase<String, TextCompletionModel> {
  final TextCompletionRepository _repository;

  TextCompletionUseCase(this._repository);

  @override
  Future<Either<Failure, TextCompletionModel>> execute(String input) async {
    return await _repository.getTextCompletion(input);
  }
}