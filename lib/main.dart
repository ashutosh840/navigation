import 'package:flutter/material.dart';
import 'package:navigation/screen_one.dart';
import 'package:navigation/screen_two.dart';
import 'package:provider/provider.dart';

void main() => runApp(
      // Provide the model to all widgets within the app. We're using
      // ChangeNotifierProvider because that's a simple way to rebuild
      // widgets when a model changes. We could also just use
      // Provider, but then we would have to listen to Counter ourselves.
      //
      // Read Provider's docs to learn about all the available providers.
      ChangeNotifierProvider(
        // Initialize the model in the builder. That way, Provider
        // can own Counter's lifecycle, making sure to call `dispose`
        // when not needed anymore.
        create: (context) => Counter(),
        child: MyApp(),
      ),
    );

class Counter with ChangeNotifier {
  int value = 0;

  void increment() {
    value += 1;
    notifyListeners();
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigation',

      // Start the app with the "/" named route. In this case, the app starts
      // on the FirstScreen widget.
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => HomePage(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/second': (context) => screenOne(),
        '/third': (context) => screenTwo(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Navigation Two Screen'),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton(
              color: Colors.tealAccent,
              onPressed: () {
                print('Screen One');
                Navigator.pushNamed(context, '/second');
              },
              child: Text('Screen One'),
            ),
            FlatButton(
              color: Colors.tealAccent,
              onPressed: () {
                print('Screen Two');
                Navigator.pushNamed(context, '/third');
              },
              child: Text('Screen Two'),
            ),
            Text('Text'),
            Consumer<Counter>(
              builder: (context, counter, child) => Text('${counter.value}'),
            )
          ],
        ),
      ),
    );
  }
}
