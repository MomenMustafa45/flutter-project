import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:myapp2/add_item.dart';
import 'package:myapp2/firebase_options.dart';
import 'package:myapp2/showItems.dart';
import 'package:myapp2/login_screen.dart';
import 'package:myapp2/signup_scree.dart';
import 'package:myapp2/update_item_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Show items',
      initialRoute: '/',
      routes: {
        '/': (context) => StreamBuilder<User?>(
              stream: FirebaseAuth.instance.authStateChanges(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.active) {
                  if (snapshot.hasData) {
                    return ShowItems();
                  } else {
                    return LoginScreen();
                  }
                }
                return Center(child: CircularProgressIndicator());
              },
            ),
        '/login': (context) => LoginScreen(),
        '/signup': (context) => SignUpScreen(),
        '/add': (context) => AddItemScreen(),
        '/update': (context) => UpdateItemScreen(
              itemId: ModalRoute.of(context)!.settings.arguments as String,
              name: '',
              price: 0.0,
              imgUrl: '',
              desc: '',
            ),
      },
    );
  }
}
