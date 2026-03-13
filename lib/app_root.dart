// app_root.dart
//
// MaterialApp em arquivo separado para o compilador web carregar
// o módulo Material antes de usar (evita "undefined MaterialApp").

import 'package:flutter/material.dart';
import 'app.dart';
import 'main_navigator.dart';

/// Constrói o MaterialApp raiz. Chamado de main.dart após o primeiro frame.
Widget buildRootApp() {
  return MaterialApp(
    title: 'Viva Umbanda',
    theme: getAppTheme(),
    home: const MainNavigator(),
    debugShowCheckedModeBanner: false,
  );
}
