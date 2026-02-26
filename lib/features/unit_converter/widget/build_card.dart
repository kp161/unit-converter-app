import 'package:flutter/material.dart';

class BuildCard extends StatelessWidget {
  final String title;
  final String value;
  final String unit;
  final bool isFrom;
  final List<String>? unitList;
  final Function(String)? onUnitChanged;

  final bool isCurrency;
  final VoidCallback? onCurrencyTap;

  const BuildCard({
    super.key,
    required this.title,
    required this.value,
    required this.unit,
    required this.isFrom,
    this.unitList,
    this.onUnitChanged,
    this.isCurrency = false,
    this.onCurrencyTap,
  });

  void _showUnitPicker(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return ListView.separated(
          padding: EdgeInsets.all(16),
          itemCount: unitList!.length,
          separatorBuilder: (_, __) => const Divider(),
          itemBuilder: (context, index) {
            final selectedUnit = unitList![index];

            return ListTile(
              title: Text(
                selectedUnit,
                style: TextStyle(
                  fontSize: 16,
                  color: isDark ? Colors.white70 : Colors.black87,
                ),
              ),
              trailing: selectedUnit == unit
                  ? Icon(
                      Icons.check_rounded,
                      color: (isDark ? Colors.white70 : Colors.black87),
                    )
                  : null,
              onTap: () {
                onUnitChanged!(selectedUnit);
                Navigator.pop(context);
              },
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final orientation = MediaQuery.of(context).orientation;
    final isLandscape = orientation == Orientation.landscape;

    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: isDark ? Color(0xFF1E293B) : Color(0xFFF6F6F8),
        borderRadius: BorderRadius.circular(22),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                title,
                style: TextStyle(
                  color: isDark
                      ? Colors.white.withOpacity(0.5)
                      : Colors.black.withOpacity(0.5),
                  letterSpacing: 1.2,
                  fontSize: 12,
                ),
              ),
              const Spacer(),
              _chip(context),
            ],
          ),
          SizedBox(height: isLandscape ? 7 : 10),
          Text(
            value,
            style: TextStyle(
              fontSize: isLandscape ? 28 : 30,
              fontWeight: FontWeight.w800,
              color: isFrom
                  ? (isDark ? Colors.white : Colors.black)
                  : Color(0xFF5C6CFF),
            ),
          ),
        ],
      ),
    );
  }

  Widget _chip(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return GestureDetector(
      onTap: isCurrency ? onCurrencyTap : () => _showUnitPicker(context),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
        decoration: BoxDecoration(
          color: isDark ? Color(0xFF2A3152) : Color(0xFFE6F1FB),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Text(
              unit,
              style: TextStyle(color: isDark ? Colors.white70 : Colors.black87),
            ),
            const SizedBox(width: 6),
            Icon(
              Icons.keyboard_arrow_down_rounded,
              color: isDark ? Colors.white70 : Colors.black87,
            ),
          ],
        ),
      ),
    );
  }
}
