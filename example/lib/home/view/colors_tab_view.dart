import 'package:example/home/bloc/favorite_color_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ColorsTabView extends StatelessWidget {
  const ColorsTabView({
    super.key,
  });

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
                final colorName = colorsName[index].toUpperCase();
                return InkWell(
                  onTap: () => context.read<FavoriteColorBloc>().add(
                        PickColor(
                          color: 'Color: $colorName',
                        ),
                      ),
                  child: Container(
                    color: color,
                    height: 80,
                    child: Center(
                      child: Text(
                        colorName,
                        // style: TextStyle(color: Colors.white),
                      ),
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
