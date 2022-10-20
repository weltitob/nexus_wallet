import 'dart:math';
import 'package:flutter/material.dart';
import 'package:nexus/Authenticate/restorewallet.dart';
import 'package:nexus/Authenticate/signup.dart';
import 'package:nexus/Authenticate/startscreen.dart';
import 'package:provider/provider.dart';

import 'authentication_state.dart';

enum AuthenticationViewState { signIn, signUp, comeBack }

class AuthenticationView extends StatelessWidget {
  final AuthenticationViewState viewState;

  const AuthenticationView({Key? key, required this.viewState}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: context.read<AuthenticationState>().formKey,
            child: Builder(builder: (context) {
              if (viewState == AuthenticationViewState.signUp) {
                return SignUpView();
              }
              if (viewState == AuthenticationViewState.signIn) {
                return RestoreWalletView();
              } else {
                return GetStartedScreen();
              }
            }),
      ),
    );
  }
}