import 'package:flutter/material.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Change Password"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(labelText: 'Old Password'),
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'New Password'),
              
            ),
            TextFormField(
              decoration:
                  const InputDecoration(labelText: 'Confirm New Password'),
              
            ),
            ElevatedButton(
              onPressed: () {
               
              },
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
