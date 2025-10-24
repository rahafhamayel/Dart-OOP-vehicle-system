import 'package:flutter/material.dart';
import '../models/car.dart';
import '../models/motorcycle.dart';
import '../models/truck.dart';
import '../utils/storage.dart';

class DeleteVehiclePage extends StatefulWidget {
  const DeleteVehiclePage({super.key});

  @override
  State<DeleteVehiclePage> createState() => _DeleteVehiclePageState();
}

class _DeleteVehiclePageState extends State<DeleteVehiclePage> {
  final TextEditingController _plateController = TextEditingController();
  String _status = '';

  void _deleteVehicle() async {
    int plate = int.tryParse(_plateController.text) ?? 0;

    List<Car> cars = await Storage.loadCars();
    List<Motorcycle> motorcycles = await Storage.loadMotorcycles();
    List<Truck> trucks = await Storage.loadTrucks();

    bool found = false;

    cars.removeWhere((v) {
      if (v.plateNum == plate) {
        found = true;
        return true;
      }
      return false;
    });

    motorcycles.removeWhere((v) {
      if (v.plateNum == plate) {
        found = true;
        return true;
      }
      return false;
    });

    trucks.removeWhere((v) {
      if (v.plateNum == plate) {
        found = true;
        return true;
      }
      return false;
    });

    await Storage.saveCars(cars);
    await Storage.saveMotorcycles(motorcycles);
    await Storage.saveTrucks(trucks);

    setState(() {
      _status = found ? 'Vehicle deleted!' : 'Vehicle not found.';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Delete Vehicle')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _plateController,
              decoration: const InputDecoration(labelText: 'Enter Plate Number'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: _deleteVehicle, child: const Text('Delete Vehicle')),
            const SizedBox(height: 20),
            Text(_status),
          ],
        ),
      ),
    );
  }
}
