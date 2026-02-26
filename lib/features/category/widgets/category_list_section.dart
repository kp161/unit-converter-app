import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:provider/provider.dart';
import 'package:unit_converter/core/constant/category_list.dart';
import 'package:unit_converter/features/category/model/category_items_model.dart';
import 'package:unit_converter/features/category/provider/search_provider.dart';
import 'package:unit_converter/features/category/widgets/build_grid.dart';

class CategoryListSection extends StatelessWidget {
  const CategoryListSection({super.key});

  @override
  Widget build(BuildContext context) {
    final searchQuery = context.watch<SearchProvider>().query;

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

    if (filteredCategoryMap.isEmpty) {
      return Padding(
        padding: EdgeInsets.only(top: 60),
        child: Center(
          child: Column(
            children: [
              Icon(Icons.search_off_rounded, size: 60, color: Colors.grey,),
              SizedBox(height: 16),
              Text("No category found", 
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.grey,
              ),),
            ],
          ),
        ),
      );
    }

    final entries = filteredCategoryMap.entries.toList();

    return AnimationLimiter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(entries.length, (index) {
          final entry = entries[index];

          return AnimationConfiguration.staggeredList(
            position: index,
            duration: Duration(milliseconds: 450),
            child: SlideAnimation(
              verticalOffset: 40,
              child: FadeInAnimation(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildCategoryTitle(entry.key.toUpperCase()),
                    const SizedBox(height: 15),
                    BuildGrid(items: entry.value),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          );
        }),
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
