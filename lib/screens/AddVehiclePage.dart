import 'package:flutter/material.dart';
import '../models/car.dart';
import '../models/motorcycle.dart';
import '../models/truck.dart';
import '../utils/storage.dart';
import '../models/engine.dart';
import '../models/enums.dart';

class AddVehiclePage extends StatefulWidget {
  const AddVehiclePage({super.key});

  @override
  State<AddVehiclePage> createState() => _AddVehiclePageState();
}

class _AddVehiclePageState extends State<AddVehiclePage> {
  String type = 'Car';

  final _formKey = GlobalKey<FormState>();

  final companyController = TextEditingController();
  final modelController = TextEditingController();
  final plateController = TextEditingController();
  final bodyController = TextEditingController();

  final lengthController = TextEditingController();
  final widthController = TextEditingController();
  final colorController = TextEditingController();

  final engCompanyController = TextEditingController();
  final engModelController = TextEditingController();
  final engCapacityController = TextEditingController();
  final engCylindersController = TextEditingController();

  GearType gearType = GearType.normal;
  FuelType fuelType = FuelType.gasoline;

  final chairController = TextEditingController();
  bool leather = false;

  final tierController = TextEditingController();

  final freeWeightController = TextEditingController();
  final fullWeightController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Vehicle')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              DropdownButtonFormField<String>(
                value: type,
                items: const [
                  DropdownMenuItem(value: 'Car', child: Text('Car')),
                  DropdownMenuItem(value: 'Motorcycle', child: Text('Motorcycle')),
                  DropdownMenuItem(value: 'Truck', child: Text('Truck')),
                ],
                onChanged: (v) {
                  setState(() => type = v!);
                },
                decoration: const InputDecoration(labelText: 'Vehicle Type'),
              ),
              const SizedBox(height: 10),

              TextFormField(controller: companyController, decoration: const InputDecoration(labelText: 'Company')),
              TextFormField(controller: modelController, decoration: const InputDecoration(labelText: 'Model')),
              TextFormField(controller: plateController, decoration: const InputDecoration(labelText: 'Plate Number'), keyboardType: TextInputType.number),
              TextFormField(controller: bodyController, decoration: const InputDecoration(labelText: 'Body Serial Number'), keyboardType: TextInputType.number),
              TextFormField(controller: lengthController, decoration: const InputDecoration(labelText: 'Length'), keyboardType: TextInputType.number),
              TextFormField(controller: widthController, decoration: const InputDecoration(labelText: 'Width'), keyboardType: TextInputType.number),
              TextFormField(controller: colorController, decoration: const InputDecoration(labelText: 'Color')),

              // Engine
              TextFormField(controller: engCompanyController, decoration: const InputDecoration(labelText: 'Engine Company')),
              TextFormField(controller: engModelController, decoration: const InputDecoration(labelText: 'Engine Model')),
              TextFormField(controller: engCapacityController, decoration: const InputDecoration(labelText: 'Engine Capacity'), keyboardType: TextInputType.number),
              TextFormField(controller: engCylindersController, decoration: const InputDecoration(labelText: 'Engine Cylinders'), keyboardType: TextInputType.number),

              DropdownButtonFormField<GearType>(
                value: gearType,
                items: GearType.values
                    .map((e) => DropdownMenuItem(value: e, child: Text(e.toString().split('.').last)))
                    .toList(),
                onChanged: (v) => setState(() => gearType = v!),
                decoration: const InputDecoration(labelText: 'Gear Type'),
              ),
              DropdownButtonFormField<FuelType>(
                value: fuelType,
                items: FuelType.values
                    .map((e) => DropdownMenuItem(value: e, child: Text(e.toString().split('.').last)))
                    .toList(),
                onChanged: (v) => setState(() => fuelType = v!),
                decoration: const InputDecoration(labelText: 'Fuel Type'),
              ),

              const SizedBox(height: 10),

              if (type == 'Car') ...[
                TextFormField(controller: chairController, decoration: const InputDecoration(labelText: 'Chairs'), keyboardType: TextInputType.number),
                CheckboxListTile(
                  title: const Text('Leather Furniture'),
                  value: leather,
                  onChanged: (v) => setState(() => leather = v!),
                ),
              ],
              if (type == 'Motorcycle') ...[
                TextFormField(controller: tierController, decoration: const InputDecoration(labelText: 'Tier Diameter'), keyboardType: TextInputType.number),
              ],
              if (type == 'Truck') ...[
                TextFormField(controller: freeWeightController, decoration: const InputDecoration(labelText: 'Free Weight'), keyboardType: TextInputType.number),
                TextFormField(controller: fullWeightController, decoration: const InputDecoration(labelText: 'Full Weight'), keyboardType: TextInputType.number),
              ],

              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  final engine = Engine.full(
                    engCompanyController.text,
                    DateTime.now(),
                    engModelController.text,
                    int.tryParse(engCapacityController.text) ?? 0,
                    int.tryParse(engCylindersController.text) ?? 0,
                    fuelType,
                  );

                  if (type == 'Car') {
                    final car = Car.full(
                      companyController.text,
                      DateTime.now(),
                      modelController.text,
                      engine,
                      int.tryParse(plateController.text) ?? 0,
                      gearType,
                      int.tryParse(bodyController.text) ?? 0,
                      int.tryParse(lengthController.text) ?? 0,
                      int.tryParse(widthController.text) ?? 0,
                      colorController.text,
                      int.tryParse(chairController.text) ?? 0,
                      leather,
                    );
                    final cars = await Storage.loadCars();
                    cars.add(car);
                    await Storage.saveCars(cars);
                  } else if (type == 'Motorcycle') {
                    final moto = Motorcycle.full(
                      companyController.text,
                      DateTime.now(),
                      modelController.text,
                      engine,
                      int.tryParse(plateController.text) ?? 0,
                      gearType,
                      int.tryParse(bodyController.text) ?? 0,
                      double.tryParse(tierController.text) ?? 0.0,
                      double.tryParse(lengthController.text) ?? 0.0,
                    );
                    final motos = await Storage.loadMotorcycles();
                    motos.add(moto);
                    await Storage.saveMotorcycles(motos);
                  } else if (type == 'Truck') {
                    final truck = Truck.full(
                      companyController.text,
                      DateTime.now(),
                      modelController.text,
                      engine,
                      int.tryParse(plateController.text) ?? 0,
                      gearType,
                      int.tryParse(bodyController.text) ?? 0,
                      int.tryParse(lengthController.text) ?? 0,
                      int.tryParse(widthController.text) ?? 0,
                      colorController.text,
                      double.tryParse(freeWeightController.text) ?? 0.0,
                      double.tryParse(fullWeightController.text) ?? 0.0,
                    );
                    final trucks = await Storage.loadTrucks();
                    trucks.add(truck);
                    await Storage.saveTrucks(trucks);
                  }

                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Vehicle Added Successfully')));
                  Navigator.pop(context);
                },
                child: const Text('Add Vehicle'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
