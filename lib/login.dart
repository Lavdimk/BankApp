import 'package:bank_app/navigation.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  void validateLogin(BuildContext context, String username, String password) {
    if (username == 'Krenar' && password == 'krenar123') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Invalid username or password'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    String username = '';
    String password = '';

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade200,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 60),
              const Align(
                alignment: Alignment.topCenter,
                child: Text(
                  'Welcome back!',
                  style: TextStyle(
                    fontSize: 40,
                    color: Colors.blue,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const Align(
                alignment: Alignment.topCenter,
                child: Text(
                  'Log In',
                  style: TextStyle(
                    fontSize: 26,
                    color: Colors.blue,
                  ),
                ),
              ),
              const SizedBox(height: 100),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 25),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Username',
                    hintStyle: TextStyle(fontSize: 20),
                    prefixIcon: Icon(Icons.person),
                    border: InputBorder.none,
                  ),
                  onChanged: (value) {
                    username = value;
                  },
                ),
              ),
              const SizedBox(height: 20),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 25),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Password',
                    hintStyle: TextStyle(fontSize: 20),
                    prefixIcon: Icon(Icons.key),
                    border: InputBorder.none,
                  ),
                  obscureText: true,
                  onChanged: (value) {
                    password = value;
                  },
                ),
              ),
              const SizedBox(height: 40),
              SizedBox(
                height: 40,
                width: 320,
                child: ElevatedButton(
                  onPressed: () {
                    validateLogin(context, username, password);
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                  child: const Text(
                    'Login',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: const [
                  Padding(
                    padding: EdgeInsets.only(right: 45),
                    child: Text(
                      'Forgot Password',
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontSize: 16,
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 300),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    "Don't have an account? ",
                    style: TextStyle(
                      fontSize: 16,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  Text(
                    'Sign Up here',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.blue,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
