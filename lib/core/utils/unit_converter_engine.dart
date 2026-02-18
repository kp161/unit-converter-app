import 'package:unit_converter/core/utils/unit_mapper.dart';
import 'package:units_converter/units_converter.dart';

class UnitConverterEngine {
  static double convert({
    required String category,
    required String from,
    required String to,
    required double value,
  }) {
    switch (category) {
      case 'length':
        return _length(from, to, value);

      case 'weight':
        return _mass(from, to, value);

      case 'temperature':
        return _temperature(from, to, value);

      case 'speed':
        return _speed(from, to, value);

      case 'area':
        return _area(from, to, value);

      case 'volume':
        return _volume(from, to, value);

      case 'time':
        return _time(from, to, value);

      case 'cooking':
        return _cooking(from, to, value);

      case 'fuel':
        return _fuel(from, to, value);
      
      case 'volume3d':
        return _volume3d(from, to, value);

      case 'digital':
        return _digital(from, to, value);

      case 'energy':
        return _energy(from, to, value);

      case 'power':
        return _power(from, to, value);

      default:
        return value;
    }
  }

  static double _mass(String from, String to, double val) {
    final f = UnitMapper.mass[from]!;
    final t = UnitMapper.mass[to]!;

    final m = Mass();
    m.convert(f, val);

    final result = m.getUnit(t);

    return result.value ?? val;
  }

  static double _length(String from, String to, double val) {
    final f = UnitMapper.length[from]!;
    final t = UnitMapper.length[to]!;

    final l = Length();
    l.convert(f, val);

    final result = l.getUnit(t);

    return result.value ?? val;
  }

  static double _temperature(String from, String to, double val) {
    final f = UnitMapper.temperature[from]!;
    final t = UnitMapper.temperature[to]!;

    final temp = Temperature();
    temp.convert(f, val);

    final result = temp.getUnit(t);

    return result.value ?? val;
  }

  static double _speed(String from, String to, double val) {
    final f = UnitMapper.speed[from]!;
    final t = UnitMapper.speed[to]!;

    final s = Speed();
    s.convert(f, val);

    final result = s.getUnit(t);
    return result.value ?? val;
  }

  static double _time(String from, String to, double val) {
    final f = UnitMapper.time[from]!;
    final t = UnitMapper.time[to]!;

    final time = Time();
    time.convert(f, val);

    final result = time.getUnit(t);
    return result.value ?? val;
  }

  static double _volume(String from, String to, double val) {
    final f = UnitMapper.volume[from]!;
    final t = UnitMapper.volume[to]!;

    final v = Volume();
    v.convert(f, val);

    final result = v.getUnit(t);
    return result.value ?? val;
  }

  static double _cooking(String from, String to, double val) {
    final f = UnitMapper.cooking[from]!;
    final t = UnitMapper.cooking[to]!;

    final c = Volume();
    c.convert(f, val);

    final result = c.getUnit(t);
    return result.value ?? val;
  }

  static double _volume3d(String from, String to, double val){
    final f = UnitMapper.volume3d[from]!;
    final t = UnitMapper.volume3d[to]!;

    final v3d = Volume();
    v3d.convert(f, val);

    final result = v3d.getUnit(t);
    return result.value ?? val;
  }

  static double _area(String from, String to, double val) {
    final f = UnitMapper.area[from]!;
    final t = UnitMapper.area[to]!;

    final a = Area();
    a.convert(f, val);

    final result = a.getUnit(t);
    return result.value ?? val;
  }

  static double _fuel(String from, String to, double val) {
    final f = UnitMapper.fuel[from]!;
    final t = UnitMapper.fuel[to]!;

    final fuel = FuelConsumption();
    fuel.convert(f, val);

    final result = fuel.getUnit(t);
    return result.value ?? val;
  }

  static double _digital(String from, String to, double val) {
    final f = UnitMapper.digital[from]!;
    final t = UnitMapper.digital[to]!;

    final d = DigitalData();
    d.convert(f, val);

    final result = d.getUnit(t);
    return result.value ?? val;
  }

  static double _energy(String from, String to, double val) {
    final f = UnitMapper.energy[from]!;
    final t = UnitMapper.energy[to]!;

    final e = Energy();
    e.convert(f, val);

    final result = e.getUnit(t);
    return result.value ?? val;
  }

  static double _power(String from, String to, double val) {
    final f = UnitMapper.power[from]!;
    final t = UnitMapper.power[to]!;

    final p = Power();
    p.convert(f, val);

    final result = p.getUnit(t);
    return result.value ?? val;
  }
}
