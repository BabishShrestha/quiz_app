import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:quiz_app/domain/entities/category.dart';

import '../../constants.dart';
import '../../domain/entities/questions.dart';
import '../pages/question_page.dart';
import '../state_mgmt/api_provider.dart';

List<String> difficulty = ['Any', 'Easy', 'Medium', 'Hard'];

class OptionDialog extends StatefulWidget {
  final Quiz_Category selectedcategory;

  const OptionDialog({Key? key, required this.selectedcategory})
      : super(key: key);

  @override
  State<OptionDialog> createState() => _OptionDialogState();
}

String? _value;
bool start = false;

class _OptionDialogState extends State<OptionDialog> {
  @override
  Widget build(BuildContext context) {
    final questionValueProvider = QuestionValueProvider(
        widget.selectedcategory, _value == 'Any' ? null : _value);
    return start && _value != null
        ? Consumer(
            builder: (BuildContext context, WidgetRef ref, Widget? child) {
              start = false;
              final questionPool = ref.watch(questionValueProvider);

              return questionPool.when(
                data: (data) {
                  List<Questions> questions = data;
                  return QuestionPage(questionpool: questions);
                },
                error: (error, stackTrace) =>
                    LottieBuilder.asset('assets/animation/404-page-error.json'),
                loading: () => const Center(
                  child: CircularProgressIndicator(
                    color: kAppBarColor,
                  ),
                ),
              );
            },
          )
        : AlertDialog(
            clipBehavior: Clip.hardEdge,
            actionsAlignment: MainAxisAlignment.center,
            contentPadding: const EdgeInsets.all(10),
            backgroundColor: kPrimaryScaffoldColor,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            title: RichText(
              maxLines: 3,
              textAlign: TextAlign.center,
              text: TextSpan(
                  text: widget.selectedcategory.name,
                  style: kCategoryTextStyle),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('Enter Difficulty:'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ...difficulty.map((difficultyValue) => ChoiceChip(
                          label: Text(difficultyValue),
                          selected: _value == difficultyValue,
                          selectedColor: Colors.purpleAccent,
                          onSelected: (bool selected) {
                            setState(() {
                              _value = selected ? difficultyValue : null;
                            });
                          },
                        )),
                  ],
                ),
              ],
            ),
            actions: [
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      start = !start;
                    });
                  },
                  child: const Text('Start Quiz'))
            ],
          );
  }
}
