import 'package:firebase_auth/firebase_auth.dart';

class GoogleUser {
  // fetch user's name, email, and profile image
  final String name;
  final String email;
  final String? imageUrl;

  GoogleUser({
    required this.name,
    required this.email,
    this.imageUrl,
  });

  factory GoogleUser.fromFirebaseUser(User user) {
    return GoogleUser(
      name: user.displayName ?? '',
      email: user.email ?? '',
      imageUrl: user.photoURL,
    );
  }
}
