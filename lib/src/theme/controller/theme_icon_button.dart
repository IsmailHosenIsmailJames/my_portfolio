import 'package:dartx/dartx.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_portfolio/src/theme/controller/theme_cubit.dart';

Widget themeIconButton(BuildContext context) =>
    BlocBuilder<ThemeCubit, ThemeMode>(
      builder: (context, state) {
        return TextButton.icon(
          style: IconButton.styleFrom(
            backgroundColor: Colors.grey.withValues(alpha: 0.1),
            foregroundColor: Colors.green.shade600,
          ),

          onPressed: () {
            final themeController = context.read<ThemeCubit>();
            if (state == ThemeMode.dark) {
              themeController.setTheme(ThemeMode.light);
            } else if (state == ThemeMode.light) {
              themeController.setTheme(ThemeMode.system);
            } else {
              themeController.setTheme(ThemeMode.dark);
            }
          },
          icon:
              state == ThemeMode.dark
                  ? const Icon(Icons.dark_mode)
                  : state == ThemeMode.light
                  ? const Icon(Icons.light_mode)
                  : const Icon(Icons.brightness_4),
          label: Text(
            state.name.capitalize(),
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        );
      },
    );
