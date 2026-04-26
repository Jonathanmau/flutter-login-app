import 'package:flutter/material.dart';

// import widget reusable & validator
import '../widgets/custom_textfield.dart';
import '../widgets/custom_button.dart';
import '../utils/validator.dart';
import '../models/user.dart'; // import model

// Stateful
class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // key untuk mengontrol & validasi form
  final _formKey = GlobalKey<FormState>();

  // menyimpan input email & password
  String email = '';
  String password = '';

  bool isLoading = false; // untuk menampilkan loading
  bool isPasswordVisible = false; // toggle show/hide password

  void login() async {
    // jalankan validasi semua field
    if (!_formKey.currentState!.validate()) return;

    // ubah state → tampil loading
    setState(() => isLoading = true);
    await Future.delayed(Duration(seconds: 2));

    if (email == "admin@test.com" && password == "Admin123") {
      final user = User(email: email);

      // jika sukses ke dashboard
      // kirim object user ke dashboard
      Navigator.pushReplacementNamed(context, '/dashboard', arguments: user);
    } else {
      // jika gagal → matikan loading
      setState(() => isLoading = false);

      // tampilkan pesan error ke user
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Email atau Password salah")));
    }
  }

  //UI LOGIN
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bagian atas aplikasi
      appBar: AppBar(title: Text("Login")),

      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20), // jarak dari tepi layar
          // Form digunakan untuk validasi input
          child: Form(
            key: _formKey,

            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.lock),
                    SizedBox(width: 5),
                    Text("Silakan Login", style: TextStyle(fontSize: 18)),
                  ],
                ),

                SizedBox(height: 20),

                // INPUT EMAIL
                CustomTextField(
                  label: "Email",

                  // setiap perubahan disimpan ke variabel email
                  onChanged: (value) => email = value,

                  // validasi email dari utils
                  validator: Validator.validateEmail,
                ),

                SizedBox(height: 15),

                // INPUT PASSWORD
                CustomTextField(
                  label: "Password",
                  isPassword: true, // tipe password
                  isVisible: isPasswordVisible, // kontrol visibility
                  // toggle show/hide password
                  toggle: () {
                    setState(() {
                      isPasswordVisible = !isPasswordVisible;
                    });
                  },

                  onChanged: (value) => password = value,

                  // validasi password dari utils
                  validator: Validator.validatePassword,
                ),

                SizedBox(height: 20),

                // BUTTON LOGIN
                CustomButton(
                  text: "Login",
                  onPressed: login,
                  isLoading: isLoading, // tampil loading jika true
                ),

                // LINK LUPA PASSWORD
                TextButton(
                  onPressed: () {
                    // navigasi ke halaman forgot
                    Navigator.pushNamed(context, '/forgot');
                  },
                  child: Text("Lupa Password?"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
