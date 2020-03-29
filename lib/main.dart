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
          body: TabBarView(
            children: choices.map((Choice choice) {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: ChoiceCard(choice: choice),
              );
            }).toList(),
          ),

        ),
      ),
    );
  }
}

class Choice {
  const Choice({this.title, this.icon, this.testTitle2});

  final String title;
  final IconData icon;
  final String testTitle2; // as TEST by Andy
}

const List<Choice> choices = const <Choice>[
  const Choice(title: 'CAR', icon: Icons.directions_car, testTitle2: 'testTitle "CAR"'),
  const Choice(title: 'BICYCLE', icon: Icons.directions_bike, testTitle2: 'testTitle "BICYCLE"'),
/*  const Choice(title: 'BOAT', icon: Icons.directions_boat),
  const Choice(title: 'BUS', icon: Icons.directions_bus),
  const Choice(title: 'TRAIN', icon: Icons.directions_railway),
  const Choice(title: 'WALK', icon: Icons.directions_walk),
*/];



class ChoiceCard extends StatelessWidget {
  // ChoiceCard ist ein Widget welches eine Card zurückgibt,
  // über den Key ist die getätigte Auswahl ermittelbar
  const ChoiceCard({Key key, this.choice}) : super(key: key);

  final Choice choice;

  @override
  Widget build(BuildContext context) {
    // Hier choice ausgeben auf Konsole, als TEST und Hintergrundfarbe ändern
    var cardBgColor;
    print('Key ist ${this.choice.title}');
    if (this.choice.title == 'CAR') cardBgColor =  Colors.lime[100];
    else cardBgColor = Colors.green;
    // .
    final TextStyle textStyle = Theme.of(context).textTheme.headline4;
    return Card(
      color: cardBgColor /*Colors.white*/,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          // Hier statt default <Widget> etwas anderes zurückgeben?
          children: <Widget>[
            Icon(choice.icon, size: 128.0, color: textStyle.color),
            Text(choice.title, style: textStyle),
            Text(choice.testTitle2, style: textStyle)  // TEST mit ausgebautem ChoiceCard
          ],
        ),
      ),
    );
  }
}
