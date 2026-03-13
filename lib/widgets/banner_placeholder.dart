// widgets/banner_placeholder.dart
//
// Container reutilizável para os 2 espaços de anúncio (topo e rodapé).
// Quando o usuário for assinante, a tela não exibe este widget (ou exibe vazio).
// Depois: substituir este widget por AdWidget do google_mobile_ads com seus IDs do AdMob.

import 'package:flutter/material.dart';

class BannerPlaceholder extends StatelessWidget {
  /// Altura fixa sugerida para banner (ex.: 50–60 dp)
  final double height;

  const BannerPlaceholder({super.key, this.height = 56.0});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        border: Border(
          top: BorderSide(color: Colors.grey.shade400),
          bottom: BorderSide(color: Colors.grey.shade400),
        ),
      ),
      alignment: Alignment.center,
      child: Text(
        'Espaço para anúncio',
        style: TextStyle(
          color: Colors.grey.shade600,
          fontSize: 12,
        ),
      ),
    );
  }
}
