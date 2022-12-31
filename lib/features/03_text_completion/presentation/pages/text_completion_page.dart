import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/strings_manager.dart';
import '../../../../core/utils/values_manager.dart';
import '../../../../core/widgets/loading_widget.dart';
import '../../../../core/widgets/search_text_field_widget.dart';
import '../cubit/text_completion_cubit.dart';
import '../widget/text_completion_widget.dart';

class TextCompletionPage extends StatefulWidget {
  const TextCompletionPage({Key? key}) : super(key: key);

  @override
  State<TextCompletionPage> createState() => _TextCompletionPageState();
}

class _TextCompletionPageState extends State<TextCompletionPage> {
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
        title: Text(AppStrings.textCompletion.split("-")[0]),
      ),
      body: Center(
        child: Column(children: [
          Expanded(
            child: BlocBuilder<TextCompletionCubit, TextCompletionState>(
              builder: (context, textCompletionState) {
                if (textCompletionState is TextCompletionLoading) {
                  return const LoadingWidget();
                }
                if (textCompletionState is TextCompletionLoaded) {
                  final choicesData =
                      textCompletionState.textCompletionModelData.choices;

                  return TextCompletionWidget(
                    choicesData: choicesData,
                  );
                }
                return const Center(
                    child: Text(
                  AppStrings.textCompletion,
                  style: TextStyle(fontSize: 20, color: Colors.grey),
                ));
              },
            ),
          ),
          SearchTextFieldWidget(
              textEditingController: _searchTextController,
              onTap: () {
                BlocProvider.of<TextCompletionCubit>(context)
                    .textCompletion(query: _searchTextController.text)
                    .then((value) => _clearTextField());
              }),
          const SizedBox(
            height: AppSize.s20,
          ),
        ]),
      ),
    );
  }

  void _clearTextField() {
    setState(() {
      _searchTextController.clear();
    });
  }
}
