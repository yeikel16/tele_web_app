// Copyright (c) 2022, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:example/home/view/view.dart';
import 'package:flutter/material.dart';
import 'package:tele_web_app/tele_web_app.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) => InfoView();
}

class InfoView extends StatelessWidget {
  InfoView({super.key});
  final tele = TeleWebApp();
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
        body: TabBarView(
          children: <Widget>[
            ColorsTabView(),
            const InfoTabView(),
          ],
        ),
      ),
    );
  }
}
