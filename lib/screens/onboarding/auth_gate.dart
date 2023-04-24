import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart' as auth;
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:insight/consts/values.dart';
import 'package:insight/screens/bottom_navigation.dart';
import 'package:insight/screens/onboarding/get_started_screen.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        return StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            // User is not signed in
            if (!snapshot.hasData) {
              return auth.SignInScreen(
                providers: [
                  auth.EmailAuthProvider(),
                ],
                footerBuilder: (context, _) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: GestureDetector(
                      onTap: () {
                        // Hive.box('user').put(hasSignUp, false);
                      },
                      child: const Text(
                        'By signing in, you agree to our terms and conditions.',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                  );
                },
              );
            }

            // Render your application if authenticated
            if (Hive.box('user').get(hasSignUp, defaultValue: false)) {
              return const NavigationScreen();
            }
            return const GetStartedScreen();
          },
        );
      },
    );
  }
}
