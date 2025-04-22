import 'package:flutter/material.dart';
import '../widgets/custom_appbar.dart';
import '../widgets/custom_drawer.dart';
import '../widgets/custom_buttom_nav.dart';

class RiwayatPage extends StatefulWidget {
  const RiwayatPage({super.key});

  @override
  State<RiwayatPage> createState() => _RiwayatPageState();
}

class _RiwayatPageState extends State<RiwayatPage> {
  int _selectedIndex = 1;

  void _onNavTap(int index) {
    setState(() {
      _selectedIndex = index;
    });

    if (index == 0) {
      Navigator.pushReplacementNamed(context, '/home');
    } else if (index == 2) {
      Navigator.pushReplacementNamed(context, '/profil');
    }
  }

  final List<Map<String, String>> _riwayatTransaksi = [
    {
      "judul": "Top Up",
      "waktu": "12 Apr 2025",
      "nominal": "Rp 100.000",
      "tipe": "debit"
    },
    {
      "judul": "Kirim Uang",
      "waktu": "10 Apr 2025",
      "nominal": "Rp 50.000",
      "tipe": "kredit"
    },
    {
      "judul": "Pembayaran Tagihan",
      "waktu": "08 Apr 2025",
      "nominal": "Rp 75.000",
      "tipe": "kredit"
    },
    {
      "judul": "Isi Saldo",
      "waktu": "05 Apr 2025",
      "nominal": "Rp 200.000",
      "tipe": "debit"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Riwayat Transaksi'),
      drawer: const CustomDrawer(),
      body: ListView.builder(
        itemCount: _riwayatTransaksi.length,
        itemBuilder: (context, index) {
          final item = _riwayatTransaksi[index];
          final tipe = item["tipe"];
          final warna = tipe == "debit" ? Colors.green : Colors.red;

          return ListTile(
            leading: Icon(
              tipe == "debit" ? Icons.arrow_downward : Icons.arrow_upward,
              color: warna,
            ),
            title: Text(item["judul"]!),
            subtitle: Text(item["waktu"]!),
            trailing: Text(
              item["nominal"]!,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: warna,
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: CustomBottomNav(
        currentIndex: 1, // karena ini halaman Riwayat
        onTap: (index) {
          if (index == 0) {
            Navigator.pushReplacementNamed(context, '/home');
          } else if (index == 2) {
            Navigator.pushReplacementNamed(context, '/profil');
          }
        },
      ),
    );
  }
}
