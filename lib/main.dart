import 'package:flutter/material.dart';
import 'screens/category_screen.dart';
import 'screens/details_screen.dart';
import 'screens/home_screen.dart';
import 'screens/search_filters_screen.dart';
import 'screens/sender_screen.dart';
import 'screens/status_screen.dart';
import 'screens/tags_screen.dart';
import 'screens/login_screen.dart';
import 'screens/newinbox_screen.dart';
import 'screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pal Mail',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (context) => const SplashScreen(),
        LoginScreen.id: (context) => const LoginScreen(),
        MyHomeScreen.id: (context) => MyHomeScreen(),
        DetailsScreen.id: (context) => DetailsScreen(),
        NewInboxScreen.id: (context) => NewInboxScreen(),
        TagsScreen.id: (context) => const TagsScreen(),
        CategoryScreen.id: (context) => const CategoryScreen(),
        StatusScreen.id: (context) => const StatusScreen(),
        SearchFilter.id: (context) => const SearchFilter(),
        SenderScreen.id: (context) => SenderScreen(),
      },
    );
  }
}
