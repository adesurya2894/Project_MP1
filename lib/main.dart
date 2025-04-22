import 'package:flutter/material.dart';
import 'package:app_pertamaku/pages/login_page.dart';
import 'package:app_pertamaku/pages/home_page.dart';
import 'package:app_pertamaku/pages/riwayat_page.dart';
import 'package:app_pertamaku/pages/profil_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Super App',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),

      // ✅ Halaman awal langsung ke Login
      home: const LoginPage(),

      // ✅ Semua route disiapkan untuk navigasi
      routes: {
        '/login': (context) => const LoginPage(),
        '/home': (context) => const HomePage(),
        '/riwayat': (context) => const RiwayatPage(),
        '/profil': (context) => const ProfilPage(),
      },
    );
  }
}
