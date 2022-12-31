import 'package:json_annotation/json_annotation.dart';

part 'responses.g.dart';

//json_serializable

@JsonSerializable()
class ChoicesTextCompletionResponse {
  @JsonKey(name: 'text')
  String? text;
  @JsonKey(name: 'index')
  num? index;
  @JsonKey(name: 'finish_reason')
  String? finishReason;

  ChoicesTextCompletionResponse(
    this.text,
    this.index,
    this.finishReason,
  );

  // toJson
  Map<String, dynamic> toJson() => _$ChoicesTextCompletionResponseToJson(this);

//fromJson
  factory ChoicesTextCompletionResponse.fromJson(Map<String, dynamic> json) =>
      _$ChoicesTextCompletionResponseFromJson(json);
}

@JsonSerializable()
class TextCompletionResponse {
  @JsonKey(name: "created")
  num? created;

  @JsonKey(name: "choices")
  List<ChoicesTextCompletionResponse>? choices;

  TextCompletionResponse(
    this.created,
    this.choices,
  );

  // toJson
  Map<String, dynamic> toJson() => _$TextCompletionResponseToJson(this);

//fromJson
  factory TextCompletionResponse.fromJson(Map<String, dynamic> json) =>
      _$TextCompletionResponseFromJson(json);
}
