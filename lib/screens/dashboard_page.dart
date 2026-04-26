import 'package:flutter/material.dart';
import 'login_page.dart';
import '../models/user.dart';

// Stateless karena tidak ada perubahan state
class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // mengambil data email yang dikirim dari halaman login
    // ambil data user dari login
    final user = ModalRoute.of(context)!.settings.arguments as User;

    // membuat data dummy sebanyak 10 item
    List<String> items = List.generate(10, (index) => "Item ${index + 1}");

    return Scaffold(
      // APPBAR
      appBar: AppBar(
        title: Text("Dashboard"),

        // tombol logout di kanan atas
        actions: [
          IconButton(
            icon: Icon(Icons.logout),

            onPressed: () {
              // logout → hapus semua halaman sebelumnya
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
                (route) => false,
              );
            },
          ),
        ],
      ),

      // BODY
      body: Padding(
        padding: EdgeInsets.all(15),

        child: Column(
          children: [
            // CARD USER
            // menampilkan data user yang login
            Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: EdgeInsets.all(15),
                child: Text(
                  "Selamat datang, ${user.email}", // ambil data user dari halaman login
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),

            SizedBox(height: 10),

            // XLIST DATA
            // Expanded agar ListView memenuhi sisa ruang
            Expanded(
              child: ListView.builder(
                itemCount: items.length, // jumlah item

                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(items[index]), // tampilkan item
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
