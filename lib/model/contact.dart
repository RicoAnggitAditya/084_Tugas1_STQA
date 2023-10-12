import 'package:hive_flutter/hive_flutter.dart';

part 'contact.g.dart';

@HiveType(typeId: 0) /// Menandakan bahwa kelas ini akan digunakan dengan Hive dan memiliki typeId 0
class Contact extends HiveObject {
  @HiveField(0) /// Menandakan bahwa ini adalah field dengan HiveFieldId 0
  final String name; /// Variabel untuk menyimpan nama kontak
  @HiveField(1) /// Menandakan bahwa ini adalah field dengan HiveFieldId 1
  final String email; /// Variabel untuk menyimpan email kontak
  @HiveField(2) /// Menandakan bahwa ini adalah field dengan HiveFieldId 2
  final String phone; /// Variabel untuk menyimpan nomor telepon kontak
  Contact({
    required this.name, /// Konstruktor untuk menginisialisasi nilai name
    required this.email, /// Konstruktor untuk menginisialisasi nilai email
    required this.phone, /// Konstruktor untuk menginisialisasi nilai phone
  });
}
