import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
// Import halaman lain
import 'package:mamah_muda/Models/cardHome.dart'; // Pastikan Anda mengimport model yang telah Anda buat
import 'package:mamah_muda/screens/AccountRecipe.dart';

import 'package:mamah_muda/screens/addrecipe.dart';
import 'package:mamah_muda/screens/Account_screen.dart';

import 'package:mamah_muda/screens/Favorite_screen.dart';
import 'package:mamah_muda/screens/home_screen.dart';
import 'package:mamah_muda/screens/info.dart';

class MyResultSearch extends StatelessWidget {
  const MyResultSearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pencarian',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyResultSearchPage(title: 'Hasil Pencarian'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyResultSearchPage extends StatefulWidget {
  MyResultSearchPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  ResultSearchScreen createState() => ResultSearchScreen();
}

class ResultSearchScreen extends State<MyResultSearchPage> {
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
            child: Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      'Hasil pencarian untuk resep',
                      style: GoogleFonts.roboto(
                        color: const Color(0xFF001122),
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  //Backend : daftar resep yang ada
                  //Model: resep
                  SizedBox(
                    height: 730,
                    child: GridView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 12,
                        mainAxisSpacing: 12,
                        childAspectRatio:
                            0.85, // Sesuaikan rasio aspek sesuai kebutuhan
                      ),
                      itemCount: RecipeModel.length,
                      itemBuilder: (context, index) {
                        final card = RecipeModel[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => InfoMain(),
                              ),
                            );
                          },
                          child: AspectRatio(
                            aspectRatio:
                                0.85, // Sesuaikan rasio aspek sesuai kebutuhan
                            child: Stack(
                              children: [
                                Container(
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: 128,
                                        width: double.infinity,
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
                                Positioned(
                                  right: 8,
                                  bottom: 8,
                                  child: Container(
                                    width: 24,
                                    height: 24,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFC91108),
                                      shape: BoxShape.circle,
                                    ),
                                    child: Center(
                                      child: Text(
                                        card.rating
                                            .toString(), // Display the rating
                                        style: GoogleFonts.roboto(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 12),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      'Hasil pencarian untuk akun',
                      style: GoogleFonts.roboto(
                        color: const Color(0xFF001122),
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    //Backend : daftar akun yang ada
                    //Model:  akun yang dicari
                    height: 730,
                    child: ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      itemCount: AccountModel.length,
                      itemBuilder: (context, index) {
                        final card = AccountModel[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => RecipeAccount(),
                              ),
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Container(
                              height: 48,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0x40D3D1D8),
                                    offset: Offset(0, 5),
                                    blurRadius: 15,
                                  ),
                                ],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    card.title,
                                    style: GoogleFonts.roboto(
                                      color: const Color(0xFF001122),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
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
