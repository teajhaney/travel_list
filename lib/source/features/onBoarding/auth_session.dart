// import 'package:flutter/material.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';
// import 'package:travel_list/source/features_export.dart';
// import '../../../main.dart';

// class AuthSession extends StatefulWidget {
//   const AuthSession({super.key});

//   @override
//   State<AuthSession> createState() => _AuthSessionState();
// }

// class _AuthSessionState extends State<AuthSession> {
//   User? _user;
//   @override
//   void initState() {
//     _getAuth();
//     super.initState();
//   }

//   Future<void> _getAuth() async {
//     setState(() {
//       _user = supabase.auth.currentUser;
//     });
//     supabase.auth.onAuthStateChange.listen((event) {
//       setState(() {
//         _user = event.session?.user;
//       });
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return _user == null
//         ? const OnboardingScreen()
//         : const ButtomNavigationBarScreen();
//   }
// }
