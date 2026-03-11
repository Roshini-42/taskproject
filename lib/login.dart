import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

import 'home.dart';


class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController usernames = TextEditingController();
  TextEditingController passwords = TextEditingController();

  bool isLoading = false;
  bool showPassword = false;
  String errorMessage = '';

  Future login() async {
    String username = usernames.text.trim();
    String password = passwords.text;

    if (username.isEmpty) {
      setState(() {
        errorMessage = 'Username cannot be empty';
      });
      return;
    }

    if (password.isEmpty) {
      setState(() {
        errorMessage = 'Password cannot be empty';
      });
      return;
    }

    setState(() {
      isLoading = true;
      errorMessage = '';
    });

    try {

      Response response = await Dio().post(
        'https://fakestoreapi.com/auth/login',
        data: {
          'username': username,
          'password': password,
        },
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => Home()),
        );
      } else {
        setState(() {
          errorMessage = 'Invalid username or password';
        });
      }
    } catch (e) {
      setState(() {
        errorMessage = 'Invalid username or password';
      });
    }

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [

          Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.blue[800],
          ),

          Positioned(
            top: -40,
            right: 15,
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.pink[200],
                shape: BoxShape.circle,
              ),
            ),
          ),

          Positioned(
            top: 60,
            left: 30,
            child: Text(
              'Welcome\nback',
              style: TextStyle(
                fontSize: 50,
                height: 1.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),

          Positioned(
            top: 210,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(28.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    SizedBox(height: 10),

                    Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(height: 24),

                    TextField(
                      controller: usernames,
                      decoration: InputDecoration(
                        label: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.mail_outline, color: Colors.grey, size: 18),
                            SizedBox(width: 8),
                            Text('username', style: TextStyle(color: Colors.grey)),
                          ],
                        ),
                      ),
                    ),

                    SizedBox(height: 16),

                    TextField(
                      controller: passwords,
                      obscureText: !showPassword,
                      decoration: InputDecoration(
                        label: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.lock_outline, color: Colors.grey, size: 18),
                            SizedBox(width: 8),
                            Text('Password', style: TextStyle(color: Colors.grey)),
                          ],
                        ),
                        suffixIcon: TextButton(
                          onPressed: () {
                            setState(() {
                              showPassword = !showPassword;
                            });
                          },
                          child: Text(
                            showPassword ? 'Hide' : 'Show',
                            style: TextStyle(color: Colors.blue[800]),
                          ),
                        ),

                      ),
                    ),

                    SizedBox(height: 8),

                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'Forgot passcode?',
                        style: TextStyle(color: Colors.blue[800]),
                      ),
                    ),

                    if (errorMessage.isNotEmpty)
                      Text(
                        errorMessage,
                        style: TextStyle(color: Colors.red, fontSize: 13),
                      ),

                    SizedBox(height: 16),

                    SizedBox(
                      width: double.infinity,
                      height: 52,
                      child: ElevatedButton(
                        onPressed: isLoading ? null : login,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue[800],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: isLoading
                            ? CircularProgressIndicator(color: Colors.white)
                            : Text(
                          'Login',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 16),

                    Center(
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          'Create account',
                          style: TextStyle(color: Colors.blue[800]),
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }
}
