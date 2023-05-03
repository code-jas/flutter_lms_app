import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:learning_app/constants/colors.dart';
import 'package:learning_app/services/auth_service.dart';
import 'package:learning_app/widgets/login/button.dart';
import 'package:learning_app/widgets/login/square_tile.dart';
import 'package:learning_app/widgets/login/text_field.dart';

class LoginPage extends StatefulWidget {
  final Function()? onTap;
  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // text editing controllers
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  // sign user in method
  void signUserIn() async {
    showDialog(
        context: context,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        });
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      // ignore: use_build_context_synchronously
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      // ignore: use_build_context_synchronously
      Navigator.pop(context);
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('No user found for that email.'),
          ),
        );
      } else if (e.code == 'wrong-password') {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Wrong password provided for that user.'),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/lms_auth_bg.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            _lmsTitle(),
            _signInForm(),
          ],
        ),
      ),
    );
  }

  _lmsTitle() {
    return Positioned(
      top: MediaQuery.of(context).size.height / 4 - 80,
      left: 0,
      right: 0,
      child: Center(
        child: Column(children: const [
          Text(
            'LMS',
            style: TextStyle(
              color: light_100,
              fontSize: 120,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'Learn from anything and anywhere',
            style: TextStyle(
              color: light_100,
              fontSize: 16,
              height: 0.01,
            ),
          ),
        ]),
      ),
    );
  }

  _signInForm() {
    return Positioned(
      bottom: 0,
      child: Container(
        height: MediaQuery.of(context).size.height / 2 + 50,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          color: dark_100,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LoginTextField(
                controller: emailController,
                hintText: 'Email',
                obscureText: false,
              ),

              const SizedBox(height: 20),

              // password textfield
              LoginTextField(
                controller: passwordController,
                hintText: 'Password',
                obscureText: true,
              ),
              const SizedBox(height: 20),

              // sign in button
              LoginButton(
                text: 'Sign In',
                onTap: signUserIn,
                colorBtn: primary,
              ),
              const SizedBox(height: 20),

              LoginButton(
                text: 'Sign In with Google',
                onTap: () => AuthService().signInWithGoogle(),
                colorBtn: secondary,
              ),
              const SizedBox(height: 50),

              // not a member? register now
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Don\'t have an account?',
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 13,
                    ),
                  ),
                  const SizedBox(width: 4),
                  GestureDetector(
                    onTap: widget.onTap,
                    child: const Text(
                      'Register now',
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
