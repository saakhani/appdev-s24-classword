import 'package:classwork/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          children: <Widget>[
            const SizedBox(height: 240.0),
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(
                filled: true,
                labelText: 'Username',
              ),
            ),
            // spacer
            const SizedBox(height: 12.0),
            // [Password]
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(
                filled: true,
                labelText: 'Password',
              ),
              obscureText: true,
            ),
            const SizedBox(height: 12.0),
            OverflowBar(
              alignment: MainAxisAlignment.end,
              children: <Widget>[
                // TextButton(
                //   onPressed: (){
                //     _usernameController.clear();
                //     _passwordController.clear();
                //   },
                //   child: const Text("Cancel")
                // ),
                ElevatedButton(
                    onPressed: () {
                      print("Username: " + _usernameController.text);
                      print("Password: " + _passwordController.text);
                      auth.createUserWithEmailAndPassword(
                          email: _usernameController.text,
                          password: _passwordController.text);
                    },
                    child: const Text("Login")),
              ],
            )
          ],
        ),
      ),
    );
  }
}
