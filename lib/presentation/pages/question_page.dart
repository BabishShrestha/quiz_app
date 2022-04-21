import 'package:flutter/material.dart';
import 'package:html_unescape/html_unescape.dart';
import 'package:quiz_app/constants.dart';

import '../../domain/entities/questions.dart';

class QuestionPage extends StatefulWidget {
  final List<Questions> questionpool;

  const QuestionPage({required this.questionpool});

  @override
  State<QuestionPage> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  @override
  Widget build(BuildContext context) {
    int currentIndex = 0;

    Questions question = widget.questionpool[currentIndex];
    final List<dynamic> options = question.incorrectanswers;
    final List<String> selectedanswers = [];
    if (!options.contains(question.correctanswer)) {
      options.add(question.correctanswer);
      options.shuffle();
    }
    int _current = -1;
    print(question.difficulty);
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Stack(
              clipBehavior: Clip.none,
              fit: StackFit.loose,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.5,
                  alignment: Alignment.topLeft,
                  color: Colors.purple,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 50,
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.all(10),
                        child: Text(
                          '${widget.questionpool[0].category}',
                          style: kQuestionStyle.copyWith(
                              color: kPrimaryScaffoldColor, fontSize: 25),
                        ),
                      ),
                      Container(
                        alignment: Alignment.topRight,
                        padding: EdgeInsets.all(10),
                        child: Text('0:30'),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        child: Text("${(currentIndex + 1).toString()}",
                            style: kQuestionStyle.copyWith(
                                color: kPrimaryScaffoldColor,
                                fontWeight: FontWeight.w600,
                                fontSize: 20)),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.27,
                  right: 20,
                  left: 20,
                  child: Container(
                      height: 440,
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: kElevationToShadow[12],
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        children: [
                          Text(
                            textAlign: TextAlign.center,
                            style: kQuestionStyle,
                            HtmlUnescape().convert(
                                widget.questionpool[currentIndex].question),
                          ),

                          SizedBox(
                            height: 25,
                          ),

                          ...options.map((option) => MaterialButton(
                                color: Colors.purple,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                onPressed: () {},
                                child: Text(
                                  HtmlUnescape().convert(option),
                                  style: kQuestionStyle.copyWith(
                                    color: kPrimaryScaffoldColor,
                                  ),
                                ),
                              )),

                          // ListView.builder(
                          //     itemCount: options.length,
                          //     itemBuilder: (context, index) {
                          //       return Card(
                          //         elevation: 4,
                          //         shape: RoundedRectangleBorder(
                          //             borderRadius: BorderRadius.circular(20)),
                          //         child: MaterialButton(
                          //           shape: RoundedRectangleBorder(
                          //               borderRadius: BorderRadius.circular(20)),
                          //           onPressed: () {
                          //             setState(() {
                          //               _current = index;
                          //               if (currentIndex >=
                          //                   widget.questionpool.length) {
                          //                 Navigator.of(context).push(
                          //                     MaterialPageRoute(
                          //                         builder: (context) =>
                          //                             ResultPage()));
                          //               } else if (currentIndex <
                          //                   widget.questionpool.length) {
                          //                 currentIndex++;
                          //                 print(currentIndex);
                          //               }
                          //             });
                          //           },
                          //           child: Text('${options[index]}'),
                          //         ),
                          //       );
                          //     })
                        ],
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<bool> _onWillPop() async {
    return (await showDialog(
          context: context,
          builder: (_) {
            return AlertDialog(
              content: Text(
                  "Are you sure you want to forfeit? All your progress will be lost."),
              title: Text("Warning!"),
              actions: <Widget>[
                TextButton(
                  child: Text("Yes"),
                  onPressed: () {
                    Navigator.popUntil(context, (route) => route.isFirst);
                  },
                ),
                TextButton(
                  child: Text("No"),
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
