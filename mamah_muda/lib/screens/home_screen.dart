import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
// Import halaman lain
import 'package:mamah_muda/Models/cardHome.dart'; // Pastikan Anda mengimport model yang telah Anda buat
import 'package:mamah_muda/screens/ResultSearch_screen.dart';

import 'package:mamah_muda/screens/addrecipe.dart';
import 'package:mamah_muda/screens/Account_screen.dart';
import 'package:mamah_muda/screens/Search_screen.dart';
import 'package:mamah_muda/screens/Favorite_screen.dart';
import 'package:mamah_muda/screens/Viral_screen.dart';
import 'package:mamah_muda/screens/Kategori_screen.dart';
import 'package:mamah_muda/screens/Khas_screen.dart';

class MyHome extends StatelessWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Beranda',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Beranda'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  HomeScreen createState() => HomeScreen();
}

class HomeScreen extends State<MyHomePage> {
  int selected = 0;

  void _onItemTapped(int index) {
    setState(() {
      selected = index;
    });
    switch (index) {
      case 0:
        // Tetap di halaman home
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
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MyAccount()),
        );
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
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            expandedHeight: 100, // Atur tinggi maksimum SliverAppBar
            backgroundColor: const Color(0xFFF7F7F7),
            flexibleSpace: FlexibleSpaceBar(
              titlePadding: const EdgeInsets.only(bottom: 2),
              title: Container(
                alignment: Alignment.bottomLeft,
                child: Image.asset(
                  'assets/images/logoHorizontal.png',
                  height: 36, // Atur tinggi gambar di sini
                  width: 99.82,
                  fit: BoxFit
                      .contain, // Atur bagaimana gambar diatur dalam ruang
                ),
              ),
              centerTitle: false,
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                      height: 14), // Jarak antara atas layar dan teks
                  Text(
                    'Mau masak apa',
                    style: GoogleFonts.roboto(
                      color: const Color(0xFF001122),
                      fontSize: 32,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.25,
                    ),
                  ),
                  Text(
                    'hari ini?',
                    style: GoogleFonts.roboto(
                      color: const Color(0xFF001122),
                      fontSize: 32,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.25,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // BANNER ADS
          SliverToBoxAdapter(
            child: const SizedBox(
                height: 12), // Jarak antara elemen sebelumnya dan banner
          ),
          SliverToBoxAdapter(
            child: AspectRatio(
              aspectRatio: 428 / 206,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Color(0xFFF7C245),
                  boxShadow: [
                    BoxShadow(
                      color: Color(
                          0x40D3D1D8), // Warna D3D1D8 dengan 25% transparansi
                      offset: Offset(15, 15), // x = 15, y = 15
                      blurRadius: 30, // blur = 30
                      spreadRadius: 0, // spread = 0
                    ),
                  ],
                ),
                child: Stack(
                  children: [
                    Image.asset(
                      'assets/images/BannerAds.png',
                      height: double.maxFinite,
                      width: double.maxFinite,
                      fit: BoxFit.cover,
                    ),

                    // Tambahkan lebih banyak widget dalam Stack jika diperlukan
                  ],
                ),
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: const SizedBox(
                height: 24), // Jarak antara elemen sebelumnya dan banner
          ),

          SliverToBoxAdapter(
              child: Row(
            children: <Widget>[
              Expanded(
                child: TextFormField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: const Icon(FeatherIcons.search,
                        color: Color(0xFF9AA0B4)),
                    hintText: "Cari resep masakan atau akun pemilik resep",
                    hintStyle: GoogleFonts.roboto(
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                      color: const Color(0xFF9AA0B4),
                    ),
                    contentPadding: EdgeInsets.symmetric(vertical: 13),
                  ),
                ),
              ),
              SizedBox(width: 8),
              ElevatedButton(
                onPressed: () {
                  //Backend : logika pencarian
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MyResultSearch(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFC91108), // Warna tombol
                ),
                child: Text(
                  'Search',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          )),

          SliverToBoxAdapter(
            child: const SizedBox(
                height: 32), // Jarak antara elemen sebelumnya dan banner
          ),

          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      'Tahun resep masakan viral',
                      style: GoogleFonts.roboto(
                        color: const Color(0xFF001122),
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      'Pastikan dirimu selalu up-to-date lewat resep viral',
                      style: GoogleFonts.roboto(
                        color: const Color(0xFF9AA0B4),
                        fontWeight: FontWeight.normal,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  SizedBox(height: 12),
                  //Model: Viral
                  SizedBox(
                    height: 132,
                    child: ListView.separated(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        final card = viral[index];

                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MyViral()),
                            ).then((_) {
                              // Setelah kembali dari MyViral(), atur selected kembali ke 0
                              setState(() {
                                selected = 0;
                              });
                            });
                          },
                          child: Container(
                            width: 95,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0x40D3D1D8),
                                  offset: Offset(15, 15),
                                  blurRadius: 30,
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Image widget to display the image
                                Container(
                                  height: 90,
                                  width: 95,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(8)),
                                    image: DecorationImage(
                                      image: NetworkImage(card.imageUrl),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    card.title,
                                    style: GoogleFonts.roboto(
                                      color: const Color(0xFF001122),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) =>
                          const SizedBox(width: 12),
                      itemCount: viral.length,
                    ),
                  ),
                ],
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: const SizedBox(
                height: 24), // Jarak antara elemen sebelumnya dan banner
          ),

          // KATEGORI
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      'Kategori Resep Masakan',
                      style: GoogleFonts.roboto(
                        color: const Color(0xFF001122),
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      'Telusuri resep lewat kategori masakan',
                      style: GoogleFonts.roboto(
                        color: const Color(0xFF9AA0B4),
                        fontWeight: FontWeight.normal,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  SizedBox(height: 12),
                  //Model: kategori
                  SizedBox(
                    height: 132,
                    child: ListView.separated(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        final card = kategori[index];

                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MyKategori()),
                            ).then((_) {
                              setState(() {
                                selected = 0;
                              });
                            });
                          },
                          child: Container(
                            width: 95,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0x40D3D1D8),
                                  offset: Offset(15, 15),
                                  blurRadius: 30,
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Image widget to display the image
                                Container(
                                  height: 90,
                                  width: 95,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(8)),
                                    image: DecorationImage(
                                      image: NetworkImage(card.imageUrl),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    card.title,
                                    style: GoogleFonts.roboto(
                                      color: const Color(0xFF001122),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) =>
                          const SizedBox(width: 12),
                      itemCount: kategori.length,
                    ),
                  ),
                ],
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: const SizedBox(
                height: 24), // Jarak antara elemen sebelumnya dan banner
          ),

          // KHAS
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      'Masakan Khas',
                      style: GoogleFonts.roboto(
                        color: const Color(0xFF001122),
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      'Manjakan lidahmu lewat masakan khas',
                      style: GoogleFonts.roboto(
                        color: const Color(0xFF9AA0B4),
                        fontWeight: FontWeight.normal,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  SizedBox(height: 12),
                  //Model: khas
                  SizedBox(
                    height: 132,
                    child: ListView.separated(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        final card = khas[index];

                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => MyKhas()),
                            ).then((_) {
                              setState(() {
                                selected = 0;
                              });
                            });
                          },
                          child: Container(
                            width: 95,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0x40D3D1D8),
                                  offset: Offset(15, 15),
                                  blurRadius: 30,
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Image widget to display the image
                                Container(
                                  height: 90,
                                  width: 95,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(8)),
                                    image: DecorationImage(
                                      image: NetworkImage(card.imageUrl),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    card.title,
                                    style: GoogleFonts.roboto(
                                      color: const Color(0xFF001122),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) =>
                          const SizedBox(width: 12),
                      itemCount: khas.length,
                    ),
                  ),
                ],
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: const SizedBox(
                height: 24), // Jarak antara elemen sebelumnya dan banner
          ),
        ], //slivers
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
