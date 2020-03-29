//import 'dart:html';

import 'package:flutter/material.dart';

void main() => runApp(TabbedAppBarSample());

class TabbedAppBarSample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DATAmove.org - the transition company [Materialpp.title]',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: DefaultTabController(
        length: choices.length,
        child: Scaffold(
          appBar: AppBar(
            title: const Text(
              'DATAmove.org - the transition company [appBar.title]',
              textAlign: TextAlign.center,
            ),
            centerTitle: true,
            bottom: TabBar(
              isScrollable: true,
              tabs: choices.map((Choice choice) {
                //  print(choice.title);
//                final String label = choice.title.toLowerCase();
//                print(label);
/*                return Column(
                  children: <Widget>[
                    Center(
                      child: Text(label),
                    )
                  ],
                );
*/
                return Tab(
                  text: choice.title,
                  icon: Icon(choice.icon),
                );
              }).toList(),
            ),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Center(
                child: Text(
                  "DATAmove.org [appBar.body.Column.Center.Text]",
                  style: TextStyle(
                      fontSize: 27.0,
                      color: const Color(0xFF000000),
                      fontWeight: FontWeight.w200,
                      fontFamily: "Roboto"),
                  textAlign: TextAlign.center,
                ),
              ),
              Center(
                child: Text(
                  "the transition company [appBar.body.Column.Center.Text]",
                  style: TextStyle(
                      fontSize: 12.0,
                      color: const Color(0xFF000000),
                      fontWeight: FontWeight.w200,
                      fontFamily: "Roboto"),
                  textAlign: TextAlign.center,
                ),
              ),
              TabBarView(
                children: <Widget>[
                  Center(child: Text(Choice(title: 'CAR', icon: Icons.directions_car).title)),
                  Center(child: Text(Choice(title: 'BICYCLE', icon: Icons.directions_bike).title)),
                  Center(child: Text(Choice(title: 'BOAT', icon: Icons.directions_boat).title)),
                  Center(child: Text(Choice(title: 'BUS', icon: Icons.directions_bus).title)),
                  Center(child: Text(Choice(title: 'TRAIN', icon: Icons.directions_railway).title)),
                  Center(child: Text(Choice(title: 'WALK', icon: Icons.directions_walk).title)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Choice {
  const Choice({this.title, this.icon});

  final String title;
  final IconData icon;
}

const List<Choice> choices = const <Choice>[
  const Choice(title: 'CAR', icon: Icons.directions_car),
  const Choice(title: 'BICYCLE', icon: Icons.directions_bike),
  const Choice(title: 'BOAT', icon: Icons.directions_boat),
  const Choice(title: 'BUS', icon: Icons.directions_bus),
  const Choice(title: 'TRAIN', icon: Icons.directions_railway),
  const Choice(title: 'WALK', icon: Icons.directions_walk),
];

class ChoiceCard extends StatelessWidget {
  const ChoiceCard({Key key, this.choice}) : super(key: key);

  final Choice choice;

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = Theme.of(context).textTheme.headline4;
    return Card(
      color: Colors.white,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(choice.icon, size: 128.0, color: textStyle.color),
            Text(choice.title, style: textStyle),
          ],
        ),
      ),
    );
  }
}
