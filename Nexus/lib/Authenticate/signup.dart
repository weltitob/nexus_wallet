import 'dart:ffi' as ffi;
import 'package:bdk_flutter/bdk_flutter.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:nexus/Authenticate/authentication_state.dart';
import 'package:nexus/Authenticate/restorewallet.dart';
import 'package:nexus/Widgets/buttons.dart';
import 'package:nexus/Widgets/textfields.dart';
import 'package:nexus/theme.dart';
import 'package:provider/provider.dart';
import 'dart:math';

Random random = new Random();

class SignUpView extends StatefulWidget {

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignUpView>
    with TickerProviderStateMixin {
  late Future<String> ruststring;
  late String lottiefile;

  bool _visible = false;
  List<String> lottiebackgrounds = [
    "https://assets8.lottiefiles.com/packages/lf20_flhqgevg.json", //astronaut
  ];

  @override
  void initState() {
    super.initState();
    chooseLottieFile();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void generatewallet() async {
    final response = await generateMnemonic();
    print(response);
  }

  void chooseLottieFile() async {
    int randomNumber = random.nextInt(lottiebackgrounds.length);
    lottiefile = lottiebackgrounds[randomNumber];
    await lottiefile; //that picture is already loaded can also use timedelay
    setState(() {
      _visible = !_visible;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final state = context.watch<AuthenticationState>();

    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: double.infinity,
            width: double.infinity,
            child: lottiefile == null
                ? Container()
                : FittedBox(
                    fit: BoxFit.fitHeight,
                    child: AnimatedOpacity(
                      opacity: _visible ? 1.0 : 0.0,
                      duration: Duration(milliseconds: 7000),
                      //lottieflie wird wahrscheinlich erst fertig geladen wenn animation schon angefangen
                      //hat daher geht es auf falsches lottiefile und funktioniert nicht
                      child: LottieBuilder.network(lottiefile),
                    ),
                  ),
          ),
          Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.black.withOpacity(0.80),
          ),
          ListView(
            padding: EdgeInsets.only(left: 55, right: 55, top: 160),
            physics: BouncingScrollPhysics(),
            children: [
              Center(
                child: Text(
                  "The future is yours!",
                  style: Theme.of(context).textTheme.headline1!.copyWith(color: AppTheme.white90),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Powered with decentralized IDs by",
                    style: Theme.of(context).textTheme.caption!.copyWith(color: AppTheme.white70),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 8),
                    height: 40,
                    child: Image.asset("assets/images/ion.png"),
                  ),
                ],
              ),
              SizedBox(
                height: AppTheme.cardPadding,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  FormTextField(
                    title: "Username",
                    controller: state.usernameController,
                    isObscure: false,
                  ),
                  // FormTextField(
                  //   title: "Username",
                  //   controller: state.passwordController,
                  //   isObscure: false,
                  // ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: AppTheme.cardPadding * 2),
                    child: FormTextField(
                      title: "Full name",
                      controller: state.nameController,
                      isObscure: false,
                    ),
                  ),
                  LongButtonWidget(
                    title: 'Sign up',
                    onTap: () {
                      print('Sign up pressed');
                      //generatewallet();
                      //state.registerUser(widget.code);
                    },
                    state: state.isLoading
                        ? ButtonState.loading
                        : ButtonState.idle,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 35),
                    child: Text(
                      'Already have an account?',
                      style: GoogleFonts.manrope(
                        color: AppTheme.white70,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 28),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: AppTheme.white60,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: SizedBox(
                      height: 0,
                      width: 65,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 22, bottom: 22),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RestoreWalletView()));
                      },
                      child: Text(
                        'Restore account',
                        style: GoogleFonts.manrope(
                          color: AppTheme.white70,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
