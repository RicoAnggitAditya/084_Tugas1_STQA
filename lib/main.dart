import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:nyobahive/layout/form_page.dart';
import 'layout/home_page.dart';
import 'model/contact.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized; /// Menginisialisasi binding untuk Flutter

  await Hive.initFlutter(); /// Menginisialisasi Hive untuk Flutter

  Hive.registerAdapter(ContactAdapter()); /// Mendaftarkan adapter ContactAdapter untuk Hive

  await Hive.openBox<Contact>('dbContact'); /// Membuka Hive box 'dbContact' yang akan digunakan untuk menyimpan objek Contact

  runApp(const MyApp()); /// Menjalankan aplikasi Flutter
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, /// Mengatur tampilan "debug" di banner
      theme: ThemeData(
        primarySwatch: Colors.blue, /// Tema utama aplikasi
      ),
      home: HomePage(), /// Halaman awal aplikasi
    );
  }
}

