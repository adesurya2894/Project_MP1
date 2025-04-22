import 'package:flutter/material.dart';
import '../widgets/custom_appbar.dart';
import '../widgets/custom_drawer.dart';
import 'home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  String? _errorMessage;

  final String validEmail = 'admin@example.com';
  final String validPassword = '123456';

  void _login() {
    final email = _emailController.text.trim();
    final password = _passwordController.text;

    if (email == validEmail && password == validPassword) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    } else {
      setState(() {
        _errorMessage = 'Email atau password salah!!';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          const CustomAppBar(title: 'Login'), // ✅ tetap gunakan custom appbar
      drawer: const CustomDrawer(), // ✅ tampilkan drawer juga

      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Email', style: TextStyle(fontSize: 16)),
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(hintText: 'Masukkan email'),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 20),
            const Text('Password', style: TextStyle(fontSize: 16)),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(hintText: 'Masukkan password'),
            ),
            const SizedBox(height: 20),
            if (_errorMessage != null)
              Text(_errorMessage!, style: const TextStyle(color: Colors.red)),
            const SizedBox(height: 10),
            Center(
              child: ElevatedButton(
                onPressed: _login,
                child: const Text('Login'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
