import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'src/router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Adjutant',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: const Color(0xffbb2649),
        textTheme: GoogleFonts.ibmPlexSansTextTheme(),
      ),
      routerConfig: router,
    );
  }
}
