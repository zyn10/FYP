import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:petbook/providers/json_details.dart';
import 'package:petbook/providers/user_provider.dart';
import 'package:petbook/responsive/responsive_layout.dart';
import 'package:petbook/responsive/web_screen_layout.dart';
import 'package:petbook/screen/auth/login_screen.dart';
import 'package:petbook/responsive/mobile_screen_layout.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey =
      "pk_test_51N7nWLAVXUi2V7LVC1B7rwj6oz1sWkOGY1hoTv3N4wUQ3ct4b33YaZrKziwCagv2vksIjDjrC97fLIrAjPyRaft200xAIkbm0s";
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: 'AIzaSyByiI9lE0t0j6dAuYXr8hyhp1bHK92X8L8',
          appId: '1:1055007900065:web:dc33eabf6f5a86e0948be0',
          messagingSenderId: '1055007900065',
          projectId: 'petbookdb-91436',
          storageBucket: 'petbookdb-91436.appspot.com'),
    );
  } else {
    await Firebase.initializeApp();
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => UserProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => UserDetailsProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Petbook',
        theme: ThemeData(
          primarySwatch: Colors.orange,
        ),
        home: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.active) {
                if (snapshot.hasData) {
                  return const ResponsiveLayout(
                      webScreenLayout: WebScreenLayout(),
                      mobileScreenLayout: MobileScreenLayout());
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text('${snapshot.error}'),
                  );
                }
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.grey,
                  ),
                );
              }
              return const OurLogin();
            }),
      ),
    );
  }
}
