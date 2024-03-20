import 'package:flutter/material.dart';
import '/common/common_export.dart';
import './router/router.dart';

import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  runApp(const MyApp());
  await Supabase.initialize(
    url: 'https://rtorfvuzocvotxbxwmsu.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJ0b3JmdnV6b2N2b3R4Ynh3bXN1Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTA5MzYzMzgsImV4cCI6MjAyNjUxMjMzOH0.0qnU4zNrhszkLmhgfBiXHKmuEUSHtJpi321vhd1zOMo',
  );
}

final supabase = Supabase.instance.client;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      themeMode: ThemeMode.system,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      routeInformationParser: router.routeInformationParser,
      routeInformationProvider: router.routeInformationProvider,
      routerDelegate: router.routerDelegate,
    );
  }
}
