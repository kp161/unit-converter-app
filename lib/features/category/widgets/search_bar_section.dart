import 'package:flutter/material.dart';

class SearchBarSection extends StatelessWidget {
  final ValueChanged<String> onChanged;
  const SearchBarSection({super.key, required this.onChanged});

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
          Expanded(child: TextField(
            onChanged: onChanged,
            style: TextStyle(color: isDark ? Colors.white : Colors.black),
            decoration: InputDecoration(
              hintText: 'Search Conversion...',
              border: InputBorder.none,
              isDense: true
            ),
          ))
        ],
      ),
    );
  }
}
