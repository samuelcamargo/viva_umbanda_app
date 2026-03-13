// services/preferences_service.dart
//
// Guarda se o usuário "removeu a publicidade" (assinante).
// Por enquanto só lemos/escrevemos um bool em SharedPreferences.
// Futuramente: aqui virá a verificação da compra in_app_purchase (store);
// o app salvará localmente que o usuário é assinante para esconder os banners.
// Usado por: HomeScreen, OrixasScreen (mostrar ou não os 2 banners).

import 'package:shared_preferences/shared_preferences.dart';

class PreferencesService {
  static const String _keyRemoverPublicidadeAtivo = 'remover_publicidade_ativo';

  /// Retorna true se o usuário tem assinatura ativa (sem anúncios)
  Future<bool> isRemoverPublicidadeAtivo() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_keyRemoverPublicidadeAtivo) ?? false;
  }

  /// Define se a publicidade está removida (assinante).
  /// Em produção isso será setado após validação da compra na store.
  Future<void> setRemoverPublicidadeAtivo(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_keyRemoverPublicidadeAtivo, value);
  }
}
