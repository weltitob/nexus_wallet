import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nexus/theme.dart';

class FormTextField extends StatelessWidget {
  final String title;
  final bool isObscure;
  final TextEditingController? controller;
  const FormTextField({
    Key? key,
    required this.title,
    required this.isObscure,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15),
      child: TextField(
        controller: controller,
        textAlign: TextAlign.center,
        style: GoogleFonts.manrope(
          fontWeight: FontWeight.w400,
          fontSize: 14,
        ),
        obscureText: isObscure,
        decoration: InputDecoration(
          hintText: title,
          fillColor: AppTheme.white60,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }
}


class FormTextFieldBIP extends StatefulWidget {
  final String title;
  final TextEditingController controller;
  final List<String> bipwords;

  const FormTextFieldBIP({
    Key? key,
    required this.title,
    required this.controller,
    required this.bipwords,
  }) : super(key: key);

  @override
  State<FormTextFieldBIP> createState() => _FormTextFieldBIPState();
}

class _FormTextFieldBIPState extends State<FormTextFieldBIP> {
  bool isInsideList = false;

  void initState(){
    super.initState();
    widget.controller.addListener(_isinsideList);
  }


  void _isinsideList() {
    isInsideList = widget.bipwords.any((bipword) => (bipword == widget.controller.text));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15),
      child: TextField(
        controller: widget.controller,
        textAlign: TextAlign.center,
        style: GoogleFonts.manrope(
          color: (isInsideList) ? Colors.white : Colors.redAccent,
          fontWeight: FontWeight.w400,
          fontSize: 14,
        ),
        decoration: InputDecoration(
          hintText: widget.title,
          fillColor: AppTheme.white60,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }
}


class TextFieldButton extends StatelessWidget {
  final IconData iconData;
  final Function() onTap;

  const TextFieldButton({Key? key, required this.iconData, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: AppTheme.cardRadiusBig,
        ),
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Icon(
            iconData,
            color: Theme.of(context).colorScheme.onSecondary,
          ),
        ),
      ),
    );
  }
}

class TextFieldButtonMorph extends StatelessWidget {
  final IconData iconData;
  final Function() onTap;

  const TextFieldButtonMorph({
    Key? key,
    required this.iconData,
    required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: AppTheme.glassMorphColor,
          borderRadius: AppTheme.cardRadiusBig,
        ),
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Icon(
            iconData,
            color: AppTheme.white90,
          ),
        ),
      ),
    );
  }
}