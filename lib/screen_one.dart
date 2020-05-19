import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'main.dart';


class screenOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Navigation Two Screen'),
      ),
      body: Container(
        width: double.infinity,
        height:double.infinity ,
        child: Column(
          children: <Widget>[
            Text('Screen One'),
            FlatButton(
              onPressed: (){

                Provider.of<Counter>(context,listen:false).increment();
                Navigator.pop(context);
              },
              child: Text('Go Back'),
            )

          ],
        ) ,
      ),
    );
  }
}
