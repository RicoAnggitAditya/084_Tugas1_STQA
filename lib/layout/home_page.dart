import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:hive/hive.dart';

import '../model/contact.dart';
import 'form_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key}); /// Konstruktor HomePage

  @override
  State<HomePage> createState() => _HomePageState(); /// Override metode createState()
}

class _HomePageState extends State<HomePage> {
  List<Contact> ct = []; /// Deklarasi variabel ct untuk menyimpan daftar kontak
  late Box<Contact> box; /// Deklarasi variabel box untuk Hive box

  @override
  void initState() {
    super.initState();
    box = Hive.box('dbContact'); /// Inisialisasi variabel box dengan Hive box 'dbContact'
  }

  @override
  Widget build(BuildContext context) {
    ct = box.values.toList(); /// Mengambil nilai dari Hive box dan mengonversinya ke dalam daftar kontak

    return Scaffold(
      body: SafeArea(
        child: ListView.builder(
          itemCount: ct.length, /// Jumlah item dalam daftar sesuai dengan panjang ct
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 10,
                child: ListTile(
                  leading: const Icon(Icons.person),
                  title: Text(
                    ct[index].name,
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [Text(ct[index].email), Text(ct[index].phone)],
                  ),
                  trailing: IconButton(
                    onPressed: () {
                      /// Aksi yang akan diambil saat tombol hapus ditekan
                    },
                    icon: const Icon(Icons.delete),
                  ),
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => FormPage()), /// Navigasi ke FormPage saat tombol tambah ditekan
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
