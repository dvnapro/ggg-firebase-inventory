import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:admin/auth/index.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("WELCOME HOME", style: TextStyle(fontSize: 30)),
            TextButton(
              onPressed: () {
                context.read<AuthenticationProvider>().signOut();
              },
              child: Text("Sign out"),
            ),
          ],
        ),
      ),
    );
  }
}
