import 'package:flutter/material.dart';
import '/common/common_export.dart';
import './router/router.dart';


import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://ujncwkjcxnawbyuwwrvv.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InVqbmN3a2pjeG5hd2J5dXd3cnZ2Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTY1NjU2NzcsImV4cCI6MjAzMjE0MTY3N30.UHU96duIaYOFMiJ9I3BIHzaHuQbyTKDwA8QRX3_I3V0',
  );
  runApp(const MyApp());
}

final supabase = Supabase.instance.client;

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    
    super.initState();
  }
 
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
