class ImageUrl {
  String url;

  ImageUrl(
    this.url,
  );
}

class ImageModel {
  num created;
  List<ImageUrl> imageUrl;

  ImageModel(
    this.created,
    this.imageUrl,
  );
}
