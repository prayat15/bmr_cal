import "package:flutter/material.dart";
import "dart:math";

void main() => runApp(
    MaterialApp(
        title: 'BMR Calc',
        theme: ThemeData(
          primaryColor: Colors.redAccent,
          accentColor: Colors.redAccent,
        ),

        home: HomeScreen()
    )
);

class HomeScreen extends StatefulWidget {
  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {

  List _tenureTypes = [ 'Male(s)', 'Female(s)' ];
  String _tenureType = "Female(s)";
  String _bmrResult = "";
  String _bmrResult1 = "";

  final TextEditingController _age = TextEditingController();
  final TextEditingController _height = TextEditingController();
  final TextEditingController _weight = TextEditingController();

  bool _switchValue = true;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text("BMR Calculator"),
            elevation: 0.0
        ),

        body: Center(
            child: Container(
                child: Column(
                  children: <Widget>[
                    Container(
                        padding: EdgeInsets.all(20.0),
                        child: TextField(
                          controller: _age,
                          decoration: InputDecoration(
                              labelText: "Enter Age"
                          ),
                          keyboardType: TextInputType.number,

                        )
                    ),

                    Container(
                        padding: EdgeInsets.all(20.0),
                        child: TextField(
                          controller: _height,
                          decoration: InputDecoration(
                              labelText: "Height"
                          ),
                          keyboardType: TextInputType.number,
                        )
                    ),

                    Container(
                        padding: EdgeInsets.all(20.0),
                        child: Row(
                          children: <Widget>[
                            Flexible(
                                flex: 4,
                                fit: FlexFit.tight,
                                child: TextField(
                                  controller: _weight,
                                  decoration: InputDecoration(
                                      labelText: "Weight"
                                  ),
                                  keyboardType: TextInputType.number,
                                )
                            ),

                            Flexible(
                                flex: 1,
                                child: Column(
                                    children: [
                                      Text(
                                          _tenureType,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold
                                          )
                                      ),
                                      Switch(
                                          value: _switchValue,
                                          onChanged: (bool value) {
                                            print(value);

                                            if( value ) {
                                              _tenureType = _tenureTypes[1];
                                            } else {
                                              _tenureType = _tenureTypes[0];
                                            }

                                            setState(() {
                                              _switchValue = value;
                                            });
                                          }

                                      )
                                    ]
                                )
                            )
                          ],
                        )

                    ),

                    Flexible(
                        fit: FlexFit.loose,
                        child: FlatButton(
                            onPressed: _handleCalculation,
                            child: Text("Calculate"),
                            color: Colors.redAccent,
                            textColor: Colors.white,
                            padding: EdgeInsets.only(top: 10.0, bottom: 10.0, left: 24.0, right: 24.0)


                        )

                    ),

                    emiResultsWidget(_bmrResult)

                  ],
                )
            )
        )
    );
  }

  void _handleCalculation() {

    //  Amortization
    //  A = Payemtn amount per period
    //  P = Initial Printical (loan amount)
    //  r = interest rate
    //  n = total number of payments or periods

    double male = 0;
    double female = 0;
    int a = int.parse(_age.text);
    double h = double.parse(_height.text);
    double w = double.parse(_weight.text);



    male=((10*w)+(6.25*h)-(5*a)+5);
    female=((10*w)+(6.25*h)-(5*a)-161);

    _bmrResult = male.toStringAsFixed(2);
    _bmrResult1 = female.toStringAsFixed(2);

    setState(() {

    });
  }


  Widget emiResultsWidget(bmrResult) {

    bool canShow = false;
    String _bmrResult = bmrResult;

    if( _bmrResult.length > 0 )
    //else(_bmrResult1.length <
    {
      canShow = true;
    }
    return
      Container(
          margin: EdgeInsets.only(top: 40.0),
          child: canShow ? Column(
              children: [
                Text("Your Monthly BMR is",
                    style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold
                    )
                ),
                Container(
                    child: Text(_bmrResult,
                        style: TextStyle(
                            fontSize: 50.0,
                            fontWeight: FontWeight.bold
                        )
                    )
                )
              ]
          ) : Container()
      );
  }
}