library flutter_button_collection;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';



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
    double focusElevation,
    double hoverElevation,
    double highlightElevation,
    double disabledElevation,
    Widget child,
    EdgeInsetsGeometry padding,
    ShapeBorder shape,
    this.upperCase = true,
  }) : assert(elevation == null || elevation >= 0.0),
        assert(elevation == null || elevation >= 0.0),
        assert(focusElevation == null || focusElevation >= 0.0),
        assert(hoverElevation == null || hoverElevation >= 0.0),
        assert(highlightElevation == null || highlightElevation >= 0.0),
        assert(disabledElevation == null || disabledElevation >= 0.0),
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
        focusElevation: focusElevation,
        hoverElevation: hoverElevation,
        highlightElevation: highlightElevation,
        disabledElevation: disabledElevation,
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
      elevation: buttonTheme.getElevation(this),
      focusElevation: buttonTheme.getFocusElevation(this),
      hoverElevation: buttonTheme.getHoverElevation(this),
      highlightElevation: buttonTheme.getHighlightElevation(this),
      disabledElevation: buttonTheme.getDisabledElevation(this),
      onPressed: onPressed,
      clipBehavior: clipBehavior ?? Clip.none,
      fillColor: buttonTheme.getFillColor(this),
      textStyle: theme.textTheme.button.copyWith(color: buttonTheme.getTextColor(this)),
      padding: buttonTheme.getPadding(this) != padding ? EdgeInsets.all(20.0) : buttonTheme.getPadding(this),
      shape: buttonTheme.getShape(this) != shape ? RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))) : buttonTheme.getShape(this),
      child: newChild,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<double>('elevation', elevation, defaultValue: null));
    properties.add(DiagnosticsProperty<double>('focusElevation', focusElevation, defaultValue: null));
    properties.add(DiagnosticsProperty<double>('hoverElevation', hoverElevation, defaultValue: null));
    properties.add(DiagnosticsProperty<double>('highlightElevation', highlightElevation, defaultValue: null));
    properties.add(DiagnosticsProperty<double>('disabledElevation', disabledElevation, defaultValue: null));
  }

}