import 'package:flutter/material.dart';

import 'AddVehiclePage.dart';
import 'DeleteVehiclePage.dart';
import 'ModifyVehiclePage.dart';
import 'SearchVehiclePage.dart';
import 'ShowVehiclesPage.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Vehicle Management System'),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const AddVehiclePage()),
                  );
                },
                child: const Text('Add Vehicle'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const ShowVehiclesPage()),
                  );
                },
                child: const Text('Show All Vehicles'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const SearchVehiclePage()),
                  );
                },
                child: const Text('Search Vehicle'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const ModifyVehiclePage()),
                  );
                },
                child: const Text('Modify Vehicle'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const DeleteVehiclePage()),
                  );
                },
                child: const Text('Delete Vehicle'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
