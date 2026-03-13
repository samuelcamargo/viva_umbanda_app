// main.dart
//
// Entrypoint do app. Na web, o MaterialApp é construído em app_root.dart
// (após o 1º frame) para o compilador carregar o módulo Material corretamente.

import 'package:flutter/material.dart';
import 'app_root.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const _AppLoader());
}

/// Na web: primeiro frame sem MaterialApp; depois chama buildRootApp() de app_root.dart.
class _AppLoader extends StatefulWidget {
  const _AppLoader();

  @override
  State<_AppLoader> createState() => _AppLoaderState();
}

class _AppLoaderState extends State<_AppLoader> {
  bool _ready = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) setState(() => _ready = true);
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!_ready) return const SizedBox.shrink();
    return buildRootApp();
  }
}
