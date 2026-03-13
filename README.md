# Viva Umbanda

Aplicativo Flutter de **frases e pensamentos umbandistas**, com conteúdo sobre a **Umbanda no Brasil**, lista de **Orixás** e um fluxo simples de **assinatura para remover publicidade**. O app funciona **offline**, sem login e sem backend.

Hoje o projeto roda em:

- Android
- Windows
- Web (`Chrome` e `Edge`)

---

## Funcionalidades

- **Home**: exibe um pensamento umbandista.
  - Não assinante: **1 pensamento por dia**
  - Assinante: pode tocar em **"Nova frase"** para carregar quantas quiser
  - Banners no topo e no rodapé para não assinantes
- **Umbanda**: tela com um resumo da história da Umbanda no Brasil
- **Orixás**: lista com nome, descrição e cor temática de cada Orixá
- **Remover publicidade**: tela da assinatura por **US$ 1,00/mês** (ou equivalente), com switch de **"Simular assinante"** para testes

---

## Stack atual

- **Flutter**
- **Isar** como banco local em Android/Windows
- **SharedPreferences** para guardar:
  - status de assinatura
  - frase do dia
- **google_mobile_ads**
  - por enquanto o app usa placeholders visuais
  - no Android há um **App ID de teste do AdMob** no manifest para evitar crash na inicialização

---

## Pré-requisitos

- Flutter instalado
- Android Studio para emulador Android
- Chrome ou Edge para web

Comando útil:

```bash
flutter doctor
```

---

## Como rodar

Na raiz do projeto:

```bash
flutter pub get
```

### Android

1. Abra um emulador no Android Studio
2. Confirme os dispositivos:

```bash
flutter devices
```

3. Rode o app:

```bash
flutter run -d android
```

Se quiser um device específico:

```bash
flutter run -d emulator-5554
```

### Windows

```bash
flutter run -d windows
```

### Web

Para Chrome:

```bash
flutter run -d chrome --web-renderer html
```

Para Edge:

```bash
flutter run -d edge
```

---

## Estrutura do projeto

### `lib/`

| Caminho | Responsabilidade |
|---|---|
| `main.dart` | Ponto de entrada do app |
| `app_root.dart` | Constrói o `MaterialApp` raiz |
| `app.dart` | Tema, cores e estilos globais |
| `main_navigator.dart` | Navegação por abas (`Home`, `Umbanda`, `Orixás`, `Remover anúncios`) |
| `screens/home_screen.dart` | Frase do dia / nova frase para assinantes |
| `screens/umbanda_screen.dart` | História da Umbanda no Brasil |
| `screens/orixas_screen.dart` | Lista de Orixás |
| `screens/remove_ads_screen.dart` | Tela da assinatura e simulação de assinante |
| `services/preferences_service.dart` | Persistência de assinatura e frase do dia |
| `widgets/banner_placeholder.dart` | Placeholder visual para banners |

### `lib/database/`

| Caminho | Responsabilidade |
|---|---|
| `database_helper.dart` | Export condicional por plataforma |
| `database_helper_native.dart` | Implementação nativa com Isar |
| `database_helper_web.dart` | Implementação web em memória |
| `isar_schema.dart` | Schema Isar (`FraseIsar`, `OrixaIsar`) |
| `isar_schema.g.dart` | Código gerado do Isar |
| `frases_data.dart` | Base de frases umbandistas |
| `seed_data.dart` | Base dos Orixás e helpers para web/seed |

### `models/`

- `frase.dart`
- `orixa.dart`

---

## Banco de dados

### Android e Windows

O app usa **[Isar](https://pub.dev/packages/isar)** como banco local.

Coleções:

- `FraseIsar`
- `OrixaIsar`

Comportamento do seed:

- o banco é aberto uma única vez por execução
- o seed compara a contagem esperada com a contagem atual
- se houver divergência, ele:
  - limpa frases
  - limpa Orixás
  - repopula tudo novamente

Isso evita:

- seed duplicado
- Orixás repetidos
- base parcial depois de testes

### Web

Na web o app **não usa Isar**. Ele carrega frases e Orixás em memória via `SeedData`, para evitar problemas do código gerado do Isar no JavaScript.

---

## Frases

- As frases vêm de `lib/database/frases_data.dart`
- Hoje o app está configurado para usar a lista completa quando `so10ParaTeste = false`
- Se esse valor for mudado para `true`, o app limita o retorno a 10 frases para testes

Para alterar o conteúdo:

- edite `frases_data.dart`
- desinstale o app ou limpe os dados
- rode novamente para repovoar o banco

---

## Orixás

Os Orixás são definidos em `lib/database/seed_data.dart`.

Para alterar:

- nome
- descrição
- cor

edite a lista `_orixasData` e reinstale o app ou limpe os dados.

---

## Assinatura e anúncios

### Estado atual

- a assinatura é apresentada como **US$ 1,00/mês**
- ainda não existe integração real com loja (`Play Store` / `App Store`)
- existe um switch **"Simular assinante"** para testes

### Regras no app

- assinante:
  - remove banners
  - pode ver mais pensamentos por dia
- não assinante:
  - vê um pensamento por dia
  - continua vendo placeholders de anúncios

### AdMob

O projeto usa `google_mobile_ads`, mas ainda não renderiza banners reais.

No Android, o `AndroidManifest.xml` contém um **App ID de teste do AdMob** apenas para evitar que o app feche ao iniciar em debug.

Quando for publicar, troque esse valor por um App ID real do projeto AdMob.

---

## Android: observações importantes

O projeto recebeu alguns ajustes para funcionar com o ambiente atual:

- **Gradle 8.7**
- **Android Gradle Plugin 8.3.2**
- **Kotlin 1.9.22**
- `kotlin.incremental=false` para evitar erro de caminhos em discos diferentes (`C:` e `D:`)
- workaround no `android/build.gradle` para definir `namespace` em dependências Android antigas, como `isar_flutter_libs`

Se o `flutter run` perder a conexão com o debug service no emulador, estes comandos costumam resolver:

```bash
adb forward --remove-all
adb kill-server
adb start-server
flutter run -d emulator-5554
```

---

## Arquivos gerados

Ao mudar o schema do Isar, gere novamente o arquivo `.g.dart`:

```bash
dart run build_runner build --delete-conflicting-outputs
```

---

## Testes e análise

Analisar o projeto:

```bash
flutter analyze
```

Teste widget básico:

```bash
flutter test
```

---

## Próximos passos recomendados

- integrar compra real da assinatura
- trocar o App ID de teste do AdMob por um real
- implementar banners reais com `BannerAd` / `AdWidget`
- revisar o conjunto de frases e autores
- ajustar identidade visual final do app

---

## Licença

All rights reserved. Uso do código conforme combinado com o autor do repositório (Samuel Camargo - 2026).
