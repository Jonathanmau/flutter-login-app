import 'package:flutter/material.dart';

// import widget reusable & validator
import '../widgets/custom_textfield.dart';
import '../widgets/custom_button.dart';
import '../utils/validator.dart';

// Stateful karena ada loading state
class ForgotPage extends StatefulWidget {
  @override
  _ForgotPageState createState() => _ForgotPageState();
}

class _ForgotPageState extends State<ForgotPage> {
  // key untuk validasi form
  final _formKey = GlobalKey<FormState>();

  String email = ''; // menyimpan input email
  bool isLoading = false; // status loading

  // FUNGSI KIRIM RESET
  void sendReset() async {
    // cek validasi form
    if (!_formKey.currentState!.validate()) return;

    // tampilkan loading
    setState(() => isLoading = true);

    // simulasi proses kirim email
    await Future.delayed(Duration(seconds: 2));

    // matikan loading
    setState(() => isLoading = false);

    // tampilkan feedback ke user
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text("Link reset dikirim ke email")));
  }

  // UI
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appbar atas
      appBar: AppBar(title: Text("Lupa Password")),

      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),

          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(10),
                child: Text(
                  "Masukkan email untuk reset password anda",
                  textAlign: TextAlign.center,
                ),
              ),

              SizedBox(height: 10),

              // INPUT EMAIL
              Form(
                key: _formKey,
                child: CustomTextField(
                  label: "Email",

                  // simpan input ke variabel
                  onChanged: (value) => email = value,

                  // validasi dari utils
                  validator: Validator.validateEmail,
                ),
              ),

              SizedBox(height: 20),

              // BUTTON RESET
              CustomButton(
                text: "Kirim Link Reset",
                onPressed: sendReset,
                isLoading: isLoading,
              ),

              // KEMBALI KE LOGIN
              TextButton(
                onPressed: () {
                  Navigator.pop(context); // kembali ke halaman sebelumnya
                },
                child: Text("Kembali ke Login"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
