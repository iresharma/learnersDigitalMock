import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:learners_1/Core/matrix/components/matsum.dart';
import 'package:learners_1/Core/matrix/components/showMat.dart';
import 'package:learners_1/models/matrix.dart';

class MatrixMulProve extends StatefulWidget {
  @override
  _MatrixMulProveState createState() => _MatrixMulProveState();
}

class _MatrixMulProveState extends State<MatrixMulProve> {
  bool example;

  @override
  void initState() {
    super.initState();
    example = true;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        ClipPath(
          child: Container(
            color: Theme.of(context).primaryColor,
          ),
        ),
        Scaffold(
          appBar: CupertinoNavigationBar(
            leading: IconButton(
              icon: Icon(
                FlutterIcons.back_ant,
                color: Theme.of(context).primaryColor,
              ),
              onPressed: () => Navigator.of(context).pop(),
            ),
            middle: example
                ? Text('Understand the problem')
                : Text('Try solving this'),
          ),
          floatingActionButton: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              if (example) ...{
                Container(
                  height: 40,
                  width: 40,
                  child: FloatingActionButton(
                      heroTag: null,
                      child: Icon(
                        FlutterIcons.download_ant,
                        size: 15,
                      ),
                      elevation: 2,
                      onPressed: () => print('down')),
                ),
                SizedBox(
                  height: 10,
                )
              },
              FloatingActionButton.extended(
                  backgroundColor:
                      !example ? Colors.cyan : Theme.of(context).primaryColor,
                  onPressed: () {
                    setState(() {
                      example = !example;
                    });
                  },
                  label: !example ? Text('Read Again') : Text('Solve'),
                  icon: example
                      ? Icon(FlutterIcons.arrowright_ant)
                      : Icon(FlutterIcons.arrowleft_ant))
            ],
          ),
          // body: AnimatedCrossFade(
          //   firstChild: Example(),
          //   secondChild: Solve(),
          //   duration: Duration(milliseconds: 850),
          //   crossFadeState:
          //       example ? CrossFadeState.showFirst : CrossFadeState.showSecond,
          // ),
          body: AnimatedSwitcher(
            duration: const Duration(milliseconds: 500),
            transitionBuilder: (Widget child, Animation<double> animation) {
              return ScaleTransition(child: child, scale: animation);
            },
            child: example ? Example() : Solve(),
          ),
        )
      ],
    );
  }
}

class Solve extends StatefulWidget {
  @override
  _SolveState createState() => _SolveState();
}

class _SolveState extends State<Solve> {
  Matrix A;
  Matrix B;
  Matrix C;
  int _index;

