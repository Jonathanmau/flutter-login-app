import 'package:flutter/material.dart';

// widget tombol reusable
class CustomButton extends StatelessWidget {
  final String text; // teks tombol
  final VoidCallback onPressed; // aksi saat ditekan
  final bool isLoading; // status loading

  const CustomButton({
    required this.text,
    required this.onPressed,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return isLoading
        // loading tampil spinner
        ? CircularProgressIndicator()
        // jika tidak tampil tombol
        : ElevatedButton(onPressed: onPressed, child: Text(text));
  }
}
