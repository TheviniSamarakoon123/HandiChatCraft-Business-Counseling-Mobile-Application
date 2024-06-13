import 'package:flutter/material.dart';
import 'package:handichatcraft_w1986581/hansala/widget/bottom_nav_bar.dart';

import 'package:provider/provider.dart';

import 'provider.dart';

class ThemeChangePage extends StatelessWidget {
  const ThemeChangePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Theme change"),
        ),
        bottomNavigationBar: BottomNavBar(
        callback: (p0) {},
        index: 4,
      ),
        body: Consumer<UiProvider>(
            builder: (context, UiProvider notifier, child) {
          return Column(
            children: [
              ListTile(
                leading: const Icon(Icons.dark_mode),
                title: const Text("Dark Mode"),
                trailing: Switch(
                  value: notifier.isDark,
                  onChanged: (value) => notifier.changeTheme(),
                ),
              )
            ],
          );
        }));
  }
}
