import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:share_plus/share_plus.dart';

import '../../../../core/utils/values_manager.dart';
import '../../domain/entities/text_completion_model.dart';


class TextCompletionWidget extends StatelessWidget {
  final List<ChoicesTextCompletionModel> choicesData;
  const TextCompletionWidget({super.key , required this.choicesData});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
                    itemCount: choicesData.length,
                    itemBuilder: (BuildContext context, int index) {
                      final textData = choicesData[index];
                      return Card(
                        child: Padding(
                          padding: const EdgeInsets.all(AppPadding.p14),
                          child: Column(
                            children: [
                              Text(
                                textData.text,
                                style: const TextStyle(fontSize: 18),
                              ),
                              const SizedBox(
                                height: AppSize.s30,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  InkWell(
                                      onTap: () {
                                        Share.share(textData.text);
                                      },
                                      child: const Icon(Icons.share, size: 35)),
                                  InkWell(
                                      onTap: () {
                                        Clipboard.setData(
                                            ClipboardData(text: textData.text));
                                      },
                                      child: const Icon(
                                        Icons.copy,
                                        size: 35,
                                      )),
                                ],
                              ),
                              const SizedBox(
                                height: AppSize.s10,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
  }
}