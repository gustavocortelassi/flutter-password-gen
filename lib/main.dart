import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 230, 18, 159)),
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        home: const PasswordGenerator());
  }
}

class PasswordGenerator extends StatefulWidget {
  const PasswordGenerator({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PasswordGeneratorState createState() => _PasswordGeneratorState();
}

class _PasswordGeneratorState extends State<PasswordGenerator> {
  String _password = '';
  void _generatePassword() {
    final random = Random();
    const characters =
        'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#\$%^&*()_+';
    String password = '';

    // gera aleatorio
    for (int i = 0; i < 8; i++) {
      password += characters[random.nextInt(characters.length)];
    }

    setState(() {
      _password = password;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gerador de senha'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Senha aleatoria:',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              _password,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _generatePassword,
              child: const Text('Gerar'),
            ),
          ],
        ),
      ),
    );
  }
}
