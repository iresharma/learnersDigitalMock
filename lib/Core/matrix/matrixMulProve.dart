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
          body: AnimatedCrossFade(
            firstChild: Example(),
            secondChild: Text('ques'),
            duration: Duration(milliseconds: 250),
            crossFadeState:
                example ? CrossFadeState.showFirst : CrossFadeState.showSecond,
          ),
        )
      ],
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
    C = Matrix().generator(row: 3, col: 2);
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
                    width: MediaQuery.of(context).size.width / 2 - 50,
                    mat: A,
                    name: 'A'),
                ShowMatrix(
                  width: MediaQuery.of(context).size.width / 2 - 50,
                  mat: B,
                  name: 'B',
                )
              ],
            ),
          ),
          ShowMatrix(
            width: MediaQuery.of(context).size.width / 2 - 50,
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
                            OutlineButton.icon(
                              color: Colors.green,
                              textColor: Colors.green,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              label: Text('Read More'),
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '> (A + B) X C',
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: ScreenUtil().setSp(20)),
                            ),
                            OutlineButton.icon(
                              color: Colors.green,
                              textColor: Colors.green,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              label: Text('Read More'),
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
                          mat: Matrix().mul(Matrix().add(A, B), C),
                          height: ScreenUtil().setSp(140),
                          name: '(A + B)C',
                        ),
                      ],
                    ),
                  )),
            ],
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
          )
        ],
      ),
    );
  }
}

class RandomCircle extends ShapeBorder {
  @override
  // TODO: implement dimensions
  EdgeInsetsGeometry get dimensions => throw UnimplementedError();

  @override
  Path getInnerPath(Rect rect, {TextDirection textDirection}) {
    // TODO: implement getInnerPath
    throw UnimplementedError();
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection textDirection}) {
    return getClip(rect.size);
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection textDirection}) {
    // TODO: implement paint
  }

  @override
  ShapeBorder scale(double t) {
    // TODO: implement scale
    throw UnimplementedError();
  }

  Path getClip(Size size) {
    Path path = Path();

    path.moveTo(0, 40);
    path.quadraticBezierTo(size.width / 2, 0, size.width, 40);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);

    return path;
  }
}
