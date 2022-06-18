import 'package:flutter/material.dart';
import 'package:tele_web_app/tele_web_app.dart';

class InfoTabView extends StatefulWidget {
  const InfoTabView({super.key});

  @override
  State<InfoTabView> createState() => _InfoTabViewState();
}

class _InfoTabViewState extends State<InfoTabView> {
  final tele = TeleWebApp();

  @override
  void initState() {
    tele.mainButton.onClick(() {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('You are press the main button 😁 !!'),
        ),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            const SizedBox(height: 16),
            const Text(
              'WebApp',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              'initData: ${tele.initData}',
              style: const TextStyle(fontSize: 18),
            ),
            Text(
              'viewportHeight: ${tele.viewportHeight}',
              style: const TextStyle(fontSize: 18),
            ),
            Text(
              'viewportStableHeight: ${tele.viewportStableHeight}',
              style: const TextStyle(fontSize: 18),
            ),
            Text(
              'isExpanded: ${tele.isExpanded}',
              style: const TextStyle(fontSize: 18),
            ),
            Text(
              'colorScheme: ${tele.colorScheme}',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 16),
            const Text(
              'mainButton',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              'color: ${tele.mainButton.color}',
              style: const TextStyle(fontSize: 18),
            ),
            Text(
              'text: ${tele.mainButton.text}',
              style: const TextStyle(fontSize: 18),
            ),
            Text(
              'textColor: ${tele.mainButton.textColor}',
              style: const TextStyle(fontSize: 18),
            ),
            Text(
              'isVisible: ${tele.mainButton.isVisible}',
              style: const TextStyle(fontSize: 18),
            ),
            Text(
              'isActive: ${tele.mainButton.isActive}',
              style: const TextStyle(fontSize: 18),
            ),
            Text(
              'isProgressVisible: ${tele.mainButton.isProgressVisible}',
              style: const TextStyle(fontSize: 18),
            ),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              // verticalDirection: VerticalDirection.up,

              children: [
                MaterialButton(
                  color: Colors.blue,
                  onPressed: tele.close,
                  child: IntrinsicWidth(
                    child: Row(
                      children: const [
                        Icon(Icons.close),
                        Text('close'),
                      ],
                    ),
                  ),
                ),
                MaterialButton(
                  color: Colors.blue,
                  onPressed: () {
                    tele.mainButton.hide();
                  },
                  child: IntrinsicWidth(
                    child: Row(
                      children: const [
                        Icon(Icons.vertical_align_bottom_sharp),
                        Text('hide'),
                      ],
                    ),
                  ),
                ),
                MaterialButton(
                  color: Colors.blue,
                  onPressed: () {
                    tele.mainButton.enable();
                  },
                  child: IntrinsicWidth(
                    child: Row(
                      children: const [
                        Icon(Icons.border_bottom),
                        Text('enable'),
                      ],
                    ),
                  ),
                ),
                MaterialButton(
                  color: Colors.blue,
                  onPressed: () {
                    tele.mainButton.disable();
                  },
                  child: IntrinsicWidth(
                    child: Row(
                      children: const [
                        Icon(Icons.browser_not_supported_sharp),
                        Text('disable'),
                      ],
                    ),
                  ),
                ),
                MaterialButton(
                  color: Colors.blue,
                  minWidth: 80,
                  onPressed: () {
                    tele.mainButton.show();
                  },
                  child: IntrinsicWidth(
                    child: Row(
                      children: const [Icon(Icons.upload), Text('show')],
                    ),
                  ),
                ),
                MaterialButton(
                  color: Colors.blue,
                  minWidth: 80,
                  onPressed: () {
                    final isLoading = tele.mainButton.isProgressVisible;
                    if (isLoading) {
                      tele.mainButton.hideProgress();
                    } else {
                      tele.mainButton.showProgress();
                    }
                  },
                  child: IntrinsicWidth(
                    child: Row(
                      children: const [
                        Icon(Icons.restart_alt_sharp),
                        Text('show loading')
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Text(
              'ThemeParams',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              'bgColor: ${tele.themeParams.bgColor}',
              style: const TextStyle(fontSize: 18),
            ),
            Text(
              'buttonColor: ${tele.themeParams.buttonColor}',
              style: const TextStyle(fontSize: 18),
            ),
            Text(
              'textColor: ${tele.themeParams.textColor}',
              style: const TextStyle(fontSize: 18),
            ),
            Text(
              'button_textColor: ${tele.themeParams.buttonTextColor}',
              style: const TextStyle(fontSize: 18),
            ),
            Text(
              'hintColor: ${tele.themeParams.hintColor}',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
