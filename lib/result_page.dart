import 'package:flutter/material.dart';
import 'constants.dart';

class ResultPage extends StatelessWidget {
  String bmi;
  String result;
  String inter;
  
  @override
  Widget build(BuildContext context) {
    final Map arguments = ModalRoute.of(context).settings.arguments as Map;
    bmi = arguments['bmi'];
    result = arguments['result'];
    inter = arguments['inter'];
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Result'),
        ),
        body: Column(
          children: <Widget>[
            Text(
              'Your Result',
              style: ktitleStyle,
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Color(0xFF1D1E33),
                ),
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                      result,
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: 20.0,
                      ),
                    ),
                    Text(
                      bmi,
                      style: TextStyle(
                        fontSize: 120.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        inter,
                        style: TextStyle(
                          fontSize: 25.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/');
              },
              child: Container(
                color: Colors.pink,
                margin: EdgeInsets.only(top: 10.0),
                child: Center(
                  child: Text(
                    're-Calculate',
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                ),
                width: double.infinity,
                height: 60.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
