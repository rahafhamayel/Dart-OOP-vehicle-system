import 'engine.dart';
import 'enums.dart';
import 'vehicle.dart';

class Car extends Vehicle {
  int _chairNum = 0;
  bool _isFurnitureLeather = false;

  int get chairNum => _chairNum;
  set chairNum(int value) => _chairNum = value;

  bool get isFurnitureLeather => _isFurnitureLeather;
  set isFurnitureLeather(bool value) => _isFurnitureLeather = value;

  Car();
  Car.full(
      String manufactureCompany,
      DateTime manufactureDate,
      String model,
      Engine engine,
      int plateNum,
      GearType gearType,
      int bodySerialNum,
      int length,
      int width,
      String color,
      this._chairNum,
      this._isFurnitureLeather)
      : super.full(
      manufactureCompany,
      manufactureDate,
      model,
      engine,
      plateNum,
      gearType,
      bodySerialNum,
      length,
      width,
      color);

  @override
  Map<String, dynamic> toJson() => {
    ...super.toJson(),
    'chairNum': _chairNum,
    'isFurnitureLeather': _isFurnitureLeather,
  };

  factory Car.fromJson(Map<String, dynamic> json) => Car.full(
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
    json['chairNum'],
    json['isFurnitureLeather'],
  );
}