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
        backgroundColor: Colors.deepPurple,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            _menuCard(
              context,
              title: 'Add Vehicle',
              icon: Icons.add,
              page: const AddVehiclePage(),
              gradient: const LinearGradient(colors: [Colors.green, Colors.lightGreen]),
            ),
            _menuCard(
              context,
              title: 'Show All Vehicles',
              icon: Icons.list,
              page: const ShowVehiclesPage(),
              gradient: const LinearGradient(colors: [Colors.blue, Colors.lightBlueAccent]),
            ),
            _menuCard(
              context,
              title: 'Search Vehicle',
              icon: Icons.search,
              page: const SearchVehiclePage(),
              gradient: const LinearGradient(colors: [Colors.orange, Colors.deepOrangeAccent]),
            ),
            _menuCard(
              context,
              title: 'Modify Vehicle',
              icon: Icons.edit,
              page: const ModifyVehiclePage(),
              gradient: const LinearGradient(colors: [Colors.purple, Colors.deepPurpleAccent]),
            ),
            _menuCard(
              context,
              title: 'Delete Vehicle',
              icon: Icons.delete,
              page: const DeleteVehiclePage(),
              gradient: const LinearGradient(colors: [Colors.red, Colors.redAccent]),
            ),
          ],
        ),
      ),
    );
  }

  Widget _menuCard(BuildContext context,
      {required String title,
        required IconData icon,
        required Widget page,
        required Gradient gradient}) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        decoration: BoxDecoration(
          gradient: gradient,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              offset: const Offset(0, 5),
              blurRadius: 10,
            ),
          ],
        ),
        child: Row(
          children: [
            Icon(icon, color: Colors.white, size: 30),
            const SizedBox(width: 20),
            Text(
              title,
              style: const TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
