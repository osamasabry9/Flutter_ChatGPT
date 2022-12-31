import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../../app/constants.dart';
import '../../features/02_image_generation/data/model/responses/responses.dart';
import '../../features/03_text_completion/data/models/responses/responses.dart';


part 'app_api.g.dart';

@RestApi(baseUrl: Constants.baseUrl)
abstract class AppServiceClient {
  factory AppServiceClient(Dio dio, {String baseUrl}) = _AppServiceClient;

  @POST(Constants.endPointImage)
  Future<ImageDataResponse> getGenerateImages(
    @Field("prompt") String prompt,
    @Field("n") int number,
    @Field("size") String size,
  );
  
  @POST(Constants.endPointText)
  Future<TextCompletionResponse> getTextCompletion(
    @Field("model") String model,
    @Field("max_tokens") int maxTokens,

    @Field("prompt") String promptText,
  );
}
