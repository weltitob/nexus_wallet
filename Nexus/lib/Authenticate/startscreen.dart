import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:nexus/Screens/home.dart';
import 'restorewallet.dart';
import 'package:nexus/Widgets/buttons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import '../../theme.dart';
import 'signup.dart';

class GetStartedScreen extends StatefulWidget {
  @override
  _GetStartedScreenState createState() => _GetStartedScreenState();
}

class _GetStartedScreenState extends State<GetStartedScreen> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        margin: EdgeInsets.only(top: 140, bottom: 40, left: 30, right: 30),
        height: MediaQuery.of(context).size.height,
        child: Column(
          // even space distribution
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              width: double.infinity,
              child: Lottie.asset(
                "assets/bitcoinanimation.json",
                //later repeat false and only start animation when app loaded
                repeat: false,
              ),
            ),
            SizedBox(
              height: 160,
            ),
            LongButtonWidgetTransparent(
              title: "Restore Wallet",
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => RestoreWalletView()));
              },
            ),
            // creating the signup button
            SizedBox(height: 20),
            LongButtonWidget(
                title: "Create Wallet",
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => HomeScreen()));
                })
          ],
        ),
      ),
    );
  }
}
