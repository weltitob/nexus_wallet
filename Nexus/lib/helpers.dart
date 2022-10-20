import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:nexus/components/user_repository.dart';
import 'package:timeago/timeago.dart';
import 'package:get_it/get_it.dart';
import '../components/user_repository.dart';


//helpers for the routing?
const String authPath = '/auth';
const String welcomePath = '/welcome';
const String overviewPath = '/overview';

void errorPrint(dynamic value) {
  debugPrint(value.toString());
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}

var textCopiedSnackBar = SnackBar(
  backgroundColor: Colors.transparent,
  content: Container(
    margin: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
    decoration: BoxDecoration(
      color: Colors.grey[800],
      borderRadius: BorderRadius.circular(20.0)
    ),
    child: Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 8, left: 20, right: 20),
      child: Text(
        "Text copied to clipboard!",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w400,
          color: Colors.white.withOpacity(0.8)
        ),
      ),
    ),
  )
);

final datetime = DateTime.now();

Timestamp timestamp = Timestamp.fromDate(datetime); //To TimeStamp
UserRepository userRepo = locate<UserRepository>();

abstract class Helpers {

  static final random = Random();

  static String randomPictureUrl() {
    final randomInt = random.nextInt(1000);
    return 'https://picsum.photos/seed/$randomInt/300/300';
  }

  static String getRandomString(int length) {
    const characters =
        'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    return String.fromCharCodes(Iterable.generate(
        length, (_) => characters.codeUnitAt(random.nextInt(characters.length))));
    //if already exists dont know if would actually be an problem
    //
    //new generated codes need to be added to pesons own profile and als with used and unused
    //also needs to get added in sperate stroagepoint where there simply are all codes and info if theyre already used
  }

  static DateTime randomDate() {
    final random = Random();
    final currentDate = DateTime.now();
    return currentDate.subtract(Duration(seconds: random.nextInt(200000)));
  }

  static String formatTime(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours  = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes);
    final seconds = twoDigits(duration.inSeconds);

    return [
      if(duration.inHours > 0) hours,
      minutes,
      seconds,
      ].join(':');
  }
}

//for Scrolls removing the glow effect
class MyBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}

class GetItService {
  static final getIt = GetIt.instance;
  static initializeService() {
    getIt.registerSingleton<UserRepository>(UserRepository());
  }
}

T locate<T extends Object>() {
  return GetItService.getIt<T>();
}
