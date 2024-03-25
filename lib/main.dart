import 'package:flutter/material.dart';
import '/common/common_export.dart';
import './router/router.dart';

import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://chpobhtorvywobukvkmb.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImNocG9iaHRvcnZ5d29idWt2a21iIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTEyMDA0NDksImV4cCI6MjAyNjc3NjQ0OX0.3bLpFoNQkVCs5p7c_2Z0H4tZwQJhcf3eva7_CTvVIX4',
  );
  runApp(const MyApp());
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
