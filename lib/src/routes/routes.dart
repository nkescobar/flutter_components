import 'package:flutter/material.dart';
import 'package:flutter_componentes/src/pages/alert_page.dart';
import 'package:flutter_componentes/src/pages/animated_container.dart';
import 'package:flutter_componentes/src/pages/avatar_oage.dart';
import 'package:flutter_componentes/src/pages/card_pages.dart';
import 'package:flutter_componentes/src/pages/home_page.dart';
import 'package:flutter_componentes/src/pages/inputs-page.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    '/': (BuildContext context) => HomePage(),
    'alert': (BuildContext context) => AlertPage(),
    'avatar': (BuildContext context) => AvatarPage(),
    'card': (BuildContext context) => CardPage(),
    'animatedContainer': (BuildContext context) => AnimatedPage(),
    'inputs': (BuildContext context) => InputPage(),
  };
}
