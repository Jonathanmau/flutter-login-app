import 'package:flutter/material.dart';

// import semua halaman (screens)
import 'screens/login_page.dart';
import 'screens/forgot_page.dart';
import 'screens/dashboard_page.dart';

// fungsi pertama kali dijalankan saat app dibuka
void main() {
  runApp(MyApp());
}

// widget utama yang mengatur seluruh aplikasi
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // menghilangkan tulisan debug di pojok kanan atas
      debugShowCheckedModeBanner: false,

      // route pertama saat aplikasi dibuka
      initialRoute: '/',

      // daftar semua navigasi halaman dalam aplikasi
      routes: {
        '/': (context) => LoginPage(),
        '/forgot': (context) => ForgotPage(),
        '/dashboard': (context) => DashboardPage(),
      },
    );
  }
}
