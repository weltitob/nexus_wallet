import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:nexus/theme.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image/image.dart';

enum ButtonState { idle, loading, disabled }

class LongButtonWidget extends StatefulWidget {
  final String title;
  final TextStyle? titleStyle;
  final ButtonState state;
  final Widget? leadingIcon;
  final Function()? onTap;
  dynamic buttonColor;
  dynamic textColor;

  LongButtonWidget({
    required this.title,
    required this.onTap,

    this.titleStyle,
    this.buttonColor,
    this.textColor,
    this.state = ButtonState.idle,
    this.leadingIcon,
  });

  @override
  State<LongButtonWidget> createState() => _LongButtonWidgetState();
}

class _LongButtonWidgetState extends State<LongButtonWidget> {

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.4),
            offset: Offset(0, 24),
            blurRadius: 50,
            spreadRadius: -18,
          ),
        ],
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: widget.buttonColor != null ? widget.buttonColor : AppTheme.colorBitcoin,
          shadowColor: widget.buttonColor != null ? widget.buttonColor : AppTheme.colorPrimaryGradient,
          shape: RoundedRectangleBorder(borderRadius: AppTheme.cardRadiusBig,),
        ),
        onPressed: widget.onTap,
        child: Container(
          width: size.width - 140,
          height: 60,
          alignment: Alignment.center,
          child: widget.state == ButtonState.loading
              ? Center(
                  child: Transform.scale(
                      scale: 0.6,
                      child: const CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation(AppTheme.white100),
                      )))
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (widget.leadingIcon != null)
                      Padding(
                        padding: const EdgeInsets.only(
                            right: AppTheme.elementSpacing),
                        child: widget.leadingIcon,
                      ),
                    Text(
                      widget.title,
                      style: Theme.of(context).textTheme.button?.copyWith(
                        color: widget.textColor != null ? widget.textColor : AppTheme.white90,
                        fontSize: 17
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}


class LongButtonWidgetTransparent extends StatefulWidget {
  final String title;
  final TextStyle? titleStyle;
  final ButtonState state;
  final Widget? leadingIcon;
  final Function()? onTap;
  dynamic buttonColor;
  dynamic textColor;

  LongButtonWidgetTransparent({
    required this.title,
    required this.onTap,

    this.titleStyle,
    this.buttonColor,
    this.textColor,
    this.state = ButtonState.idle,
    this.leadingIcon,
  });

  @override
  State<LongButtonWidgetTransparent> createState() => _LongButtonWidgetTransparentState();
}

class _LongButtonWidgetTransparentState extends State<LongButtonWidgetTransparent> {

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.4),
            offset: Offset(0, 24),
            blurRadius: 50,
            spreadRadius: -18,
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: widget.onTap,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.transparent),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
              side: BorderSide(
                color: AppTheme.white100,
              ),
              borderRadius: AppTheme.cardRadiusBig,
          ),),
        ),
        child: Container(
          width: size.width - 140,
          height: 60,
          alignment: Alignment.center,
          child: widget.state == ButtonState.loading
              ? Center(
              child: Transform.scale(
                  scale: 0.6,
                  child: const CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(AppTheme.white100),
                  )))
              : Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (widget.leadingIcon != null)
                Padding(
                  padding: const EdgeInsets.only(
                      right: AppTheme.elementSpacing),
                  child: widget.leadingIcon,
                ),
              Text(
                widget.title,
                style: Theme.of(context).textTheme.button?.copyWith(
                    color: widget.textColor != null ? widget.textColor : AppTheme.white90,
                    fontSize: 17
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RoundedButtonWidget extends StatelessWidget {
  final IconData iconData;
  final Function()? onTap;
  final bool isGlassmorph;

  const RoundedButtonWidget({
    required this.iconData,
    required this.onTap,
    required this.isGlassmorph,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: AppTheme.cardRadiusSmall,
      child: BackdropFilter(
        filter: new ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
        child: Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              borderRadius: AppTheme.cardRadiusSmall,
              color: isGlassmorph ? AppTheme.glassMorphColor : Theme.of(context).colorScheme.secondaryContainer,
            ),
            child: InkWell(
              borderRadius: AppTheme.cardRadiusSmall,
              child: Container(
                child: Icon(
                  iconData,
                  color: isGlassmorph ? AppTheme.white90 : Theme.of(context).colorScheme.onSecondaryContainer,
                ),),
              onTap: onTap,
            )),
      ),
    );
  }
}
