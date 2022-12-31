import 'package:chat_gpt/core/utils/strings_manager.dart';
import 'package:chat_gpt/core/utils/values_manager.dart';
import 'package:chat_gpt/features/02_image_generation/presentation/pages/widget/generated_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/loading_widget.dart';
import '../../../../core/widgets/search_text_field_widget.dart';
import '../cubit/image_generation_cubit.dart';

class ImageGenerationPage extends StatefulWidget {
  const ImageGenerationPage({Key? key}) : super(key: key);

  @override
  State<ImageGenerationPage> createState() => _ImageGenerationPageState();
}

class _ImageGenerationPageState extends State<ImageGenerationPage> {
  final TextEditingController _searchTextController = TextEditingController();

  @override
  void initState() {
    _searchTextController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    _searchTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.imageGeneration.split("-")[0]),
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(
                child: BlocBuilder<ImageGenerationCubit, ImageGenerationState>(
              builder: (context, imageGenerationState) {
                if (imageGenerationState is ImageGenerationLoading) {
                  return const LoadingWidget();
                }

                if (imageGenerationState is ImageGenerationLoaded) {
                  return GeneratedImageWidget(
                    imageGenerationModelData:
                        imageGenerationState.imageGenerationModelData,
                  );
                }

                return const Center(
                    child: Text(
                  AppStrings.imageGeneration,
                  style: TextStyle(fontSize: 20, color: Colors.grey),
                ));
              },
            )),
            SearchTextFieldWidget(
              textEditingController: _searchTextController,
              onTap: () {
                BlocProvider.of<ImageGenerationCubit>(context)
                    .imagesGenerate(
                      query: _searchTextController.text,
                    )
                    .then((value) => _clearTextField);
              },
            ),
            const SizedBox(
              height: AppSize.s20,
            ),
          ],
        ),
      ),
    );
  }

  void _clearTextField() {
    setState(() {
      _searchTextController.clear();
    });
  }
}
