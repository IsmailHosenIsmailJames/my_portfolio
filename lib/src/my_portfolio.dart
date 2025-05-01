import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/src/screens/home/cubit/hover_on_card_cubit.dart';
import 'package:my_portfolio/src/screens/home/home_page.dart';
import 'package:my_portfolio/src/theme/colors/app_colors.dart';
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
        BlocProvider(create: (context) => HoverOnProjectCardCubit()),
      ],
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder:
            (context, state) => MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData.light().copyWith(
                textTheme: GoogleFonts.poppinsTextTheme(),
                colorScheme: ColorScheme.fromSeed(
                  seedColor: AppColors.primary,
                  brightness: Brightness.light,
                ),
                iconButtonTheme: IconButtonThemeData(
                  style: IconButton.styleFrom(
                    foregroundColor: AppColors.primary,
                    backgroundColor: Colors.grey.shade200,
                  ),
                ),
              ),
              darkTheme: ThemeData.dark().copyWith(
                textTheme: GoogleFonts.poppinsTextTheme(
                  ThemeData(brightness: Brightness.dark).textTheme,
                ),
                colorScheme: ColorScheme.fromSeed(
                  seedColor: AppColors.primary,
                  brightness: Brightness.dark,
                ),
                iconButtonTheme: IconButtonThemeData(
                  style: IconButton.styleFrom(
                    foregroundColor: AppColors.primary,
                    backgroundColor: Colors.grey.shade900,
                  ),
                ),
              ),
              themeMode: state,
              home: HomePage(),
            ),
      ),
    );
  }
}
