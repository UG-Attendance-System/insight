import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:insight/consts/theme.dart';
import 'package:insight/firebase_options.dart';
import 'package:insight/providers/categories_provider.dart';
import 'package:insight/providers/pitches_provider.dart';
import 'package:insight/providers/user_provider.dart';
import 'package:insight/screens/bottom_navigation.dart';
import 'package:insight/screens/inner_screens.dart/pitch_detail_screen.dart';
import 'package:insight/screens/onboarding/auth_gate.dart';
import 'package:insight/screens/inner_screens.dart/message_screen.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('user');
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CategoryProvider>(
          create: (context) => CategoryProvider(),
        ),
        ChangeNotifierProvider<User>(
          create: (context) => User(),
        ),
        ChangeNotifierProvider<PitchesProvider>(
          create: (context) => PitchesProvider(),
        ),
      ],
      child: MaterialApp(
        theme: AppTheme.appTheme(),
        home: const AuthGate(),
        routes: {
          NavigationScreen.routeName: (context) => const NavigationScreen(),
          MessageScreen.routeName: (context) => const MessageScreen(),
          PitchDetailScreen.routeName: (context) => const PitchDetailScreen(),
        },
      ),
    );
  }
}
