// class ini berfungsi sebagai helper untuk validasi input form
// supaya kode validasi tidak ditulis berulang di setiap halaman
class Validator {
  // VALIDASI EMAIL
  // fungsi ini dipakai untuk mengecek input email
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return "Email tidak boleh kosong";
    }
    if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
      return "Format email tidak valid";
    }

    return null; // jika valid
  }

  // VALIDASI PASSWORD
  // fungsi ini mengecek aturan password
  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return "Password tidak boleh kosong";
    }
    if (value.length < 8) {
      return "Minimal 8 karakter";
    }
    if (!RegExp(r'^(?=.*[A-Za-z])(?=.*\d)').hasMatch(value)) {
      return "Harus huruf & angka";
    }

    return null; // jika valid
  }
}
