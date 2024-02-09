import 'package:flutter/material.dart';
import 'package:roottest/presentation/account.dart';
import 'package:roottest/presentation/explore.dart';
import 'package:roottest/presentation/meet_up.dart';
import 'package:roottest/presentation/prolet.dart';
import 'package:roottest/presentation/promilohome.dart';
import 'package:roottest/presentation/widgets/bottom_navigation.dart';

class Home extends StatelessWidget {
  Home({super.key});
  final pages = [PromiloHome(), Prolet(), MeetUp(), Explore(), Acccount()];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: ValueListenableBuilder(
            valueListenable: navigationNotifier,
            builder: (context, value, _) {
              return SafeArea(
                child: pages[value],
              );
            },
          ),
          bottomNavigationBar: BottomNavigation()),
    );
  }
}
