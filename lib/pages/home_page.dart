import 'package:flutter/material.dart';
import '../widgets/custom_appbar.dart';
import '../widgets/custom_drawer.dart';
import '../widgets/custom_buttom_nav.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'BSI PAY'),
      drawer: const CustomDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 👉 Kartu Saldo
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              color: Colors.teal,
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('Saldo Kamu', style: TextStyle(color: Colors.white70)),
                    SizedBox(height: 8),
                    Text(
                      'Rp 1.250.000',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            // 👉 Tombol Aksi Cepat
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                ActionButton(icon: Icons.history, label: 'Riwayat'),
                ActionButton(
                    icon: Icons.account_balance_wallet, label: 'Isi Saldo'),
                ActionButton(icon: Icons.send, label: 'Kirim Uang'),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("FAB ditekan");
        },
        child: const Icon(Icons.chat, color: Colors.white),
        backgroundColor: Colors.teal,
      ),
      bottomNavigationBar: CustomBottomNav(
        currentIndex: 0, // karena halaman ini adalah Home
        onTap: (index) {
          if (index == 1) {
            Navigator.pushReplacementNamed(context, '/riwayat');
          } else if (index == 2) {
            Navigator.pushReplacementNamed(context, '/profil');
          }
        },
      ),
    );
  }
}

// ✅ Widget Aksi Cepat (Sementara tetap di file ini)
class ActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback? onTap;

  const ActionButton({
    super.key,
    required this.icon,
    required this.label,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          CircleAvatar(
            radius: 24,
            backgroundColor: Colors.teal.shade100,
            child: Icon(icon, color: Colors.teal),
          ),
          const SizedBox(height: 6),
          Text(label, style: const TextStyle(fontSize: 14)),
        ],
      ),
    );
  }
}
