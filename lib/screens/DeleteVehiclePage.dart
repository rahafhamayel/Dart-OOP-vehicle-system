
import 'package:flutter/material.dart';

class DeleteVehiclePage extends StatelessWidget {
  const DeleteVehiclePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Delete Vehicle')),
      body: Center(
        child: Text('هنا يمكن حذف سيارة موجودة'),
      ),
    );
  }
}
