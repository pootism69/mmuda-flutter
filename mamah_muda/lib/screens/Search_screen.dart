import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
// Import halaman lain

import 'package:mamah_muda/screens/addrecipe.dart';
import 'package:mamah_muda/screens/Account_screen.dart';

import 'package:mamah_muda/screens/Favorite_screen.dart';
import 'package:mamah_muda/screens/home_screen.dart';
import 'package:mamah_muda/screens/ResultSearch_screen.dart'; // Import halaman MySearchResult

class MySearch extends StatelessWidget {
  const MySearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pencarian',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MySearchPage(title: 'Pencarian'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MySearchPage extends StatefulWidget {
  MySearchPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  SearchScreen createState() => SearchScreen();
}

class SearchScreen extends State<MySearchPage> {
  int selected = 1;

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
        //tetap di search
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
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                      height: 14), // Jarak antara atas layar dan teks
                  Text(
                    'Yuk cari resep',
                    style: GoogleFonts.roboto(
                      color: const Color(0xFF001122),
                      fontSize: 32,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.25,
                    ),
                  ),
                  Text(
                    'masakan',
                    style: GoogleFonts.roboto(
                      color: const Color(0xFF001122),
                      fontSize: 32,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.25,
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: const SizedBox(
                height: 24), // Jarak antara elemen sebelumnya dan banner
          ),
          //Pencarian
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

          SliverFillRemaining(
            hasScrollBody: false,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                      height: 14), // Jarak antara atas layar dan teks
                  Text(
                    'Hasil yang ditemukan,',
                    style: GoogleFonts.roboto(
                      color: const Color(0xFF9AA0B4),
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  Text(
                    'akan muncul disini',
                    style: GoogleFonts.roboto(
                      color: const Color(0xFF9AA0B4),
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
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
