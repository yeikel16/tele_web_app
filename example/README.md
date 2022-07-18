# Telegram Web App

[![style: very good analysis][very_good_analysis_badge]][very_good_analysis_link]
[![License: MIT][license_badge]][license_link]
[![Netlify Status](https://api.netlify.com/api/v1/badges/9e3a614b-3d84-4091-b93b-dd507b393cf3/deploy-status)](https://taupe-tulumba-027376.netlify.app)

Example of WebApp in Telegram with Flutter.

You can find the code of the telegram bot used in this [example here][example_bot].

---
To test this example with your own telegram bot, follow these steps:

1. Run the `flutter pub get` command
2. Run the `flutter build web` command
3. Deploy in some hosting (GitHub Page, Netlify, Vercel) the folder located in `build/web`.
4. Once the project is deployed, obtain the URL
5. In your [bot][example_bot] you must change the value of the variable `link_webapp` with your URL
6. Once your [bot][example_bot] is activated, you can do it from Telegram to your WebApp in Flutter 😎

[example_bot]: https://github.com/yeikel16/flutter-webapp-bot
[coverage_badge]: coverage_badge.svg
[flutter_localizations_link]: https://api.flutter.dev/flutter/flutter_localizations/flutter_localizations-library.html
[internationalization_link]: https://flutter.dev/docs/development/accessibility-and-localization/internationalization
[license_badge]: https://img.shields.io/badge/license-MIT-blue.svg
[license_link]: https://opensource.org/licenses/MIT
[very_good_analysis_badge]: https://img.shields.io/badge/style-very_good_analysis-B22C89.svg
[very_good_analysis_link]: https://pub.dev/packages/very_good_analysis
[very_good_cli_link]: https://github.com/VeryGoodOpenSource/very_good_cli
