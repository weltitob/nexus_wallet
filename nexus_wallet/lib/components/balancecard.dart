import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:nexus_wallet/theme.dart';

class BalanceCardBtc extends StatelessWidget {
  const BalanceCardBtc({Key? key}) : super(key: key);

  Widget balanceText(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppTheme.cardPadding * 1.5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Balance',
            style: Theme.of(context).textTheme.subtitle1,
          ),
          const SizedBox(height: 2),
          Text(
            "2.150 BTC",
            // NumberFormat.simpleCurrency().format(MockBalance.data.last),
            style: Theme.of(context).textTheme.headline3),
          const Spacer(),
          Text(
            'Wallet adress',
            style: Theme.of(context).textTheme.caption,
          ),
          Row(
            children: [
              Icon(Icons.copy_rounded, color: AppTheme.white80, size: 18,),
              const SizedBox(width: 4,),
              Text(
                '3FZbgi29cpjq2...',
                style: Theme.of(context).textTheme.subtitle2,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget currencyPicture(BuildContext context) {
    return Positioned(
      right: AppTheme.cardPadding * 1.5,
      top: AppTheme.cardPadding * 1.5,
      child: Container(
        height: AppTheme.cardPadding * 2,
        width: AppTheme.cardPadding * 2,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Theme.of(context).backgroundColor.withOpacity(0.25),
        ),
        child: CachedNetworkImage(
          imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/46/Bitcoin.svg/1200px-Bitcoin.svg.png',
        ),
      ),
    );
  }

  Widget profitPercent(BuildContext context) {
    return Positioned(
      right: 28,
      bottom: 28,
      child: Container(
        padding: const EdgeInsets.fromLTRB(6, 6, 8, 6),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Theme.of(context).backgroundColor.withOpacity(0.25),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const Icon(
              FontAwesomeIcons.caretUp,
              size: 16,
            ),
            const SizedBox(width: 4),
            Text('+5.2%', style: Theme.of(context).textTheme.bodyText2,),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppTheme.cardPadding),
      child: SizedBox(
        height: 200,
        child: Stack(
          children: [
            const BalanceBackground(),
            balanceText(context),
            profitPercent(context),
            currencyPicture(context)
          ],
        ),
      ),
    );
  }
}

class BalanceCardEur extends StatelessWidget {
  const BalanceCardEur({Key? key}) : super(key: key);

  Widget balanceText(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(28),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Welcome to your',
            style: Theme.of(context).textTheme.subtitle1!.copyWith(
            fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 2),
          Text(
            "NexusWallet",
            // NumberFormat.simpleCurrency().format(MockBalance.data.last),
            style: Theme.of(context).textTheme.headline2!.copyWith(
                fontWeight: FontWeight.bold),
          ),
          const Spacer(),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Theme.of(context).backgroundColor.withOpacity(0.25),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppTheme.elementSpacing,
                  vertical: AppTheme.elementSpacing / 2),
              child: Text(
                "Simple & Secure",
                // NumberFormat.simpleCurrency().format(MockBalance.data.last),
                style: Theme.of(context).textTheme.bodyText2,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildLottieAnimation(BuildContext context) {
    return Positioned(
      right: -AppTheme.elementSpacing,
      bottom: -AppTheme.elementSpacing,
      child: SizedBox(
        height: AppTheme.cardPadding * 8,
        width: AppTheme.cardPadding * 8,
        child: LottieBuilder.asset(
          "assets/lottiefiles/rocket.json",
          repeat: true,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppTheme.cardPadding),
      child: SizedBox(
        height: 200,
        child: Stack(
          children: [
            const BalanceBackground2(),
            buildLottieAnimation(context),
            balanceText(context),
          ],
        ),
      ),
    );
  }
}

class BalanceBackground2 extends StatelessWidget {
  const BalanceBackground2({Key? key}) : super(key: key);

  Widget circleTopRight() {
    return Positioned(
      right: 100,
      top: -80,
      child: Container(
        width: 265,
        height: 265,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            begin: Alignment(-0.8, -0.7),
            end: Alignment.bottomCenter,
            colors: [
              Color(0x26FFFFFF),
              Color(0x00FFFFFF),
            ],
          ),
        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(34),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: [0, 0.25, 0.75, 1],
          colors: [
            Color(0x99FFFFFF),
            Color(0x00FFFFFF),
            Color(0x00FFFFFF),
            Color(0x99FFFFFF),
          ],
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(34),
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              colors: [
                Color(0xFF522F77),
                Color(0xFF7127B7),
              ],
            ),
          ),
          child: Stack(
            children: [
              circleTopRight(),
            ],
          ),
        ),
      ),
    );
  }
}

