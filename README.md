# tele_web_app

[![style: very good analysis][very_good_analysis_badge]][very_good_analysis_link]
[![License: MIT][license_badge]][license_link]

It enables communication between your [bot][bot_link] and the Flutter-embedded [Web App][web_app_link] displayed inside [Telegram][telegram_link] by making use of interoperability between *Dart* and *JavaScript*.

 🚧🚩**This package is still under development, it is not recommended to use it in a production environment.**
> The package should only be used on the *Web platform*. This package makes use of the interoperability between *Dart* and *JavaScript*

## Install

1. Add the following lines to your project dependencies

    ```yaml
    tele_web_app:
        git: https://github.com/yeikel16/tele_web_app.git
    ```

1. Add to the `index.html` located in the `web` folder and put the [telegram-web-app.js][script_link] script in the `<head>` tag before any other scripts, using this code:

    ```html
    <script src="https://telegram.org/js/telegram-web-app.js"></script>
    ```

[script_link]: https://core.telegram.org/bots/webapps
[web_app_link]: https://core.telegram.org/bots/webapps
[telegram_link]: https://telegram.org
[bot_link]: https://core.telegram.org/bots
[license_badge]: https://img.shields.io/badge/license-MIT-blue.svg
[license_link]: https://opensource.org/licenses/MIT
[very_good_analysis_badge]: https://img.shields.io/badge/style-very_good_analysis-B22C89.svg
[very_good_analysis_link]: https://pub.dev/packages/very_good_analysis
