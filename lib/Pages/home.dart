import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:learners_1/components/topicCard.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> topics = ['Matrix', 'Algebra', 'Probablity'];
  List<String> assets = ['matrix.png', 'algebra.png', 'probablity.png'];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: ListView.builder(
        itemCount: topics.length + 2,
        itemBuilder: (context, index) {
          if (index == 0) {
            return Container(
              padding: EdgeInsets.all(20),
              alignment: Alignment.topLeft,
              child: RichText(
                text: TextSpan(children: <TextSpan>[
                  TextSpan(
                      text: 'Hi, \n',
                      style: TextStyle(
                          fontFamily: 'ProductSans',
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: ScreenUtil().setSp(40))),
                  TextSpan(
                      text: 'Let\'s start something',
                      style: TextStyle(
                          fontFamily: 'ProductSans',
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: ScreenUtil().setSp(25)))
                ]),
              ),
            );
          } else if (index == topics.length + 1) {
            return Padding(
              padding: const EdgeInsets.only(top: 18.0),
              child: Center(
                  child: Text(
                'More topics coming soon ⏰',
                style: TextStyle(
                    fontFamily: 'ProductSans',
                    fontWeight: FontWeight.w200,
                    fontSize: ScreenUtil().setSp(15)),
              )),
            );
          } else
            return TopicCard(
                topic: topics[index - 1],
                asset: 'assets/images/${assets[index - 1]}');
        },
      ),
    );
  }
}
