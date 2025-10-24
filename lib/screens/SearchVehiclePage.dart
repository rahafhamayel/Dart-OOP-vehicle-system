import 'package:flutter/material.dart';
import '../models/car.dart';
import '../models/motorcycle.dart';
import '../models/truck.dart';
import '../utils/storage.dart';

class SearchVehiclePage extends StatefulWidget {
  const SearchVehiclePage({super.key});

  @override
  State<SearchVehiclePage> createState() => _SearchVehiclePageState();
}

class _SearchVehiclePageState extends State<SearchVehiclePage> {
  final TextEditingController _plateController = TextEditingController();
  String _result = '';

  void _searchVehicle() async {
    int plate = int.tryParse(_plateController.text) ?? 0;

    List<Car> cars = await Storage.loadCars();
    List<Motorcycle> motorcycles = await Storage.loadMotorcycles();
    List<Truck> trucks = await Storage.loadTrucks();

    var vehicle = cars.cast<dynamic>()
        .followedBy(motorcycles)
        .followedBy(trucks)
        .firstWhere(
            (v) => v.plateNum == plate,
        orElse: () => null);

    setState(() {
      if (vehicle != null) {
        _result = 'Found: ${vehicle.model}, Plate: ${vehicle.plateNum}';
      } else {
        _result = 'Vehicle not found.';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Search Vehicle')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _plateController,
              decoration: const InputDecoration(
                labelText: 'Enter Plate Number',
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: _searchVehicle, child: const Text('Search')),
            const SizedBox(height: 20),
            Text(_result),
          ],
        ),
      ),
    );
  }
}
