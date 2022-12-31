class ChoicesTextCompletionModel {
  String text;
  num index;
  String finishReason;

  ChoicesTextCompletionModel(
    this.text,
    this.index,
    this.finishReason,
  );
}

class TextCompletionModel {
  num created;
  List<ChoicesTextCompletionModel> choices;

  TextCompletionModel(
    this.created,
    this.choices,
  );
}
