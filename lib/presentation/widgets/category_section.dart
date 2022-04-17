import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:quiz_app/presentation/state_mgmt/categoryProvider.dart';

class CategorySection extends StatefulWidget {
  @override
  State<CategorySection> createState() => _CategorySectionState();
}

class _CategorySectionState extends State<CategorySection>
    with TickerProviderStateMixin {
  late final AnimationController _animationController;
  final double kCategoryRowWidth = 20;

  final double kCategoryColumnHeight = 20;
  List<String> categoryAnimation = [
    'assets/animation/categories/spinning-globe.json',
    'assets/animation/categories/book-app.json',
    'assets/animation/categories/film-clipper.json',
    'assets/animation/categories/music.json',
    'assets/animation/categories/theater-masks.json',
    'assets/animation/categories/retro-television-tv.json',
  ];

  @override
  void initState() {
    super.initState();

    _animationController =
        AnimationController(vsync: this, duration: Duration.zero);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  int tapIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      alignment: Alignment.topLeft,
      child: GridView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: categoryAnimation.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1.2,
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 10.0),
          itemBuilder: (context, index) {
            var selectedcategoryProvider = Provider((ref) => CategoryItem());
            return Consumer(
              builder: (BuildContext context, WidgetRef ref, Widget? child) =>
                  MaterialButton(
                onPressed: () {
                  setState(() {
                    // ref.read(selectedcategoryProvider).checkItem(index);
                    tapIndex = index;
                    if (_animationController.isCompleted) {
                      _animationController.reset();
                    }
                  });

                  _animationController.forward();
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                clipBehavior: Clip.hardEdge,
                child: tapIndex == index
                    ? Column(
                        children: [
                          Expanded(
                              child: Lottie.asset(categoryAnimation[index],
                                  controller: _animationController,
                                  onLoaded: (composition) {
                            _animationController.duration =
                                composition.duration;
                          })),
                          Text(
                              textAlign: TextAlign.center,
                              "${categoryAnimation[index].substring(28)}")
                        ],
                      )
                    : Column(
                        children: [
                          Text(
                              textAlign: TextAlign.center,
                              "${categoryAnimation[index].substring(28)}")
                        ],
                      ),
              ),
            );
          }),
    );
  }
}
