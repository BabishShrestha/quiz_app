import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:quiz_app/domain/entities/category.dart';
import 'package:quiz_app/presentation/widgets/widgets.dart';

import '../../constants.dart';
import '../state_mgmt/api_provider.dart';

class QuizHomePage extends StatelessWidget {
  QuizHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomNavBar(),
      body: SafeArea(
        child: Column(
          children: [
            const WelcomeCard(),
            const SizedBox(
              height: 50,
            ),
            const Text('Categories', style: kCategoryTextStyle),
            Expanded(
              child: Container(
                margin: const EdgeInsets.all(15),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFF3366FF),
                      Color(0xFF00CCFF),
                    ],
                  ),
                ),
                child: Consumer(
                  builder:
                      (BuildContext context, WidgetRef ref, Widget? child) {
                    final categoryPool = ref.watch(category_valueProvider);
                    return categoryPool.when(
                        data: (data) {
                          List<Quiz_Category> quizCategory = data;
                          return CategorySection(quiz_category: quizCategory);
                        },
                        error: (error, stackTrace) => LottieBuilder.asset(
                            'assets/animation/404-page-error.json'),
                        loading: () => const Center(
                                child: CircularProgressIndicator(
                              color: kAppBarColor,
                            )));
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
