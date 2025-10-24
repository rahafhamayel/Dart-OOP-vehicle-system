import 'engine.dart';
import 'enums.dart';
import 'vehicle.dart';

class Truck extends Vehicle {
  double _freeWeight = 0.0;
  double _fullWeight = 0.0;

  double get freeWeight => _freeWeight;
  set freeWeight(double value) => _freeWeight = value;

  double get fullWeight => _fullWeight;
  set fullWeight(double value) => _fullWeight = value;

  Truck();
  Truck.full(
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
      this._freeWeight,
      this._fullWeight)
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
    'freeWeight': _freeWeight,
    'fullWeight': _fullWeight,
  };

  factory Truck.fromJson(Map<String, dynamic> json) => Truck.full(
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
    json['freeWeight'],
    json['fullWeight'],
  );
}
