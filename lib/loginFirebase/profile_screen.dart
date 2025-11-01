import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProfileScreen extends StatelessWidget {
  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(user.photoURL ?? ''),
              radius: 50,
            ),
            const SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(labelText: 'Name'),
              controller: TextEditingController(text: user.displayName),
              readOnly: true,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Email'),
              controller: TextEditingController(text: user.email),
              readOnly: true,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                Navigator.pushReplacementNamed(context, '/');
              },
              child: const Text('Back'),
            ),
          ],
        ),
      ),
    );
  }
}
