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
            WelcomeCard(),
            const SizedBox(
              height: 50,
            ),
            Expanded(
              child: Consumer(
                builder: (BuildContext context, WidgetRef ref, Widget? child) {
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
          ],
        ),
      ),
    );
  }
}
