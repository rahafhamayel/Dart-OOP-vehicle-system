import 'package:flutter/material.dart';

class ModifyVehiclePage extends StatelessWidget {
  const ModifyVehiclePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Modify Vehicle')),
      body: Center(
        child: Text('هنا يمكن تعديل بيانات سيارة موجودة'),
      ),
    );
  }
}
