import 'package:json_annotation/json_annotation.dart';

part 'responses.g.dart';

//json_serializable
@JsonSerializable()
class ImageDataResponse {

  @JsonKey(name: "created")
  num? created;
  @JsonKey(name: "data")
  List<ImageUrlResponse>? data;

  ImageDataResponse(this.created, this.data);

  // toJson
  Map<String, dynamic> toJson() => _$ImageDataResponseToJson(this);

//fromJson
  factory ImageDataResponse.fromJson(Map<String, dynamic> json) =>
      _$ImageDataResponseFromJson(json);
}


@JsonSerializable()
class ImageUrlResponse {

  @JsonKey(name: 'url')
  String? url;


  ImageUrlResponse(this.url);

  // toJson
  Map<String, dynamic> toJson() => _$ImageUrlResponseToJson(this);

//fromJson
  factory ImageUrlResponse.fromJson(Map<String, dynamic> json) =>
      _$ImageUrlResponseFromJson(json);
}

