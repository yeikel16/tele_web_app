import 'package:js/js.dart' show allowInterop;

import 'package:tele_web_app/src/interop/js_object_wrapper.dart';
import 'package:tele_web_app/src/interop/web_app_interop.dart' as tele;
import 'package:tele_web_app/src/utils.dart';

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

  /// True, if the confirmation dialog is enabled while the user is trying to
  /// close the Mini App.
  ///
  /// False, if the confirmation dialog is disabled.
  bool get isClosingConfirmationEnabled =>
      jsObject.isClosingConfirmationEnabled;

  /// An object for controlling the main button.
  ///
  /// Is displayed at the bottom of the Web App in the Telegram interface.
  MainButton get mainButton => MainButton.fromJsObject(jsObject.MainButton);

  /// An object for controlling the back button.
  ///
  /// Can be displayed in the header of the Mini App in the Telegram interface.
  BackButton get backButton => BackButton.fromJsObject(jsObject.BackButton);

  /// Sets the app event handler.
  ///
  /// Check the list of available events:
  ///
  /// - [WebAppEventType.themeChanged]
  ///
  ///   {@macro event_type_theme_changed}
  ///
  /// - [WebAppEventType.viewportChanged]
  ///
  ///   {@macro event_type_viewport_changed}
  ///
  /// - [WebAppEventType.mainButtonClicked]
  ///
  ///   {@macro event_type_main_button_clicked}
  void onEvent(WebAppEventType eventType, Function eventHandler) =>
      jsObject.onEvent(eventType.name, allowInterop(() => eventHandler));

  /// Deletes a previously set event handler.
  void offEvent(WebAppEventType eventType, Function eventHandler) =>
      jsObject.offEvent(eventType.name, allowInterop(() => eventHandler));

  /// Send data to the bot.
  ///
  /// When this method is called, a service message is sent to the bot
  /// containing the data data of the length up to 4096 bytes, and the
  /// Web App is closed. See the field web_app_data in the class
  /// [Message](https://core.telegram.org/bots/api#message).
  ///
  /// This method is only available for Web Apps launched via a
  /// [Keyboard button](https://core.telegram.org/bots/webapps#keyboard-button-web-apps).
  void sendData(String data) => jsObject.sendData(data);

  /// A method that opens a link in an external browser.
  ///
  /// The Mini App will not be closed.
  ///
  /// If the optional options parameter [tryInstantView] is passed with true
  /// value, the link will be opened in
  /// [Instant View](https://instantview.telegram.org/) mode if possible.
  ///
  /// Note that this method can be called only in response to user interaction
  /// with the Mini App interface (e.g. a click inside the Mini App or
  /// on the main button)
  void openLink(String url, {bool? tryInstantView}) => jsObject.openLink(
        url,
        tryInstantView != null
            ? tele.OpenLinkOptions(try_instant_view: tryInstantView)
            : null,
      );

  /// A method that opens a telegram link inside Telegram app.
  ///
  /// The Mini App will be closed.
  void openTelegramLink(String url) => jsObject.openTelegramLink(url);

  /// A method that shows message in a simple alert with a 'Close' button.
  ///
  /// If an optional callback parameter was passed, the callback function will
  /// be called when the popup is closed.
  void showAlert(String message, [void Function()? callback]) =>
      jsObject.showAlert(message, allowInteropOrNull(callback));

  /// Show message in a simple confirmation window with 'OK'
  /// and 'Cancel' buttons.
  ///
  /// If an optional callback parameter was passed, the callback function will
  /// be called when the popup is closed and the first argument will be a
  /// boolean indicating whether the user pressed the 'OK' button.
  void showConfirm(String message,
          [void Function(bool isConfirmed)? callback,]) =>
      jsObject.showConfirm(message, allowInteropOrNull(callback));

  /// Show a native popup for scanning a QR code.
  ///
  /// If an optional callback parameter was passed, the callback function will
  /// be called and the text from the QR code will be passed as the first
  /// argument. Returning true inside this callback function causes the popup to
  /// be closed.
  void showScanQrPopup(
    ScanQrPopupParams params, [
    bool? Function(String text)? callback,
  ]) =>
      jsObject.showScanQrPopup(params.jsObject, allowInteropOrNull(callback));

  /// Close the native popup for scanning a QR code.
  ///
  /// Run it if you received valid data in the event qrTextReceived.
  void closeScanQrPopup() => jsObject.closeScanQrPopup();

  /// A method that requests text from the clipboard.
  ///
  /// The Mini App will receive the event clipboardTextReceived. If an optional
  /// callback parameter was passed, the callback function will be called and
  /// the text from the clipboard will be passed as the first argument.
  void readTextFromClipboard([void Function(String text)? callback]) =>
      jsObject.readTextFromClipboard(allowInteropOrNull(callback));

  /// A method that shows a native popup requesting permission for the bot to
  /// send messages to the user.
  ///
  /// If an optional callback parameter was passed, the callback function will
  /// be called when the popup is closed and the first argument will be a
  /// boolean indicating whether the user granted this access.
  void requestWriteAccess([void Function(bool isGranted)? callback]) =>
      jsObject.requestWriteAccess(allowInteropOrNull(callback));

  /// A method that shows a native popup prompting the user for their phone
  /// number.
  ///
  /// If an optional callback parameter was passed, the callback function will
  /// be called when the popup is closed and the first argument will be a
  /// boolean indicating whether the user shared its phone number.
  void requestContact([void Function(bool isShared)? callback]) =>
      jsObject.requestContact(allowInteropOrNull(callback));

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

