import 'package:chat_gpt/app/extensions.dart';

import '../../../../../../app/constants.dart';
import '../../../domain/entities/image.dart';
import '../responses/responses.dart';

extension ImageUrlResponseMapper on ImageUrlResponse? {
  ImageUrl toDomain() {
    return ImageUrl(this?.url.orEmpty() ?? Constants.empty);
  }
}

extension ImageDataResponseMapper on ImageDataResponse? {
  ImageModel toDomain() {
    List<ImageUrl> imagesUrl =
        (this?.data?.map((imageUrlResponse) => imageUrlResponse.toDomain()) ??
                const Iterable.empty())
            .cast<ImageUrl>()
            .toList();

    return ImageModel(
      this?.created.orZero() ?? Constants.zero,
      imagesUrl,
    );
  }
}
