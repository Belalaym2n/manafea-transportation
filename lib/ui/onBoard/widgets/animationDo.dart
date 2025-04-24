import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';

Widget animationDo(
    int index,
    int delay,
    Widget child,
    ) {
  if (index == 1 || index==3 ) {
    return FadeInDown(
      delay: Duration(milliseconds: delay),
      child: child,
    );
  }
  return FadeInUp(
    delay: Duration(milliseconds: delay),
    child: child,
  );
}