import 'package:feather_icons/feather_icons.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:learning_app/constants/colors.dart';
import 'package:learning_app/widgets/app_bar.dart';
import 'package:learning_app/widgets/login/button_signout.dart';

class Account extends StatefulWidget {
  const Account({super.key});

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  final user = FirebaseAuth.instance.currentUser!;

  // sign user out method
  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: default_,
      appBar: const AppBarWidget(
        title: "Account",
        paddingController: 0,
        actions: [],
      ),
      body: SafeArea(
        child: Stack(
          children: [
            _accountHeader(),
            _actionContainers(),
          ],
        ),
      ),
    );
  }

  _accountHeader() {
    return Positioned(
      top: 28,
      left: 0,
      right: 0,
      child: Center(
        child: Column(children: const [
          SizedBox(
            height: 120,
            width: 120,
            child: CircleAvatar(
              backgroundImage: AssetImage("assets/images/angelo_profi.jpg"),
            ),
          ),
          SizedBox(height: 30),
          Text(
            'Angelo B. Silvestre',
            style: TextStyle(
              color: light_100,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 6),
          Text(
            'johnangelo.silvestre04@gmail.com',
            style: TextStyle(color: light_100, fontSize: 14),
          )
        ]),
      ),
    );
  }

  _actionContainers() {
    return Positioned(
      bottom: 0,
      child: Container(
        height: MediaQuery.of(context).size.height / 2 - 20,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          color: dark_100,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 25),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ListTile(
                  title: Text(
                    'Account Settings',
                    style:
                        TextStyle(color: light_300, fontSize: 11, height: 1.5),
                  ),
                ),
                ListTile(
                  title: const Text(
                    'Account Security',
                    style:
                        TextStyle(color: light_100, fontSize: 14, height: 0.5),
                  ),
                  trailing: const Icon(
                    FeatherIcons.chevronRight,
                    color: light_100,
                  ),
                  onTap: () {
                    print('Account Security');
                  },
                ),
                ListTile(
                  title: const Text(
                    'Email Notifications',
                    style:
                        TextStyle(color: light_100, fontSize: 14, height: 0.5),
                  ),
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    color: light_100,
                  ),
                  onTap: () {
                    print('Email Notifications');
                  },
                ),
                ListTile(
                  title: const Text(
                    'Learning Reminder',
                    style:
                        TextStyle(color: light_100, fontSize: 14, height: 0.5),
                  ),
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    color: light_100,
                  ),
                  onTap: () {
                    print('Learning Reminder');
                  },
                ),
                const SizedBox(height: 10),
                const ListTile(
                  title: Text(
                    'Support',
                    style:
                        TextStyle(color: light_300, fontSize: 11, height: 1.5),
                  ),
                ),
                ListTile(
                  title: const Text(
                    'About LMS',
                    style:
                        TextStyle(color: light_100, fontSize: 14, height: 0.5),
                  ),
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    color: light_100,
                  ),
                  onTap: () {
                    print('About LMS');
                  },
                ),
                ListTile(
                  title: const Text(
                    'Frequently asked questions',
                    style:
                        TextStyle(color: light_100, fontSize: 14, height: 0.5),
                  ),
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    color: light_100,
                  ),
                  onTap: () {
                    print('Frequently asked questions');
                  },
                ),
                ListTile(
                  title: const Text(
                    'Share LMS app',
                    style:
                        TextStyle(color: light_100, fontSize: 14, height: 0.5),
                  ),
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    color: light_100,
                  ),
                  onTap: () {
                    print('Share LMS app');
                  },
                ),
                const SizedBox(height: 15),
                LogoutButton(
                  text: 'Sign Out',
                  onTap: signUserOut,
                ),
                // Add more ListTiles for other settings options here
              ],
            ),
          ),
        ),
      ),
    );
  }
}
