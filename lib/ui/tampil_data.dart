import 'package:flutter/material.dart';

class TampilData extends StatelessWidget {
  // Terima data yang dikirim dari FormData
  final String nama;
  final String nim;
  final int umur;

  const TampilData({
    Key? key,
    required this.nama,
    required this.nim,
    required this.umur,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perkenalan'),
        backgroundColor: Colors.pink[300],
        elevation: 0,
      ),
      body: Container(
        color: Colors.pink[50],
        width: double.infinity,
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Card(
              elevation: 5,
              shadowColor: Colors.pink[100],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Container(
                padding: const EdgeInsets.all(24.0),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Perkenalan Diri Saya:',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.pink[800],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Nama saya $nama, NIM $nim, dan umur saya adalah $umur tahun.',
                      style: TextStyle(
                        fontSize: 18.0,
                        height: 1.5,
                        color: Colors.grey[800],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
