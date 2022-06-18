import 'package:js/js.dart' show allowInterop;

import 'package:tele_web_app/src/interop/js_object_wrapper.dart';
import 'package:tele_web_app/src/interop/web_app_interop.dart' as tele;

/// {@template tele_web_app}
/// Allows communication between your bot and the Web App built in Flutter
/// displayed inside Telegram
/// {@endtemplate}
class TeleWebApp extends JsObjectWrapper<tele.WebAppJsImpl> {
  /// {@macro tele_web_app}
  factory TeleWebApp() {
    _instance ??= TeleWebApp._();
    return _instance!;
  }

  TeleWebApp._() : super(tele.WebApp);

  static TeleWebApp? _instance;

  /// Raw data transferred to the Web App, convenient for validating data.
  ///
  /// WARNING: [Validate data](https://core.telegram.org/bots/webapps#validating-data-received-via-the-web-app)
  /// from this field before using it on the bot's server.
  String get initData => jsObject.initData;

  /// An object with input data transferred to the Web App.
  ///
  /// WARNING: Data from this field should not be trusted.
  /// You should only use data from initData on the bot's server and
  /// only after it has been [validated](https://core.telegram.org/bots/webapps#validating-data-received-via-the-web-app).
  WebAppInitData get initDataUnsafe =>
      WebAppInitData.fromJsObject(jsObject.initDataUnsafe);

  /// The color scheme currently used in the Telegram app.
  ///
  /// Either “light” or “dark”.
  String get colorScheme => jsObject.colorScheme;

  /// Containing the current theme settings used in the Telegram app.
  ThemeParams get themeParams => ThemeParams.fromJsObject(jsObject.themeParams);

  /// If the Web App expands to the maximum height available,
  /// its value is `true`.
  ///
  /// `false`, if the Web App occupies part of the screen and can
  /// be expanded to full height using the `expand()` method.
  bool get isExpanded => jsObject.isExpanded;

  /// The current height of the visible area of the Web App.
  double get viewportHeight => jsObject.viewportHeight.toDouble();

  /// The height of the visible area of the Web App in its last stable state.
  double get viewportStableHeight => jsObject.viewportStableHeight.toDouble();

  /// An object for controlling the main button.
  ///
  /// Is displayed at the bottom of the Web App in the Telegram interface.
  MainButton get mainButton => MainButton.fromJsObject(jsObject.MainButton);

  /// Sets the app event handler.
  ///
  /// Check the list of available events.
  void onEvent(String eventType, void Function() eventHandler) {
    // TODO(yeikel16): implement onEvent method.
  }

  /// Deletes a previously set event handler.
  void offEvent(String eventType, void Function() eventHandler) {
    // TODO(yeikel16): implement offEvent method.
  }

  /// Send data to the bot.
  ///
  /// When this method is called, a service message is sent to the bot
  /// containing the data data of the length up to 4096 bytes, and the
  /// Web App is closed. See the field web_app_data in the class
  /// [Message](https://core.telegram.org/bots/api#message).
  ///
  /// This method is only available for Web Apps launched via a
  /// [Keyboard button](https://core.telegram.org/bots/webapps#keyboard-button-web-apps).
  void sendData(dynamic data) => jsObject.sendData(data);

  /// Informs the Telegram app that the Web App is ready to be displayed.
  ///
  /// It is recommended to call this method as early as possible,
  /// as soon as all essential interface elements are loaded.
  /// Once this method is called, the loading placeholder is hidden and
  /// the Web App is shown.
  ///
  /// If the method is not called, the placeholder will be hidden only
  /// when the page is fully loaded.
  void ready() => jsObject.ready();

  /// Expands the Web App to the maximum available height.
  ///
  /// To find out if the Web App is expanded to the maximum height,
  /// refer to the value of the [isExpanded] parameter
  void expand() => jsObject.expand();

  /// Close the Web App.
  void close() => jsObject.close();
}

/// {@template main_button}
/// It is responsible for controlling the main button.
///
/// Shown at the bottom of the web application in the Telegram interface.
/// {@endtemplate}
class MainButton extends JsObjectWrapper<tele.MainButtonJsImpl> {
  /// Wrap a JS object.
  ///
  /// {@macro main_button}
  MainButton.fromJsObject(super.jsObject);

  /// Current button text.
  ///
  /// Set to CONTINUE by default.
  String get text => jsObject.text;

  /// Current button color.
  String get color => jsObject.color;

  /// Current button text color.
  String get textColor => jsObject.textColor;

  /// Shows whether the button is visible.
  ///
  /// Set to `false` by default.
  bool get isVisible => jsObject.isVisible;

  /// Shows whether the button is active.
  ///
  /// Set to `true` by default.
  bool get isActive => jsObject.isActive;

  /// Shows whether the button is displaying a loading indicator.
  bool get isProgressVisible => jsObject.isProgressVisible;

  ///	A method to set the button text.
  void setText(String text) => jsObject.setText(text);

  /// A method that sets the button press event handler.
  void onClick(void Function() callback) =>
      jsObject.onClick(allowInterop(callback));

  /// Make the button visible.
  void show() => jsObject.show();

  /// Hide the button.
  void hide() => jsObject.hide();

