import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:unit_converter/features/category/widgets/category_list_section.dart';
import 'package:unit_converter/features/category/widgets/home_top_bar.dart';
import 'package:unit_converter/features/category/widgets/search_bar_section.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FocusScope.of(context).unfocus();
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final List<Widget> widgets = [
      HomeTopBar(),

      const SizedBox(height: 28),

      SearchBarSection(),

      const SizedBox(height: 28),

      CategoryListSection(),
    ];

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
            child: AnimationLimiter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(
                  widgets.length,
                  (index) => AnimationConfiguration.staggeredList(
                    position: index,
                    duration: Duration(milliseconds: 450),
                    child: SlideAnimation(
                      verticalOffset: 40,
                      child: FadeInAnimation(child: widgets[index]),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
