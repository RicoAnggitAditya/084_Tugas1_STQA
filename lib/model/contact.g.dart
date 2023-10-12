part of 'contact.dart';


class ContactAdapter extends TypeAdapter<Contact> {
  @override
  final int typeId = 0; /// Menandakan typeId untuk kelas Contact yang akan digunakan dalam Hive

  @override
  Contact read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Contact(
      name: fields[0] as String, /// Membaca nilai nama dari field dengan HiveFieldId 0
      email: fields[1] as String, /// Membaca nilai email dari field dengan HiveFieldId 1
      phone: fields[2] as String, /// Membaca nilai nomor telepon dari field dengan HiveFieldId 2
    );
  }

  @override
  void write(BinaryWriter writer, Contact obj) {
    writer
      ..writeByte(3) /// Menulis jumlah field (3 field) ke dalam binary
      ..writeByte(0)
      ..write(obj.name) /// Menulis nilai nama ke dalam binary
      ..writeByte(1)
      ..write(obj.email) /// Menulis nilai email ke dalam binary
      ..writeByte(2)
      ..write(obj.phone); /// Menulis nilai nomor telepon ke dalam binary
  }

  @override
  int get hashCode => typeId.hashCode; /// Menghitung hashCode berdasarkan typeId

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ContactAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId; /// Memeriksa kesamaan adapter berdasarkan typeId
}

/// Kode di atas adalah adapter untuk mengkonversi objek Contact ke format biner yang dapat disimpan dalam Hive dan sebaliknya.

