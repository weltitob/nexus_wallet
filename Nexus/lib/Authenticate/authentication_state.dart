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

  void registerUser() async {
    setLoading(true);

    // print(validate);
    // if (validate != null && validate == true && isLoading == false) {
    if (isLoading == true) {
      final user = User(
        walletAdress: "",
        backgroundImageUrl: "",
        bio: "Leel",
        displayName: usernameController.text,
        username: usernameController.text,
        //later dont save customToken like this
        // since it is used for logging user in later (like saving pw plain in datbase)
        customToken: "schwonz",
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