import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mamah_muda/screens/AccountRecipe.dart';
import 'package:mamah_muda/screens/home_screen.dart';

class InfoMain extends StatelessWidget {
  const InfoMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Detail Resep',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: InfoScreenPage(title: 'Detail Resep'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class InfoScreenPage extends StatefulWidget {
  InfoScreenPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  InfoScreen createState() => InfoScreen();
}

class InfoScreen extends State<InfoScreenPage> {
  int? selectedRating;
  bool isLoved = false;

  final List<int> ratings = [5, 4, 3, 2, 1];

  // Placeholder for adding to favorites in the backend
  void addToFavorites() async {
    //Backend : logika simpan favorit
  }

  // Placeholder for removing from favorites in the backend
  void removeFromFavorites() async {
    //Backend : logika hapus favorit
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const SizedBox(height: 10),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 16.0),
                child: Row(
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => MyHome()),
                        );
                      },
                      child: Image.asset('assets/images/tombol_back.png'),
                    ),
                    const SizedBox(width: 10),
                    const Text(
                      'Detail',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          isLoved = !isLoved;
                          if (isLoved) {
                            addToFavorites();
                          } else {
                            removeFromFavorites();
                          }
                        });
                      },
                      icon: Icon(
                        isLoved ? Icons.favorite : Icons.favorite_border,
                        color: isLoved ? Color(0xFFC91108) : Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              //Backend : gambar
              Image.asset('assets/images/info_gambar.png'),
              Container(
                margin: const EdgeInsets.only(top: 16.0, left: 2),
                child: const Text(
                  //Backend : nama resep
                  'Seblak viral ala Mamang Rapael',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 24.0,
                    fontFamily: 'Staatliches',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Icon(FeatherIcons.star, color: Color(0xFFC91108)),
                        const SizedBox(width: 2.0),
                        Text(
                          //Backend : rating
                          'Bintang 5',
                          style: GoogleFonts.roboto(
                            color: const Color(0xF0001122),
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: <Widget>[
                        IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => RecipeAccount()),
                            );
                          },
                          icon:
                              Icon(FeatherIcons.user, color: Color(0xFFC91108)),
                        ),
                        const SizedBox(width: 2.0),
                        Text(
                          //Backend : nama akun
                          'Mamah Risna',
                          style: GoogleFonts.roboto(
                            color: const Color(0xF0001122),
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 16.0, left: 2),
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
                padding: const EdgeInsets.all(2.0),
                child: const Text(
                  //Backend : Deskripsi
                  'Seblak ini pernah viral loh di tahun 2023. Kali ini Mamah Risna dari Gedebage mau bantu kalian buat seblak viral ala Mamang Rapael yang dijamin syedep dan endulita.',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 12.0,
                    fontFamily: 'Oxygen',
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(2),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Bahan',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      //Backend : bahan
                      '200g kerupuk mawar putih mentah\n'
                      '4 sdm minyak\n'
                      '20 buah cabai rawit hijau\n'
                      '5 buah cabai rawit merah\n'
                      '4 siung bawang putih\n'
                      '5 cm kencur\n'
                      '1 batang daun bawang, iris\n'
                      '1 sdt Royco Kaldu Ayam\n'
                      'Air, untuk merebus',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 12.0,
                        fontFamily: 'Oxygen',
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Cara Memasak',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      //Backend : cara
                      'Rebus kerupuk mawar putih hingga setengah matang\n'
                      'Haluskan cabai rawit hijau, cabai rawit merah, bawang putih, dan kencur\n'
                      'Panaskan minyak, tumis bumbu halus hingga harum\n'
                      'Masukkan kerupuk, aduk hingga rata\n'
                      'Tambahkan daun bawang dan Royco Kaldu Ayam, aduk rata\n'
                      'Masak hingga matang dan air menyusut\n'
                      'Seblak siap disajikan',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 12.0,
                        fontFamily: 'Oxygen',
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              const Text(
                'Komentar',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF001122),
                ),
              ),
              SizedBox(height: 8),
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
                  //Backend : input komentar
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Berikan Komentar kamu",
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
                'Berikan ratingmu',
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFF001122),
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              DropdownButton<int>(
                //Backend : input rating (int)
                value: selectedRating,
                hint: const Text('Rating'),
                isExpanded: true,
                items: ratings.map((int value) {
                  return DropdownMenuItem<int>(
                    value: value,
                    child: Text(value.toString()),
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    selectedRating = newValue;
                  });
                },
              ),
              Container(
                padding: EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 18),
                    Divider(
                      thickness: 1,
                      color: Colors.black,
                    ),
                    SizedBox(height: 18),
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
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: Color(0xFFF7F7F7),
                        border: Border.all(
                          color: Colors.black,
                        ),
                      ),
                      child: const Text(
                        //Backend : tampilkan komentar
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
                      ),
                    ),
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
