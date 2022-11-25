import 'package:flutter/material.dart';
import 'package:nexus_wallet/theme.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Currency {
  final String code;
  final String name;
  final Image icon;
  final double currentAmount;
  final double profit;
  final List<double> priceHistory;
  final List<Trade> tradeHistory;

  Currency({
    required this.code,
    required this.name,
    required this.icon,
    required this.priceHistory,
    this.currentAmount = 0.0,
    this.profit = 0.0,
    this.tradeHistory = const [],
  });

  String get usdAmountString =>
      NumberFormat.simpleCurrency().format(currentAmount * priceHistory.last);

  String _toPercent(double value) =>
      NumberFormat('+#.##%; -#.##%').format(value);

  String get profitString => _toPercent(profit);

  String get currentPriceString =>
      NumberFormat.simpleCurrency().format(priceHistory.last);

  double get priceChange =>
      (priceHistory.last - priceHistory.first) / priceHistory.first;

  String get priceChangeString => _toPercent(priceChange);
}


enum TradeDirection {
  buy,
  sell,
}

class Trade {
  final TradeDirection tradeDirection;
  final String date;
  final double amount;

  Trade({
    required this.tradeDirection,
    required this.date,
    required this.amount,
  });

  String get dateFormatted =>
      DateFormat('dd MMMM yyyy').format(DateFormat('yyyy-MM-dd').parse(date));

  String get amountString {
    final amountSign = tradeDirection == TradeDirection.buy ? '+' : '-';

    return '$amountSign${NumberFormat('#,###.####').format(amount)}';
  }
}

class MockFavorites {
  static final data = [
    Currency(
      code: 'XRP',
      name: 'Ripple',
      icon: Image.asset('assets/images/xrp_icon.png'),
      priceHistory: [
        0.36995,
        0.37004,
        0.36675,
        0.36704,
        0.36527,
        0.36666,
        0.36921,
        0.36965,
        0.37171,
        0.37045,
        0.36949,
        0.37177,
        0.37435,
        0.39880,
        0.39704,
        0.40104,
        0.40498,
        0.40342,
        0.40015,
        0.39306,
        0.39383,
        0.39132,
        0.38928,
        0.38770,
      ],
      tradeHistory: [
        Trade(
          tradeDirection: TradeDirection.sell,
          date: '2022-06-03',
          amount: 450,
        ),
        Trade(
          tradeDirection: TradeDirection.sell,
          date: '2022-05-24',
          amount: 250,
        ),
        Trade(
          tradeDirection: TradeDirection.buy,
          date: '2022-03-12',
          amount: 700,
        ),
      ],
    ),
    Currency(
      code: 'LTC',
      name: 'Litecoin',
      icon: Image.asset('assets/images/ltc_icon.png'),
      priceHistory: [
        61.65,
        61.40,
        61.26,
        61.23,
        60.99,
        61.25,
        61.34,
        61.54,
        62.14,
        62.12,
        61.87,
        62.15,
        62.26,
        62.76,
        62.67,
        63.30,
        63.19,
        63.70,
        63.51,
        61.86,
        61.82,
        61.65,
        60.87,
        60.41,
      ],
    ),
    Currency(
      code: 'ADA',
      name: 'Cardano',
      icon: Image.asset('assets/images/ada_icon.png'),
      priceHistory: [
        0.52543,
        0.51538,
        0.51715,
        0.52900,
        0.53250,
        0.53423,
        0.52864,
        0.52598,
        0.52986,
        0.53392,
        0.54404,
        0.52392,
        0.51803,
        0.52535,
        0.53479,
        0.53129,
        0.52307,
        0.51462,
        0.52479,
        0.52220,
        0.52730,
        0.52730,
        0.53318,
        0.53318,
      ],
      tradeHistory: [
        Trade(
          tradeDirection: TradeDirection.sell,
          date: '2022-05-22',
          amount: 850,
        ),
        Trade(
          tradeDirection: TradeDirection.buy,
          date: '2022-04-19',
          amount: 350,
        ),
        Trade(
          tradeDirection: TradeDirection.buy,
          date: '2022-04-14',
          amount: 500,
        ),
      ],
    ),
  ];
}

class FavoritesItem extends StatelessWidget {
  final Currency currency;
  final BuildContext context;

  const FavoritesItem({
    Key? key,
    required this.currency,
    required this.context,
  }) : super(key: key);

  Widget title() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          currency.code,
          style: const TextStyle(fontSize: 20),
        ),
        Text(
          currency.name,
          style: Theme.of(context).textTheme.subtitle2,
        ),
      ],
    );
  }

  Widget price() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          currency.currentPriceString,
          style: const TextStyle(fontSize: 16),
        ),
        const SizedBox(height: 4),
        Row(
          children: [
            Icon(
              currency.priceChange >= 0
                  ? FontAwesomeIcons.caretUp
                  : FontAwesomeIcons.caretDown,
              size: 16,
              color: AppTheme.errorColor,
            ),
            const SizedBox(width: 2),
            Text(
              currency.priceChangeString,
              style: const TextStyle(
                color: AppTheme.successColor,
              ),
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        height: 74,
        color: lighten(Theme.of(context).backgroundColor, 10),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(AppTheme.elementSpacing),
              child: Row(
                children: [
                  const Icon(Icons.currency_bitcoin),
                  //CustomIcon(icon: currency.icon),
                  const SizedBox(width: 16),
                  title(),
                  const Spacer(),
                  price(),
                ],
              ),
            ),
            Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () =>
                    print("HAHAHAHA"),
                  //   Navigator.of(context).push(
                  // MaterialPageRoute(
                  //   builder: (_) => CurrencyDetailsScreen(currency: currency),
                  // ),
                ),
            )
          ],
        ),
      ),
    );
  }
}