import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mamah_muda/Models/api_response.dart';
import 'package:mamah_muda/Services/post_resep.dart';

import 'dart:io';
import 'package:mamah_muda/Widget/custom_inputEdit.dart';
import 'package:mamah_muda/screens/Account_screen.dart';
import 'package:mamah_muda/screens/Resepsaya.dart';
import 'package:mamah_muda/screens/Search_screen.dart';
import 'package:mamah_muda/screens/Favorite_screen.dart';
import 'package:mamah_muda/screens/home_screen.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  final _formKey = GlobalKey<FormState>();

  final TextEditingController NameController = TextEditingController();
  final TextEditingController TimeController = TextEditingController();
  final TextEditingController DescriptionController = TextEditingController();
  final TextEditingController IngredientController = TextEditingController();
  final TextEditingController instructionController = TextEditingController();

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
    'Dessert'
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

  void createPost() async {
    if (_formKey.currentState!.validate()) {
      ApiResponse response = await createPosts(
          NameController.text,
          DescriptionController.text,
          TimeController.text,
          selectedFoodType!,
          selectkategori!,
          selectedYear!,
          selectkhas!,
          IngredientController.text,
          instructionController.text);

      if (response.error == null) {
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
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MyRecipe()),
            );
          },
        ).show();
      } else {
        // Tampilkan dialog error
        AwesomeDialog(
          context: context,
          dialogType: DialogType.error,
          animType: AnimType.topSlide,
          showCloseIcon: true,
          title: "Error",
          desc: response.error,
          btnOkText: "Tutup",
          btnOkColor: Color(0xFFC91108),
          btnOkOnPress: () {},
        ).show();
      }
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
          child: Form(
            key: _formKey,
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
                  controller: NameController,
                  textInputAction: TextInputAction.next,
                  textInputType: TextInputType.text,
                  hint: 'Masukkan nama resep kamu',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Nama resep tidak boleh kosong';
                    }
                    return null;
                  },
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
                  controller: TimeController,
                  textInputAction: TextInputAction.next,
                  textInputType: TextInputType.text,
                  hint: 'Masukkan estimasi waktu (dalam menit)',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Estimasi waktu tidak boleh kosong';
                    }
                    return null;
                  },
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
                  child: TextFormField(
                    controller: DescriptionController,
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
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Deskripsi tidak boleh kosong';
                      }
                      return null;
                    },
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
                DropdownButtonFormField<String>(
                  value: selectedFoodType,
                  hint: const Text('Pilih tingkat kesulitan'),
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
                  validator: (value) {
                    if (value == null) {
                      return 'Pilih tingkat kesulitan';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 24),
                const Text(
                  'Kategori',
                  style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF001122),
                      fontWeight: FontWeight.bold),
                ),
                DropdownButtonFormField<String>(
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
                  validator: (value) {
                    if (value == null) {
                      return 'Pilih kategori';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 24),
                const Text(
                  'Viral Tahun',
                  style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF001122),
                      fontWeight: FontWeight.bold),
                ),
                DropdownButtonFormField<String>(
                  value: selectedYear,
                  hint: const Text('Pilih tahun'),
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
                  validator: (value) {
                    if (value == null) {
                      return 'Pilih tahun viral';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 24),
                const Text(
                  'Khas Daerah',
                  style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF001122),
                      fontWeight: FontWeight.bold),
                ),
                DropdownButtonFormField<String>(
                  value: selectkhas,
                  hint: const Text('Pilih khas daerah'),
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
                  validator: (value) {
                    if (value == null) {
                      return 'Pilih khas daerah';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 24),
                const Text(
                  'Bahan-bahan',
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
                  child: TextFormField(
                    controller: IngredientController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Masukkan bahan-bahan",
                      hintStyle: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.normal,
                        color: const Color(0xFF9AA0B4),
                      ),
                      contentPadding: EdgeInsets.symmetric(vertical: 10),
                    ),
                    maxLines: null,
                    expands: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Bahan-bahan tidak boleh kosong';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(height: 24),
                const Text(
                  'Instruksi',
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
                  child: TextFormField(
                    controller: instructionController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Masukkan instruksi",
                      hintStyle: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.normal,
                        color: const Color(0xFF9AA0B4),
                      ),
                      contentPadding: EdgeInsets.symmetric(vertical: 10),
                    ),
                    maxLines: null,
                    expands: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Instruksi tidak boleh kosong';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(height: 32),
                Container(
                  width: double.infinity,
                  height: 48,
                  child: ElevatedButton(
                    onPressed: createPost,
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Color(0xFFC91108)),
                    ),
                    child: const Text(
                      'Simpan',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 60,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildIconButton(Icons.home, 0),
              _buildIconButton(Icons.search, 1),
              _buildIconButton(Icons.add_circle, 2, Color(0xFFC91108)),
              _buildIconButton(Icons.favorite, 3),
              _buildIconButton(Icons.person, 4),
            ],
          ),
        ),
      ),
    );
  }
}
