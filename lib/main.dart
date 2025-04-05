import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/providers/articles_provider.dart';
import 'package:untitled/providers/login_provider.dart';
import 'package:untitled/providers/signup_provider.dart';
import 'package:untitled/screens/LoginScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=> LoginProvider()),
        ChangeNotifierProvider(create: (_)=> SignUpProvider()),
        ChangeNotifierProvider(create: (_)=> ArticlesProvider()),
      ],
      child: MaterialApp(
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  LoginScreen(),
    ), );
  }
}

