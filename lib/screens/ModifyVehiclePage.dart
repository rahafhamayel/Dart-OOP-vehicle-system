import 'package:flutter/material.dart';
import '../models/car.dart';
import '../models/motorcycle.dart';
import '../models/truck.dart';
import '../utils/storage.dart';

class ModifyVehiclePage extends StatefulWidget {
  const ModifyVehiclePage({super.key});

  @override
  State<ModifyVehiclePage> createState() => _ModifyVehiclePageState();
}

class _ModifyVehiclePageState extends State<ModifyVehiclePage> {
  final TextEditingController _plateController = TextEditingController();
  final TextEditingController _modelController = TextEditingController();
  String _status = '';

  void _loadVehicle() async {
    int plate = int.tryParse(_plateController.text) ?? 0;

    List<Car> cars = await Storage.loadCars();
    List<Motorcycle> motorcycles = await Storage.loadMotorcycles();
    List<Truck> trucks = await Storage.loadTrucks();

    var vehicleList = cars.cast<dynamic>()
        .followedBy(motorcycles)
        .followedBy(trucks)
        .toList();

    var vehicle = vehicleList.firstWhere((v) => v.plateNum == plate, orElse: () => null);

    if (vehicle != null) {
      _modelController.text = vehicle.model;
      setState(() => _status = 'Vehicle loaded. Edit the model and save.');
    } else {
      setState(() => _status = 'Vehicle not found.');
    }
  }

  void _saveChanges() async {
    int plate = int.tryParse(_plateController.text) ?? 0;
    String newModel = _modelController.text;

    List<Car> cars = await Storage.loadCars();
    List<Motorcycle> motorcycles = await Storage.loadMotorcycles();
    List<Truck> trucks = await Storage.loadTrucks();

    bool found = false;

    for (var v in cars) {
      if (v.plateNum == plate) {
        v.model = newModel;
        found = true;
        await Storage.saveCars(cars);
        break;
      }
    }

    for (var v in motorcycles) {
      if (v.plateNum == plate) {
        v.model = newModel;
        found = true;
        await Storage.saveMotorcycles(motorcycles);
        break;
      }
    }

    for (var v in trucks) {
      if (v.plateNum == plate) {
        v.model = newModel;
        found = true;
        await Storage.saveTrucks(trucks);
        break;
      }
    }

    setState(() {
      _status = found ? 'Changes saved!' : 'Vehicle not found.';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Modify Vehicle')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _plateController,
              decoration: const InputDecoration(labelText: 'Enter Plate Number'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 10),
            ElevatedButton(onPressed: _loadVehicle, child: const Text('Load Vehicle')),
            const SizedBox(height: 10),
            TextField(
              controller: _modelController,
              decoration: const InputDecoration(labelText: 'Model'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: _saveChanges, child: const Text('Save Changes')),
            const SizedBox(height: 20),
            Text(_status),
          ],
        ),
      ),
    );
  }
}
