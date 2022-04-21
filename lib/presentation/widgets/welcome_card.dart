import 'package:flutter/material.dart';
import 'package:quiz_app/constants.dart';

class WelcomeCard extends StatelessWidget {
  const WelcomeCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
            style: kHomeTextStyle,
          ),
          Text(
            'Alphabot',
            style: kHomeTextStyle,
          ),
          SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}