/// {@template back_button}
/// It is responsible for controlling the back button.
///
/// Can be displayed in the header of the Mini App in the Telegram interface.
/// {@endtemplate}
class BackButton extends JsObjectWrapper<tele.BackButtonJsImpl> {
  /// Wrap a JS object.
  ///
  /// {@macro back_button}
  BackButton.fromJsObject(super.jsObject);

  /// Shows whether the button is visible.
  ///
  /// Set to `false` by default.
  bool get isVisible => jsObject.isVisible;

  /// A method that sets the button press event handler.
  void onClick(void Function() callback) =>
      jsObject.onClick(allowInterop(callback));

  /// A method that removes the button press event handler.
  void offClick(void Function() callback) =>
      jsObject.offClick(allowInterop(callback));

  /// A method to make the button active and visible.
  void show() => jsObject.show();

  /// A method to hide the button.
  void hide() => jsObject.hide();
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

  /// Secondary background color in the #RRGGBB format.
  String? get secondaryBgColor => jsObject.secondary_bg_color;
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

/// {@template scan_qr_popup_params}
/// This object describes the native popup for scanning QR codes.
/// {@endtemplate}
class ScanQrPopupParams extends JsObjectWrapper<tele.ScanQrPopupParamsJsImpl> {
  /// {@macro scan_qr_popup_params}
  ScanQrPopupParams({String? text})
      : super(tele.ScanQrPopupParamsJsImpl(text: text));

  /// {@macro scan_qr_popup_params}
  ScanQrPopupParams.fromJsObject(super.jsObject);

  /// Optional. The text to be displayed under the 'Scan QR' heading, 0-64
  /// characters.
  String? get text => jsObject.text;
}

/// {@template webapp_event_type}
/// Types of events that come from Telegram app.
/// {@endtemplate}
enum WebAppEventType {
  /// {@template event_type_theme_changed}
  /// Occurs whenever theme settings are changed in the user's Telegram app
  /// (including switching to night mode).
  ///
  /// `eventHandler` receives no parameters, new theme settings and color
  /// scheme can be received via this.themeParams and this.colorScheme
  /// respectively.
  /// {@endtemplate}
  themeChanged,

  /// {@template event_type_viewport_changed}
  /// Occurs when the visible section of the Web App is changed.
  ///
  /// `eventHandler` receives an parameter with the single field
  /// `isStateStable`.
  ///
  /// If `isStateStable = true`, the resizing of the Web App is finished.
  /// If it is `false`, the resizing is ongoing (the user is expanding or
  /// collapsing the Web App or an animated object is playing).
  /// The current value of the visible section’s height is available
  /// in `this.viewportHeight`.
  /// {@endtemplate}
  viewportChanged,

  /// {@template event_type_main_button_clicked}
  /// Occurs when the main button is pressed.
  /// eventHandler receives no parameters.
  /// {@endtemplate}
  mainButtonClicked
}
