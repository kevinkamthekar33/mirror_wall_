import 'package:flutter/material.dart';
import 'package:mirror_wall_1/controller/web_view.dart';
import 'package:mirror_wall_1/views/screens/homePage.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ListenableProvider(
          create: (context) => Webviewcontroller(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      routes: {
        "/": (context) => const Home_Page(),
      },
    );
  }
}
