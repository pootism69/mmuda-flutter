import 'package:flutter/material.dart';

var informationTextStyle = const TextStyle(fontFamily: 'Oxygen');

class DD extends StatefulWidget {
  const DD({Key? key}) : super(key: key);

  @override
  _DDState createState() => _DDState();
}

class _DDState extends State<DD> {
  String? selectedFoodType;
  String? selectedYear;

  final List<String> foodTypes = ['Nasi Goreng', 'Rendang', 'Sate', 'Bakso'];
  final List<String> viralYears = ['2021', '2022', '2023', '2024'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Tipe Makanan',
              style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFF001122),
                  fontWeight: FontWeight.bold),
            ),
            DropdownButton<String>(
              value: selectedFoodType,
              hint: const Text('Pilih tipe makanan'),
              isExpanded: true,
              items: foodTypes.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (newValue) {
                setState(() {
                  selectedFoodType = newValue;
                });
              },
            ),
            SizedBox(height: 24),
            const Text(
              'Viral Tahun Kapan?',
              style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFF001122),
                  fontWeight: FontWeight.bold),
            ),
            DropdownButton<String>(
              value: selectedYear,
              hint: const Text('Pilih tahun viral'),
              isExpanded: true,
              items: viralYears.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (newValue) {
                setState(() {
                  selectedYear = newValue;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
