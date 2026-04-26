import 'package:flutter/material.dart';

// widget input reusable agar tidak menulis TextFormField berulang
class CustomTextField extends StatelessWidget {
  final String label; // label input
  final bool isPassword; // apakah input password
  final bool isVisible; // status tampil/sembunyi password
  final Function(String) onChanged; // fungsi saat input berubah
  final String? Function(String?) validator; // fungsi validasi
  final VoidCallback? toggle; // tombol untuk show/hide password

  const CustomTextField({
    required this.label,
    this.isPassword = false,
    this.isVisible = false,
    required this.onChanged,
    required this.validator,
    this.toggle,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // password bisa disembunyikan
      obscureText: isPassword ? !isVisible : false,

      decoration: InputDecoration(
        labelText: label,

        // password tampil icon mata
        suffixIcon: isPassword
            ? IconButton(
                icon: Icon(isVisible ? Icons.visibility : Icons.visibility_off),
                onPressed: toggle, // toggle visibility
              )
            : null,
      ),

      // simpan perubahan input
      onChanged: onChanged,

      // jalankan validasi
      validator: validator,
    );
  }
}
