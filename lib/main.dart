import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:collection_of_recipes_flutter_app/views/screens/home_page.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(useMaterial3: true),
      darkTheme: ThemeData.dark(useMaterial3: true),
      themeMode: ThemeMode.system,
      routes: {
        '/': (context) => HomePage(),
      },
    ),
  );
}

