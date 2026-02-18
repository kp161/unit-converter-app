import 'package:flutter/material.dart';
import 'package:unit_converter/features/category/model/category_items_model.dart';

class BuildGrid extends StatelessWidget {
  final List<CategoryItemsModel> items;
  const BuildGrid({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return GridView.extent(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      maxCrossAxisExtent: 100,
      mainAxisSpacing: 15,
      crossAxisSpacing: 15,
      childAspectRatio: 0.8,
      children: items.map((item) {
        return InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: item.onTap,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 70,
                width: 70,
                padding: const EdgeInsets.all(22),
                decoration: BoxDecoration(
                  color: isDark ? Color(0xFF1E293B) : Color(0xFFF6F6F8),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: isDark ? Colors.white12 : Colors.black12,
                      blurRadius: 4,
                      offset: Offset(2, 3),
                    ),
                  ],
                ),
                child: Image.asset(item.imagePath),
              ),
              const SizedBox(height: 6),
              Hero(
                tag: 'category_${item.title}',
                child: Material(
                  color: Colors.transparent,
                  child: Text(
                    item.title,
                    style: TextStyle(
                      color: isDark ? Colors.white70 : Colors.black87,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
