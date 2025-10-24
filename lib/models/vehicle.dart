import 'automobile.dart';
import 'engine.dart';
import 'enums.dart';

class Vehicle extends Automobile {
  int _length = 0;
  int _width = 0;
  String _color = '';

  int get length => _length;
  set length(int value) => _length = value;

  int get width => _width;
  set width(int value) => _width = value;

  String get color => _color;
  set color(String value) => _color = value;

  Vehicle();
  Vehicle.full(
      String manufactureCompany,
      DateTime manufactureDate,
      String model,
      Engine engine,
      int plateNum,
      GearType gearType,
      int bodySerialNum,
      this._length,
      this._width,
      this._color)
      : super.full(
      manufactureCompany,
      manufactureDate,
      model,
      engine,
      plateNum,
      gearType,
      bodySerialNum);

  @override
  Map<String, dynamic> toJson() => {
    ...super.toJson(),
    'length': _length,
    'width': _width,
    'color': _color,
  };

  factory Vehicle.fromJson(Map<String, dynamic> json) => Vehicle.full(
    json['manufactureCompany'],
    DateTime.parse(json['manufactureDate']),
    json['model'],
    Engine.fromJson(json['engine']),
    json['plateNum'],
    GearType.values.firstWhere(
            (e) => e.toString().split('.').last == json['gearType']),
    json['bodySerialNum'],
    json['length'],
    json['width'],
    json['color'],
  );
}
