import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:learners_1/Core/matrix/components/showMat.dart';
import 'package:learners_1/models/matrix.dart';

class SumMat extends StatelessWidget {
  Matrix Sum1 = Matrix().generator(row: 1, col: 2);
  Matrix Sum2 = Matrix().generator(row: 1, col: 2);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text('Let\'s assume A and B to be as follows'),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ShowMatrix(
                  mat: Sum1,
                  name: 'A',
                  width: MediaQuery.of(context).size.width / 2 - 80,
                ),
                Text('+',
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: ScreenUtil().setSp(25))),
                ShowMatrix(
                  mat: Sum2,
                  name: 'B',
                  width: MediaQuery.of(context).size.width / 2 - 80,
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                  'To Add two or more matrices, the order of all the matrices should be same'),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                  'In this case both the matrices has (1, 2) as there order '),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'A + B = ',
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: ScreenUtil().setSp(25)),
                ),
                ShowMatrix(
                  mat: Matrix().add(Sum1, Sum2),
                  width: MediaQuery.of(context).size.width / 4,
                ),
              ],
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text('Summation of matrices is an elementwise operation,'),
            ),
            SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.center,
              child: RichText(
                text: TextSpan(children: <TextSpan>[
                  TextSpan(
                      text: '(A + B)',
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                          fontSize: ScreenUtil().setSp(20))),
                  TextSpan(
                      text: '[0,0]',
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                          fontSize: ScreenUtil().setSp(10))),
                  TextSpan(
                      text: ' = ',
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                          fontSize: ScreenUtil().setSp(20))),
                  TextSpan(
                      text: 'A',
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                          fontSize: ScreenUtil().setSp(20))),
                  TextSpan(
                      text: '[0,0]',
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                          fontSize: ScreenUtil().setSp(10))),
                  TextSpan(
                      text: ' + ',
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                          fontSize: ScreenUtil().setSp(20))),
                  TextSpan(
                      text: 'B',
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                          fontSize: ScreenUtil().setSp(20))),
                  TextSpan(
                      text: '[0,0]',
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                          fontSize: ScreenUtil().setSp(10)))
                ]),
              ),
            ),
            RichText(
              text: TextSpan(children: <TextSpan>[
                TextSpan(
                    text: '(A + B)',
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                        fontSize: ScreenUtil().setSp(20))),
                TextSpan(
                    text: '[1,1]',
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                        fontSize: ScreenUtil().setSp(10))),
                TextSpan(
                    text: ' = ',
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                        fontSize: ScreenUtil().setSp(20))),
                TextSpan(
                    text: 'A',
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                        fontSize: ScreenUtil().setSp(20))),
                TextSpan(
                    text: '[1,1]',
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                        fontSize: ScreenUtil().setSp(10))),
                TextSpan(
                    text: ' + ',
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                        fontSize: ScreenUtil().setSp(20))),
                TextSpan(
                    text: 'B',
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                        fontSize: ScreenUtil().setSp(20))),
                TextSpan(
                    text: '[1,1]',
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                        fontSize: ScreenUtil().setSp(10)))
              ]),
            ),
            SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text('As in the above example'),
            ),
            RichText(
                text: TextSpan(children: [
              TextSpan(
                  text: 'A',
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                      fontSize: ScreenUtil().setSp(20))),
              TextSpan(
                  text: '[0,0]',
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                      fontSize: ScreenUtil().setSp(10))),
              TextSpan(
                  text: ' = ${Sum1.matrix[0][0]} + ',
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                      fontSize: ScreenUtil().setSp(20))),
              TextSpan(
                  text: 'B',
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                      fontSize: ScreenUtil().setSp(20))),
              TextSpan(
                  text: '[0,0]',
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                      fontSize: ScreenUtil().setSp(10))),
              TextSpan(
                  text: ' = ${Sum2.matrix[0][0]}',
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                      fontSize: ScreenUtil().setSp(20))),
            ])),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Gives,',
              ),
            ),
            RichText(
                text: TextSpan(children: [
              TextSpan(
                  text: '(A + b)',
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                      fontSize: ScreenUtil().setSp(20))),
              TextSpan(
                  text: '[0,0]',
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                      fontSize: ScreenUtil().setSp(10))),
              TextSpan(
                  text:
                      ' = ${Sum1.matrix[0][0]} + ${Sum2.matrix[0][0]} = ${Matrix().add(Sum1, Sum2).matrix[0][0]}',
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                      fontSize: ScreenUtil().setSp(20))),
            ]))
          ],
        ),
      ),
    );
  }
}
