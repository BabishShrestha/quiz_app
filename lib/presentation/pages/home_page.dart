import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';
import 'package:quiz_app/domain/entities/category.dart';
import 'package:quiz_app/presentation/widgets/widgets.dart';

import '../../constants.dart';
import '../../data/data_sources/quiz_remote_data_source.dart';

class QuizHomePage extends StatelessWidget {
  const QuizHomePage({Key? key}) : super(key: key);

  Future<List<Quiz_Category>> getCategory() async {
    CategoryRemoteDataSourceImpl categoryRemoteDataSourceImpl =
        CategoryRemoteDataSourceImpl(client: http.Client());
    List<Quiz_Category> categories =
        await categoryRemoteDataSourceImpl.getCategoryItem();
    return categories;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomNavBar(),
      body: SafeArea(
        child: Column(
          children: [
            WelcomeCard(),
            const SizedBox(
              height: 50,
            ),
            Expanded(
                child: FutureBuilder<List<Quiz_Category>>(
                    future: getCategory(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        List<Quiz_Category> quiz_category = snapshot.data!;
                        return CategorySection(quiz_category: quiz_category);
                      } else if (snapshot.hasError) {
                        return LottieBuilder.asset(
                            'assets/animation/404-page-error.json');
                      } else {}
                      return const Center(
                          child: CircularProgressIndicator(
                        color: kAppBarColor,
                      ));
                    })),
          ],
        ),
      ),
    );
  }
}
