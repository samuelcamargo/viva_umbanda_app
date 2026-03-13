// screens/umbanda_screen.dart
//
// Aba "Umbanda": explica um pouco da história da Umbanda no Brasil.
// Layout: [Banner topo] → Conteúdo rolável → [Banner baixo].
// Se o usuário for assinante, os banners não são exibidos.

import 'package:flutter/material.dart';
import '../services/preferences_service.dart';
import '../widgets/banner_placeholder.dart';
import '../app.dart';

class UmbandaScreen extends StatefulWidget {
  final ValueNotifier<bool>? adsRemovedNotifier;

  const UmbandaScreen({super.key, this.adsRemovedNotifier});

  @override
  State<UmbandaScreen> createState() => _UmbandaScreenState();
}

class _UmbandaScreenState extends State<UmbandaScreen> {
  final PreferencesService _prefs = PreferencesService();
  bool _semPublicidade = false;
  bool _loading = true;

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
    final semPub = await _prefs.isRemoverPublicidadeAtivo();
    if (!mounted) return;
    setState(() {
      _semPublicidade = semPub;
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Umbanda')),
      body: Column(
        children: [
          if (!_semPublicidade) const BannerPlaceholder(),
          Expanded(
            child: _loading
                ? const Center(child: CircularProgressIndicator(color: AppColors.primary))
                : _buildConteudo(),
          ),
          if (!_semPublicidade) const BannerPlaceholder(),
        ],
      ),
    );
  }

  Widget _buildConteudo() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Um pouco da história da Umbanda no Brasil',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                ),
          ),
          const SizedBox(height: 16),
          _paragraph(
            'A Umbanda é uma religião brasileira, nascida da fusão de tradições africanas, '
            'espiritismo kardecista, catolicismo popular e cosmologias indígenas. '
            'Surgiu oficialmente em 15 de novembro de 1908, em Neves (região de São Gonçalo), no Rio de Janeiro.',
          ),
          const SizedBox(height: 12),
          Text(
            'Zélio Fernandino de Moraes',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                ),
          ),
          const SizedBox(height: 8),
          _paragraph(
            'Zélio de Moraes (1891-1975) foi o médium responsável pela manifestação inicial da Umbanda. '
            'Aos 17 anos, enquanto se preparava para a carreira militar, passou por uma paralisia corporal '
            'inexplicável. Ao buscar ajuda espiritual, participou de uma sessão na Federação Espírita de Niterói, '
            'onde incorporou uma entidade que se identificou como o Caboclo das Sete Encruzilhadas.',
          ),
          const SizedBox(height: 12),
          Text(
            'O Caboclo das Sete Encruzilhadas',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                ),
          ),
          const SizedBox(height: 8),
          _paragraph(
            'Nessa sessão, o Caboclo das Sete Encruzilhadas defendeu os pretos-velhos e os caboclos, '
            'espíritos que haviam sido rejeitados por parte do espiritismo da época. '
            'Anunciou a criação de uma nova religião aberta a todos, sem discriminação de raça ou classe, '
            'tendo a caridade como princípio central.',
          ),
          const SizedBox(height: 12),
          Text(
            'Primeiro templo e expansão',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                ),
          ),
          const SizedBox(height: 8),
          _paragraph(
            'Zélio fundou em 1918 o primeiro templo umbandista, a Tenda Nossa Senhora da Piedade, '
            'e foi o principal divulgador da religião até sua morte em 1975. '
            'A Umbanda combina a reverência aos Orixás (sincretizados com santos católicos), '
            'a crença espírita na reencarnação e na evolução espiritual, e o trabalho de caridade '
            'através dos guias (pretos-velhos, caboclos, Exus, Pomba Gira, entre outros).',
          ),
          const SizedBox(height: 12),
          _paragraph(
            'Hoje a Umbanda está presente em todo o Brasil e em outros países, mantendo a ênfase '
            'na caridade, no respeito à natureza e na acolhida a quem busca luz e orientação.',
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget _paragraph(String text) {
    return Text(
      text,
      style: Theme.of(context).textTheme.bodyLarge,
      textAlign: TextAlign.justify,
    );
  }
}
