// screens/remove_ads_screen.dart
//
// Terceira aba: página estática explicando que por R$ 9,90/mês o usuário
// remove os anúncios da Home e da aba Orixás. Botão "Assinar" sem integração
// com store (pode mostrar SnackBar "Em breve"). Opcional: switch "Simular assinante"
// para testar esconder os banners.

import 'package:flutter/material.dart';
import '../services/preferences_service.dart';
import '../app.dart';

class RemoveAdsScreen extends StatefulWidget {
  final ValueNotifier<bool>? adsRemovedNotifier;

  const RemoveAdsScreen({super.key, this.adsRemovedNotifier});

  @override
  State<RemoveAdsScreen> createState() => _RemoveAdsScreenState();
}

class _RemoveAdsScreenState extends State<RemoveAdsScreen> {
  final PreferencesService _prefs = PreferencesService();
  bool _simularAssinante = false;
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _carregar();
  }

  Future<void> _carregar() async {
    final value = await _prefs.isRemoverPublicidadeAtivo();
    if (!mounted) return;
    setState(() {
      _simularAssinante = value;
      _loading = false;
    });
  }

  Future<void> _toggleSimular(bool value) async {
    await _prefs.setRemoverPublicidadeAtivo(value);
    widget.adsRemovedNotifier?.value = value;
    setState(() => _simularAssinante = value);
  }

  void _onAssinar() {
    // Futuramente: abrir fluxo in_app_purchase (assinatura R$ 9,90/mês)
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Assinatura em breve. Por enquanto use "Simular assinante" para testar.'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator(color: AppColors.primary)),
      );
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Remover publicidade')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 16),
            Icon(
              Icons.block_outlined,
              size: 64,
              color: AppColors.primary,
            ),
            const SizedBox(height: 24),
            Text(
              'Apoie o app e use sem anúncios',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary,
                  ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            Text(
              'Por apenas R\$ 9,90 por mês você remove todos os anúncios da Home e da seção Orixás. '
              'O app continua igual: frases aleatórias e informações sobre os Orixás, só que sem propaganda.',
              style: Theme.of(context).textTheme.bodyLarge,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            FilledButton(
              onPressed: _onAssinar,
              style: FilledButton.styleFrom(
                backgroundColor: AppColors.primary,
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              child: const Text('Assinar por R\$ 9,90/mês'),
            ),
            const SizedBox(height: 32),
            const Divider(),
            const SizedBox(height: 16),
            Text(
              'Para desenvolvedores: use o switch abaixo para simular assinante e testar as telas sem banners.',
              style: Theme.of(context).textTheme.bodySmall,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),
            SwitchListTile(
              title: const Text('Simular assinante (sem anúncios)'),
              value: _simularAssinante,
              onChanged: _toggleSimular,
              activeColor: AppColors.primary,
            ),
          ],
        ),
      ),
    );
  }
}
