import 'package:flutter/material.dart';

class screenTwo extends StatelessWidget {
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
          children: <Widget>[
            Text('Screen Two'),
            FlatButton(
              color: Colors.blue,
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Go Back'),
            )
          ],
        ),
      ),
    );
  }
}
