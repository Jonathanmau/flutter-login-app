// model untuk merepresentasikan data user dalam aplikasi
class User {
  final String email; // email user
  final String name; // nama user (opsional untuk pengembangan)

  // constructor untuk inisialisasi object User
  User({
    required this.email,
    this.name = "Guest", // default jika tidak diisi
  });
}
