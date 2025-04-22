import 'package:flutter/material.dart';
import '../widgets/custom_appbar.dart';
import '../widgets/custom_drawer.dart';
import '../widgets/custom_buttom_nav.dart';

class ProfilPage extends StatefulWidget {
  const ProfilPage({super.key});

  @override
  State<ProfilPage> createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage> {
  int _selectedIndex = 2; // ✅ Profil = index ke-2

  void _onNavTap(int index) {
    setState(() {
      _selectedIndex = index;
    });

    if (index == 0) {
      Navigator.pushReplacementNamed(context, '/home');
    } else if (index == 1) {
      Navigator.pushReplacementNamed(context, '/riwayat');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Profil'),
      drawer: const CustomDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Profil Pengguna',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            const ListTile(
              leading: Icon(Icons.person),
              title: Text('Nama Lengkap'),
              subtitle: Text('Giel Pratama'),
            ),
            const ListTile(
              leading: Icon(Icons.email),
              title: Text('Email'),
              subtitle: Text('admin@example.com'),
            ),
            const ListTile(
              leading: Icon(Icons.phone),
              title: Text('Telepon'),
              subtitle: Text('085227391944'),
            ),
            const ListTile(
              leading: Icon(Icons.lock),
              title: Text('Status'),
              subtitle: Text('Login Aktif'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNav(
        currentIndex: _selectedIndex,
        onTap: _onNavTap,
      ),
    );
  }
}
