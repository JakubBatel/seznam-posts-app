import 'package:flutter/material.dart';
import 'package:post_app/routes.dart';

class AppRoot extends StatelessWidget {
  const AppRoot({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Posts App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            elevation: const WidgetStatePropertyAll(0),
            backgroundColor: WidgetStateProperty.resolveWith(
              (states) {
                if (states.contains(WidgetState.disabled)) {
                  return Colors.deepPurple.shade200;
                }
                return Colors.deepPurple.shade400;
              },
            ),
            foregroundColor: WidgetStateProperty.resolveWith(
              (states) {
                if (states.contains(WidgetState.disabled)) {
                  return Colors.grey;
                }
                return Colors.white;
              },
            ),
          ),
        ),
        useMaterial3: true,
      ),
      routerConfig: router,
    );
  }
}
