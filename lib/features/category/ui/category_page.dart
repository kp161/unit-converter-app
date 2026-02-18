import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:unit_converter/core/constant/category_list.dart';
import 'package:unit_converter/features/category/model/category_items_model.dart';
import 'package:unit_converter/features/category/widgets/build_grid.dart';
import 'package:unit_converter/features/category/widgets/home_top_bar.dart';
import 'package:unit_converter/features/category/widgets/search_bar_section.dart';

class CategoryPage extends StatefulWidget {
  final VoidCallback toggleTheme;
  const CategoryPage({super.key, required this.toggleTheme});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  String searchQuery = '';

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
    final isDark = theme.brightness == Brightness.dark;

    final allCategory = getCategoryItems(context);

    final Map<String, List<CategoryItemsModel>> filteredCategoryMap = {};

    allCategory.forEach((section, items) {
      final filteredItems = items.where((item) {
        return item.title.toLowerCase().contains(searchQuery.toLowerCase());
      }).toList();

      if (filteredItems.isNotEmpty) {
        filteredCategoryMap[section] = filteredItems;
      }
    });

    final List<Widget> widgets = [
      HomeTopBar(isDark: isDark, onThemeToggle: widget.toggleTheme),

      const SizedBox(height: 28),

      SearchBarSection(
        onChanged: (value) {
          setState(() {
            searchQuery = value;
          });
        },
      ),

      const SizedBox(height: 28),

      ...filteredCategoryMap.entries.map((entry) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildCategoryTitle(entry.key.toUpperCase()),
            const SizedBox(height: 15),
            BuildGrid(items: entry.value),
            const SizedBox(height: 20),
          ],
        );
      }).toList(),
      if (filteredCategoryMap.isEmpty)
        const Center(
          child: Padding(
            padding: EdgeInsets.only(top: 40),
            child: Text("No category found"),
          ),
        ),
    ];

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
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

  Widget buildCategoryTitle(String title) {
    return Text(
      title,
      style: TextStyle(
        color: Color(0xFF5048E5),
        fontSize: 14,
        letterSpacing: 1.2,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
