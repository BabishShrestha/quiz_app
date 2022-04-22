import 'package:flutter/material.dart';
import 'package:html_unescape/html_unescape.dart';
import 'package:quiz_app/constants.dart';
import 'package:quiz_app/presentation/pages/result_page.dart';

import '../../domain/entities/questions.dart';

class QuestionPage extends StatefulWidget {
  final List<Questions> questionpool;

  const QuestionPage({required this.questionpool});

  @override
  State<QuestionPage> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  Map<int, dynamic> selectedanswers = {};

  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    // print(selectedanswers);
    Questions question = widget.questionpool[currentIndex];
    // print(question.correctanswer);
    final List<dynamic> options = question.incorrectanswers;
    if (!options.contains(question.correctanswer)) {
      options.add(question.correctanswer);
      options.shuffle();
    }
    // var OptionColor = Colors.purple;
    return WillPopScope(
      onWillPop: onWillPop,
      child: Scaffold(
        body: SafeArea(
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                  colors: [
                    Color(0xFF3366FF),
                    Color(0xFF00CCFF),
                  ],
                )),
                height: MediaQuery.of(context).size.height * 0.5,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        question.category,
                        style: kQuestionStyle.copyWith(
                            color: kPrimaryScaffoldColor, fontSize: 25),
                      ),
                    ),
                    // Container(
                    //   alignment: Alignment.topRight,
                    //   padding: const EdgeInsets.all(10),
                    //   child: const Text('0:30'),
                    // ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text("Question ${(currentIndex + 1).toString()}:",
                        style: kQuestionStyle.copyWith(
                            color: kPrimaryScaffoldColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 20)),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                    height: MediaQuery.of(context).size.height * 0.5,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: kElevationToShadow[12],
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          textAlign: TextAlign.center,
                          style: kQuestionStyle.copyWith(color: Colors.black),
                          HtmlUnescape().convert(
                              widget.questionpool[currentIndex].question),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        ...options.map(
                          (option) => MaterialButton(
                            color: kAppBarColor,
                            child: Text(HtmlUnescape().convert("$option"),
                                style: kQuestionStyle),
                            onPressed: () {
                              setState(() {
                                selectedanswers[currentIndex] = option;
                                if (currentIndex !=
                                    widget.questionpool.length - 1) {
                                  currentIndex++;
                                } else {
                                  Navigator.of(context)
                                      .pushReplacement(MaterialPageRoute(
                                          builder: (context) => ResultPage(
                                                questions: widget.questionpool,
                                                answers: selectedanswers,
                                              )));
                                }
                              });
                            },
                          ),
                        )
                      ],
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<bool> onWillPop() async {
    return (await showDialog(
          context: context,
          builder: (_) {
            return AlertDialog(
              content: const Text(
                  "Are you sure you want to quit? All your progress will be lost."),
              title: const Text("Warning!"),
              actions: <Widget>[
                TextButton(
                  child: const Text("Yes"),
                  onPressed: () {
                    Navigator.popUntil(context, (route) => route.isFirst);
                  },
                ),
                TextButton(
                  child: const Text("No"),
                  onPressed: () {
                    Navigator.pop(context, false);
                  },
                ),
              ],
            );
          },
        )) ??
        false;
  }
}
