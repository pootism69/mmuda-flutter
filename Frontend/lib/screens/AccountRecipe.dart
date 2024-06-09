import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
// Import halaman lain
import 'package:mamah_muda/Models/cardHome.dart'; // Pastikan Anda mengimport model yang telah Anda buat

import 'package:mamah_muda/screens/Myinfo_screen.dart';
import 'package:mamah_muda/screens/home_screen.dart';

class RecipeAccount extends StatelessWidget {
  const RecipeAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Resep Akun',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RecipeAccountPage(title: 'Resep Akun'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class RecipeAccountPage extends StatefulWidget {
  RecipeAccountPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  RecipeAccountScreen createState() => RecipeAccountScreen();
}

class RecipeAccountScreen extends State<RecipeAccountPage> {
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F7),
      appBar: AppBar(
        title: Text(
          //backend: nama akun
          "Neng Iis",
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
            icon: Icon(Icons
                .arrow_back), // Ubah dari `Icons.arrow_back` menjadi `Icon(Icons.arrow_back)`
            onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyHome()),
                )),
        // Jika ingin menambahkan padding ke AppBar, gunakan properti `toolbarHeight` dan `titleSpacing`.
        // Contohnya:
        // toolbarHeight: 80, // Sesuaikan dengan kebutuhan Anda
        // titleSpacing: 0, // Sesuaikan dengan kebutuhan Anda
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: const SizedBox(height: 12),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 12),
                  //Model : resep
                  //Backend: daftar resep di akun yang dipilih
                  SizedBox(
                    height: 800,
                    child: GridView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 12,
                        mainAxisSpacing: 12,
                        childAspectRatio: 0.85,
                      ),
                      itemCount: RecipeModel.length,
                      itemBuilder: (context, index) {
                        final card = RecipeModel[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MyRecipeDetail()));
                          },
                          child: AspectRatio(
                            aspectRatio: 0.85,
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
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: const SizedBox(height: 24),
          ),
        ],
      ),
    );
  }
}
