import 'package:flutter/material.dart';

import '../../constants.dart';

class QuizHomePage extends StatelessWidget {
  const QuizHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double kCategoryRowWidth = 20;
    double kCategoryColumnHeight = 20;
    return Scaffold(
      bottomNavigationBar: const BottomNavBar(),
      body: SafeArea(
        child: ListView(
          shrinkWrap: true,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              alignment: Alignment.topLeft,
              decoration: const BoxDecoration(
                color: Colors.purple,
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(20),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    'Welcome Back!',
                    style: TextStyle(fontSize: 25),
                  ),
                  Text(
                    'Alphabot',
                    style: TextStyle(fontSize: 25),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Container(
              padding: const EdgeInsets.all(15),
              alignment: Alignment.topLeft,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ListTile(
                      contentPadding: EdgeInsets.zero,
                      title: const Text('Choose Categories',
                          style: kCategoryTextStyle),
                      trailing: TextButton(
                        onPressed: () {},
                        child: Text('See all',
                            style: kHomeTextStyle.copyWith(fontSize: 18)),
                      )),
                  SizedBox(
                    height: kCategoryColumnHeight,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Expanded(
                        child: Placeholder(
                          fallbackHeight: 100,
                          fallbackWidth: 100,
                        ),
                      ),
                      SizedBox(
                        width: kCategoryRowWidth,
                      ),
                      const Expanded(
                        child: Placeholder(
                          fallbackHeight: 100,
                          fallbackWidth: 100,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: kCategoryColumnHeight,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Expanded(
                        child: Placeholder(
                          fallbackHeight: 100,
                          fallbackWidth: 100,
                        ),
                      ),
                      SizedBox(
                        width: kCategoryRowWidth,
                      ),
                      const Expanded(
                        child: Placeholder(
                          fallbackHeight: 100,
                          fallbackWidth: 100,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: kCategoryColumnHeight,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Expanded(
                        child: Placeholder(
                          fallbackHeight: 100,
                          fallbackWidth: 100,
                        ),
                      ),
                      SizedBox(
                        width: kCategoryRowWidth,
                      ),
                      const Expanded(
                        child: Placeholder(
                          fallbackHeight: 100,
                          fallbackWidth: 100,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.lightBlueAccent,
      selectedItemColor: Colors.purple,
      unselectedItemColor: Colors.grey,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.history), label: 'History'),
        BottomNavigationBarItem(icon: Icon(Icons.badge), label: 'Achievement'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
      ],
      onTap: (_) {},
    );
  }
}
