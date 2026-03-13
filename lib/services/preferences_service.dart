// services/preferences_service.dart
//
// Guarda: (1) se o usuário é assinante (remove anúncios + mais frases por dia);
// (2) a frase do dia para não-assinantes (uma frase por dia).
// Usado por: HomeScreen, OrixasScreen, UmbandaScreen.

import 'package:shared_preferences/shared_preferences.dart';

class PreferencesService {
  static const String _keyRemoverPublicidadeAtivo = 'remover_publicidade_ativo';
  static const String _keyFraseDoDiaData = 'frase_do_dia_data'; // yyyy-MM-dd
  static const String _keyFraseDoDiaTexto = 'frase_do_dia_texto';
  static const String _keyFraseDoDiaAutor = 'frase_do_dia_autor';

  /// Retorna true se o usuário tem assinatura ativa (sem anúncios + mais frases por dia)
  Future<bool> isRemoverPublicidadeAtivo() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_keyRemoverPublicidadeAtivo) ?? false;
  }

  /// Define se a publicidade está removida (assinante).
  Future<void> setRemoverPublicidadeAtivo(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_keyRemoverPublicidadeAtivo, value);
  }

  /// Data da última frase exibida para não-assinantes (formato yyyy-MM-dd)
  Future<String?> getFraseDoDiaData() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_keyFraseDoDiaData);
  }

  /// Salva a frase do dia para não-assinantes (só uma por dia)
  Future<void> setFraseDoDia(String dataYyyyMmDd, String texto, String? autor) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyFraseDoDiaData, dataYyyyMmDd);
    await prefs.setString(_keyFraseDoDiaTexto, texto);
    await prefs.setString(_keyFraseDoDiaAutor, autor ?? '');
  }

  /// Retorna a frase do dia salva (texto e autor) se a data for a de hoje
  Future<({String texto, String? autor})?> getFraseDoDiaSeHoje(String hojeYyyyMmDd) async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString(_keyFraseDoDiaData);
    if (data != hojeYyyyMmDd) return null;
    final texto = prefs.getString(_keyFraseDoDiaTexto);
    if (texto == null || texto.isEmpty) return null;
    final autor = prefs.getString(_keyFraseDoDiaAutor);
    return (texto: texto, autor: (autor == null || autor.isEmpty) ? null : autor);
  }
}
