import 'package:flutter/material.dart';

  import 'Screen/currencey_Screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Currency Converter',
      theme: ThemeData(
      primarySwatch: Colors.blue,
          colorScheme: const ColorScheme(
            brightness: Brightness.light,
            primary: Color.fromARGB(255, 12, 155, 199),
            onPrimary: Colors.white,
            secondary: Color(0xff363636),
            onSecondary: Colors.white,
            error: Colors.red,
            onError: Colors.white,
            background: Colors.black,
            onBackground: Colors.white,
            surface: Colors.black,
            onSurface: Colors.white,)

),
debugShowCheckedModeBanner: false,
      
      home: const AllCurrencyScreen(),
    );
  }
}
