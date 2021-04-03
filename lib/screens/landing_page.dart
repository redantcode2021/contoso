import 'package:contoso/screens/home_page.dart';
import 'package:contoso/utilities/logger.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import '../constants.dart';
import 'login_page.dart';

class LandingPage extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        // If Firebase App init, snapshot has error
        if (snapshot.hasError) {
          return Scaffold(
            body: Center(
              child: Text("Error: ${snapshot.error}"),
            ),
          );
        }

        // Connection Initialized - Firebase App is running
        if (snapshot.connectionState == ConnectionState.done) {
          Log.i("Connection State is done");
          // StreamBuilder can check the login state live
          return StreamBuilder(
              stream: FirebaseAuth.instance.authStateChanges(),
              builder: (context, streamSnapshot) {
                // If Stream snapshot has error
                if (streamSnapshot.hasError) {
                  return Scaffold(
                    body: Center(
                      child: Text("Error: ${streamSnapshot.error}"),
                    ),
                  );
                }

                // Connection state active - Do the user login check inside the
                // if statement
                if (streamSnapshot.connectionState == ConnectionState.active) {
                  // Get the user
                  User _user = streamSnapshot.data;
                  Log.i("Connection State is active");
                  // If the user is null, we're not logged in
                  if (_user == null) {
                    // user not logged in, head to login
                    Log.i("Go to Login Page");
                    return LoginPage();
                  } else {
                    // The user is logged in, head to homepage
                    Log.i("Go to Home Page");
                    return HomePage();
                  }
                }
                // Checking the auth state - Loading
                //Log.i("Checking auth");
                return Scaffold(
                  body: Center(
                    child: Text(
                      "Checking Authentication...",
                      style: Constants.regularHeading,
                    ),
                  ),
                );
              });
        }
        // Connecting to Firebase - Loading
        Log.i("Firebase Loading");
        return Scaffold(
          body: Center(
            child: Text(
              "Initialization App...",
              style: Constants.regularHeading,
            ),
          ),
        );
      },
    );
  }
}
