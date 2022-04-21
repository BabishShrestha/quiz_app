import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:quiz_app/domain/entities/category.dart';
import 'package:quiz_app/presentation/widgets/options_dialog.dart';

import '../../constants.dart';

class CategorySection extends StatefulWidget {
  final List<Quiz_Category> quiz_category;

  const CategorySection({required this.quiz_category});
  @override
  State<CategorySection> createState() => _CategorySectionState();
}

class _CategorySectionState extends State<CategorySection>
    with TickerProviderStateMixin {
  final double kCategoryRowWidth = 20;

  final double kCategoryColumnHeight = 20;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  int tapIndex = -1;

  @override
  Widget build(BuildContext context) {
    Quiz_Category selected = Quiz_Category(id: 9, name: '');
    return Container(
      alignment: Alignment.topLeft,
      child: GridView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: widget.quiz_category.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1.2,
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 10.0),
          itemBuilder: (context, index) {
            return MaterialButton(
                padding: const EdgeInsets.all(12),
                // color: Color(0xFF00FCFF),
                onPressed: () {
                  setState(() {
                    // ref.read(selectedcategoryProvider).checkItem(index);
                    tapIndex = index;
                    selected = widget.quiz_category[tapIndex];
                  });
                  showDialog(
                      context: context,
                      builder: (context) => OptionDialog(
                            selectedcategory: selected,
                          ));
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                clipBehavior: Clip.hardEdge,
                child: index == tapIndex
                    ? CategoryItem(
                        index: index,
                        name: widget.quiz_category[index].name,
                        animate: true,
                      )
                    : CategoryItem(
                        index: index,
                        name: widget.quiz_category[index].name,
                        animate: false));
          }),
    );
  }
}

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    Key? key,
    required this.index,
    required this.name,
    required this.animate,
  }) : super(key: key);

  final int index;
  final String name;
  final bool animate;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: index < categoryAnimation.length
                ? Lottie.asset(
                    categoryAnimation[index],
                    animate: animate,
                  )
                : Icon(
                    iconlist[index - 6],
                    color: kPrimaryScaffoldColor,
                  )),
        Text(
          textAlign: TextAlign.center,
          name,
          style: kCategoryItemStyle,
        )
      ],
    );
  }
}
