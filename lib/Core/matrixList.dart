import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Matrix extends StatefulWidget {
  @override
  _MatrixState createState() => _MatrixState();
}

class _MatrixState extends State<Matrix> {
  List<Map<String, dynamic>> problems = [
    {
      'Problem': '(A + B)C = AC + BC',
      'Statement': 'Prove the above expression (Distributive Law)',
      'Marks': 6
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Hero(
          tag: 'Matrix',
          child: RichText(
            text: TextSpan(children: <TextSpan>[
              TextSpan(
                  text: 'Learn ',
                  style: TextStyle(
                      fontFamily: 'ProductSans',
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: ScreenUtil().setSp(25))),
              TextSpan(
                  text: 'Matrix',
                  style: TextStyle(
                      fontFamily: 'ProductSans',
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.w400,
                      fontSize: ScreenUtil().setSp(30)))
            ]),
          ),
        ),
        leading: Hero(
          tag: 'Matrix img',
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: SizedBox(
              child: Image.asset('assets/images/matrix.png'),
              height: 20,
              width: 20,
            ),
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: problems.length + 1,
        itemBuilder: (context, index) {
          if (index == 0) {
            return Container(
              padding: EdgeInsets.all(20),
              alignment: Alignment.topLeft,
              child: RichText(
                text: TextSpan(children: <TextSpan>[
                  TextSpan(
                      text: 'Matrices, \n',
                      style: TextStyle(
                          fontFamily: 'ProductSans',
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: ScreenUtil().setSp(30))),
                  TextSpan(
                      text: 'Here are few important problems',
                      style: TextStyle(
                          fontFamily: 'ProductSans',
                          color: Colors.black45,
                          fontWeight: FontWeight.w400,
                          fontSize: ScreenUtil().setSp(20)))
                ]),
              ),
            );
          } else {
            return ListTile(
                isThreeLine: true,
                tileColor: Colors.grey.shade200,
                title: Text(
                  problems[index - 1]['Problem'],
                  style: TextStyle(
                      fontFamily: 'ProductSans', fontWeight: FontWeight.w700),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      problems[index - 1]['Statement'],
                      style: TextStyle(
                          fontFamily: 'ProductSans',
                          fontWeight: FontWeight.w200,
                          color: Colors.black),
                    ),
                    Text('Marks: ${problems[index - 1]['Marks'].toString()}',
                        style: TextStyle(
                            fontFamily: 'ProductSans',
                            fontWeight: FontWeight.w200,
                            color: Colors.black))
                  ],
                ),
                trailing: Icon(FlutterIcons.right_ant),
                onTap: () => Navigator.of(context).pushNamed('/MatMulProve'));
          }
        },
      ),
    );
  }
}
