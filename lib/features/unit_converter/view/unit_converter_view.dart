import 'package:currency_picker/currency_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:provider/provider.dart';
import 'package:unit_converter/features/unit_converter/provider/unit_converter_controller.dart';
import 'package:unit_converter/features/unit_converter/widget/build_card.dart';
import 'package:unit_converter/features/unit_converter/widget/static_keyboard.dart';
import 'package:unit_converter/features/unit_converter/widget/swap_button.dart';
import 'package:unit_converter/widgets/convert_icon.dart';

class UnitConverterView extends StatefulWidget {
  final String title;
  final String category;

  const UnitConverterView({
    super.key,
    required this.title,
    required this.category,
  });

  @override
  State<UnitConverterView> createState() => _UnitConverterViewState();
}

class _UnitConverterViewState extends State<UnitConverterView>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _keyboardFade;
  late Animation<Offset> _keyboardSlide;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );

    _keyboardFade = CurvedAnimation(
      parent: _controller,
      curve: const Interval(0, 1.0, curve: Curves.easeOutCubic),
    );

    _keyboardSlide = Tween<Offset>(
      begin: const Offset(0, 0.4),
      end: Offset.zero,
    ).animate(_keyboardFade);

    Future.delayed(const Duration(milliseconds: 300), () {
      if (mounted) _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  List<Widget> _buildCards(UnitConverterController c, BuildContext context) {
    final isCurrency = widget.category == "currency";

    Widget buildFrom() => isCurrency
        ? BuildCard(
            title: 'FROM',
            value: c.inputValue,
            unit: c.fromCurrency.code,
            isFrom: true,
            isCurrency: true,
            onCurrencyTap: () {
              showCurrencyPicker(
                context: context,
                onSelect: (val) => c.setFromCurrency(val, context),
              );
            },
          )
        : BuildCard(
            title: 'FROM',
            value: c.inputValue,
            unit: c.fromUnit,
            isFrom: true,
            unitList: c.units,
            onUnitChanged: (val) => c.setFromUnit(val, context),
          );

    Widget buildTo() => isCurrency
        ? BuildCard(
            title: 'TO',
            value: c.resultValue,
            unit: c.toCurrency.code,
            isFrom: false,
            isCurrency: true,
            onCurrencyTap: () {
              showCurrencyPicker(
                context: context,
                onSelect: (val) => c.setToCurrency(val, context),
              );
            },
          )
        : BuildCard(
            title: 'TO',
            value: c.resultValue,
            unit: c.toUnit,
            isFrom: false,
            unitList: c.units,
            onUnitChanged: (val) => c.setToUnit(val, context),
          );

    return [
      buildFrom(),
      SwapButton(onTap: () => c.swapUnits(context)),
      buildTo(),
    ];
  }

  Widget animatedKeyboard(UnitConverterController c) {
    return SlideTransition(
      position: _keyboardSlide,
      child: FadeTransition(
        opacity: _keyboardFade,
        child: StaticKeyboard(onKeyTap: (val) => c.onKeyTap(val, context)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final c = context.watch<UnitConverterController>();
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final cards = _buildCards(c, context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        toolbarHeight: 40,
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: Colors.transparent,
        leading: Padding(
          padding: EdgeInsets.only(left: 15, top: 6, bottom: 6),
          child: ConvertIcon(),
        ),
        centerTitle: true,
        title: Hero(
          tag: 'category_${widget.title}',
          child: Material(
            color: Colors.transparent,
            child: Text(
              widget.title,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w700,
                color: isDark ? Colors.white : Colors.black,
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: OrientationBuilder(
          builder: (context, orientation) {
            final isLandscape = orientation == Orientation.landscape;

            if (isLandscape) {
              return Row(
                children: [
                  Expanded(
                    flex: 5,
                    child: SingleChildScrollView(child: _animatedList(cards)),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    flex: 4,
                    child: SingleChildScrollView(child: animatedKeyboard(c)),
                  ),
                ],
              );
            } else {
              return Column(
                children: [
                  Expanded(child: _animatedList(cards)),
                  animatedKeyboard(c),
                ],
              );
            }
          },
        ),
      ),
    );
  }

  Widget _animatedList(List<Widget> widgets) {
    return AnimationLimiter(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: List.generate(
          widgets.length,
          (index) => AnimationConfiguration.staggeredList(
            position: index,
            duration: Duration(milliseconds: 450),
            child: SlideAnimation(
              verticalOffset: 50,
              child: FadeInAnimation(
                child: Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: widgets[index],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
