// Copyright (c) 2022, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:example/home/bloc/favorite_color_bloc.dart';
import 'package:example/home/view/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FavoriteColorBloc(),
      child: const InfoView(),
    );
  }
}

class InfoView extends StatelessWidget {
  const InfoView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Telegram/Flutter'),
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.home)),
              Tab(icon: Icon(Icons.info)),
            ],
          ),
        ),
        body: BlocListener<FavoriteColorBloc, String>(
          listenWhen: (previous, current) => previous != current,
          listener: (context, state) {
            if (state.isNotEmpty) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state),
                  duration: const Duration(seconds: 2),
                ),
              );
            }
          },
          child: const TabBarView(
            children: <Widget>[
              ColorsTabView(),
              InfoTabView(),
            ],
          ),
        ),
      ),
    );
  }
}
