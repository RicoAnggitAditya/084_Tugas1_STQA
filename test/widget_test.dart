import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:nyobahive/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    /// Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    /// Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget); /// Memeriksa apakah teks '0' ada di widget dan hanya ada satu widget yang sesuai.
    expect(find.text('1'), findsNothing); /// Memeriksa apakah teks '1' tidak ada di widget.

    /// Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add)); /// Menyimulasikan tap pada ikon '+'.
    await tester.pump(); /// Memicu pembaruan tampilan.

    /// Verify that our counter has incremented.
    expect(find.text('0'), findsNothing); /// Memeriksa apakah teks '0' tidak ada lagi di widget.
    expect(find.text('1'), findsOneWidget); /// Memeriksa apakah teks '1' ada di widget dan hanya ada satu widget yang sesuai.
  });
}

