import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unit_converter/features/category/provider/search_provider.dart';

class SearchBarSection extends StatefulWidget {
  const SearchBarSection({super.key});

  @override
  State<SearchBarSection> createState() => _SearchBarSectionState();
}

class _SearchBarSectionState extends State<SearchBarSection> {
  final FocusNode _focusNode = FocusNode();

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Container(
      height: 46,
      padding: const EdgeInsets.symmetric(horizontal: 14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: isDark ? Colors.white24 : Colors.black26,
          width: 1,
        ),
        color: isDark ? Color(0xFF1E293B) : Color(0xFFF6F6F8),
      ),
      child: Row(
        children: [
          Icon(
            Icons.search,
            color: isDark ? Colors.white54 : Colors.black54,
            size: 20,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: TextField(
              focusNode: _focusNode,
              onChanged: (value) {
                context.read<SearchProvider>().updateQuery(value);
              },
              style: TextStyle(color: isDark ? Colors.white : Colors.black),
              decoration: InputDecoration(
                hintText: 'Search Conversion...',
                border: InputBorder.none,
                isDense: true,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
