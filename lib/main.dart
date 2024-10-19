import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:foodapp/services/auth/login_or_register.dart';
import 'package:foodapp/firebase_options.dart';
import 'package:foodapp/models/restaurant.dart';
import 'package:foodapp/themes/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:foodapp/pages/login_page.dart';

void main() async{
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    MultiProvider(
      providers: [
        //theme provider
        ChangeNotifierProvider(create: (context)=>ThemeProvider()),
        //restaurant proivider
        ChangeNotifierProvider(create: (context)=>Restaurant()),
      ],
      child: const MyApp(),
      )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:const LoginOrRegister(),
      theme: Provider.of<ThemeProvider>(context).themeData,
    );
  }
}

