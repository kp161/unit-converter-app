import 'package:flutter/material.dart';
import 'package:unit_converter/core/constant/unit_list.dart';
import 'package:unit_converter/features/category/model/category_items_model.dart';
import 'package:unit_converter/features/unit_converter/ui/unit_converter_page.dart';
import 'package:unit_converter/core/routes/smooth_route.dart';

Map<dynamic, List<CategoryItemsModel>> getCategoryItems(BuildContext context) {
  void navigate(String title, List<String> units, String category) {
    FocusScope.of(context).unfocus();
    Future.delayed(Duration(milliseconds: 150), () {
      if(!context.mounted) return;
      Navigator.of(context).push(
        smoothRoute(
          UnitConverterPage(title: title, units: units, category: category),
        ),
      );
    });
  }

  return {
    'Common': [
      CategoryItemsModel(
        'Weight',
        'assets/icons/weight.png',
        () => navigate('Weight', weightUnits, 'weight'),
      ),
      CategoryItemsModel(
        'Length',
        'assets/icons/length.png',
        () => navigate('Length', lengthUnits, 'length'),
      ),
      CategoryItemsModel(
        'Volume',
        'assets/icons/volume.png',
        () => navigate('Volume', volumeUnits, 'volume'),
      ),
      CategoryItemsModel(
        'Area',
        'assets/icons/area.png',
        () => navigate('Area', areaUnits, 'area'),
      ),
      CategoryItemsModel(
        'Speed',
        'assets/icons/speed.png',
        () => navigate('Speed', speedUnits, 'speed'),
      ),
      CategoryItemsModel(
        'Cooking',
        'assets/icons/cooking.png',
        () => navigate('Cooking', cookingUnits, 'cooking'),
      ),
      CategoryItemsModel(
        'Currency',
        'assets/icons/currency.png',
        () => navigate('Currency', currencyUnits, 'currency'),
      ),
      CategoryItemsModel(
        'Fuel',
        'assets/icons/fuel.png',
        () => navigate('Fuel', fuelUnits, 'fuel'),
      ),
    ],

    'Time': [
      CategoryItemsModel(
        'Time',
        'assets/icons/time.png',
        () => navigate('Time', timeUnits, 'time'),
      ),
    ],

    'Engineering': [
      CategoryItemsModel(
        'Temp.',
        'assets/icons/temp.png',
        () => navigate('Temp.', tempUnits, 'temperature'),
      ),
      CategoryItemsModel(
        'Volume 3D',
        'assets/icons/vector 3D.png',
        () => navigate('Volume 3D', volume3dUnits, 'volume3d'),
      ),
      CategoryItemsModel(
        'Digital',
        'assets/icons/digital.png',
        () => navigate('Digital', digitalUnits, 'digital'),
      ),
    ],

    'Electricity': [
      CategoryItemsModel(
        'Energy',
        'assets/icons/energy.png',
        () => navigate('Energy', energyUnits, 'energy'),
      ),
      CategoryItemsModel(
        'Power',
        'assets/icons/power.png',
        () => navigate('Power', powerUnits, 'power'),
      ),
    ],
  };
}