  /// Enable the button.
  void enable() => jsObject.enable();

  /// Disable the button.
  void disable() => jsObject.disable();

  /// Show a loading indicator on the button.
  ///
  /// It is recommended to display loading progress if the action tied
  /// to the button may take a long time. By default, the button is disabled
  /// while the action is in progress.
  void showProgress({bool leaveActive = true}) =>
      jsObject.showProgress(leaveActive);

  /// Hide the loading indicator.
  void hideProgress() => jsObject.hideProgress();

  /// Set the button parameters.
  void setParams({
    String? text,
    String? color,
    String? textColor,
    bool? isActive,
    bool? isVisible,
  }) =>
      jsObject.setParams(
        tele.MainButtonParams(
          text: text,
          color: color,
          text_color: textColor,
          is_active: isActive,
          is_visible: isVisible,
        ),
      );
}

/// {@template theme_params}
/// Contains the user's current theme settings.
///
/// Web Apps can [adjust the appearance](https://core.telegram.org/bots/webapps#color-schemes)
/// of the interface to match the Telegram user's app in real time.
/// {@endtemplate}
class ThemeParams extends JsObjectWrapper<tele.ThemeParamsJsImpl> {
  /// {@macro theme_params}
  ThemeParams.fromJsObject(super.jsObject);

  /// Background color in the #RRGGBB format.
  String? get bgColor => jsObject.bg_color;

  /// Main text color in the #RRGGBB format.
  String? get textColor => jsObject.text_color;

  /// Hint text color in the #RRGGBB format.
  String? get hintColor => jsObject.hint_color;

  /// Link color in the #RRGGBB format.
  String? get linkColor => jsObject.link_color;

  /// Button color in the #RRGGBB format.
  String? get buttonColor => jsObject.button_color;

  /// Button text color in the #RRGGBB format.
  String? get buttonTextColor => jsObject.button_text_color;
}

/// {@template webapp_init_data}
/// Contains data that is transferred to the Web App when it is opened.
///
/// It is empty if the Web App was launched from a
/// [keyboard button](https://core.telegram.org/bots/webapps#keyboard-button-web-apps).
/// {@endtemplate}
class WebAppInitData extends JsObjectWrapper<tele.WebAppInitDataJsImpl> {
  /// {@macro webapp_init_data}
  WebAppInitData.fromJsObject(super.jsObject);

  /// A unique identifier for the Web App session.
  ///
  /// Required for sending messages via the
  /// [answerWebAppQuery](https://core.telegram.org/bots/api#answerwebappquery) method.
  String? get queryId => jsObject.query_id;

  /// Containing data about the current user.
  WebAppUser? get user => WebAppUser.fromJsObject(jsObject.user);

  /// Containing data about the chat partner of the current user in the chat
  /// where the bot was launched via the attachment menu.
  ///
  /// Returned only for Web Apps launched via the attachment menu.
  WebAppUser? get receiver => WebAppUser.fromJsObject(jsObject.receiver);

  /// The value of the startattach parameter, passed
  /// [via link](https://core.telegram.org/bots/webapps#adding-bots-to-the-attachment-menu).
  ///
  /// Only returned for Web Apps when launched from the `attachment`
  /// menu via link.
  ///
  /// The value of the `start_param` parameter will also be passed in
  /// the GET-parameter tgWebAppStartParam, so the Web App can load
  /// the correct interface right away.
  String? get startParam => jsObject.start_param;

  /// Time when the form was opened.
  DateTime get authDate =>
      DateTime.fromMillisecondsSinceEpoch(jsObject.auth_date as int);

  /// A hash of all passed parameters, which the bot server can use to
  /// [check their validity](https://core.telegram.org/bots/webapps#validating-data-received-via-the-web-app).
  String get hash => jsObject.hash;
}

/// {@template webapp_user}
/// Contains the data of the Web App user.
/// {@endtemplate}
class WebAppUser extends JsObjectWrapper<tele.WebAppUserJsImpl?> {
  /// {@macro webapp_user}
  WebAppUser.fromJsObject(super.jsObject);

  /// A unique identifier for the user or bot.
  ///
  /// This number may have more than 32 significant bits and some programming
  /// languages may have difficulty/silent defects in interpreting it.
  /// It has at most 52 significant bits, so a 64-bit integer or a
  /// double-precision float type is safe for storing this identifier.
  int get id => jsObject!.id.toInt();

  /// True, if this user is a bot.
  ///
  /// Returns in the [receiver](https://core.telegram.org/bots/webapps#webappinitdata) field only.
  bool? get isBot => jsObject?.is_bot;

  /// First name of the user or bot.
  String? get firstName => jsObject?.first_name;

  /// Last name of the user or bot.
  String? get lastName => jsObject?.last_name;

  /// Username of the user or bot.
  String? get username => jsObject?.username;

  /// [IETF language tag](https://en.wikipedia.org/wiki/IETF_language_tag) of the user's language.
  ///
  /// Returns in user field only.
  String? get languageCode => jsObject?.language_code;

  /// URL of the user’s profile photo.
  ///
  /// The photo can be in .jpeg or .svg formats.
  /// Only returned for Web Apps launched from the attachment menu.
  String? get photoUrl => jsObject?.photo_url;
}
