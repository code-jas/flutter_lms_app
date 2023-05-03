//! Login widget

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
  //                 'Welcome back you\'ve been missed!',
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

  //               // forgot password?
  //               Padding(
  //                 padding: const EdgeInsets.symmetric(horizontal: 25.0),
  //                 child: Row(
  //                   mainAxisAlignment: MainAxisAlignment.end,
  //                   children: [
  //                     Text(
  //                       'Forgot Password?',
  //                       style: TextStyle(color: Colors.grey[600]),
  //                     ),
  //                   ],
  //                 ),
  //               ),

  //               const SizedBox(height: 15),

  //               // sign in button
  //               LoginButton(
  //                 text: 'Sign In',
  //                 onTap: signUserIn,
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
  //               Row(
  //                 mainAxisAlignment: MainAxisAlignment.center,
  //                 children: [
  //                   // google button
  //                   SquareTile(
  //                       onTap: () => AuthService().signInWithGoogle(),
  //                       imagePath: 'assets/images/google.png'),

  //                   const SizedBox(width: 25),

  //                   // apple button
  //                   SquareTile(
  //                       onTap: () => {}, imagePath: 'assets/images/apple.png')
  //                 ],
  //               ),

  //               const SizedBox(height: 50),

  //               // not a member? register now
  //               Row(
  //                 mainAxisAlignment: MainAxisAlignment.center,
  //                 children: [
  //                   Text(
  //                     'Not a member?',
  //                     style: TextStyle(color: Colors.grey[700]),
  //                   ),
  //                   const SizedBox(width: 4),
  //                   GestureDetector(
  //                     onTap: widget.onTap,
  //                     child: const Text(
  //                       'Register now',
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



//! Dissplay user Logged in
  //  Scaffold(
//       backgroundColor: dark_100,
//       appBar: AppBar(
//         backgroundColor: default_,
//         actions: [
//           IconButton(
//             onPressed: signUserOut,
//             icon: const Icon(Icons.logout),
//           )
//         ],
//       ),
//       body: Center(
//         child: Text(
//           "LOGGED IN AS: ${user.email!}",
//           style: const TextStyle(fontSize: 20, color: light_100),
//         ),
//       ),
//     )