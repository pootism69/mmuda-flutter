import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

// Import halaman lain

import 'package:mamah_muda/Widget/dropdown.dart';
import 'package:mamah_muda/screens/Editrecipe.dart';
import 'package:mamah_muda/screens/Resepsaya.dart';

class MyRecipeDetail extends StatelessWidget {
  const MyRecipeDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Detail Resep Saya',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyRecipeDetailPage(title: 'Detail Resep Saya'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyRecipeDetailPage extends StatefulWidget {
  MyRecipeDetailPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  MyRecipeDetailScreen createState() => MyRecipeDetailScreen();
}

class MyRecipeDetailScreen extends State<MyRecipeDetailPage> {
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const SizedBox(
                height: 10,
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 16.0),
                child: Row(
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MyRecipe()),
                            );
                          },
                          child: Image.asset('assets/images/tombol_back.png'),
                        ),
                      ],
                    ),
                    const SizedBox(width: 10), // Jarak antara gambar dan teks
                    const Text(
                      'Detail',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(), // Spacer untuk mengisi ruang di antara elemen
                    Column(
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MyEditRecipe(),
                              ),
                            );
                          },
                          child: Image.asset('assets/images/edit.png'),
                        ),
                      ],
                    ),
                    const SizedBox(width: 10), // Jarak antara gambar
                    Column(
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            //pop up
                            AwesomeDialog(
                              context: context,
                              dialogType: DialogType.warning,
                              animType: AnimType.topSlide,
                              showCloseIcon: true,
                              title: "Hapus Resep",
                              desc:
                                  "Yakin mau menghapus resep ini? (Klik silang jika tidak ingin menghapus resep ini)",
                              btnOkText: "Iya",
                              btnOkColor: Color(0xF0F81300),
                              btnOkOnPress: () {
                                //Backend : logika hapus resep

                                //HAPUS RESEP
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => MyRecipe()));
                              },
                            ).show();
                          },
                          child: Image.asset('assets/images/trash-2.png'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Image.asset('assets/images/info_gambar.png'),
              Container(
                margin: const EdgeInsets.only(top: 16.0, left: 8),
                child: Text(
                  //Backend : nama resep
                  'Seblak viral ala Mamang Rapael',
                  textAlign: TextAlign.left,
                  style: GoogleFonts.roboto(
                    color: const Color(0xFF001122),
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                      Row(
                        children: <Widget>[
                          Icon(FeatherIcons.star),
                          const SizedBox(width: 8.0),
                          Text(
                            //Backend : rating
                            'bintang 5',
                            style: informationTextStyle,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(),
                    ])),
              ),
              Container(
                margin: const EdgeInsets.only(top: 16.0, left: 8),
                child: const Text(
                  'Deskripsi',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 14.0,
                    fontFamily: 'Staatliches',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(8.0),
                child: const Text(
                  //Backend : deskripsi
                  'Seblak ini pernah viral loh di tahun 20223......................................Kali ini mamah risna dari Gedebage mau bantu kalian buat seblak viral ala mamang rapael yang dijamin syedep dan endulita',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 12.0,
                    fontFamily: 'Oxygen',
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(8),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Bahan',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                    ),
                    SizedBox(
                        height: 8), // Jarak antara judul "Bahan" dan teks bahan
                    Text(
                      //Backend : bahan
                      '200g kerupuk mawar putih mentah'
                      '4 sdm minyak'
                      '20 buah cabai rawit hijau'
                      '5 buah cabai rawit merah'
                      '4 siung bawang putih'
                      '5 cm kencur'
                      '1 batang daun bawang, iris'
                      '1 sdtRoyco Kaldu Ayam Air, untuk merebus',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 12.0,
                        fontFamily: 'Oxygen',
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Cara Memasak',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                    ),
                    SizedBox(
                        height: 8), // Jarak antara judul "Bahan" dan teks bahan
                    Text(
                      //Backend : cara memasak
                      '200g kerupuk mawar putih mentah'
                      '4 sdm minyak'
                      '20 buah cabai rawit hijau'
                      '5 buah cabai rawit merah'
                      '4 siung bawang putih'
                      '5 cm kencur'
                      '1 batang daun bawang, iris'
                      '1 sdtRoyco Kaldu Ayam Air, untuk merebus',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 12.0,
                        fontFamily: 'Oxygen',
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Komentar',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                        //Backend : Kotak komentar
                        width: double.infinity, // Mengikuti lebar layar
                        padding: EdgeInsets.symmetric(
                            horizontal: 8), // Padding kiri kanan 8
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(6), // Radius sudut 6
                          color:
                              Color(0xFFF7F7F7), // Warna latar belakang putih
                          border: Border.all(
                            color: Colors.black, // Warna border hitam
                          ),
                        ),
                        child: const Text(
                          //Backend : isi komentar
                          'lebih baik dengan'
                          '200g kerupuk mawar putih mentah'
                          '4 sdm minyak'
                          '20 buah cabai rawit hijau'
                          '5 buah cabai rawit merah'
                          '4 siung bawang putih'
                          '5 cm kencur'
                          '1 batang daun bawang, iris'
                          '1 sdtRoyco Kaldu Ayam Air, untuk merebus',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 12.0,
                            fontFamily: 'Oxygen',
                          ),
                        ))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
