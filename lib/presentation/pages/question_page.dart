import 'package:flutter/material.dart';

class QuestionPage extends StatelessWidget {
  const QuestionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              clipBehavior: Clip.none,
              fit: StackFit.loose,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.5,
                  alignment: Alignment.topLeft,
                  color: Colors.purple,
                  child: Column(
                    children: [
                      Text('Category Name'),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        alignment: Alignment.topRight,
                        child: Text('0:30'),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        child: Text('Question Count'),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.28,
                  right: 40,
                  left: 40,
                  child: Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(20)),
                    child: Placeholder(),
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.27,
                  right: 30,
                  left: 30,
                  child: Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        color: Colors.blueGrey,
                        borderRadius: BorderRadius.circular(20)),
                    child: Placeholder(),
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.25,
                  right: 20,
                  left: 20,
                  child: Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(20)),
                    child: Placeholder(),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
