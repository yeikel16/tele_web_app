import 'package:flutter/material.dart';
import 'package:tele_web_app/tele_web_app.dart';

class ColorsTabView extends StatelessWidget {
  ColorsTabView({super.key});

  final tele = TeleWebApp();

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Theme.of(context).appBarTheme.backgroundColor!,
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: Text(
              'Pick your favorite color',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: Colors.primaries.length,
              itemBuilder: (context, index) {
                final color = Colors.primaries[index];
                final rgb = color.value
                    .toRadixString(16)
                    .padLeft(8, '0')
                    .substring(2)
                    .toUpperCase();

                final colorName = colorsName[index].toUpperCase();

                return InkWell(
                  onTap: () {
                    tele.mainButton
                      ..setParams(
                        text: colorName,
                        color: '#$rgb',
                        isVisible: true,
                      )
                      ..show()
                      ..onClick(() {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(colorName),
                            duration: const Duration(seconds: 2),
                          ),
                        );
                        tele.sendData({
                          'colorName': colorName,
                          'rgb': rgb,
                        });
                      });
                  },
                  child: Container(
                    color: color,
                    height: 80,
                    child: Center(
                      child: Text(colorName),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

final colorsName = [
  'red',
  'pink',
  'purple',
  'deepPurple',
  'indigo',
  'blue',
  'lightBlue',
  'cyan',
  'teal',
  'green',
  'lightGreen',
  'lime',
  'yellow',
  'amber',
  'orange',
  'deepOrange',
  'brown',
  'blueGrey',
];
