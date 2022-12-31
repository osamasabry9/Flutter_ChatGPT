import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../core/utils/values_manager.dart';
import '../../../domain/entities/image.dart';

class GeneratedImageWidget extends StatelessWidget {
  final ImageModel imageGenerationModelData;
  const GeneratedImageWidget(
      {super.key, required this.imageGenerationModelData});

  @override
  Widget build(BuildContext context) {
    return MasonryGridView.builder(
        gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        mainAxisSpacing: 3,
        crossAxisSpacing: 3,
        itemCount: imageGenerationModelData.imageUrl.length,
        itemBuilder: (context, index) {
          final generatedImage = imageGenerationModelData.imageUrl[index];

          return Card(
            child: CachedNetworkImage(
              imageUrl: generatedImage.url,
              fit: BoxFit.cover,
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  SizedBox(
                      height: AppSize.s150,
                      width: AppSize.s150,
                      child: Shimmer.fromColors(
                        baseColor: Colors.grey.withOpacity(.3),
                        highlightColor: Colors.grey,
                        child: Container(
                          height: AppSize.s220,
                          width: AppSize.s130,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(4)),
                        ),
                      )),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          );
        });
  }
}
