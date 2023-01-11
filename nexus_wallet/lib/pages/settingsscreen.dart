import 'package:flutter/material.dart';
import 'package:bdk_flutter/bdk_flutter.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {

  // final _externalDescriptor = "wpkh([b8b575c2/84'/1'/0'/0]tprv8icWtRzy9CWgFxpGMLSdAeE4wWyz39XGc6SwykeTo13tYm14JkVVQAf7jz8DDarCgNJrG3aEPJEqchDWeJdiaWpS3FwbLB9SzsN57V7qxB/*)";
  // final _internalDescriptor = "wpkh([b8b575c2/84'/1'/0'/1]tprv8icWtRzy9CWgFxpGMLSdAeE4wWyz39XGc6SwykeTo13tYm14JkVVQAf7jz8DDarCgNJrG3aEPJEqchDWeJdiaWpS3FwbLB9SzsN57V7qxB/*)";

  // @override void initState() async{
  //   final blockchain  = await Blockchain.create(
  //       config: BlockchainConfig.electrum(
  //           config: ElectrumConfig(
  //               stopGap: 10,
  //               timeout: 5,
  //               retry: 5,
  //               url: "ssl://electrum.blockstream.info:60002")));
  //   final wallet = await Wallet.create(
  //       databaseConfig: const DatabaseConfig.memory(),
  //       descriptor: _externalDescriptor,
  //       network: Network.Testnet
  //   );
  //   final addressInfo = await wallet.getAddress(addressIndex: AddressIndex.New);
  //   await wallet.sync(blockchain);
  //   print(addressInfo.toString());
  //   // TODO: implement initState
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Container(),
    );
  }
}
