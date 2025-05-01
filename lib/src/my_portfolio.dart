import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/src/screens/home/home_page.dart';
import 'package:my_portfolio/src/theme/controller/theme_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyPortfolio extends StatelessWidget {
  final SharedPreferences sharedPreferences;
  const MyPortfolio({super.key, required this.sharedPreferences});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ThemeCubit(sharedPreferences)),
      ],
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder:
            (context, state) => MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData.light().copyWith(
                textTheme: GoogleFonts.poppinsTextTheme(),
                colorScheme: ColorScheme.fromSeed(
                  seedColor: Colors.green,
                  brightness: Brightness.light,
                ),
              ),
              darkTheme: ThemeData.dark().copyWith(
                textTheme: GoogleFonts.poppinsTextTheme(
                  ThemeData(brightness: Brightness.dark).textTheme,
                ),
                colorScheme: ColorScheme.fromSeed(
                  seedColor: Colors.green,
                  brightness: Brightness.dark,
                ),
              ),
              themeMode: state,
              home: HomePage(),
            ),
      ),
    );
  }
}
