import 'package:bitnet_wallet/theme.dart';
import 'package:flutter/material.dart';

class WalletScreen extends StatefulWidget {

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  @override
  Widget build(BuildContext context) {
    return buildWallet(context);
  }
  Widget buildWallet(BuildContext context) {
    const String total = '=39876.589 SAT';
    const String totalCrypto = '7.251332 BTC';

    return Padding(
      padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 20.0),
      child: Container(
        width: MediaQuery.of(context).size.width - 50,
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
            color: lighten(Theme.of(context).scaffoldBackgroundColor, 10),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                offset: const Offset(0, 2.5),
                blurRadius: 10,
              ),
            ],
            borderRadius: const BorderRadius.all(Radius.circular(18.0))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(Icons.account_balance_wallet_rounded,
                  color: Theme.of(context).primaryColorDark,),
                const SizedBox(width: 10),
                Expanded(
                  child: Text('Total Wallet Balance',
                    style: Theme.of(context).textTheme.subtitle1,),
                ),
                Icon(Icons.qr_code_rounded,
                  color: Theme.of(context).primaryColorDark,)],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      '$totalCrypto',
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Text(
                        '$total',
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            MyDivider(),
            buildLightningText(Icons.lock_rounded, 'Main Wallet', 2828382392),
            buildLightningText(Icons.flash_on_rounded, 'Lightning Wallet', 2828382392),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  buildWalletButtons(Icons.upload_rounded, 'SELL'),
                  buildWalletButtons(Icons.flash_on_rounded, 'SEND'),
                  buildWalletButtons(Icons.get_app_rounded, 'BUY'),

                ],
              ),
            ),
            const SizedBox(height: 10.0),
            Center(
              child: Icon(Icons.keyboard_arrow_down_rounded,
                  size: 30, color: Theme.of(context).primaryColorDark),
            )
          ],
        ),
      ),

    );
  }

  Widget buildWalletButtons(IconData iconData, String text) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
        width: 80,
        height: 35,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              offset: const Offset(0, 2.5),
              blurRadius: 10,
            ),
          ],
        ),
        child: Material(
            color: Theme.of(context).primaryColorLight,
            borderRadius: BorderRadius.circular(50.0),
            child: InkWell(
                borderRadius:
                BorderRadius.circular(50.0),
                child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(iconData,
                          color: Theme.of(context).primaryColorDark,
                          size: 20,),
                        const Padding(padding: EdgeInsets.symmetric(horizontal: 2.5)),
                        Text(
                            text,
                            style: Theme.of(context).textTheme.subtitle2
                        ),
                      ],
                    )),
                onTap: () {} )));
  }

  Widget buildLightningText(IconData iconData, String text, double balance){
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ClipOval(
                child: Material(
                  color: Colors.blueAccent,
                  child: InkWell(
                    splashColor: Colors.lightBlueAccent, // inkwell color
                    child: SizedBox(
                        width: 30.0,
                        height: 30.0,
                        child: Icon(
                          iconData,
                          color: Colors.white,
                          size: 20.0,
                        )),
                    onTap: () {},
                  ),
                ),
              ),
              const Padding(padding: const EdgeInsets.symmetric(horizontal: 5.0)),
              Text(
                text,
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '$balance SATS',
                style: Theme.of(context).textTheme.subtitle1,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class MyDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Divider(
      height: 20,
      color: Colors.grey,
    );
  }
}
