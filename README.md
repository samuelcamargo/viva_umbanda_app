# Viva Umbanda

App de **frases e pensamentos umbandistas** que exibe uma frase aleatória ao abrir, informações sobre Orixás e opção de remover publicidade por assinatura. Funciona **offline**, sem login e sem backend: tudo fica no celular em um banco SQLite.

---

## O que o app faz

- **Home**: mostra uma frase umbandista por dia (não assinante) ou várias ao toque em "Nova frase" (assinante). Dois espaços para banners (em cima e embaixo). Quem não assina vê apenas um pensamento por dia.
- **Umbanda**: página com um pouco da história da Umbanda no Brasil (origem em 1908, Zélio de Moraes, Caboclo das Sete Encruzilhadas, primeiro templo). Dois espaços para anúncios (ocultos para assinante).
- **Orixás**: lista de Orixás da Umbanda com nome e descrição, também com dois espaços para anúncios.
- **Remover publicidade**: assinatura de **US$ 1,00/mês** (ou equivalente) para remover anúncios e desbloquear mais pensamentos por dia na Home. Por enquanto não há integração com a loja; há um switch "Simular assinante" para testar.

---

## Pré-requisitos

- [Flutter](https://flutter.dev) instalado (versão mínima sugerida: 3.16+).
- Android Studio e/ou Xcode para rodar em emulador ou dispositivo (Android e iOS).

Para verificar:

```bash
flutter doctor
```

---

## Como rodar

1. Clone o repositório (ou baixe o código).
2. Abra o terminal na pasta do projeto (onde está o `pubspec.yaml`).
3. Instale as dependências e execute:

```bash
flutter pub get
flutter run
```

Escolha um dispositivo/emulador quando o Flutter pedir. Para Android:

```bash
flutter run -d android
```

Para iOS (apenas em Mac):

```bash
flutter run -d ios
```

**Web (Chrome):** use o renderer HTML para evitar erro de "MaterialApp undefined" em debug:

```bash
flutter run -d chrome --web-renderer html
```

---

## Estrutura do projeto (para quem for dar manutenção)

A lógica do app está em `lib/`:

| Pasta / arquivo | Função |
|-----------------|--------|
| `main.dart` | Entrada do app: tema e navegação com 4 abas (Home, Umbanda, Orixás, Remover anúncios). |
| `main_navigator.dart` | Container das abas e do IndexedStack; compartilha adsRemovedNotifier. |
| `app.dart` | Definição do tema (cores, fontes) do app. |
| `database/database_helper.dart` | Abre/cria o banco SQLite e oferece `getFraseAleatoria()` e `getAllOrixas()`. |
| `database/seed_data.dart` | Dados iniciais: frases e Orixás inseridos na primeira abertura do app. |
| `database/frases_data.dart` | Listas de frases umbandistas (caridade, fé/axé, Orixás, etc.) usadas pelo seed. |
| `models/frase.dart` | Modelo da frase (id, texto, autor). |
| `models/orixa.dart` | Modelo do Orixá (id, nome, descricao, cor). |
| `screens/home_screen.dart` | Tela Home: uma frase por dia (não assinante) ou várias (assinante) + placeholders. |
| `screens/umbanda_screen.dart` | Tela Umbanda: história da Umbanda no Brasil + placeholders. |
| `screens/orixas_screen.dart` | Tela Orixás: lista de Orixás + dois placeholders. |
| `screens/remove_ads_screen.dart` | Tela "Remover publicidade" (US$ 1/mês) e switch "Simular assinante". |
| `widgets/banner_placeholder.dart` | Widget reutilizável dos espaços de anúncio (topo e baixo). |
| `services/preferences_service.dart` | Assinante (sem anúncios) e frase do dia para não assinantes. |

O código está comentado para um desenvolvedor júnior conseguir entender onde alterar frases, temas e anúncios.

---

## Banco de dados (SQLite)

- O banco fica no armazenamento interno do app (diretório de documentos), com o nome `viva_umbanda.db`.
- **Tabelas**:
  - `frases`: `id`, `texto`, `autor` (opcional).
  - `orixas`: `id`, `nome`, `descricao`, `cor` (opcional, para a UI).
- Os dados iniciais são inseridos na primeira execução em `database/seed_data.dart`.
- **Como adicionar novas frases ou Orixás**: edite as listas em `lib/database/seed_data.dart` e reinstale o app (ou incremente a versão do banco e faça uma migração para rodar novos inserts).

---

## Onde colocar os anúncios de verdade

Os dois espaços (em cima e embaixo) usam o widget `BannerPlaceholder` em `lib/widgets/banner_placeholder.dart`. Para exibir anúncios reais:

1. Configure o [Google AdMob](https://admob.google.com) e crie os IDs dos seus banners.
2. No projeto, o pacote `google_mobile_ads` já está no `pubspec.yaml`.
3. Troque o uso de `BannerPlaceholder` pelos widgets de banner do `google_mobile_ads` (por exemplo `AdWidget` com `BannerAd`), usando seus IDs. A documentação do pacote está em: [google_mobile_ads no pub.dev](https://pub.dev/packages/google_mobile_ads).

A lógica de “mostrar ou não” os banners já está pronta: quando o usuário é assinante (ou “Simular assinante” está ativo), os placeholders não são exibidos.

---

## Próximos passos (assinatura)

- Integrar **in_app_purchase** (ou equivalente) para a assinatura de **US$ 1,00/mês** (ou equivalente).
- Após a compra ser validada pela loja, salvar em `PreferencesService` que a publicidade foi removida (`setRemoverPublicidadeAtivo(true)`), para que o app continue escondendo os banners e liberando mais frases por dia sem precisar de login.

---

## Licença

All rights reserved. Uso do código conforme combinado com o autor do repositório (Samuel Camargo - 2026).
