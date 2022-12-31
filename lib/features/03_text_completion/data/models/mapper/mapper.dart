import 'package:chat_gpt/app/constants.dart';
import 'package:chat_gpt/app/extensions.dart';
import 'package:chat_gpt/features/03_text_completion/domain/entities/text_completion_model.dart';

import '../responses/responses.dart';

extension ChoicesTextCompletionResponseMapper
    on ChoicesTextCompletionResponse? {
  ChoicesTextCompletionModel toDomain() {
    return ChoicesTextCompletionModel(
      this?.text.orEmpty() ?? Constants.empty,
      this?.index.orZero() ?? Constants.zero,
      this?.finishReason.orEmpty() ?? Constants.empty,
    );
  }
}

extension TextCompletionResponseMapper on TextCompletionResponse? {
  TextCompletionModel toDomain() {
    List<ChoicesTextCompletionModel> choices = (this?.choices?.map(
                (choicesTextCompletionResponse) =>
                    choicesTextCompletionResponse.toDomain()) ??
            const Iterable.empty())
        .cast<ChoicesTextCompletionModel>()
        .toList();

    return TextCompletionModel(
      this?.created.orZero() ?? Constants.zero,
      choices,
    );
  }
}
