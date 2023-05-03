import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:learning_app/constants/colors.dart';
import 'package:learning_app/widgets/login/button.dart';
import 'package:learning_app/widgets/login/square_tile.dart';
import 'package:learning_app/widgets/login/text_field.dart';

class RegisterPage extends StatefulWidget {
  final Function()? onTap;
  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // text editing controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  // sign user up method
  void signUserUp() async {
    showDialog(
        context: context,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        });
    try {
      // add confirmPasswordvalidation
      if (passwordController.text != confirmPasswordController.text) {
        // ignore: use_build_context_synchronously
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Passwords do not match.'),
          ),
        );
        return;
      } else {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );
        // ignore: use_build_context_synchronously
        Navigator.pop(context);
      }

      // The account was successfully created, so show a success message
      // ignore: use_build_context_synchronously
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: const Text('Account created'),
          content: const Text(
              'Your account has been created. Please sign in to continue.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        // The email address is already in use, so show an error message
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: const Text('Error'),
            content: const Text(
                'The email address is already in use. Please sign in instead.'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('OK'),
              ),
            ],
          ),
        );
      } else {
        // An unknown error occurred, so show a generic error message
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: const Text('Error'),
            content: const Text(
                'An error occurred while creating your account. Please try again later.'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('OK'),
              ),
            ],
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
            _signUpForm(),
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

  _signUpForm() {
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
              LoginTextField(
                controller: passwordController,
                hintText: 'Password',
                obscureText: true,
              ),
              const SizedBox(height: 20),
              LoginTextField(
                controller: confirmPasswordController,
                hintText: 'Confirm Password',
                obscureText: true,
              ),
              const SizedBox(height: 20),
              LoginButton(
                text: 'Sign Up',
                onTap: signUserUp,
                colorBtn: primary,
              ),
              const SizedBox(height: 20),
              // LoginButton(
              //   text: 'Sign In with Google',
              //   onTap: () => AuthService().signInWithGoogle(),
              //   colorBtn: secondary,
              // ),
              const SizedBox(height: 50),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account?',
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
  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     backgroundColor: Colors.grey[300],
  //     body: SingleChildScrollView(
  //       child: SafeArea(
  //         child: Center(
  //           child: Column(
  //             mainAxisAlignment: MainAxisAlignment.center,
  //             children: [
  //               const SizedBox(height: 50),

  //               // logo
  //               const Icon(
  //                 Icons.lock,
  //                 size: 100,
  //               ),

  //               const SizedBox(height: 50),

  //               // welcome back, you've been missed!
  //               Text(
  //                 'Let\'s create an account for you',
  //                 style: TextStyle(
  //                   color: Colors.grey[700],
  //                   fontSize: 16,
  //                 ),
  //               ),

  //               const SizedBox(height: 15),

  //               // username textfield
  //               LoginTextField(
  //                 controller: emailController,
  //                 hintText: 'Email',
  //                 obscureText: false,
  //               ),

  //               const SizedBox(height: 10),

  //               // password textfield
  //               LoginTextField(
  //                 controller: passwordController,
  //                 hintText: 'Password',
  //                 obscureText: true,
  //               ),

  //               const SizedBox(height: 10),

  //               // password textfield
  //               LoginTextField(
  //                 controller: confirmPasswordController,
  //                 hintText: 'Confirm Password',
  //                 obscureText: true,
  //               ),

  //               const SizedBox(height: 15),

  //               // sign in button
  //               LoginButton(
  //                 text: 'Sign Up',
  //                 onTap: signUserUp,
  //                 colorBtn: Colors.blue,
  //               ),

  //               const SizedBox(height: 25),

  //               // or continue with
  //               Padding(
  //                 padding: const EdgeInsets.symmetric(horizontal: 25.0),
  //                 child: Row(
  //                   children: [
  //                     Expanded(
  //                       child: Divider(
  //                         thickness: 0.5,
  //                         color: Colors.grey[400],
  //                       ),
  //                     ),
  //                     Padding(
  //                       padding: const EdgeInsets.symmetric(horizontal: 10.0),
  //                       child: Text(
  //                         'Or continue with',
  //                         style: TextStyle(color: Colors.grey[700]),
  //                       ),
  //                     ),
  //                     Expanded(
  //                       child: Divider(
  //                         thickness: 0.5,
  //                         color: Colors.grey[400],
  //                       ),
  //                     ),
  //                   ],
  //                 ),
  //               ),

  //               const SizedBox(height: 25),

  //               // google + apple sign in buttons
  //               // Row(
  //               //   mainAxisAlignment: MainAxisAlignment.center,
  //               //   children: const [
  //               //     // google button
  //               //     SquareTile(imagePath: 'assets/images/google.png'),

  //               //     SizedBox(width: 25),

  //               //     // apple button
  //               //     SquareTile(imagePath: 'assets/images/apple.png')
  //               //   ],
  //               // ),

  //               const SizedBox(height: 50),

  //               // not a member? register now
  //               Row(
  //                 mainAxisAlignment: MainAxisAlignment.center,
  //                 children: [
  //                   Text(
  //                     'Already have an account?',
  //                     style: TextStyle(color: Colors.grey[700]),
  //                   ),
  //                   const SizedBox(width: 4),
  //                   GestureDetector(
  //                     onTap: widget.onTap,
  //                     child: const Text(
  //                       'Login now',
  //                       style: TextStyle(
  //                         color: Colors.blue,
  //                         fontWeight: FontWeight.bold,
  //                       ),
  //                     ),
  //                   ),
  //                 ],
  //               )
  //             ],
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }
}
