import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:hive/hive.dart';
import 'package:nyobahive/layout/home_page.dart';
import 'package:nyobahive/model/contact.dart';

class FormPage extends StatefulWidget {
  const FormPage({super.key}); /// Konstruktor FormPage

  @override
  State<FormPage> createState() => _FormPageState(); /// Override metode createState()
}

class _FormPageState extends State<FormPage> {
  late Box<Contact> box; /// Deklarasi variabel box

  var formkey = GlobalKey<FormState>(); /// Deklarasi variabel formkey

  @override
  void initState() {
    super.initState();
    box = Hive.box('dbContact'); /// Inisialisasi variabel box
    print("contactsBox.length: ${box.values.length}"); /// Mencetak panjang nilai dalam box
  }

  String? name; /// Deklarasi variabel name

  String? email; /// Deklarasi variabel email

  String? phone; /// Deklarasi variabel phone

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: formkey, /// Mengatur kunci form
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                      labelText: 'Name',
                      hintText: 'Enter Your Name',
                      border: OutlineInputBorder()),
                  onChanged: (value) {
                    name = value; /// Mengubah nilai variabel name saat isian berubah
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                      labelText: 'Email',
                      hintText: 'Enter Your Email',
                      border: OutlineInputBorder()),
                  onChanged: (value) {
                    email = value; /// Mengubah nilai variabel email saat isian berubah
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                      labelText: 'Phone',
                      hintText: 'Enter Your Phone Number',
                      border: OutlineInputBorder()),
                  onChanged: (value) {
                    phone = value; /// Mengubah nilai variabel phone saat isian berubah
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (formkey.currentState!.validate()) { /// Memeriksa apakah form valid
                      formkey.currentState!.save();

                      Contact ct =
                          Contact(name: name!, email: email!, phone: phone!); /// Membuat objek Contact dengan nilai yang diambil dari input
                      box.add(ct); /// Menambahkan objek Contact ke dalam box
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomePage(),
                        ),
                      ); /// Navigasi ke halaman HomePage
                    }
                  },
                  child: const Text('Save'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