  @override
  void initState() {
    super.initState();
    A = Matrix().generator(row: 3, col: 3);
    B = Matrix().generator(row: 3, col: 3);
    C = Matrix().generator(row: 3, col: 3);
    _index = 0;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Text(
            '(A + B)C = AC + BC',
            style: TextStyle(
                fontSize: ScreenUtil().setSp(25), fontWeight: FontWeight.bold),
          ),
          Text(
            '\nLet the values of A, B and C be,',
            style: TextStyle(
                fontSize: ScreenUtil().setSp(15),
                fontWeight: FontWeight.w400,
                color: Colors.black87),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ShowMatrix(
                    width: MediaQuery.of(context).size.width < 400
                        ? 160
                        : MediaQuery.of(context).size.width / 2 - 50,
                    mat: A,
                    name: 'A'),
                ShowMatrix(
                  width: MediaQuery.of(context).size.width < 400
                      ? 160
                      : MediaQuery.of(context).size.width / 2 - 50,
                  mat: B,
                  name: 'B',
                )
              ],
            ),
          ),
          ShowMatrix(
            width: MediaQuery.of(context).size.width < 400
                ? 160
                : MediaQuery.of(context).size.width / 2 - 50,
            mat: C,
            name: 'C',
          ),
          SizedBox(
            height: 20,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Follow the following steps to solve',
                style: TextStyle(
                    fontSize: ScreenUtil().setSp(15),
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Stepper(
            physics: NeverScrollableScrollPhysics(),
            type: StepperType.vertical,
            controlsBuilder: (BuildContext context,
                {VoidCallback onStepContinue, VoidCallback onStepCancel}) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Container(
                    child: OutlineButton.icon(
                      label: Text('Show'),
                      icon: Icon(FlutterIcons.eye_fea),
                      onPressed: () => print('hi'),
                      color: Colors.red,
                      textColor: Colors.red,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                  if (_index < 4) ...{
                    SizedBox(
                      width: 20,
                    ),
                    Container(
                        child: FlatButton(
                      child: Text('Next'),
                      onPressed: () => setState(() => _index++),
                      color: Colors.green,
                      textColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                    )),
                  }
                ],
              );
            },
            currentStep: _index,
            onStepTapped: (index) {
              setState(() {
                _index = index;
              });
            },
            steps: [
              Step(
                  isActive: _index == 0,
                  title: Text(
                    'A + B',
                    style: TextStyle(
                        fontSize: ScreenUtil().setSp(20),
                        fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text('The first step is to add A & B'),
                  content: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      ShowMatrix(
                        width: MediaQuery.of(context).size.width < 400
                            ? 260
                            : MediaQuery.of(context).size.width / 1.5,
                        mat: Matrix().add(A, B),
                        height: ScreenUtil().setSp(160),
                        input: true,
                        name: 'A + B',
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  )),
              Step(
                  isActive: _index == 1,
                  title: Text(
                    '(A + B)C',
                    style: TextStyle(
                        fontSize: ScreenUtil().setSp(20),
                        fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text('The second step is to multiply A + B with C'),
                  content: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      ShowMatrix(
                        width: MediaQuery.of(context).size.width < 400
                            ? 320
                            : MediaQuery.of(context).size.width / 1.25,
                        mat: Matrix().mul(Matrix().add(A, B), C),
                        height: ScreenUtil().setSp(160),
                        input: true,
                        name: '(A + B)C',
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  )),
              Step(
                  isActive: _index == 2,
                  title: Text(
                    'AC',
                    style: TextStyle(
                        fontSize: ScreenUtil().setSp(20),
                        fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text('The third step is to multiply A & C'),
                  content: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      ShowMatrix(
                        width: MediaQuery.of(context).size.width < 400
                            ? 200
                            : MediaQuery.of(context).size.width / 2,
                        mat: Matrix().mul(A, C),
                        height: ScreenUtil().setSp(160),
                        input: true,
                        name: 'AC',
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  )),
              Step(
                  isActive: _index == 3,
                  title: Text(
                    'BC',
                    style: TextStyle(
                        fontSize: ScreenUtil().setSp(20),
                        fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text('The fourth step is to multiply B & C'),
                  content: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      ShowMatrix(
                        width: MediaQuery.of(context).size.width < 400
                            ? 200
                            : MediaQuery.of(context).size.width / 2,
                        mat: Matrix().mul(B, C),
                        height: ScreenUtil().setSp(160),
                        input: true,
                        name: 'BC',
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  )),
              Step(
                  isActive: _index == 4,
                  title: Text(
                    'AC + BC',
                    style: TextStyle(
                        fontSize: ScreenUtil().setSp(20),
                        fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text('The last step is to add AC and BC'),
                  content: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      ShowMatrix(
                        width: MediaQuery.of(context).size.width < 400
                            ? 340
                            : MediaQuery.of(context).size.width / 1.1,
                        mat: Matrix()
                            .mul(Matrix().mul(A, C), Matrix().mul(B, C)),
                        height: ScreenUtil().setSp(210),
                        input: true,
                        name: 'AC + BC',
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  )),
            ],
          ),
          SizedBox(
            height: 40,
          )
        ],
      ),
    );
  }
}

class Example extends StatefulWidget {
  @override
  _ExampleState createState() => _ExampleState();
}

class _ExampleState extends State<Example> {
  Matrix A;
  Matrix B;
  Matrix C;
  int _index;

  @override
  void initState() {
    super.initState();
    A = Matrix().generator(row: 3, col: 3);
    B = Matrix().generator(row: 3, col: 3);
    C = Matrix().generator(row: 3, col: 3);
    _index = 0;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Text(
            '(A + B)C = AC + BC',
            style: TextStyle(
                fontSize: ScreenUtil().setSp(25), fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ShowMatrix(
                    width: MediaQuery.of(context).size.width < 400
                        ? 160
                        : MediaQuery.of(context).size.width / 2 - 50,
                    mat: A,
                    name: 'A'),
                ShowMatrix(
                  width: MediaQuery.of(context).size.width < 400
                      ? 160
                      : MediaQuery.of(context).size.width / 2 - 50,
                  mat: B,
                  name: 'B',
                )
              ],
            ),
          ),
          ShowMatrix(
            width: MediaQuery.of(context).size.width < 400
                ? 160
                : MediaQuery.of(context).size.width / 2 - 50,
            mat: C,
            name: 'C',
          ),
          SizedBox(
            height: 20,
          ),
          Text('Since we have to prove the above Expression'),
          Text('We should break it into 2 parts,i.e, LHS & RHS'),
          Stepper(
            physics: NeverScrollableScrollPhysics(),
            type: StepperType.vertical,
            controlsBuilder: (BuildContext context,
                {VoidCallback onStepContinue, VoidCallback onStepCancel}) {
              return Row(
                children: <Widget>[
                  Container(
                    child: null,
                  ),
                  Container(child: null),
                ],
              );
            },
            currentStep: _index,
            onStepTapped: (index) {
              setState(() {
                _index = index;
              });
            },
            steps: [
              Step(
                  isActive: _index == 0,
                  title: Text('Left Hand Side',
                      style: TextStyle(
                          color: Colors.deepPurpleAccent,
                          fontWeight: FontWeight.w700,
                          fontSize: ScreenUtil().setSp(25))),
                  subtitle: Text('(A + B)C'),
                  content: Container(
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                              'LHS has two operations\nSumation of A and B\nMultiplation with C'),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '> A + B',
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: ScreenUtil().setSp(20)),
                            ),
                            IconButton(
                              color: Colors.green,
                              icon: Icon(FlutterIcons.info_circle_faw),
                              onPressed: () => showModalBottomSheet(
                                  context: context, builder: (_) => SumMat()),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        ShowMatrix(
                          width: MediaQuery.of(context).size.width / 1.5,
                          mat: Matrix().add(A, B),
                          height: ScreenUtil().setSp(160),
                          name: 'A + B',
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '> (A + B) X C',
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: ScreenUtil().setSp(20)),
                            ),
                            IconButton(
                              color: Colors.green,
                              icon: Icon(FlutterIcons.info_circle_faw),
                              onPressed: () => showModalBottomSheet(
                                  context: context, builder: (_) => SumMat()),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        ShowMatrix(
                          width: MediaQuery.of(context).size.width < 400
                              ? 320
                              : MediaQuery.of(context).size.width / 1.25,
                          mat: Matrix().mul(Matrix().add(A, B), C),
                          height: ScreenUtil().setSp(140),
                          name: '(A + B)C',
                        ),
                      ],
                    ),
                  )),
            ],
          ),
          SizedBox(
            height: 40,
          )
        ],
      ),
    );
  }
}

// TODO: Backgroud CLippers

// class RandomCircle extends ShapeBorder {
//   @override
//   // TODO: implement dimensions
//   EdgeInsetsGeometry get dimensions => throw UnimplementedError();

//   @override
//   Path getInnerPath(Rect rect, {TextDirection textDirection}) {
//     // TODO: implement getInnerPath
//     throw UnimplementedError();
//   }

//   @override
//   Path getOuterPath(Rect rect, {TextDirection textDirection}) {
//     return getClip(rect.size);
//   }

//   @override
//   void paint(Canvas canvas, Rect rect, {TextDirection textDirection}) {
//     // TODO: implement paint
//   }

//   @override
//   ShapeBorder scale(double t) {
//     // TODO: implement scale
//     throw UnimplementedError();
//   }

//   Path getClip(Size size) {
//     Path path = Path();

//     path.moveTo(0, 40);
//     path.quadraticBezierTo(size.width / 2, 0, size.width, 40);
//     path.lineTo(size.width, size.height);
//     path.lineTo(0, size.height);

//     return path;
//   }
// }
