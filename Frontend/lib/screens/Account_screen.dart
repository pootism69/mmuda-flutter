import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mamah_muda/screens/LoginScreen.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
// Import halaman lain

import 'package:mamah_muda/screens/Resepsaya.dart';

import 'package:mamah_muda/screens/addrecipe.dart';
import 'package:mamah_muda/screens/Search_screen.dart';
import 'package:mamah_muda/screens/Favorite_screen.dart';
import 'package:mamah_muda/screens/home_screen.dart';
import 'package:mamah_muda/screens/edit_akun.dart';

class MyAccount extends StatelessWidget {
  const MyAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Akun',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyAccountPage(title: 'Akun'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyAccountPage extends StatefulWidget {
  MyAccountPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  AccountScreen createState() => AccountScreen();
}

class AccountScreen extends State<MyAccountPage> {
  int selected = 4;

  void _onItemTapped(int index) {
    setState(() {
      selected = index;
    });
    switch (index) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MyHome()),
        );
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MySearch()),
        );
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MyAdd()),
        );
        break;
      case 3:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MyFavorite()),
        );
        break;
      case 4:
        //tetap di halaman akun
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
      backgroundColor: const Color(0xFFF7F7F7),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 50.0), // Padding kiri dan kanan 20, atas dan bawah 50
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                "Akun Saya",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Container(
                width: double.infinity, // Mengikuti lebar layar
                padding:
                    EdgeInsets.symmetric(horizontal: 8), // Padding kiri kanan 8
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6), // Radius sudut 6
                  color: Color(0xFFF7F7F7), // Warna latar belakang putih
                  border: Border.all(color: Colors.white), // Warna border hitam
                ),
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.center, // Menempatkan elemen di tengah
                  children: <Widget>[
                    const SizedBox(height: 10),
                    SizedBox(
                      width: 100,
                      height: 100,
                      child: Image.asset(
                        'assets/images/akun.png', // Ganti dengan path gambar Anda
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(height: 8), // Jarak antara gambar dan teks
                    Text(
                      //Backend : Nama akun
                      'Mamah Risnah',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.roboto(
                        color: const Color(0xFF001122),
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.25,
                      ),
                    ),
                    Text(
                      //Backend : Nama email
                      'MamahRisnah@gmail.com',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.roboto(
                        color: const Color(0xFF001122),
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.25,
                      ),
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Container(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    color: Colors.white, // Background warna putih
                    width: double.infinity, // Mengikuti lebar layar
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.black,
                          backgroundColor:
                              Colors.white, // Warna latar belakang putih
                          textStyle: const TextStyle(
                            fontSize: 20,
                          ),
                          alignment:
                              Alignment.centerLeft, // Menempatkan teks ke kiri
                          padding: const EdgeInsets.symmetric(
                              vertical: 16, horizontal: 8), // Padding
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                                Radius.circular(0)), // Menghilangkan border
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => EditAkun()),
                          ).then((_) {
                            // Setelah kembali dari MyViral(), atur selected kembali ke 0
                            setState(() {
                              selected = 4;
                            });
                          });
                        },
                        child: const Text(
                          'Edit Akun',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    color: Colors.white, // Background warna putih
                    width: double.infinity, // Mengikuti lebar layar
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.black,
                          backgroundColor:
                              Colors.white, // Warna latar belakang putih
                          textStyle: const TextStyle(
                            fontSize: 20,
                          ),
                          alignment:
                              Alignment.centerLeft, // Menempatkan teks ke kiri
                          padding: const EdgeInsets.symmetric(
                              vertical: 16, horizontal: 8), // Padding
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                                Radius.circular(0)), // Menghilangkan border
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => MyRecipe()),
                          ).then((_) {
                            // Setelah kembali dari MyViral(), atur selected kembali ke 0
                            setState(() {
                              selected = 4;
                            });
                          });
                        },
                        child: const Text(
                          'Resep Saya',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 50),
              Center(
                child: SizedBox(
                  width: 162,
                  height: 44,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black,
                      backgroundColor: Colors.white,
                      textStyle: const TextStyle(fontSize: 20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: BorderSide(color: Color(0xFFC91108), width: 2),
                      ),
                    ),
                    onPressed: () {
                      AwesomeDialog(
                        context: context,
                        dialogType: DialogType.warning,
                        animType: AnimType.topSlide,
                        showCloseIcon: true,
                        title: "Keluar akun",
                        desc:
                            "Kamu yakin ingin keluar? (Jika ingin tetap masuk, klik silang)",
                        btnOkText: "Iya, saya yakin ingin keluar",
                        btnOkColor: Color(0xF0F81300),
                        btnOkOnPress: () {
                          //Backend : Logika keluar akun
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginScreen()));
                        },
                      ).show();
                    },
                    child: const Text(
                      'Keluar',
                      style: TextStyle(fontSize: 16, color: Color(0xFFC91108)),
                    ),
                  ),
                ),
              ),
              // Tambahkan widget lain di sini jika diperlukan
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
