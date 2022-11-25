import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:nexus_wallet/homescreen.dart';
import 'package:nexus_wallet/theme.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({Key? key}) : super(key: key);

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    final screens = [
      const HomeScreen(),
      //BitcoinScreen(),
    ];

    return Scaffold(
      body: screens[index],
      bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: Theme.of(context).backgroundColor,
          color: Colors.purple.shade800,
          animationDuration: const Duration(milliseconds: 300),
          onTap: (index){
          },
          items: const [
            Icon(
              Icons.currency_bitcoin,
              color: Colors.white,
            ),
            Icon(
              Icons.qr_code_rounded,
              color: Colors.white,
            ),
            Icon(
              Icons.settings,
              color: Colors.white,
            ),
          ]),
    );
  }
}
