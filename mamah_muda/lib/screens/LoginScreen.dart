import 'package:flutter/material.dart';
import 'package:mamah_muda/Models/api_response.dart';
import 'package:mamah_muda/Models/users.dart';
import 'package:mamah_muda/Services/user_service.dart';
import 'package:mamah_muda/Widget/custom_input.dart';
import 'package:mamah_muda/screens/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'DaftarScreen.dart'; // Impor halaman pendaftaran

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isObscure = true;

  void loginUser() async {
    if (formkey.currentState!.validate()) {
      ApiResponse response =
          await login(usernameController.text, passwordController.text);
      if (response.error == null) {
        _saveAndRedirectToHome(response.data as users);
      } else {
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
    await pref.setString('name', user.name ?? '');
    await pref.setString('name', user.email ?? '');
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
            key: formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 69),
                    child: Image.asset(
                      'assets/images/ikon1.png',
                      width: 120,
                      height: 70,
                    ),
                  ),
                ),
                const SizedBox(height: 10.0),
                const Text(
                  'Masuk Ke Akun Kamu',
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                  ),
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
                  //Backend : input username
                  controller: usernameController,
                  validator: (val) => val == null || val.isEmpty
                      ? 'Username lu belum cil!'
                      : null,
                  textInputAction: TextInputAction.next,
                  textinputtype: TextInputType.emailAddress,
                  hint: 'Masukkan username kamu',
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
                  //Backend : input password
                  controller: passwordController,
                  validator: (val) => val == null || val.isEmpty
                      ? 'password lu belum cil!'
                      : null,
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
                  height: 8,
                ),
                const SizedBox(
                  height: 50,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Color(0xFFC91108),
                    textStyle: const TextStyle(
                      fontSize: 20,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                      side: BorderSide(color: Color(0xFFC91108), width: 2),
                    ),
                  ),
                  onPressed: () {
                    //Backend : logika login
                    loginUser();
                  },
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    child: Text(
                      'Masuk',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black,
                    backgroundColor: Colors.white,
                    textStyle: const TextStyle(
                      fontSize: 20,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                      side: BorderSide(color: Color(0xFFC91108), width: 2),
                    ),
                  ),
                  onPressed: () {
                    // Navigasi ke halaman pendaftaran
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DaftarScreen()),
                    );
                  },
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    child: Text(
                      'Daftar',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
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
