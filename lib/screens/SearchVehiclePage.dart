import 'package:flutter/material.dart';

class SearchVehiclePage extends StatelessWidget {
  const SearchVehiclePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Search Vehicle')),
      body: Center(
        child: Text('هنا يمكن البحث عن سيارة بالرقم أو الموديل'),
      ),
    );
  }
}
