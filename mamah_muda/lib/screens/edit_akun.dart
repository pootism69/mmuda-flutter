import 'package:flutter/material.dart';

import 'package:mamah_muda/Widget/custom_inputEdit.dart';
import 'package:mamah_muda/screens/Account_screen.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

class EditAkun extends StatefulWidget {
  const EditAkun({super.key});

  @override
  State<EditAkun> createState() => _EditAkun();
}

class _EditAkun extends State<EditAkun> {
  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final passwordController = TextEditingController();
  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            "Edit akun",
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          leading: IconButton(
              icon: Icon(Icons
                  .arrow_back), // Ubah dari `Icons.arrow_back` menjadi `Icon(Icons.arrow_back)`
              onPressed: () {
                AwesomeDialog(
                  context: context,
                  dialogType: DialogType.warning,
                  animType: AnimType.topSlide,
                  showCloseIcon: true,
                  title: "Edit akun batal disimpan",
                  desc:
                      "Kamu yakin ingin membatalkan mengedit akun? (Jika ingin tetap mengedit resep, klik silang)",
                  btnOkText: "Iya, saya yakin",
                  btnOkColor: Color(0xF0F81300),
                  btnOkOnPress: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MyAccount()));
                  },
                ).show();
              })),
      // Jika ingin menambahkan padding ke AppBar, gunakan properti `toolbarHeight` dan `titleSpacing`.
      // Contohnya:
      // toolbarHeight: 80, // Sesuaikan dengan kebutuhan Anda
      // titleSpacing: 0, // Sesuaikan dengan kebutuhan Anda

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 50.0),
              const Text(
                'Email',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              CustomEdit(
                //Backend : email
                controller: emailController,
                textInputAction: TextInputAction.next,
                textInputType: TextInputType.emailAddress,
                hint: ' Masukkan Username Kamu',
              ),
              const SizedBox(
                height: 16,
              ),
              const Text(
                'Username',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              CustomEdit(
                //Backend : username
                controller: nameController,
                textInputAction: TextInputAction.next,
                textInputType: TextInputType.emailAddress,
                hint: ' Masukkan Email Kamu',
              ),
              const SizedBox(
                height: 16,
              ),
              const Text(
                'Password',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              CustomEdit(
                //Backend : password
                controller: passwordController,
                textInputAction: TextInputAction.done,
                textInputType: TextInputType.visiblePassword,
                hint: 'Masukkan password kamu',
                isObscure: isObscure,
                hasSuffix: true,
                onPressed: () {
                  setState(() {
                    isObscure = !isObscure;
                  });
                },
              ),
              const SizedBox(height: 50),
              Center(
                child: SizedBox(
                  width: 162,
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
                        title: "Perubahan disimpan",
                        desc: "akun kamu sudah diedit",
                        btnOkText: "Kembali ke akun saya",
                        btnOkColor: Color(0xF000B06D),
                        btnOkOnPress: () {
                          //Backend : logika edit akun

                          //pindah halaman
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MyAccount()));
                        },
                      ).show();
                    },
                    child: const Text(
                      'Ubah',
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
