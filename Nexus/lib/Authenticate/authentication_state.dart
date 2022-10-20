import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter/material.dart';
import 'package:nexus/components/base_state.dart';
import 'package:nexus/components/user_repository.dart';
import '../helpers.dart';


class AuthenticationState extends BaseState {
  final userRepo = locate<UserRepository>();
  final formKey = GlobalKey<FormState>();
  final navigationService = NavigationService.intance;

  BuildContext get context => navigationService.navigatorKey.currentContext!;
  User? currentUser;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isLoadingGoogle = false;

  AuthenticationState() {
    if (currentUser == null) {
      _userNotifier();
    }
    userRepo.currentUserNotifier.addListener(_userNotifier);
  }

  @override
  void dispose() {
    userRepo.currentUserNotifier.removeListener(_userNotifier);
    super.dispose();
  }

  Future<AuthION> authION() async {
    HttpsCallable callable = FirebaseFunctions.instance.httpsCallable('authION');
    final resp = await callable.call(<String, dynamic>{
      //later pass entire user relevant info then create ION account
      // and get entire user as mydata back who is then registered
      'username': usernameController.text,
    });
    final mydata = AuthION.fromJson(resp.data);
    return mydata;
  }

  void registerUser() async {
    setLoading(true);

    //check and validate data the user put in
    //final validate = formKey.currentState?.validate();
    final iondata = await authION();

    // print(validate);
    // if (validate != null && validate == true && isLoading == false) {
    if (isLoading == true) {
      final user = User(
        did: iondata.did,
        walletAdress: "",
        backgroundImageUrl: "",
        bio: "Leel",
        displayName: usernameController.text,
        username: usernameController.text,
        //later dont save customToken like this
        // since it is used for logging user in later (like saving pw plain in datbase)
        customToken: iondata.customToken,
        profileImageUrl: "",
        // codes: codes,
        createdAt: timestamp,
        updatedAt: timestamp,
        isActive: true,
        showFollowers: true,
        isPrivate: true,
        dob: 0,
      );
      final register = await userRepo.registerUser(user,);
      setLoading(false);

      if (register.isRight) {
        errorPrint("Successfully registered a user");
        navigatorToHome();
      } else {
        errorPrint("${register.left} error");
      }
    }
    else {
      errorPrint("Validation failed");
    }
  }

  void loginUser() async {
    final validate = formKey.currentState?.validate();

    if (validate != null && validate == true && isLoading == false) {
      setLoading(true);

      final register = await userRepo.login(usernameController.text.trim(), passwordController.text.trim());
      setLoading(false);

      if (register.isRight) {
        errorPrint("Successfully login a user");
        navigatorToHome();
      } else {
        errorPrint("${register.left} error");
      }
    }
  }

  void navigatorToHome() {
    Navigator.of(context).pushNamedAndRemoveUntil(
      overviewPath, (route) => true,
    );
  }

  void _userNotifier() {
    currentUser = userRepo.currentUserNotifier.value;
    notifyListeners();
  }
}