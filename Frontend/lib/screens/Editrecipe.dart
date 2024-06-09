import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'dart:io';
import 'package:mamah_muda/Widget/custom_inputEdit.dart';
import 'package:mamah_muda/screens/Myinfo_screen.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

class MyEditRecipe extends StatelessWidget {
  const MyEditRecipe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Edit Resep',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyEditRecipePage(title: 'Edit Resep'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyEditRecipePage extends StatefulWidget {
  MyEditRecipePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  EditRecipeScreen createState() => EditRecipeScreen();
}

class EditRecipeScreen extends State<MyEditRecipePage> {
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
    'Cemilan',
    'Dessert',
    'Lainnya'
  ];
  final List<String> khas = ['Nusantara', 'Western', 'Asia', 'Lainnya'];

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
              GestureDetector(
                onTap: () {
                  AwesomeDialog(
                    context: context,
                    dialogType: DialogType.warning,
                    animType: AnimType.topSlide,
                    showCloseIcon: true,
                    title: "Resep batal disimpan",
                    desc:
                        "Kamu yakin ingin membatalkan mengedit resep? (Jika ingin tetap mengedit resep, klik silang)",
                    btnOkText: "Iya, saya yakin",
                    btnOkColor: Color(0xF0F81300),
                    btnOkOnPress: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MyRecipeDetail()));
                    },
                  ).show();
                },
                child: Image.asset('assets/images/tombol_back.png'),
              ),
              const Text(
                'Edit Resep',
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
                //Backend : nama resep
                controller: NameController,
                textInputAction: TextInputAction.next,
                textInputType: TextInputType.text,
                hint: 'Masukkan nama resep kamu',
              ),
              SizedBox(height: 24),
              const Text(
                'Estimasi Waktu (dalam menit)',
                style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFF001122),
                    fontWeight: FontWeight.bold),
              ),
              CustomEdit(
                //Backend : waktu
                controller: TimeController,
                textInputAction: TextInputAction.next,
                textInputType: TextInputType.text,
                hint: 'Masukkan estimasi waktu (dalam menit)',
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
                  //Backend : Deskripsi
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
                'Tingkat Kesulitan',
                style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFF001122),
                    fontWeight: FontWeight.bold),
              ),
              DropdownButton<String>(
                //Backend : tingkat kesulitan
                value: selectedFoodType,
                hint: const Text('tingkat kesulitan'),
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
                //Backend : kategori
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
                //Backend : viral
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
                'Asal daerah dari masakan kamu',
                style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFF001122),
                    fontWeight: FontWeight.bold),
              ),
              DropdownButton<String>(
                //Backend : khas
                value: selectkhas,
                hint: const Text('Pilih asal daerah'),
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
                  //Backend : bahan
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
                  //Backend : cara
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
                      //POP UP
                      AwesomeDialog(
                        context: context,
                        dialogType: DialogType.success,
                        animType: AnimType.topSlide,
                        showCloseIcon: true,
                        title: "Resep disimpan",
                        desc: "Resep kamu sudah diedit",
                        btnOkText: "Kembali ke resep",
                        btnOkColor: Color(0xF000B06D),
                        btnOkOnPress: () {
                          //Backend : logika edit resep

                          //pindah halaman
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MyRecipeDetail()));
                        },
                      ).show();
                    },
                    child: const Text(
                      'Edit resep',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
