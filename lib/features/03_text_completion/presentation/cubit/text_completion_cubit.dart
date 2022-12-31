
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/text_completion_model.dart';
import '../../domain/usecases/get_text_completion_usecase.dart';

part 'text_completion_state.dart';

class TextCompletionCubit extends Cubit<TextCompletionState> {
  final TextCompletionUseCase textCompletionUseCase;
  TextCompletionCubit({required this.textCompletionUseCase}) : super(TextCompletionInitial());


  Future<void> textCompletion({required String query}) async {

        emit(TextCompletionLoading());
    (await textCompletionUseCase.execute(query)).fold(
        (failure) => {
              emit(TextCompletionFailure(errorMsg: failure.message)),
            }, (data) {
      emit(TextCompletionLoaded(textCompletionModelData: data));
    });
  }
}
