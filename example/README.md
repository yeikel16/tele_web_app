# Telegram Web App

![coverage][coverage_badge]
[![style: very good analysis][very_good_analysis_badge]][very_good_analysis_link]
[![License: MIT][license_badge]][license_link]

Example of WebApp in Telegram with Flutter.

You can find the code of the telegram bot used in this [example here](https://github.com/yeikel16/flutter-webapp-bot).

---
To test this example with your own telegram bot, follow these steps:

1. Run the `flutter pub get` command
2. Run the `flutter build web` command
3. Deploy in some hosting (GitHub Page, Netlify, Vercel) the folder located in `build/web`.
4. Once the project is deployed, obtain the URL
5. In your bot you must change the value of the variable `link_webapp` with your URL
6. Once your bot is activated, you can do it from Telegram to your WebApp in Flutter 😎

[coverage_badge]: coverage_badge.svg
[flutter_localizations_link]: https://api.flutter.dev/flutter/flutter_localizations/flutter_localizations-library.html
[internationalization_link]: https://flutter.dev/docs/development/accessibility-and-localization/internationalization
[license_badge]: https://img.shields.io/badge/license-MIT-blue.svg
[license_link]: https://opensource.org/licenses/MIT
[very_good_analysis_badge]: https://img.shields.io/badge/style-very_good_analysis-B22C89.svg
[very_good_analysis_link]: https://pub.dev/packages/very_good_analysis
[very_good_cli_link]: https://github.com/VeryGoodOpenSource/very_good_cli
