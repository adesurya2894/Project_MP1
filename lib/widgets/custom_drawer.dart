import 'package:flutter/material.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: Colors.blue),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(
                    'https://i.pravatar.cc/150?img=3',
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Giel Pratama',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'giel@example.com',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Beranda'),
            onTap: () => Navigator.pushReplacementNamed(context, '/home'),
          ),
          ListTile(
            leading: Icon(Icons.history),
            title: Text('Riwayat'),
            onTap: () => Navigator.pushReplacementNamed(context, '/riwayat'),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Profil'),
            onTap: () => Navigator.pushReplacementNamed(context, '/profil'),
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Pengaturan'),
          ),
          ListTile(
            leading: Icon(Icons.login),
            title: Text('Logout'),
            onTap: () => Navigator.pushReplacementNamed(context, '/login'),
          ),
        ],
      ),
    );
  }
}
