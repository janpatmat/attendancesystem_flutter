import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:itelecexam2/dashboard.dart';
import 'package:itelecexam2/services/authService.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String username = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome to my app',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 50),
            TextField(
              onChanged: (value) {
                setState(() {
                  username = value;
                });
              },
              decoration: InputDecoration(
                labelText: 'Username',
              ),
            ),
            SizedBox(height: 20),
            TextField(
              onChanged: (value) {
                setState(() {
                  password = value;
                });
              },
              decoration: InputDecoration(
                labelText: 'Password',
              ),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // TODO: Implement login logic using username and password
                print('Username: $username');
                print('Password: $password');
              },
              child: Text('Login'),
            ),
            SizedBox(height: 20),
            SignInButton(
              Buttons.Google,
              onPressed: () async {
                await authService().signInWithGoogle().then((value) {
                  print(value.user?.displayName.toString());
                }).onError((error, stackTrace) {});

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const dashBoard()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
