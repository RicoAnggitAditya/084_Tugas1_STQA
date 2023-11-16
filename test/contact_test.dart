import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:nyobahive/model/contact.dart';
import 'path/to/contact.dart'; 

void main() {
  group('Contact Model Test', () {
    test('Contact Object Creation', () {
      // Membuat objek Contact untuk diuji
      final Contact contact = Contact(
        name: 'John Doe',
        email: 'john@example.com',
        phone: '123456789',
      );

      // Melakukan pengujian pada nilai yang diharapkan
      expect(contact.name, 'John Doe');
      expect(contact.email, 'john@example.com');
      expect(contact.phone, '123456789');
    });

    test('Hive Box Registration', () async {
      // Mock Hive box untuk pengujian
      await Hive.initFlutter();
      Hive.registerAdapter(ContactAdapter());

      // Membuka Hive box 'dbContact' dan memeriksa status
      final Box<Contact> box = await Hive.openBox<Contact>('dbContact');
      expect(box.isOpen, true);
    });

    test('Contact Saving to Hive', () async {
      // Mock Hive box untuk pengujian
      await Hive.initFlutter();
      Hive.registerAdapter(ContactAdapter());

      // Membuka Hive box 'dbContact'
      final Box<Contact> box = await Hive.openBox<Contact>('dbContact');

      // Membuat objek Contact dan menyimpannya ke dalam Hive box
      final Contact contact = Contact(
        name: 'Jane Doe',
        email: 'jane@example.com',
        phone: '987654321',
      );
      box.add(contact);

      // Memeriksa apakah objek berhasil disimpan dalam Hive box
      expect(box.length, 1);

      // Membaca objek dari Hive box
      final Contact savedContact = box.getAt(0)!;

      // Memeriksa apakah nilai yang dibaca sesuai dengan nilai yang diharapkan
      expect(savedContact.name, 'Jane Doe');
      expect(savedContact.email, 'jane@example.com');
      expect(savedContact.phone, '987654321');
    });
  });
}
