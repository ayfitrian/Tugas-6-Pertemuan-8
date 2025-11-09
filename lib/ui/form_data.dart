import 'package:flutter/material.dart';
import 'package:projectflutter/ui/tampil_data.dart';

class FormData extends StatefulWidget {
  const FormData({Key? key}) : super(key: key);

  @override
  _FormDataState createState() => _FormDataState();
}

class _FormDataState extends State<FormData> {
  final _namaController = TextEditingController();
  final _nimController = TextEditingController();
  final _tahunLahirController = TextEditingController();

  @override
  void dispose() {
    _namaController.dispose();
    _nimController.dispose();
    _tahunLahirController.dispose();
    super.dispose();
  }

  void _kirimData() {
    String nama = _namaController.text;
    String nim = _nimController.text;

    int tahunLahir = int.tryParse(_tahunLahirController.text) ?? 0;
    int umur = 0;
    if (tahunLahir > 0) {
      umur = DateTime.now().year - tahunLahir;
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => TampilData(nama: nama, nim: nim, umur: umur),
      ),
    );
  }

  Widget _buildTextField(
    TextEditingController controller,
    String label,
    IconData icon, {
    TextInputType keyboardType = TextInputType.text,
  }) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Colors.pink[700]),
        prefixIcon: Icon(icon, color: Colors.pink[300]),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.pink[400]!, width: 2),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.pink[200]!, width: 1),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Input Data Diri'),
        backgroundColor: Colors.pink[300],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.pink[50]!, Colors.pink[100]!],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 20),
              _buildTextField(_namaController, 'Nama', Icons.person_outline),
              const SizedBox(height: 16),
              _buildTextField(_nimController, 'NIM', Icons.school_outlined),
              const SizedBox(height: 16),
              _buildTextField(
                _tahunLahirController,
                'Tahun Lahir',
                Icons.calendar_today_outlined,
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: _kirimData,
                child: const Text(
                  'Simpan',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pink[400], // Tema pink
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
