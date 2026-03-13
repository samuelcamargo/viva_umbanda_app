// main_navigator.dart
//
// Container das 3 abas (Home, Orixás, Remover anúncios).
// Em arquivo separado para permitir app_root.dart usar sem import circular.

import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/orixas_screen.dart';
import 'screens/remove_ads_screen.dart';
import 'services/preferences_service.dart';

class MainNavigator extends StatefulWidget {
  const MainNavigator({super.key});

  @override
  State<MainNavigator> createState() => _MainNavigatorState();
}

class _MainNavigatorState extends State<MainNavigator> {
  int _index = 0;
  final ValueNotifier<bool> adsRemovedNotifier = ValueNotifier<bool>(false);

  late final List<Widget> _telas;

  @override
  void initState() {
    super.initState();
    _telas = [
      HomeScreen(adsRemovedNotifier: adsRemovedNotifier),
      OrixasScreen(adsRemovedNotifier: adsRemovedNotifier),
      RemoveAdsScreen(adsRemovedNotifier: adsRemovedNotifier),
    ];
    _syncAdsPreference();
  }

  Future<void> _syncAdsPreference() async {
    final prefs = PreferencesService();
    final value = await prefs.isRemoverPublicidadeAtivo();
    if (adsRemovedNotifier.value != value) {
      adsRemovedNotifier.value = value;
    }
  }

  @override
  void dispose() {
    adsRemovedNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _index,
        children: _telas,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        onTap: (i) => setState(() => _index = i),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_rounded),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.auto_awesome),
            label: 'Orixás',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.block_outlined),
            label: 'Remover anúncios',
          ),
        ],
      ),
    );
  }
}
