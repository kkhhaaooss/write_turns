import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:write_turns/providers/current_screen_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppScreen extends ConsumerWidget {
  const AppScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Widget currentScreen = ref.watch(currentScreenProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text('Write Turns'),
        centerTitle: true,
        backgroundColor: FlexColor.brandBlueDarkPrimaryContainer,
        toolbarHeight: 40,
      ),
      body: SafeArea(
        child: currentScreen,
      ),
      drawer: Padding(
        padding: const EdgeInsets.only(
          top: 40.0,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          verticalDirection: VerticalDirection.down,
          children: [
            Text('Documents'),
            Text('Settings'),
            Text('About'),
          ],
        ),
      ),
    );
  }
}
