import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'HotelBooking.dart';
import 'HotelJson.dart';

void main() {
  runApp(const HotelBookingApp());
}

/*
[2 whitespaces or 1 tab]assets:
[4 whitespaces or 2 tabs]- images/pizza1.png
[4 whitespaces or 2 tabs]- images/pizza0.png
 */

/*
https://pub.dev/packages/http/install


 */

class HotelBookingApp extends StatelessWidget {
  const HotelBookingApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'โรงแรมอุดร',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      home: const HomePage(title: 'โรงแรมอุดร'),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});
  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        toolbarHeight: 60,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.network(
              "https://i.pinimg.com/564x/ab/aa/45/abaa454f7b94142fb43be1d483afe1ac.jpg",
              height: 400,
              width: 400,
            ),
            SizedBox(height: 15),
            Text(
              '" Udon Hotel "',
              style: GoogleFonts.lora(fontSize: 25),
            ),
            Text(
              'ยินดีต้อนรับ',
              style: GoogleFonts.notoSerif(
                  textStyle: Theme.of(context).textTheme.headlineMedium,
                  fontSize: 25),
            ),
            SizedBox(height: 15), // เพิ่มช่องว่างระหว่างข้อความและปุ่ม
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HotelBooking()),
                );
              },
              child: Text(
                'จองห้องพัก',
                style: TextStyle(fontSize: 19),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
