import 'dart:ffi';

import 'package:flutter/material.dart';
import 'custom_card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'constants.dart';
import 'calculator.dart';

enum Gender { female, male }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selecterGender;
  int height = 180;
  int wieght = 60;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: CustomCard(
                    onPress: () {
                      setState(() {
                        selecterGender = Gender.male;
                      });
                    },
                    color: selecterGender == Gender.male
                        ? kActiveColor
                        : kInActiveColor,
                    child: CustomIcon(
                      text: 'Male',
                      icon: FontAwesomeIcons.mars,
                    ),
                  ),
                ),
                Expanded(
                  child: CustomCard(
                    onPress: () {
                      setState(() {
                        selecterGender = Gender.female;
                      });
                    },
                    color: selecterGender == Gender.female
                        ? kActiveColor
                        : kInActiveColor,
                    child: CustomIcon(
                      text: 'Female',
                      icon: FontAwesomeIcons.venus,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: CustomCard(
              color: Color(0xFF1D1E33),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'HEIGHT',
                    style: klabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        height.toString(),
                        style: kBigTextStyle,
                      ),
                      Text(
                        'cm',
                        style: kLittleTextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      inactiveTrackColor: Color(0xFF8D8E98),
                      activeTrackColor: Colors.white,
                      thumbColor: Color(0xFFEB1555),
                      overlayColor: Color(0x29EB1555),
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 30.0),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      onChanged: (double newVal) {
                        setState(() {
                          height = newVal.toInt();
                        });
                      },
                      min: 120.0,
                      max: 220.0,
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: CustomCard(
                    color: Color(0xFF1D1E33),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'WEIGHT',
                          style: klabelTextStyle,
                        ),
                        Text(
                          wieght.toString(),
                          style: kBigTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  wieght--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  wieght++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: CustomCard(
                    color: Color(0xFF1D1E33),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'AGE',
                          style: klabelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kBigTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              CalculatorBrain calc =
                  CalculatorBrain(height: this.height, weight: this.wieght);
              Navigator.pushNamed(context, '/result', arguments: {
                'bmi': calc.calculateBMI(),
                'result': calc.getResult(),
                'inter': calc.getInterpretation(),
              });
            },
            child: Container(
              color: Colors.pink,
              margin: EdgeInsets.only(top: 10.0),
              child: Center(
                child: Text(
                  'Calculate',
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
              ),
              width: double.infinity,
              height: 60.0,
            ),
          )
        ],
      ),
    );
  }
}

class CustomIcon extends StatelessWidget {
  final String text;
  final IconData icon;

  CustomIcon({@required this.text, @required this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 80.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          text,
          style: klabelTextStyle,
        ),
      ],
    );
  }
}

class RoundIconButton extends StatelessWidget {
  RoundIconButton({this.icon, this.onPressed});

  final IconData icon;
  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      elevation: 6.0,
      child: Icon(icon),
    );
  }
}
