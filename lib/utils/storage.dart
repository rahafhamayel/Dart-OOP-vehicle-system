import 'dart:convert';
import 'dart:io';
import '../models/car.dart';
import '../models/motorcycle.dart';
import '../models/truck.dart';
import 'package:path_provider/path_provider.dart';

class Storage {
  // اسماء الملفات
  static const String _carsFile = 'cars.json';
  static const String _motorcyclesFile = 'motorcycles.json';
  static const String _trucksFile = 'trucks.json';

  // الحصول على مجلد التطبيق
  static Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  // إنشاء ملف
  static Future<File> _localFile(String filename) async {
    final path = await _localPath;
    return File('$path/$filename');
  }

  // ===================== Cars =====================
  static Future<void> saveCars(List<Car> cars) async {
    final file = await _localFile(_carsFile);
    final jsonStr = jsonEncode(cars.map((c) => c.toJson()).toList());
    await file.writeAsString(jsonStr);
  }

  static Future<List<Car>> loadCars() async {
    try {
      final file = await _localFile(_carsFile);
      if (!file.existsSync()) return [];
      final jsonStr = await file.readAsString();
      final List<dynamic> jsonList = jsonDecode(jsonStr);
      return jsonList.map((json) => Car.fromJson(json)).toList();
    } catch (e) {
      return [];
    }
  }

  // ===================== Motorcycles =====================
  static Future<void> saveMotorcycles(List<Motorcycle> motorcycles) async {
    final file = await _localFile(_motorcyclesFile);
    final jsonStr =
    jsonEncode(motorcycles.map((m) => m.toJson()).toList());
    await file.writeAsString(jsonStr);
  }

  static Future<List<Motorcycle>> loadMotorcycles() async {
    try {
      final file = await _localFile(_motorcyclesFile);
      if (!file.existsSync()) return [];
      final jsonStr = await file.readAsString();
      final List<dynamic> jsonList = jsonDecode(jsonStr);
      return jsonList.map((json) => Motorcycle.fromJson(json)).toList();
    } catch (e) {
      return [];
    }
  }

  // ===================== Trucks =====================
  static Future<void> saveTrucks(List<Truck> trucks) async {
    final file = await _localFile(_trucksFile);
    final jsonStr = jsonEncode(trucks.map((t) => t.toJson()).toList());
    await file.writeAsString(jsonStr);
  }

  static Future<List<Truck>> loadTrucks() async {
    try {
      final file = await _localFile(_trucksFile);
      if (!file.existsSync()) return [];
      final jsonStr = await file.readAsString();
      final List<dynamic> jsonList = jsonDecode(jsonStr);
      return jsonList.map((json) => Truck.fromJson(json)).toList();
    } catch (e) {
      return [];
    }
  }
}