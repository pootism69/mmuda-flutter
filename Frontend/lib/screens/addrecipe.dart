import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'dart:io';
import 'package:mamah_muda/Widget/custom_inputEdit.dart';
import 'package:mamah_muda/screens/Account_screen.dart';
import 'package:mamah_muda/screens/Resepsaya.dart';
import 'package:mamah_muda/screens/Search_screen.dart';
import 'package:mamah_muda/screens/Favorite_screen.dart';
import 'package:mamah_muda/screens/home_screen.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

class MyAdd extends StatelessWidget {
  const MyAdd({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tambah Resep',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyAddPage(title: 'Tambah Resep'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyAddPage extends StatefulWidget {
  MyAddPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  AddScreen createState() => AddScreen();
}

class AddScreen extends State<MyAddPage> {
  int selected = 2;
  File? image;
  final NameController = TextEditingController();
  final TimeController = TextEditingController();
  String? selectedFoodType;
  String? selectedYear;
  String? selectkategori;
  String? selectkhas;

  final List<String> foodTypes = ['Mudah', 'Sedang', 'Sulit'];
  final List<String> viralYears = [
    '2019',
    '2020',
    '2021',
    '2022',
    '2023',
    '2024',
    'lainnya'
  ];
  final List<String> Kategori = [
    'Masakan Rumahan',
    'Olahan Ayam',
    'Olahan Daging ',
    'Olahan Seafood',
    'Olahan Sayuran',
    'Cemilan' 'Dessert'
  ];
  final List<String> khas = ['Nusantara', 'Western', 'Asia', 'Lainnya'];

  void _onItemTapped(int index) {
    setState(() {
      selected = index;
    });
    switch (index) {
      case 0:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => MyHome()));
        break;
      case 1:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => MySearch()));
        break;
      case 2:
        // Stay on Add recipe
        break;
      case 3:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => MyFavorite()));
        break;
      case 4:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => MyAccount()));
        break;
    }
  }

  Widget _buildIconButton(IconData icon, int index, [Color? customColor]) {
    final bool isSelected = selected == index;
    final Color color = customColor ??
        (isSelected
            ? (index == 2 ? Color(0xFFC91108) : Color(0xFFC91108))
            : (index == 2 ? Colors.black : Color(0xFFD3D1D8)));

    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        IconButton(
          icon: Icon(icon),
          color: color,
          onPressed: () => _onItemTapped(index),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    return Scaffold(
      body: Padding(
        padding:
            const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Buat Resep',
                style: TextStyle(
                    fontSize: 24,
                    color: Color(0xFF001122),
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 12,
              ),
              Image.asset('assets/images/info_gambar.png'),
              SizedBox(height: 12),
              const Text(
                'Nama Resep',
                style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFF001122),
                    fontWeight: FontWeight.bold),
              ),
              CustomEdit(
                //backend: input
                controller: NameController,
                textInputAction: TextInputAction.next,
                textInputType: TextInputType.text,
                hint: 'Masukkan nama resep kamu',
              ),
              SizedBox(height: 24),
              const Text(
                'Estimasi Waktu',
                style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFF001122),
                    fontWeight: FontWeight.bold),
              ),
              CustomEdit(
                //backend: input time
                controller: TimeController,
                textInputAction: TextInputAction.next,
                textInputType: TextInputType.text,
                hint: 'Masukkan estimasi waktu',
              ),
              SizedBox(height: 24),
              const Text(
                'Deskripsi',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF001122),
                ),
              ),
              Container(
                height: 128,
                margin: const EdgeInsets.symmetric(horizontal: 0),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 13),
                decoration: BoxDecoration(
                  color: const Color(0xFFF3F3F3),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: Color(0xFFD3D1D8),
                    width: 1.0,
                  ),
                ),
                child: TextField(
                  ////Backend : input deskripsi
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Masukkan deskripsi",
                    hintStyle: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                      color: const Color(0xFF9AA0B4),
                    ),
                    contentPadding: EdgeInsets.symmetric(vertical: 10),
                  ),
                  maxLines: null,
                  expands: true,
                ),
              ),
              SizedBox(height: 24),
              const Text(
                'Tinngkat Kesulitan',
                style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFF001122),
                    fontWeight: FontWeight.bold),
              ),
              DropdownButton<String>(
                ////Backend : tingkat kesulitan
                value: selectedFoodType,
                hint: const Text('tingkat kesuliatan'),
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
                'Kategori masakan yang kamu buat',
                style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFF001122),
                    fontWeight: FontWeight.bold),
              ),
              DropdownButton<String>(
                //Backend : Kategori
                value: selectkategori,
                hint: const Text('Pilih kategori'),
                isExpanded: true,
                items: Kategori.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    selectkategori = newValue;
                  });
                },
              ),
              SizedBox(height: 24),
              const Text(
                'Tahun viral dari resep kamu (jika pernah viral)',
                style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFF001122),
                    fontWeight: FontWeight.bold),
              ),
              DropdownButton<String>(
                //Backend : tahun viral
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
              SizedBox(height: 24),
              const Text(
                'Asal daerah dari resep kamu',
                style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFF001122),
                    fontWeight: FontWeight.bold),
              ),
              DropdownButton<String>(
                //Backend : Khas
                value: selectkhas,
                hint: const Text('nusantara'),
                isExpanded: true,
                items: khas.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    selectkhas = newValue;
                  });
                },
              ),
              SizedBox(height: 24),
              const Text(
                'Bahan',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF001122),
                ),
              ),
              Container(
                height: 128,
                margin: const EdgeInsets.symmetric(horizontal: 0),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 13),
                decoration: BoxDecoration(
                  color: const Color(0xFFF3F3F3),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: Color(0xFFD3D1D8),
                    width: 1.0,
                  ),
                ),
                child: TextField(
                  //Backend : input bahan
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Masukkan bahan-bahannya",
                    hintStyle: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                      color: const Color(0xFF9AA0B4),
                    ),
                    contentPadding: EdgeInsets.symmetric(vertical: 10),
                  ),
                  maxLines: null,
                  expands: true,
                ),
              ),
              SizedBox(height: 24),
              const Text(
                'Cara memasak',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF001122),
                ),
              ),
              Container(
                height: 128,
                margin: const EdgeInsets.symmetric(horizontal: 0),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 13),
                decoration: BoxDecoration(
                  color: const Color(0xFFF3F3F3),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: Color(0xFFD3D1D8),
                    width: 1.0,
                  ),
                ),
                child: TextField(
                  //Backend : input cara
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Tulis cara memasaknya",
                    hintStyle: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                      color: const Color(0xFF9AA0B4),
                    ),
                    contentPadding: EdgeInsets.symmetric(vertical: 10),
                  ),
                  maxLines: null,
                  expands: true,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Center(
                child: SizedBox(
                  width: 328,
                  height: 44,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black,
                      backgroundColor: Color(0xFFC91108),
                      textStyle: const TextStyle(fontSize: 20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: BorderSide(color: Color(0xFFC91108), width: 2),
                      ),
                    ),
                    onPressed: () {
                      AwesomeDialog(
                        context: context,
                        dialogType: DialogType.success,
                        animType: AnimType.topSlide,
                        showCloseIcon: true,
                        title: "Resep berhasil dibuat",
                        desc: "Resep kamu sudah dibuat",
                        btnOkText: "Simpan",
                        btnOkColor: Color(0xF000B06D),
                        btnOkOnPress: () {
                          //Backend : menyimpan resep

                          //pindah halaman
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MyRecipe()));
                        },
                      ).show();
                    },
                    child: const Text(
                      'Bagikan Resep',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        shape: CircularNotchedRectangle(),
        notchMargin: 4.0,
        elevation: 0.0,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Color(0x40D3D1D8),
                offset: Offset(15, 15),
                blurRadius: 30,
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              _buildIconButton(Icons.home_filled, 0),
              _buildIconButton(Icons.search, 1),
              _buildIconButton(Icons.add_circle, 2, Colors.black),
              _buildIconButton(Icons.favorite, 3),
              _buildIconButton(Icons.person, 4),
            ],
          ),
        ),
      ),
    );
  }
}
