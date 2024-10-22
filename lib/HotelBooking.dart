import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:google_fonts/google_fonts.dart';

class HotelBooking extends StatefulWidget {
  @override
  _HotelBookingState createState() => _HotelBookingState();
}

class _HotelBookingState extends State<HotelBooking> {
  List<dynamic> _rooms = [];

  // ฟังก์ชันสำหรับโหลดข้อมูล JSON
  Future<void> loadJsonData() async {
    String jsonString = await rootBundle.loadString('data/rooms.json');
    setState(() {
      _rooms = json.decode(jsonString); // แปลงข้อมูลจาก JSON
    });
  }

  @override
  void initState() {
    super.initState();
    loadJsonData(); // โหลดข้อมูลเมื่อแอปเริ่มทำงาน
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Udon Hotel',
          style: GoogleFonts.itim(fontSize: 30, color: Colors.teal[800]),
        ),
      ),
      body: _rooms.isNotEmpty
          ? ListView.builder(
              itemCount: _rooms.length,
              itemBuilder: (context, index) {
                return Card(
                  color: index % 2 == 0 ? Color(0xfffffde7) : Color(0xff80cbc4),
                  elevation: 10,
                  margin: EdgeInsets.all(10),
                  child: ListTile(
                    leading: Icon(Icons.bed),
                    title: Text(
                      _rooms[index]['name'], // แสดงประเภทห้อง
                      style: GoogleFonts.mali(
                        fontSize: 22,
                        color: Colors.red,
                      ),
                    ),
                    subtitle: Text(
                      _rooms[index]['details'], // แสดงคำอธิบายห้อง
                    ),
                    onTap: () {
                      // กดที่ Card แล้วไปยังหน้ารายละเอียด
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ListPage(
                            Roomdata: _rooms[index], // ส่งข้อมูลห้องไป
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            )
          : Center(child: CircularProgressIndicator()), // แสดงการโหลดข้อมูล
    );
  }
}

class ListPage extends StatelessWidget {
  final Map<String, dynamic> Roomdata;

  const ListPage({super.key, required this.Roomdata});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'รายละเอียดห้องพัก',
          style: GoogleFonts.k2d(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Color(0xff37474f)),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Roomdata['imageUrl'] != null
                ? Image.network(Roomdata['imageUrl'])
                : Container(),
            SizedBox(height: 20),
            Text(
              'ประเภทห้อง: ${Roomdata['name']}',
              style: GoogleFonts.k2d(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'รายละเอียด: ${Roomdata['details']}',
              style: GoogleFonts.k2d(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'ราคา: ${Roomdata['price']}',
              style: GoogleFonts.k2d(fontSize: 22),
            ),
          ],
        ),
      ),
    );
  }
}
