library flutter_button_collection;
import 'package:flutter/material.dart';
import 'avl_card.dart';

class AVLButton extends MaterialButton {

  final BorderRadius borderRadius;
  final bool upperCase;

  AVLButton ({
    this.borderRadius,
    Key key,
    @required VoidCallback onPressed,
    Color textColor = const Color(0xFFFFFFFF),
    Color disabledTextColor,
    Color color = const Color.fromRGBO(0, 87, 154, 1.0),
    Color disabledColor,
    double elevation,
    Widget child,
    EdgeInsetsGeometry padding,
    ShapeBorder shape,
    this.upperCase = true,
  }) : assert(elevation == null || elevation >= 0.0),
        super(
        key: key,
        onPressed: onPressed,
        textColor: textColor,
        disabledTextColor: disabledTextColor,
        color: color,
        disabledColor: disabledColor,
        elevation: elevation,
        child: child,
        padding: padding,
        shape: shape,
      );

  Widget build(BuildContext context) {

    var newChild = child;
    if (child is Text && upperCase) {
      Text text = child as Text;
      newChild = Text(text.data.toUpperCase(), style: text.style);
    }

    final ThemeData theme = Theme.of(context);
    final ButtonThemeData buttonTheme = ButtonTheme.of(context);

    return RawMaterialButton(
      onPressed: onPressed,
      clipBehavior: clipBehavior ?? Clip.none,
      fillColor: buttonTheme.getFillColor(this),
      textStyle: theme.textTheme.button.copyWith(color: buttonTheme.getTextColor(this)),
      padding: buttonTheme.getPadding(this) != padding ? EdgeInsets.all(20.0) : buttonTheme.getPadding(this),
      shape: buttonTheme.getShape(this) != shape ? RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))) : buttonTheme.getShape(this),
      child: newChild,
    );
  }
}