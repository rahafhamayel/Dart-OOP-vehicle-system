import 'package:flutter/material.dart';

class ShowVehiclesPage extends StatelessWidget {
  const ShowVehiclesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Show Vehicles')),
      body: Center(
        child: Text('هنا يتم عرض جميع السيارات المخزنة'),
      ),
    );
  }
}
