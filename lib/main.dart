import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(BMIApp());
}

class BMIApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
          primarySwatch: Colors.grey),
      home: MainScreen(title: 'BMI CALCULATOR'),
    );
  }
}

class MainScreen extends StatefulWidget {
  final title;
  MainScreen({Key? key, this.title}) : super(key: key);
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  var _gender = 'g';
  var _age = 25;
  var _height = 175.0;
  var _weight = 80;
  double? _bmi;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: TextStyle(color: Colors.white),
        ),
        elevation: 0.0,
        backgroundColor: Colors.black87.withBlue(12).withRed(5),
      ),
      body: Container(
        color: Colors.black87.withBlue(12).withRed(5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 2,
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            _gender = 'm';
                          });
                        },
                        child: Container(
                          color: (_gender == 'm')
                              ? Colors.blueGrey
                              : Colors.black54.withOpacity(0.4),
                          child: Column(
                            children: [
                              Expanded(
                                flex: 3,
                                child: Icon(
                                  Icons.male,
                                  color: Colors.white,
                                  size: 80,
                                ),
                              ),
                              Expanded(
                                  flex: 1,
                                  child: Text(
                                    'MALE',
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 20.0),
                                  ))
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            _gender = 'f';
                          });
                        },
                        child: Container(
                          color: (_gender == 'f')
                              ? Colors.blueGrey
                              : Colors.black54.withOpacity(0.4),
                          child: Column(
                            children: [
                              Expanded(
                                flex: 3,
                                child: Icon(
                                  Icons.female,
                                  color: Colors.white,
                                  size: 80,
                                ),
                              ),
                              Expanded(
                                  flex: 1,
                                  child: Text(
                                    'FEMALE',
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 20.0),
                                  ))
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  color: Colors.black54.withOpacity(0.4),
                  child: Column(
                    children: [
                      Expanded(
                          flex: 1,
                          child: Center(
                              child: Text(
                            'HEIGHT',
                            style:
                                TextStyle(color: Colors.grey, fontSize: 20.0),
                          ))),
                      Expanded(
                          flex: 2,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                '$_height',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w800,
                                    fontSize: 40.0),
                              ),
                              SizedBox(
                                width: 12.0,
                              ),
                              Text(
                                'cm',
                                style: TextStyle(
                                    color: Colors.grey, fontSize: 20.0),
                              )
                            ],
                          )),
                      Expanded(
                          flex: 2,
                          child: Slider(
                            min: 90,
                            max: 220,
                            value: _height,
                            onChanged: (value) {
                              setState(() {
                                _height = value.roundToDouble();
                              });
                            },
                            label: 'test',
                            activeColor: Colors.pink,
                          )),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Container(
                        color: Colors.black54.withOpacity(0.4),
                        child: Column(
                          children: [
                            Expanded(
                                flex: 1,
                                child: Center(
                                    child: Text(
                                  'WEIGHT',
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 20.0),
                                ))),
                            Expanded(
                              flex: 2,
                              child: Text(
                                '$_weight',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w800,
                                    fontSize: 40.0),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                      child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: ElevatedButton(
                                        onPressed: () {
                                          setState(() {
                                            if (_weight > 40) {
                                              _weight -= 1;
                                            }
                                          });
                                        },
                                        child: Center(
                                            child: Icon(
                                          Icons.minimize,
                                          color: Colors.white,
                                        ))),
                                  )),
                                  Expanded(
                                      child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: ElevatedButton(
                                        onPressed: () {
                                          setState(() {
                                            if (_weight <= 200) {
                                              _weight += 1;
                                            }
                                          });
                                        },
                                        child: Center(
                                            child: Icon(
                                          Icons.add,
                                          color: Colors.white,
                                        ))),
                                  )),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Container(
                        color: Colors.black54.withOpacity(0.4),
                        child: Column(
                          children: [
                            Expanded(
                                flex: 1,
                                child: Center(
                                    child: Text(
                                  'AGE',
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 20.0),
                                ))),
                            Expanded(
                              flex: 2,
                              child: Text(
                                '$_age',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w800,
                                    fontSize: 40.0),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                      child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: ElevatedButton(
                                        onPressed: () {
                                          setState(() {
                                            if (_age > 12) {
                                              _age -= 1;
                                            }
                                          });
                                        },
                                        child: Center(
                                            child: Icon(
                                          Icons.minimize,
                                          color: Colors.white,
                                        ))),
                                  )),
                                  Expanded(
                                      child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: ElevatedButton(
                                        onPressed: () {
                                          setState(() {
                                            if (_age < 120) {
                                              _age += 1;
                                            }
                                          });
                                        },
                                        child: Center(
                                            child: Icon(
                                          Icons.add,
                                          color: Colors.white,
                                        ))),
                                  )),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.pink,
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      _bmi = _weight * 10000 / (_height * _height);
                    });
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ResultScreen(
                              bmi: _bmi,
                              title: widget.title,
                            )));
                  },
                  child: Text(
                    'CALCULATE',
                    style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                        fontWeight: FontWeight.w800),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ResultScreen extends StatelessWidget {
  String? mode;
  Color? col;
  final double? bmi;
  final title;
  ResultScreen({this.bmi, this.title}){
    if(bmi!<18.5){
      mode = 'UNDERWEIGHT';
      col = Colors.yellow;
    }else if(bmi!<24.9){
      mode = 'HEALTHY WEIGHT';
      col = Colors.green;
    }else if(bmi!<29.9){
      mode = 'OVERWEIGHT';
      col = Colors.redAccent;
    }else{
      mode = 'OBESE';
      col = Colors.red;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: TextStyle(color: Colors.white),
        ),
        elevation: 0.0,
        backgroundColor: Colors.black87.withBlue(12).withRed(5),
      ),
      body: Container(
        color: Colors.black87.withBlue(12).withRed(5),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex:1,
                child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Center(child: Text('YOUR RESULT',style: TextStyle(fontSize: 40.0,color: Colors.white,fontWeight: FontWeight.w800),)),
                ),
              ),
          Expanded(
            flex:4,
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Container(
                color: Colors.black54.withOpacity(0.4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                        flex:1,
                        child: Padding(
                          padding: const EdgeInsets.all(25.0),
                          child: Text('$mode',style: TextStyle(fontSize: 30.0,color: col,fontWeight: FontWeight.bold),),
                        )
                    ),
                    Expanded(
                        flex:1,
                        child: Text('${bmi!.toStringAsFixed(2)}',style: TextStyle(fontSize: 40.0,color: Colors.white,fontWeight: FontWeight.bold),)
                    ),
                    Expanded(
                        flex:1,
                        child: Container()
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex:1,
            child: Container(
              color: Colors.pink,
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  'RECALCULATE',
                  style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w800),
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
