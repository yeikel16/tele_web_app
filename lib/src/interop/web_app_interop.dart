// ignore_for_file: public_member_api_docs, non_constant_identifier_names

@JS('Telegram')
library web_app;

import 'package:js/js.dart';

external WebAppJsImpl get WebApp;

@JS()
external String get visualViewport;

/// {@template telegram_web}
/// A Telegram Web App part in JS
/// {@endtemplate}
@JS('WebApp')
abstract class WebAppJsImpl {
  external factory WebAppJsImpl();

  external String get initData;
  external WebAppInitDataJsImpl get initDataUnsafe;
  external String get colorScheme;
  external ThemeParamsJsImpl get themeParams;
  external bool get isExpanded;
  external num get viewportHeight;
  external num get viewportStableHeight;
  external bool get isClosingConfirmationEnabled;
  external MainButtonJsImpl get MainButton;
  external BackButtonJsImpl get BackButton;
  external void onEvent(String eventType, void Function() eventHandler);
  external void offEvent(String eventType, void Function() eventHandler);
  external void sendData(String data);
  external void openLink(String url, [OpenLinkOptions? options]);
  external void openTelegramLink(String url);
  external void showAlert(String message, [void Function()? callback]);
  external void showConfirm(
    String message, [
    void Function(bool isConfirmed)? callback,
  ]);
  external void showScanQrPopup(ScanQrPopupParamsJsImpl params,
      [bool? Function(String text)? callback,]);
  external void closeScanQrPopup();
  external void readTextFromClipboard([void Function(String text)? callback]);
  external void requestWriteAccess([void Function(bool isGranted)? callback]);
  external void requestContact([void Function(bool isShared)? callback]);
  external void ready();
  external void expand();
  external void close();
}

@JS()
@anonymous
abstract class MainButtonJsImpl {
  external factory MainButtonJsImpl({
    String text,
    String color,
    String textColor,
    bool isVisible,
    bool isActive,
    bool isProgressVisible,
    void Function(String text) setText,
    void Function() onClick,
    void Function() show,
    void Function() hide,
    void Function() enable,
    void Function() disable,
    void Function(bool leaveActive) showProgress,
    void Function() hideProgress,
    void Function(MainButtonParams params) setParams,
  });

  external String get text;
  external String get color;
  external String get textColor;
  external bool get isVisible;
  external bool get isActive;
  external bool get isProgressVisible;
  external void setText(String text);
  external void onClick(void Function() callback);
  external void show();
  external void hide();
  external void enable();
  external void disable();
  // ignore: avoid_positional_boolean_parameters
  external void showProgress(bool leaveActive);
  external void hideProgress();
  external void setParams(MainButtonParams params);
}

@JS()
@anonymous
abstract class MainButtonParams {
  external factory MainButtonParams({
    String? text,
    String? color,
    String? text_color,
    bool? is_active,
    bool? is_visible,
  });

  external String? get text;
  external String? get color;
  external String? get text_color;
  external bool? get is_active;
  external bool? get is_visible;
}

@JS()
@anonymous
abstract class BackButtonJsImpl {
  external factory BackButtonJsImpl({
    bool isVisible,
    void Function() onClick,
    void Function() offClick,
    void Function() show,
    void Function() hide,
  });

  external bool get isVisible;
  external void onClick(void Function() callback);
  external void offClick(void Function() callback);
  external void show();
  external void hide();
}

@JS()
@anonymous
abstract class ThemeParamsJsImpl {
  external factory ThemeParamsJsImpl({
    String? bg_color,
    String? text_color,
    String? hint_color,
    String? link_color,
    String? button_color,
    String? button_text_color,
    String? secondary_bg_color,
  });

  external String? get bg_color;
  external String? get text_color;
  external String? get hint_color;
  external String? get link_color;
  external String? get button_color;
  external String? get button_text_color;
  external String? get secondary_bg_color;
}

@JS()
@anonymous
abstract class WebAppInitDataJsImpl {
  external factory WebAppInitDataJsImpl({
    String? query_id,
    WebAppUserJsImpl? user,
    WebAppUserJsImpl? receiver,
    String? start_param,
    num auth_date,
    String hash,
  });

  external String? get query_id;
  external WebAppUserJsImpl? get user;
  external WebAppUserJsImpl? get receiver;
  external String? get start_param;
  external num get auth_date;
  external String get hash;
}

@JS()
@anonymous
abstract class WebAppUserJsImpl {
  external factory WebAppUserJsImpl({
    num id,
    bool? is_bot,
    String? first_name,
    String? last_name,
    String? username,
    String? language_code,
    String? photo_url,
  });

  external num get id;
  external bool? get is_bot;
  external String get first_name;
  external String? get last_name;
  external String? get username;
  external String? get language_code;
  external String? get photo_url;
}

@JS()
@anonymous
abstract class OpenLinkOptions {
  external factory OpenLinkOptions({
    bool? try_instant_view,
  });

  external bool? get try_instant_view;
}

@JS()
@anonymous
abstract class ScanQrPopupParamsJsImpl {
  external factory ScanQrPopupParamsJsImpl({
    String? text,
  });

  external String? get text;
}