class BalanceBackground extends StatelessWidget {
  const BalanceBackground({Key? key}) : super(key: key);

  Widget circleTopRight() {
    return Positioned(
      right: -100,
      top: -80,
      child: Container(
        width: 265,
        height: 265,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            begin: Alignment(-0.8, -0.7),
            end: Alignment.bottomCenter,
            colors: [
              Color(0x26FFFFFF),
              Color(0x00FFFFFF),
            ],
          ),
        ),
      ),
    );
  }

  Widget circleBottomLeft() {
    return Positioned(
      left: -20,
      bottom: -140,
      child: Container(
        width: 280,
        height: 280,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment(0.9, -0.2),
            colors: [
              Color(0x00FFFFFF),
              Color(0x4DFFFFFF),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(34),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: [0, 0.25, 0.75, 1],
          colors: [
            Color(0x99FFFFFF),
            Color(0x00FFFFFF),
            Color(0x00FFFFFF),
            Color(0x99FFFFFF),
          ],
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(34),
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              colors: [
                Color(0xFF522F77),
                Color(0xFF7127B7),
              ],
            ),
          ),
          child: Stack(
            children: [
              circleTopRight(),
              circleBottomLeft(),
            ],
          ),
        ),
      ),
    );
  }
}

class BackgroundGradientPurple2 extends StatelessWidget {
  const BackgroundGradientPurple2({Key? key}) : super(key: key);

  Widget circleBottomLeft() {
    return Positioned(
      left: -40,
      bottom: 0,
      child: Container(
        width: 100,
        height: 100,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment(0.9, -0.2),
            colors: [
              Color(0x00FFFFFF),
              Color(0x4DFFFFFF),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        borderRadius: AppTheme.cardRadiusBig,
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: [0, 0.25, 0.75, 1],
          colors: [
            Color(0x99FFFFFF),
            Color(0x00FFFFFF),
            Color(0x00FFFFFF),
            Color(0x99FFFFFF),
          ],
        ),
      ),
      child: ClipRRect(
        borderRadius: AppTheme.cardRadiusBig,
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              colors: [
                Color(0xFF522F77),
                Color(0xFF7127B7),
              ],
            ),
          ),
          child: Stack(
            children: [
              circleBottomLeft(),
            ],
          ),
        ),
      ),
    );
  }
}

class BackgroundGradientOrange extends StatelessWidget {
  const BackgroundGradientOrange({Key? key}) : super(key: key);

  Widget circleBottomLeft() {
    return Positioned(
      left: -40,
      bottom: 0,
      child: Container(
        width: 100,
        height: 100,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment(0.9, -0.2),
            colors: [
              Color(0x00FFFFFF),
              Color(0x4DFFFFFF),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        borderRadius: AppTheme.cardRadiusBig,
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: [0, 0.25, 0.75, 1],
          colors: [
            Color(0x99FFFFFF),
            Color(0x00FFFFFF),
            Color(0x00FFFFFF),
            Color(0x99FFFFFF),
          ],
        ),
      ),
      child: ClipRRect(
        borderRadius: AppTheme.cardRadiusBig,
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              colors: [
                AppTheme.colorBitcoin,
                AppTheme.colorPrimaryGradient,
              ],
            ),
          ),
          child: Stack(
            children: [
              circleBottomLeft(),
            ],
          ),
        ),
      ),
    );
  }
}

class BackgroundGradientPurple extends StatelessWidget {
  const BackgroundGradientPurple({Key? key}) : super(key: key);

  Widget circleBottomLeft() {
    return Positioned(
      right: -40,
      top: -20,
      child: Container(
        width: 100,
        height: 100,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment(0.9, -0.2),
            colors: [
              Color(0x00FFFFFF),
              Color(0x4DFFFFFF),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        borderRadius: AppTheme.cardRadiusBig,
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: [0, 0.25, 0.75, 1],
          colors: [
            Color(0x99FFFFFF),
            Color(0x00FFFFFF),
            Color(0x00FFFFFF),
            Color(0x99FFFFFF),
          ],
        ),
      ),
      child: ClipRRect(
        borderRadius: AppTheme.cardRadiusBig,
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              colors: [
                Color(0xFF522F77),
                Color(0xFF7127B7),
              ],
            ),
          ),
          child: Stack(
            children: [
              circleBottomLeft(),
            ],
          ),
        ),
      ),
    );
  }
}