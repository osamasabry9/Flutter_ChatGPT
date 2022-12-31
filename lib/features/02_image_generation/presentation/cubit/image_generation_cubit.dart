import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/image.dart';
import '../../domain/usecases/get_generate_image.dart';

part 'image_generation_state.dart';

class ImageGenerationCubit extends Cubit<ImageGenerationState> {
  final ImageGenerationUseCase imageGenerationUseCase;
  ImageGenerationCubit({required this.imageGenerationUseCase})
      : super(ImageGenerationInitial());

  Future<void> imagesGenerate({required String query}) async {
    emit(ImageGenerationLoading());
    (await imageGenerationUseCase.execute(query)).fold(
        (failure) => {
              emit(ImageGenerationFailure(errorMsg: failure.message)),
            }, (data) {
      emit(ImageGenerationLoaded(imageGenerationModelData: data));
    });
  }
}
