import 'package:flutter/material.dart';
import 'package:mamah_muda/Widget/custom_input.dart';
import 'package:mamah_muda/screens/home_screen.dart';

class DaftarScreen extends StatefulWidget {
  const DaftarScreen({super.key});

  @override
  State<DaftarScreen> createState() => _DaftarScreenState();
}

class _DaftarScreenState extends State<DaftarScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Image.asset(
                    'assets/images/ikon1.png',
                    width: 120,
                    height: 70,
                  ),
                ),
              ),
              const SizedBox(height: 10.0),
              const Text(
                'Daftar Akun',
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              const Text(
                'Masukkan data dirimu dengan benar',
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
              const SizedBox(height: 150.0),
              const Text(
                'Username',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              customTextField(
                //Backend : username
                controller: emailController,
                textInputAction: TextInputAction.next,
                textinputtype: TextInputType.emailAddress,
                hint: ' Masukkan Username Kamu',
              ),
              const SizedBox(
                height: 16,
              ),
              const Text(
                'Email',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              customTextField(
                ////Backend : email
                controller: emailController,
                textInputAction: TextInputAction.next,
                textinputtype: TextInputType.emailAddress,
                hint: ' Masukkan Email Kamu',
              ),
              const SizedBox(
                height: 16,
              ),
              const Text(
                'Password',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              customTextField(
                //Backend : password
                controller: passwordController,
                textInputAction: TextInputAction.done,
                textinputtype: TextInputType.visiblePassword,
                hint: 'Masukkan password kamu',
                isObscure: isObscure,
                hasSuffix: true,
                onPressed: () {
                  setState(() {
                    isObscure = !isObscure;
                  });
                },
              ),
              const SizedBox(
                height: 58,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Color(
                      0xFFC91108), // Ganti warna latar belakang menjadi #C91108
                  textStyle: const TextStyle(
                    fontSize: 20,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                    side: BorderSide(color: Color(0xFFC91108), width: 2),
                  ),
                ),
                onPressed: () {
                  ////Backend : Buat akun
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyHome()),
                  );
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: Text(
                    'Daftar',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
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
