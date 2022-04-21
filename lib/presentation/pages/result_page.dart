import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:quiz_app/constants.dart';
import 'package:quiz_app/presentation/pages/home_page.dart';

import '../../domain/entities/questions.dart';

class ResultPage extends StatelessWidget {
  List<Questions> questions;
  Map<int, dynamic> answers;

  ResultPage({Key? key, required this.questions, required this.answers})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    int correct = 0;

    answers.forEach((index, answer) {
      if (questions[index].correctanswer == answer) {
        correct++;
      }
    });
    print(correct);
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF3366FF),
                Color(0xFF00CCFF),
              ],
            ),
          ),
          child: Stack(
            clipBehavior: Clip.none,
            fit: StackFit.loose,
            children: [
              Positioned(
                top: MediaQuery.of(context).size.height * 0.29,
                right: 40,
                left: 40,
                child: Container(
                  width: 400,
                  height: 440,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      color: Colors.white24,
                      borderRadius: BorderRadius.circular(20)),
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height * 0.27,
                right: 30,
                left: 30,
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.6),
                      borderRadius: BorderRadius.circular(20)),
                  child: const Placeholder(
                    strokeWidth: 0.0,
                  ),
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height * 0.25,
                right: 20,
                left: 20,
                child: Container(
                  height: 440,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 70,
                      ),
                      Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: kAppBarColor,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            textAlign: TextAlign.center,
                            'Total Score:\n ${correct / questions.length * 100} %',
                            style: kResultTextStyle,
                          )),
                      const SizedBox(
                        height: 25,
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: kAppBarColor,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Text(
                                  textAlign: TextAlign.center,
                                  'No of Q:\n  ${questions.length}',
                                  style: kResultTextStyle,
                                )),
                            Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: Colors.greenAccent.shade400,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Text(
                                  textAlign: TextAlign.center,
                                  'Correct:\n ${correct}',
                                  style: kResultTextStyle,
                                )),
                            Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Text(
                                  textAlign: TextAlign.center,
                                  'Incorrect:\n ${questions.length - correct}',
                                  style: kResultTextStyle,
                                )),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Container(
                          width: MediaQuery.of(context).size.width,
                          margin: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: kAppBarColor,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: TextButton(
                            onPressed: () {},
                            child: const Text(
                              'LeaderBoard',
                              style: kResultTextStyle,
                            ),
                          )),
                      Container(
                          width: MediaQuery.of(context).size.width * 0.5,
                          margin: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: kAppBarColor,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: TextButton(
                            onPressed: () {
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => QuizHomePage(),
                                  ),
                                  (route) => false);
                            },
                            child: const Text(
                              'Home',
                              style: kResultTextStyle,
                            ),
                          )),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height * 0.12,
                right: 30,
                left: 30,
                child: Center(
                  child: Container(
                    width: 200,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        boxShadow: kElevationToShadow[4],
                        color: kPrimaryScaffoldColor,
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          height: 120,
                          child: Lottie.asset(
                            fit: BoxFit.fill,
                            'assets/animation/top-badge-animation.json',
                            repeat: false,
                          ),
                        ),
                        const Text(
                          'Well Done!!',
                          style: kCategoryTextStyle,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
