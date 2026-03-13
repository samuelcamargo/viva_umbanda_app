// screens/home_screen.dart
//
// Primeira aba: ao abrir o app (ou esta aba), exibe uma frase umbandista
// aleatória do SQLite. Layout: [Banner topo] → Frase (destaque) → [Banner baixo].
// Se o usuário for assinante (remover_publicidade_ativo), os banners não são exibidos.

import 'package:flutter/material.dart';
import '../database/database_helper.dart';
import '../models/frase.dart';
import '../services/preferences_service.dart';
import '../widgets/banner_placeholder.dart';
import '../app.dart';

class HomeScreen extends StatefulWidget {
  final ValueNotifier<bool>? adsRemovedNotifier;

  const HomeScreen({super.key, this.adsRemovedNotifier});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final DatabaseHelper _db = DatabaseHelper();
  final PreferencesService _prefs = PreferencesService();

  Frase? _frase;
  bool _semPublicidade = false;
  bool _loading = true;
  String? _erro;

  @override
  void initState() {
    super.initState();
    widget.adsRemovedNotifier?.addListener(_onAdsPreferenceChanged);
    _carregar();
  }

  @override
  void dispose() {
    widget.adsRemovedNotifier?.removeListener(_onAdsPreferenceChanged);
    super.dispose();
  }

  void _onAdsPreferenceChanged() {
    setState(() => _semPublicidade = widget.adsRemovedNotifier?.value ?? false);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Garante que ao voltar para a aba, refletimos o valor atual do notifier
    final v = widget.adsRemovedNotifier?.value ?? false;
    if (v != _semPublicidade) setState(() => _semPublicidade = v);
  }

  /// Carrega uma frase aleatória e a preferência de esconder anúncios
  Future<void> _carregar() async {
    setState(() {
      _loading = true;
      _erro = null;
    });
    try {
      final semPub = await _prefs.isRemoverPublicidadeAtivo();
      final map = await _db.getFraseAleatoria();
      if (!mounted) return;
      setState(() {
        _semPublicidade = semPub;
        _frase = map != null ? Frase.fromMap(map) : null;
        _loading = false;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _erro = e.toString();
        _loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Viva Umbanda')),
      body: Column(
        children: [
          // Banner topo: só mostra se usuário não for assinante
          if (!_semPublicidade) const BannerPlaceholder(),
          // Conteúdo central: frase ou loading/erro
          Expanded(
            child: _buildConteudo(),
          ),
          // Banner baixo
          if (!_semPublicidade) const BannerPlaceholder(),
        ],
      ),
    );
  }

  Widget _buildConteudo() {
    if (_loading) {
      return const Center(child: CircularProgressIndicator(color: AppColors.primary));
    }
    if (_erro != null) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.error_outline, size: 48, color: Colors.red),
              const SizedBox(height: 16),
              Text(_erro!, textAlign: TextAlign.center),
              const SizedBox(height: 16),
              FilledButton(
                onPressed: _carregar,
                child: const Text('Tentar de novo'),
              ),
            ],
          ),
        ),
      );
    }
    if (_frase == null) {
      return const Center(child: Text('Nenhuma frase disponível.'));
    }

    return SingleChildScrollView(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          const SizedBox(height: 24),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                children: [
                  Text(
                    _frase!.texto,
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          height: 1.4,
                          color: AppColors.primary,
                        ),
                    textAlign: TextAlign.center,
                  ),
                  if (_frase!.autor != null && _frase!.autor!.isNotEmpty) ...[
                    const SizedBox(height: 16),
                    Text(
                      '— ${_frase!.autor}',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontStyle: FontStyle.italic,
                            color: Colors.grey.shade700,
                          ),
                    ),
                  ],
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),
          OutlinedButton.icon(
            onPressed: _carregar,
            icon: const Icon(Icons.refresh),
            label: const Text('Nova frase'),
            style: OutlinedButton.styleFrom(foregroundColor: AppColors.primary),
          ),
        ],
      ),
    );
  }
}
