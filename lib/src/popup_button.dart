import 'package:tele_web_app/src/interop/js_object_wrapper.dart';
import 'package:tele_web_app/src/interop/web_app_interop.dart' as tele;

/// {@template popup_params}
/// This object describes the native popup.
/// {@endtemplate}
class PopupParams extends JsObjectWrapper<tele.PopupParamsJsImpl> {
  /// {@macro popup_params}
  PopupParams({
    required this.message,
    this.title,
    this.buttons,
  })  : assert((buttons?.length ?? 0) > 3, 'Too many buttons'),
        super(
          tele.PopupParamsJsImpl(
            title: title,
            message: message,
            buttons: buttons
                ?.map(
                  (e) => tele.PopupButtonJsImpl(
                    id: e.id,
                    text: e.text,
                    type: e.type.type,
                  ),
                )
                .toList(),
          ),
        );

  /// The text to be displayed in the popup title, 0-64 characters.
  final String? title;

  /// The message to be displayed in the body of the popup, 1-256 characters.
  final String message;

  /// List of buttons to be displayed in the popup, 1-3 buttons.
  ///
  /// Set to one [PopupButton] type equal to [ButtonType.close] by default.
  final List<PopupButton>? buttons;
}

/// {@template popup_button_params}
/// This object describes the native popup button.
/// {@endtemplate}
class PopupButton extends JsObjectWrapper<tele.PopupButtonJsImpl> {
  /// {@macro popup_button_params}
  PopupButton.fromJsObject(super.jsObject);

  /// Identifier of the button, 0-64 characters. Set to empty string by default.
  String? get id => jsObject.id;

  /// Type of the button.
  ///
  /// Set to default by default.
  ButtonType get type => ButtonType.fromType(jsObject.type);

  /// The text to be displayed on the button, 0-64 characters.
  ///
  /// Required if type is default or destructive. Irrelevant for other types.
  String? get text => jsObject.text;
}

/// {@template button_type_enum}
/// Style that indicates a button type.
/// {@endtemplate}
enum ButtonType {
  /// A button with the default style
  fault('default'),

  /// A button with the localized text “OK”
  ok('ok'),

  /// A button with the localized text “Close”
  close('close'),

  /// A button with the localized text “Cancel”
  cancel('cancel'),

  /// A button with a style that indicates a destructive action
  /// (e.g. “Remove”, “Delete”, etc.).
  destructive('destructive');

  const ButtonType(this.type);

  /// {@macro button_type_enum}
  final String type;

  /// Find a [ButtonType] from [type].
  static ButtonType fromType(String type) {
    return ButtonType.values.firstWhere(
      (e) => e.type == type,
      orElse: () => ButtonType.fault,
    );
  }
}
