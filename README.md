# tele_web_app

[![style: very good analysis][very_good_analysis_badge]][very_good_analysis_link]
[![License: MIT][license_badge]][license_link]

It enables communication between your [bot][bot_link] and the Flutter-embedded [Web App][web_app_link] displayed inside [Telegram][telegram_link] by making use of interoperability between *Dart* and *JavaScript*.

 🚧🚩**This package is still under development, it is not recommended to use it in a production environment.**
> The package should only be used on the *Web platform*.

## Install

1. Add the following lines to your project dependencies

    ```yaml
    tele_web_app:
        git: https://github.com/yeikel16/tele_web_app.git
    ```

2. Add to the `index.html` located in the `web` folder and put the [telegram-web-app.js][script_link] script in the `<head>` tag before any other scripts, using this code:

    ```html
    <script src="https://telegram.org/js/telegram-web-app.js"></script>
    ```

3. Add the following line to indicate to Telegram that our app is ready to be displayed.

    ```js
    window.Telegram.WebApp.ready();
    ```

     In our case we call it once our custom LoadingIndicator is removed.

     ```html
     <script>
        window.addEventListener("flutter-first-frame", function () {
            var loadingIndicator = document.getElementById("loading_indicator");
            if (loadingIndicator) {
            loadingIndicator.remove();
            window.Telegram.WebApp.ready();
            }
        });
     </script>
     ```

## Usege

You moust get instance from the `TeleWebApp` singlenton class.

```dart
final twa = TeleWebApp();

// Get MainButton intance 
final button = twa.mainButton;

// Get if MainButton is visible
final isVisible = button.isVisble; // false

// Use to show the MainButton 
...
 return InkWell(
   onTap: () {
     button.show();
   },
   child: Container(
...

// Get if MainButton is visible
final isVisible = button.isVisble; // true
```

This class allows you to change some properties and access the methods so that you can do what you want with your WebApp within Telegram.

<!-- ### ThemeParams

Contains the user's current theme settings from Telegram app. All colors is follow the `#RRGGBB` format.

* `bgColor`: Background color.

* `textColor`: Main text color.

* `hintColor`: Hint text color.

* `linkColor`: Link color.

* `buttonColor`: Button color.

* `buttonTextColor`: Button text color. -->

## Bugs or Requests

If you want to [report a problem][github_issue_link] or would like to add a new feature, feel free to open an [issue on GitHub][github_issue_link]. Pull requests are also welcome.

[github_issue_link]: https://github.com/yeikel16/tele_web_app
[script_link]: https://core.telegram.org/bots/webapps
[web_app_link]: https://core.telegram.org/bots/webapps
[telegram_link]: https://telegram.org
[bot_link]: https://core.telegram.org/bots
[license_badge]: https://img.shields.io/badge/license-MIT-blue.svg
[license_link]: https://opensource.org/licenses/MIT
[very_good_analysis_badge]: https://img.shields.io/badge/style-very_good_analysis-B22C89.svg
[very_good_analysis_link]: https://pub.dev/packages/very_good_analysis
