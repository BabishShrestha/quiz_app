import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:quiz_app/domain/entities/category.dart';
import 'package:quiz_app/presentation/widgets/widgets.dart';

import '../../data/data_sources/quiz_remote_data_source.dart';

class QuizHomePage extends StatefulWidget {
  const QuizHomePage({Key? key}) : super(key: key);
  @override
  State<QuizHomePage> createState() => _QuizHomePageState();
}

class _QuizHomePageState extends State<QuizHomePage> {
  @override
  void initState() {
    super.initState();
    quizget();
  }

  void quizget() async {
    CategoryRemoteDataSourceImpl categoryRemoteDataSourceImpl =
        CategoryRemoteDataSourceImpl(client: http.Client());
    List<Quiz_Category> categories =
        await categoryRemoteDataSourceImpl.getCategoryItem();
    print(await categories.toString());
  }

  @override
  Widget build(BuildContext context) {
    quizget();
    return Scaffold(
      bottomNavigationBar: const BottomNavBar(),
      body: SafeArea(
        child: Column(
          children: [
            WelcomeCard(),
            const SizedBox(
              height: 50,
            ),
            Expanded(child: CategorySection()),
          ],
        ),
      ),
    );
  }
}
