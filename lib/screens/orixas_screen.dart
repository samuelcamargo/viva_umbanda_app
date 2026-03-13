// screens/orixas_screen.dart
//
// Segunda aba: lista de Orixás vinda do SQLite, em cards com nome e descrição.
// Mesmos 2 placeholders de banner (topo e baixo); escondidos se assinante.

import 'package:flutter/material.dart';
import '../database/database_helper.dart';
import '../models/orixa.dart';
import '../services/preferences_service.dart';
import '../widgets/banner_placeholder.dart';
import '../app.dart';

class OrixasScreen extends StatefulWidget {
  final ValueNotifier<bool>? adsRemovedNotifier;

  const OrixasScreen({super.key, this.adsRemovedNotifier});

  @override
  State<OrixasScreen> createState() => _OrixasScreenState();
}

class _OrixasScreenState extends State<OrixasScreen> {
  final DatabaseHelper _db = DatabaseHelper();
  final PreferencesService _prefs = PreferencesService();

  List<Orixa> _orixas = [];
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
    final v = widget.adsRemovedNotifier?.value ?? false;
    if (v != _semPublicidade) setState(() => _semPublicidade = v);
  }

  Future<void> _carregar() async {
    setState(() {
      _loading = true;
      _erro = null;
    });
    try {
      final semPub = await _prefs.isRemoverPublicidadeAtivo();
      final list = await _db.getAllOrixas();
      if (!mounted) return;
      setState(() {
        _semPublicidade = semPub;
        _orixas = list.map((m) => Orixa.fromMap(m)).toList();
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
      appBar: AppBar(title: const Text('Orixás')),
      body: Column(
        children: [
          if (!_semPublicidade) const BannerPlaceholder(),
          Expanded(
            child: _buildConteudo(),
          ),
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
    if (_orixas.isEmpty) {
      return const Center(child: Text('Nenhum Orixá cadastrado.'));
    }

    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      itemCount: _orixas.length,
      itemBuilder: (context, index) {
        final o = _orixas[index];
        Color? cardColor;
        if (o.cor != null && o.cor!.isNotEmpty) {
          try {
            final hex = o.cor!.replaceFirst('0x', '');
            cardColor = Color(int.parse(hex, radix: 16));
          } catch (_) {}
        }
        cardColor ??= AppColors.primary.withOpacity(0.1);

        return Card(
          margin: const EdgeInsets.only(bottom: 12),
          child: ListTile(
            contentPadding: const EdgeInsets.all(16),
            leading: CircleAvatar(
              backgroundColor: cardColor,
              child: Text(
                o.nome.isNotEmpty ? o.nome[0].toUpperCase() : '?',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            title: Text(
              o.nome,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                o.descricao,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            isThreeLine: true,
          ),
        );
      },
    );
  }
}
