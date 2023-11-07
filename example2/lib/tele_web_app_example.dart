import 'package:flutter/material.dart';
import 'package:tele_web_app/tele_web_app.dart';

class TeleWebAppExample extends StatelessWidget {
  TeleWebAppExample({super.key});

  final TeleWebApp twa = TeleWebApp();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Center(child: Text('TeleWebApp'))),
        body: Builder(
            builder: (context) {

              backButtonCallback() {
                showSnackBarText(context, 'backButton.onClick callback called');
              }

              try {
                TeleWebApp twa = TeleWebApp();
                return ListView(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // SizedBox(
                    //   height: 200,
                    //   child: GridView.count(
                    //     crossAxisCount: 4,
                    //     children: [
                    //       colorBox('bgColor', twa.themeParams.bgColor),
                    //       colorBox('textColor', twa.themeParams.textColor),
                    //       colorBox('hintColor', twa.themeParams.hintColor),
                    //       colorBox('linkColor', twa.themeParams.linkColor),
                    //       colorBox('buttonColor', twa.themeParams.buttonColor),
                    //       colorBox('buttonTextColor', twa.themeParams.buttonTextColor),
                    //       colorBox('secondaryBgColor', twa.themeParams.secondaryBgColor),
                    //     ],
                    //   ),
                    // ),

                    FilledButton(
                        onPressed: () => twa.expand(),
                        child: const Text('expand')
                    ),
                    ExpansionTile(
                      title: const Center(child: Text('Theme Params')),
                      initiallyExpanded: false,
                      children: [
                        colorBox('bgColor', /*"#660088"*/twa.themeParams.bgColor),
                        colorBox('textColor', twa.themeParams.textColor),
                        colorBox('hintColor', twa.themeParams.hintColor),
                        colorBox('linkColor', twa.themeParams.linkColor),
                        colorBox('buttonColor', twa.themeParams.buttonColor),
                        colorBox('buttonTextColor', twa.themeParams.buttonTextColor),
                        colorBox('secondaryBgColor', twa.themeParams.secondaryBgColor),
                      ].padding(10)
                    ),

                    ExpansionTile(
                        title: const Center(child: Text('Back Button')),
                        initiallyExpanded: false,
                        children: [
                          FilledButton(
                              onPressed: () => twa.backButton.show(),
                              child: const Text('backButton.show')
                          ),
                          FilledButton(
                              onPressed: () => twa.backButton.hide(),
                              child: const Text('backButton.hide')
                          ),
                          FilledButton(
                              onPressed: () {
                                showSnackBarText(context, 'backButton.onClick pressed');
                                twa.backButton.onClick(backButtonCallback);
                              },
                              child: const Text('backButton.onClick(backButtonCallback)')
                          ),

                          FilledButton(
                              onPressed: () {
                                showSnackBarText(context, 'backButton.offClick pressed');
                                twa.backButton.offClick(backButtonCallback);
                              },
                              child: const Text('backButton.offClick(backButtonCallback)')
                          ),

                          FilledButton(
                              onPressed: () {
                                showSnackBarText(context, 'backButton.onClick anonymous pressed');
                                twa.backButton.onClick(() => showSnackBarText(context, 'backButton.onClick anonymous called'));
                              },
                              child: const Text('backButton.onClick(anonymous func)')
                          ),

                          FilledButton(
                              onPressed: () {
                                showSnackBarText(context, 'backButton.offClick anonymous pressed');
                                twa.backButton.offClick(() => showSnackBarText(context, 'backButton.onClick anonymous called'));
                              },
                              child: const Text('backButton.offClick(anonymous func)')
                          ),
                        ].padding(10)
                    ),
                    // Column(
                    //   mainAxisSize: MainAxisSize.min,
                    //   children: [
                    //     colorBox('bgColor', /*"#660088"*/twa.themeParams.bgColor),
                    //     colorBox('textColor', twa.themeParams.textColor),
                    //     colorBox('hintColor', twa.themeParams.hintColor),
                    //     colorBox('linkColor', twa.themeParams.linkColor),
                    //     colorBox('buttonColor', twa.themeParams.buttonColor),
                    //     colorBox('buttonTextColor', twa.themeParams.buttonTextColor),
                    //     colorBox('secondaryBgColor', twa.themeParams.secondaryBgColor),
                    //   ],
                    // ),

                    variableValue('isClosingConfirmationEnabled', twa.isClosingConfirmationEnabled),

                    FilledButton(
                        onPressed: () => twa.openLink('http://google.com', tryInstantView: true),
                        child: const Text('openLink:[tryInstantView = true]')
                    ),
                    FilledButton(
                        onPressed: () => twa.openLink('http://google.com', tryInstantView: false),
                        child: const Text('openLink:[tryInstantView = false]')
                    ),
                    FilledButton(
                        onPressed: () => twa.openTelegramLink('tg://telegram'),
                        child: const Text('openTelegramLink (tg://telegram) [NOT WORKING]')
                    ),
                    FilledButton(
                        onPressed: () => twa.openTelegramLink('https://t.me/telegram'),
                        child: const Text('openTelegramLink (https://t.me/telegram) [ONLY WORKING]')
                    ),
                    FilledButton(
                        onPressed: () => twa.openTelegramLink('https://telegram.me/telegram'),
                        child: const Text('openTelegramLink (https://telegram.me/telegram) [NOT WORKING]')
                    ),
                    FilledButton(
                        onPressed: () => twa.showAlert('Alert message', () => showSnackBarText(context, 'Alert Popup closed')),
                        child: const Text('showAlert')
                    ),
                    FilledButton(
                        onPressed: () => twa.showConfirm('Confirm message', (_) => showSnackBarText(context, 'Confirm is: ${_.toString()}')),
                        child: const Text('showConfirm')
                    ),
                    FilledButton(
                        onPressed: () => twa.showScanQrPopup(ScanQrPopupParams(text: "Text under the 'Scan QR'"), (_) {
                          showSnackBarText(context, 'QR text is: [$_]');
                          return true;
                        }),
                        child: const Text('showScanQrPopup:[returned true]')
                    ),
                    FilledButton(
                        onPressed: () => twa.showScanQrPopup(ScanQrPopupParams(text: "Text under the 'Scan QR'"), (_) {
                          showSnackBarText(context, 'QR text is: [$_]');
                          return false;
                        }),
                        child: const Text('showScanQrPopup:[returned false]')
                    ),
                    FilledButton(
                        onPressed: () async => Future.delayed(const Duration(seconds: 5), () => twa.closeScanQrPopup()),
                        child: const Text('closeScanQrPopup in 5 seconds')
                    ),
                    FilledButton(
                        onPressed: () => twa.readTextFromClipboard((_) => showSnackBarText(context, 'Clipboard text: [$_]')),
                        child: const Text('readTextFromClipboard')
                    ),
                    FilledButton(
                        onPressed: () => twa.requestWriteAccess((_) => showSnackBarText(context, 'Request write access: [$_]')),
                        child: const Text('requestWriteAccess')
                    ),
                    FilledButton(
                        onPressed: () => twa.requestContact((_) => showSnackBarText(context, 'Contact request: ${_.toString()}')),
                        child: const Text('requestContact')
                    ),
                  ].padding(10),
                );
              } catch (e, s) {
                print("exception: [$e], [$s]");
                return Text('error');
              }
            }
        )
    );
  }

}

void showSnackBarText(BuildContext context, String text) {
  var snackBar = SnackBar(
    content: Text(text),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

Widget variableValue(String name, dynamic value) => Row(
  mainAxisAlignment: MainAxisAlignment.spaceAround,
  children: [
    Text("$name :"),
    Text("[${value.toString()}]")
  ],
);

Widget colorBox(String name, String? colorCode) => Row(
  // mainAxisSize: MainAxisSize.min,
  mainAxisAlignment: MainAxisAlignment.spaceAround,
  children: [
    Text('$name ($colorCode)'),
    SizedBox(
        height: 50,
        width: 50,
        child: colorCode != null ? ColoredBox(color: hexToColor(colorCode),) : const Text('UNDEFINED')
    ),
  ],
);

Color hexToColor(String code) => Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);

extension PaddingList on List<Widget> {
  List<Widget> padding([double paddingValue = 10]) => map((w) => Padding(padding: EdgeInsets.symmetric(vertical: paddingValue, horizontal: paddingValue), child: w,)).toList();
}