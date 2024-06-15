import 'package:flutter/material.dart';
import 'package:mamah_muda/Models/api_response.dart';
import 'package:mamah_muda/Models/users.dart';
import 'package:mamah_muda/Services/user_service.dart';
import 'package:mamah_muda/Widget/custom_input.dart';
import 'package:mamah_muda/screens/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DaftarScreen extends StatefulWidget {
  const DaftarScreen({super.key});

  @override
  State<DaftarScreen> createState() => _DaftarScreenState();
}

class _DaftarScreenState extends State<DaftarScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isObscure = true;

  void registerUser() async {
    if (formKey.currentState!.validate()) {
      ApiResponse response = await register(
          nameController.text, emailController.text, passwordController.text);
      print('Register response: ${response.data}');
      print('Register error: ${response.error}');
      if (response.error == null) {
        _saveAndRedirectToHome(response.data as users);
      } else {
        setState(() {});
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('${response.error}'),
        ));
      }
    }
  }

  void _saveAndRedirectToHome(users user) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setString('token', user.token ?? '');
    await pref.setInt('id', user.id ?? 0);
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => MyHome()), (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: formKey,
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
                  // Backend : username
                  controller: nameController,
                  validator: (val) => val == null || val.isEmpty
                      ? 'Username harus diisi'
                      : null,
                  textInputAction: TextInputAction.next,
                  textinputtype: TextInputType.emailAddress,
                  hint: 'Masukkan Username Kamu',
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
                  // Backend : email
                  controller: emailController,
                  validator: (val) {
                    if (val == null || val.isEmpty) {
                      return 'Email harus diisi';
                    } else if (!val.contains('@')) {
                      return 'Email tidak sesuai format';
                    }
                    return null;
                  },
                  textInputAction: TextInputAction.next,
                  textinputtype: TextInputType.emailAddress,
                  hint: 'Masukkan Email Kamu',
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
                  // Backend : password
                  controller: passwordController,
                  validator: (val) {
                    if (val == null || val.isEmpty) {
                      return 'Password tidak boleh kosong';
                    } else if (val.length < 6) {
                      return 'Password harus lebih dari 6 karakter';
                    }
                    return null;
                  },
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
                    registerUser();
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
      ),
    );
  }
}
