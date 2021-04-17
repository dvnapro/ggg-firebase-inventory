import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:admin/screens/index.dart';

import 'package:admin/auth/index.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // runApp(
  //   MultiProvider(
  //     providers: [
  //       Provider<AuthenticationProvider>(
  //         create: (_) => AuthenticationProvider(FirebaseAuth.instance),
  //       ),
  //       StreamProvider(
  //         create: (context) => context.read<AuthenticationProvider>().authState,
  //         initialData: null,
  //       )
  //     ],
  //     child: MyApp(),
  //   ),
  // );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthenticationProvider>(
          create: (_) => AuthenticationProvider(FirebaseAuth.instance),
        ),
        StreamProvider(
          create: (context) => context.read<AuthenticationProvider>().authState,
          initialData: null,
        )
      ],
      child: MaterialApp(
        title: 'GGG Cycle Admin',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Authenticate(),
      ),
    );
  }
}

class Authenticate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Instance to know the authentication state.
    final firebaseUser = context.watch<User?>();

    // ignore: unnecessary_null_comparison
    if (firebaseUser != null) {
      //Means that the user is logged in already and hence navigate to HomePage
      return HomePage();
    }
    //The user isn't logged in and hence navigate to SignInPage.
    return LogInPage();
  }
}
