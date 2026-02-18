import 'package:units_converter/units_converter.dart';

class UnitMapper {
  static final mass = <String, MASS>{
    "Gram (g)": MASS.grams,
    "Milligram (mg)": MASS.milligrams,
    "Kilogram (kg)": MASS.kilograms,
    "Tonne (t)": MASS.tonnes,
    "Ounce (oz)": MASS.ounces,
    "Pound (lb)": MASS.pounds,
  };

  static final length = <String, LENGTH>{
    "Millimeter (mm)": LENGTH.millimeters,
    "Centimeter (cm)": LENGTH.centimeters,
    "Meter (m)": LENGTH.meters,
    "Kilometer (km)": LENGTH.kilometers,
    "Inch (in)": LENGTH.inches,
    "Feet (ft)": LENGTH.feet,
    "Yard (yd)": LENGTH.yards,
    "Mile (mi)": LENGTH.miles,
  };

  static final volume = <String, VOLUME>{
    "Milliliter (ml)": VOLUME.milliliters,
    "Liter (l)": VOLUME.liters,
    "Cubic meter (m³)": VOLUME.cubicMeters,
    "Gallon (gal)": VOLUME.usGallons,
    "Quart (qt)": VOLUME.usQuarts,
    "Pint (pt)": VOLUME.usPints,
    "Cup": VOLUME.cups,
  };

  static final area = <String, AREA>{
    "Square millimeter (mm²)": AREA.squareMillimeters,
    "Square centimeter (cm²)": AREA.squareCentimeters,
    "Square meter (m²)": AREA.squareMeters,
    "Square kilometer (km²)": AREA.squareKilometers,
    "Square feet (ft²)": AREA.squareFeet,
    "Square Yard (yd²)": AREA.squareYard,
    "Square mile (mi²)": AREA.squareMiles,
    "Acre (ac)": AREA.acres,
    "Hectare (ha)": AREA.hectares,
  };

  static final speed = <String, SPEED>{
    "Meter/second (m/s)": SPEED.metersPerSecond,
    "Kilometer/hour (km/h)": SPEED.kilometersPerHour,
    "Mile/hour (mi/h)": SPEED.milesPerHour,
  };

  static final cooking = <String, VOLUME>{
    "Teaspoon (tsp.)": VOLUME.teaspoonsUs,
    "Tablespoon (tbsp.)": VOLUME.tablespoonsUs,
    "Cup": VOLUME.cups,
    "Milliliter (ml)": VOLUME.milliliters,
    "Liter (l)": VOLUME.liters,
  };

  static final fuel = <String, FUEL_CONSUMPTION>{
    "Kilometers/liter (km/l)": FUEL_CONSUMPTION.kilometersPerLiter,
    "Liters/100km (l/100km)": FUEL_CONSUMPTION.litersPer100km,
    "Miles/gallon (UK mpg)": FUEL_CONSUMPTION.milesPerImperialGallon,
    "Miles/gallon (US mpg)": FUEL_CONSUMPTION.milesPerUsGallon,
  };

  static final time = <String, TIME>{
    "Millisecond (ms)": TIME.milliseconds,
    "Second (s)": TIME.seconds,
    "Minute (min)": TIME.minutes,
    "Hour (h)": TIME.hours,
    "Day (d)": TIME.days,
  };

  static final temperature = <String, TEMPERATURE>{
    "Celsius (°C)": TEMPERATURE.celsius,
    "Fahrenheit (°F)": TEMPERATURE.fahrenheit,
    "Kelvin (K)": TEMPERATURE.kelvin,
  };

  static final volume3d = <String, VOLUME>{
    "Cubic centimeter (cm³)": VOLUME.cubicCentimeters,
    "Cubic meter (m³)": VOLUME.cubicMeters,
    "Cubic inch (in³)": VOLUME.cubicInches,
    "Cubic feet (ft³)": VOLUME.cubicFeet,
  };

  static final digital = <String, DIGITAL_DATA>{
    "Byte (B)": DIGITAL_DATA.byte,
    "Kilobyte (kB)": DIGITAL_DATA.kilobyte,
    "Megabyte (MB)": DIGITAL_DATA.megabyte,
    "Gigabyte (GB)": DIGITAL_DATA.gigabyte,
    "Terabyte (TB)": DIGITAL_DATA.terabyte,
  };

  static final energy = <String, ENERGY>{
    "Joule (J)": ENERGY.joules,
    "Calories (cal)": ENERGY.calories,
    "Kilocalories (kcal)": ENERGY.kilocalories,
    "Kilowatt-hout (kWh)": ENERGY.kilowattHours,
  };

  static final power = <String, POWER>{
    "Watt (W)": POWER.watt,
    "Kilowatt (kW)": POWER.kilowatt,
    "Horsepower (hp)": POWER.imperialHorsePower,
  };
}
