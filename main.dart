import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Calculator',
      //themeMode: ThemeData.light(),
      // theme: ThemeData(
      //   primarySwatch: Colors.green,
      // ),
      home: MyHomePage(title: 'Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // int _counter = 0;
  String t1 = '0', t2 = '0';
  int i = 0;

  // void _incrementCounter() {
  //   setState(() {
  //     // This call to setState tells the Flutter framework that something has
  //     // changed in this State, which causes it to rerun the build method below
  //     // so that the display can reflect the updated values. If we changed
  //     // _counter without calling setState(), then the build method would not be
  //     // called again, and so nothing would appear to happen.
  //     _counter++;
  //   });
  // }
  String des(String t3) {
    int d = t3.length - 1;
    for (; d > 0; d--) {
      if (t3[d] != '0') {
        //t2=t1[d];
        break;
      }
    }
    if (t3.length != 1) {
      if (t3[d] == '.') {
        t3 = t3.substring(0, d);
      } else {
        t3 = t3.substring(0, d + 1);
      }
    }
    return t3;
  }

  String epi(String t3) {
    if (t3[0] == '+' || t3[0] == '-') {
      if (t3[1] == 'π') {
        t3 = t3[0] + (pi).toString() + t3.substring(2, t3.length);
      } else if (t3[1] == 'e') {
        t3 = t3[0] + (e).toString() + t3.substring(2, t3.length);
      }
    } else {
      if (t3[0] == 'π') {
        t3 = (pi).toString() + t3.substring(1, t3.length);
      } else if (t3[0] == 'e') {
        t3 = (e).toString() + t3.substring(1, t3.length);
      }
    }
    if (t3[t3.length - 1] == 'π') {
      t3 = t3.substring(0, t3.length - 1) + (pi).toString();
    } else if (t3[t3.length - 1] == 'e') {
      t3 = t3.substring(0, t3.length - 1) + (e).toString();
    }
    return t3;
  }

  void display(String n) {
    if ((n == '0' ||
            n == '1' ||
            n == '2' ||
            n == '3' ||
            n == '4' ||
            n == '5' ||
            n == '6' ||
            n == '7' ||
            n == '8' ||
            n == '9' ||
            n == '.' ||
            n == 'e' ||
            n == 'π') &&
        (t1.length <= 25)) {
      if (t1 == '0') {
        t1 = '';
        t2 = '';
        if (n == 'e' || n == 'π') {
          t1 = t1 + n + '×';
          i = 1;
        } else {
          t1 = t1 + n;
        }
      } else {
        if (n == 'e' || n == 'π') {
          if ((t1.length == 1) &&
              (t1[t1.length - 1] == '+' || t1[t1.length - 1] == '-')) {
            //t2 = t1[t1.length - 1];
            t1 = t1 + n + '×';
            i = 1;
          } else if (t1[t1.length - 1] == '+' ||
              t1[t1.length - 1] == '-' ||
              t1[t1.length - 1] == '×' ||
              t1[t1.length - 1] == '÷' ||
              t1[t1.length - 1] == '%' ||
              t1[t1.length - 1] == '^') {
            t1 = t1 + n;
          } else {
            //t2 = t1[t1.length - 1];
            display('=');
            t1 = t1 + '×' + n;
            i = 1;
          }
        } else if (n == '.') {
          int j = t1.length - 1;
          //t2='en';
          for (; j >= 0; j--) {
            //t2='loop : $j';
            if (t1[j] == '+' ||
                t1[j] == '-' ||
                t1[j] == '×' ||
                t1[j] == '÷' ||
                t1[j] == '%' ||
                t1[j] == '^') {
              //t2='op';
              break;
            }
            if (t1[j] == '.') {
              t2 = '!';
              break;
            }
          }
          if (j == -1) {
            t1 = t1 + '.';
            //t2 = 'add';
          }
        } else {
          t1 = t1 + n;
        }
      }
    } else if (n == 'sin' ||
        n == 'cos' ||
        n == 'tan' ||
        n == 'ln' ||
        n == 'sinh' ||
        n == 'cosh' ||
        n == 'tanh' ||
        n == '|x|' ||
        n == 'x!' ||
        n == '1/x' ||
        n == 'e\u02e3' ||
        n == 'sin\u207B\u00B9' ||
        n == 'cos\u207B\u00B9' ||
        n == 'tan\u207B\u00B9' ||
        n == '√' ||
        n == '3√' ||
        n == 'x\u00B2' ||
        n == '+/-') {
      String t = n, s = t1;
      display('=');
      switch (t) {
        case 'cos':
          {
            t1 = cos(double.parse(t1)).toStringAsFixed(10);
            t2 = '$t($s)';
          }
          break;
        case 'sin':
          {
            t1 = sin(double.parse(t1)).toStringAsFixed(10);
            t2 = '$t($s)';
          }
          break;
        case 'tan':
          {
            t1 = tan(double.parse(t1))
                .toStringAsFixed(10); //AsFixed(//decimal nos)
            t2 = '$t($s)';
          }
          break;
        case 'ln':
          {
            t1 = log(double.parse(t1)).toStringAsFixed(10);
            t2 = '$t($s)';
          }
          break;
        case 'sinh':
          {
            t1 = ((pow(e, double.parse(t1)) - pow(e, -double.parse(t1))) / 2)
                .toStringAsFixed(10); //tan(double.parse(t1)).toString();
            t2 = '$t($s)';
          }
          break;
        case 'cosh':
          {
            t1 = ((pow(e, double.parse(t1)) + pow(e, -double.parse(t1))) / 2)
                .toStringAsFixed(10); //tan(double.parse(t1)).toString();
            t2 = '$t($s)';
          }
          break;
        case 'tanh':
          {
            t1 = ((pow(e, double.parse(t1)) - pow(e, -double.parse(t1))) /
                    ((pow(e, double.parse(t1)) + pow(e, -double.parse(t1))) /
                        2))
                .toStringAsFixed(10); //tan(double.parse(t1)).toString();
            t2 = '$t($s)';
          }
          break;
        case '|x|':
          {
            double a = double.parse(t1);
            if (a < 0) {
              a = -a;
            }
            t2 = '|($s)|';
            t1 = a.toStringAsFixed(10);
          }
          break;
        case 'x!':
          {
            int a = int.parse(t1);
            int n = 1;
            if (a < 0) {
              t2 = "Error!Negative No!";
            } else {
              for (int i = 1; i <= a; ++i) {
                n *= i;
              }
            }
            t2 = '$s!';
            t1 = n.toStringAsFixed(10);
          }
          break;
        case '1/x':
          {
            double a = double.parse(t1);
            t1 = (1 / a).toStringAsFixed(10);
            t2 = '1÷($s)';
          }
          break;
        case 'e\u02e3':
          {
            t1 = pow(e, double.parse(t1)).toStringAsFixed(10);
            t2 = 'e^($s)';
          }
          break;
        case 'sin\u207B\u00B9':
          {
            t1 = asin(double.parse(t1)).toStringAsFixed(10);
            t2 = '$t($s)';
          }
          break;
        case 'cos\u207B\u00B9':
          {
            t1 = acos(double.parse(t1)).toStringAsFixed(10);
            t2 = '$t($s)';
          }
          break;
        case 'tan\u207B\u00B9':
          {
            t1 = atan(double.parse(t1)).toStringAsFixed(10);
            t2 = '$t($s)';
          }
          break;
        case '√':
          {
            t1 = sqrt(double.parse(t1)).toStringAsFixed(10);
            t2 = '$t($s)';
          }
          break;
        case '3√':
          {
            t1 = pow(double.parse(t1), (1 / 3)).toStringAsFixed(10);
            t2 = '$t($s)';
          }
          break;
        case 'x\u00B2':
          {
            t1 = pow(double.parse(t1), 2).toStringAsFixed(10);
            t2 = '($s)^2';
          }
          break;
        case '+/-':
          {
            t1 = ((-1) * double.parse(t1)).toStringAsFixed(10);
            t2 = '($s)';
          }
          break;
      }
      t1 = des(t1);
    } else if (n == '+' ||
        n == '-' ||
        n == '×' ||
        n == '÷' ||
        n == '%' ||
        n == '^') {
      if ((n == '+' || n == '-') && (t1 == '0')) {
        t1 = '';
        t2 = '';
        --i;
      }
      if ((t1.length == 1) &&
          (n == '×' || n == '÷' || n == '%' || n == '^') &&
          (t1[0] == '+' ||
              t1[0] == '-' ||
              t1[0] == '×' ||
              t1[0] == '÷' ||
              t1[0] == '%' ||
              t1 == '0' ||
              t1 == '^')) {
        t1 = '0';
        t2 = "Invalid!!";
      } else if ((t1.length == 1) && (t1[0] == '+' || t1[0] == '-')) {
        t1 = n;
      } else {
        if ((t1.length > 1) &&
            (t1[t1.length - 1] == '+' ||
                t1[t1.length - 1] == '-' ||
                t1[t1.length - 1] == '×' ||
                t1[t1.length - 1] == '÷' ||
                t1[t1.length - 1] == '%' ||
                t1[t1.length - 1] == '^')) {
          t1 = t1.substring(0, t1.length - 1) + n;
        } else {
          t1 = t1 + n;
          ++i;
        }
      }
      if (i == 2) {
        int j = 0;
        if (t1[0] == '-' || t1[0] == '+') {
          j = 1;
        }
        for (; j < t1.length; j++) {
          if (t1[j] == '+' ||
              t1[j] == '-' ||
              t1[j] == '×' ||
              t1[j] == '÷' ||
              t1[j] == '%' ||
              t1[j] == '^') {
            break;
          }
        }
        String o = t1[j], t = t1;
        t2 = t1.substring(j + 1, t1.length - 1);
        t2 = epi(t2);
        double num;
        if (t1[0] == '-') {
          t1 = t1.substring(1, j);
          t1 = epi(t1);
          num = -(double.parse(t1));
        } else {
          t1 = t1.substring(0, j);
          //setState(() {});
          t1 = epi(t1);
          num = double.parse(t1);
        }
        i = 1;
        switch (o) {
          case '+':
            {
              t1 = (num + double.parse(t2)).toStringAsFixed(10);
            }
            break;
          case '-':
            {
              t1 = (num - double.parse(t2)).toStringAsFixed(10);
            }
            break;
          case '×':
            {
              t1 = (num * (double.parse(t2))).toStringAsFixed(10);
            }
            break;
          case '÷':
            {
              t1 = (num / (double.parse(t2))).toStringAsFixed(10);
            }
            break;
          case '%':
            {
              t1 = ((num / 100) * (double.parse(t2))).toStringAsFixed(10);
            }
            break;
          case '^':
            {
              t1 = pow(num, (double.parse(t2))).toStringAsFixed(10);
            }
            break;
        }
        t1 = des(t1);
        t1 = t1 + n;
        t2 = t.substring(0, t.length - 1);
      }
      //t2='$i';
    } else if (n == 'C') {
      t1 = '0'; //epi(t1);//'0';
      t2 = '0'; //pi.toString();
      i = 0;
    } else if (n == '=') {
      int j = t1.length - 1;
      String t = t1, o;
      double num;

      if (t1[j] == '+' ||
          t1[j] == '-' ||
          t1[j] == '×' ||
          t1[j] == '÷' ||
          t1[j] == '%' ||
          t1[j] == '^') {
        t1 += '0';
        //t2='hello';
        t = t1;
        //setState(() { });
      }
      t1 = epi(t1);
      if (t1[0] == '-' || t1[0] == '+') {
        j = 1;
      } else {
        j = 0;
      }
      for (; j < t1.length; j++) {
        if (t1[j] == '+' ||
            t1[j] == '-' ||
            t1[j] == '×' ||
            t1[j] == '÷' ||
            t1[j] == '%' ||
            t1[j] == '^') {
          break;
        }
      }
      if (j == t1.length) {
      } else {
        o = t1[j];
        t2 = t1.substring(j + 1, t1.length);
        if (t1[0] == '-') {
          t1 = t1.substring(1, j);
          num = -(double.parse(t1));
        } else {
          t1 = t1.substring(0, j);
          num = double.parse(t1);
        }
        switch (o) {
          case '+':
            {
              t1 = (num + double.parse(t2)).toStringAsFixed(10);
            }
            break;
          case '-':
            {
              t1 = (num - double.parse(t2)).toStringAsFixed(10);
            }
            break;
          case '×':
            {
              t1 = (num * (double.parse(t2))).toStringAsFixed(10);
            }
            break;
          case '÷':
            {
              t1 = (num / (double.parse(t2))).toStringAsFixed(10);
            }
            break;
          case '%':
            {
              t1 = ((num / 100) * (double.parse(t2))).toStringAsFixed(10);
            }
            break;
          case '^':
            {
              t1 = pow(num, (double.parse(t2))).toStringAsFixed(10);
            }
            break;
        }
      }
      t1 = des(t1);
      i = 0;
      t2 = t;
    } else if (n == 'bac') {
      String res = '';
      if (t1[t1.length - 1] == '+' ||
          t1[t1.length - 1] == '-' ||
          t1[t1.length - 1] == '×' ||
          t1[t1.length - 1] == '÷' ||
          t1[t1.length - 1] == '%' ||
          t1[t1.length - 1] == '^') {
        --i;
      }
      if ((t1 != '') && (t1.isNotEmpty)) {
        res = t1.substring(0, t1.length - 1);
      }
      t1 = res;
      res = '';
      if ((t2 != '') && (t2.isNotEmpty)) {
        res = t2.substring(0, t2.length - 1);
      }
      t2 = res;
    }

    if (t1 == '') {
      t1 = '0';
      t2 = '0';
    }
    // int d=0;
    // for( ;d<t1.length;d++){
    //   if(t1[d]=='.') {
    //     break;
    //   }
    // }
    // int f=0;
    // for(int i=d; i<t1.length-1;i++)
    //   {
    //     if(t1[i+1]!='0')
    //       {
    //         f=1;
    //       }
    //   }
    // if(f==0){
    //   t1=t1.substring(0,d);
    // }
    // else{
    //   for(int i=t1.length-1;i>d;i--)
    //     {
    //       if(t1[i]!='0')
    //         {
    //           break;
    //         }
    //     }
    //   t1=t1.substring(0,i);
    // }
    setState(() {});
  }

  Widget _buttonbuild(String txt, Color b, Color T) {
    return InkWell(
      radius: 46.7,
      onTap: () {
        display(txt);
      },
      child: CircleAvatar(
        backgroundColor: b, //Colors.orange,//const Color(0x87ACCDFF),
        foregroundColor: b, //Colors.orange,//const Color(0x87ACCDFF),
        child: Center(
            child: Text(txt,
                style: TextStyle(
                    fontSize: 45, color: T //Colors.black//Colors.green
                    ))),
        radius: 46.7,
      ),
    );
  }

  Widget _sbuttonbuild(String txt, Color b, Color T) {
    return InkWell(
      radius: 46.7,
      onTap: () {
        display(txt);
      },
      child: CircleAvatar(
        backgroundColor: b, //Colors.orange,//const Color(0x87ACCDFF),
        foregroundColor: b, //Colors.orange,//const Color(0x87ACCDFF),
        child: Center(
            child: Text(txt,
                style: TextStyle(
                    fontSize: 38, color: T //Colors.black//Colors.green
                    ))),
        radius: 46.7,
      ),
    );
  }

  Widget _buildCard() {
    return SizedBox(
      height: 200,
      width: 409,
      child: Card(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
            top: Radius.circular(20),
          ),
        ),
        color: const Color(0x87ACCDFF),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: SizedBox(
                height: 126,
                width: 400,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(
                          height: 120,
                          width: 320,
                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: Text(
                              t1,
                              style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 30,
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: IconButton(
                            icon: const Icon(Icons.backspace_outlined),
                            onPressed: () {
                              display('bac');
                            },
                            color: Colors.redAccent,
                            iconSize: 30.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const Divider(
              thickness: 3,
              color: Colors.black,
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: SizedBox(
                height: 50,
                width: 400,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 10, 16.0, 10),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Text(
                      t2,
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 25,
                        overflow: TextOverflow.fade,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _rbuildbuttonGrid() => SizedBox(
        height: 507,
        width: 101.4, // fixed height
        child: SingleChildScrollView(
          child: Column(children: [
            SizedBox(
              height: 403.6,
              width: 101.4,
              child: GridView.count(
                //maxCrossAxisExtent: 150,
                padding: const EdgeInsets.all(4),
                mainAxisSpacing: 8,
                crossAxisSpacing: 10,
                crossAxisCount: 1,
                children: <Widget>[
                  _buttonbuild('×', Colors.orange, Colors.black),
                  _buttonbuild('-', Colors.orange, Colors.black),
                  _buttonbuild('+', Colors.orange, Colors.black),
                  _buttonbuild('^', Colors.orange, Colors.black), //x\u02b8
                  _buttonbuild('√', Colors.orange, Colors.black),
                  _buttonbuild('1/x', Colors.orange, Colors.black),
                  _buttonbuild('x\u00B2', Colors.orange, Colors.black),

                  _buttonbuild('3√', Colors.orange, Colors.black),
                ],
              ),
            ),
            SizedBox(
              height: 98.4,
              width: 101.4,
              child: GridView.count(
                //maxCrossAxisExtent: 150,
                padding: const EdgeInsets.all(4),
                mainAxisSpacing: 8,
                crossAxisSpacing: 10,
                crossAxisCount: 1,
                children: <Widget>[
                  _buttonbuild('=', Colors.redAccent, Colors.black),
                ],
              ),
            ),
          ]),
        ),
      );

  Widget _lbuildbuttonGrid() => Column(
        children: [
          SizedBox(
            height: 101.4,
            width: 308.2, // fixed height
            child: GridView.count(
              //maxCrossAxisExtent: 150,
              padding: const EdgeInsets.all(4),
              mainAxisSpacing: 8,
              crossAxisSpacing: 10,
              crossAxisCount: 3,
              children: <Widget>[
                _buttonbuild('C', Colors.redAccent, Colors.black),
                _buttonbuild('÷', Colors.orange, Colors.black),
                _buttonbuild('%', Colors.orange, Colors.black),
              ],
            ),
          ),
          SizedBox(
            height: 405.6,
            width: 308.2, // fixed height
            child: GridView.count(
              //maxCrossAxisExtent: 150,
              padding: const EdgeInsets.all(4),
              mainAxisSpacing: 8,
              crossAxisSpacing: 10,
              crossAxisCount: 3,
              children: <Widget>[
                _buttonbuild('7', const Color(0x87ACCDFF), Colors.orange),
                _buttonbuild('8', const Color(0x87ACCDFF), Colors.orange),
                _buttonbuild('9', const Color(0x87ACCDFF), Colors.orange),
                _buttonbuild('4', const Color(0x87ACCDFF), Colors.orange),
                _buttonbuild('5', const Color(0x87ACCDFF), Colors.orange),
                _buttonbuild('6', const Color(0x87ACCDFF), Colors.orange),
                _buttonbuild('1', const Color(0x87ACCDFF), Colors.orange),
                _buttonbuild('2', const Color(0x87ACCDFF), Colors.orange),
                _buttonbuild('3', const Color(0x87ACCDFF), Colors.orange),
                _buttonbuild('+/-', const Color(0x87ACCDFF), Colors.orange),
                _buttonbuild('0', const Color(0x87ACCDFF), Colors.orange),
                _buttonbuild('.', const Color(0x87ACCDFF), Colors.orange),
                _buttonbuild('ln', const Color(0x87ACCDFF), Colors.orange),
                _buttonbuild('π', const Color(0x87ACCDFF), Colors.orange),
                _buttonbuild('e', const Color(0x87ACCDFF), Colors.orange),
                _buttonbuild('x!', const Color(0x87ACCDFF), Colors.orange),
                _buttonbuild('|x|', const Color(0x87ACCDFF), Colors.orange),
                _buttonbuild('e\u02e3', const Color(0x87ACCDFF), Colors.orange),
                _buttonbuild('sin', const Color(0x87ACCDFF), Colors.orange),
                _buttonbuild('cos', const Color(0x87ACCDFF), Colors.orange),
                _buttonbuild('tan', const Color(0x87ACCDFF), Colors.orange),
                _sbuttonbuild(
                    'sin\u207B\u00B9', const Color(0x87ACCDFF), Colors.orange),
                _sbuttonbuild(
                    'cos\u207B\u00B9', const Color(0x87ACCDFF), Colors.orange),
                _sbuttonbuild(
                    'tan\u207B\u00B9', const Color(0x87ACCDFF), Colors.orange),
                _sbuttonbuild('sinh', const Color(0x87ACCDFF), Colors.orange),
                _sbuttonbuild('cosh', const Color(0x87ACCDFF), Colors.orange),
                _sbuttonbuild('tanh', const Color(0x87ACCDFF), Colors.orange),
              ],
            ),
          ),
        ],
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        //const Color(0x87ACCDFF),
        toolbarOpacity: 0.75,
        bottomOpacity: 0.5,
        elevation: 20,
        leading: const Icon(
          Icons.calculate_outlined,
          size: 30,
          color: Colors.black,
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
        title: Text(widget.title),
        titleTextStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
            letterSpacing: 2,
            fontFamily: 'Raleway',
            color: Colors.black),
        actions: const [
          IconButton(
              icon: Icon(Icons.brightness_2_rounded),
              onPressed: null,
              color: Colors.black),
        ],
      ),
      backgroundColor: const Color(0x180303FF),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const SizedBox(
              height: 3,
            ),
            _buildCard(),
            // const Text('Hello',
            //     style: TextStyle(fontSize: 40, color: Colors.green)),
            const SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                _lbuildbuttonGrid(),
                Align(
                    alignment: Alignment.topRight, child: _rbuildbuttonGrid()),
              ],
            ),
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      // onPressed: _incrementCounter,
      // tooltip: 'Delete',
      // child: const Text('=',
      // style: TextStyle(
      // fontSize: 40,
      // )),
      // hoverElevation: 20,
      // hoverColor: const Color(0xFFD50018),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
