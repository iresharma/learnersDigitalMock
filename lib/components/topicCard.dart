import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';

class TopicCard extends StatelessWidget {
  final String topic;
  final String asset;

  const TopicCard({Key key, @required this.topic, this.asset})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
      child: InkWell(
        onTap: () => Navigator.of(context).pushNamed('/$topic'),
        child: Container(
          height: 160,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                  width: 0.5, color: Theme.of(context).primaryColor)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Center(
                child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Hero(
                      tag: topic,
                      child: RichText(
                        text: TextSpan(children: <TextSpan>[
                          TextSpan(
                              text: 'Learn\n',
                              style: TextStyle(
                                  fontFamily: 'ProductSans',
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                  fontSize: ScreenUtil().setSp(25))),
                          TextSpan(
                              text: topic,
                              style: TextStyle(
                                  fontFamily: 'ProductSans',
                                  color: Theme.of(context).primaryColor,
                                  fontWeight: FontWeight.w700,
                                  fontSize: ScreenUtil().setSp(30)))
                        ]),
                      ),
                    )),
              ),
              Padding(
                  padding: EdgeInsets.all(20),
                  child: Hero(
                    tag: topic + ' img',
                    child: SizedBox(
                      child: Image.asset(
                        asset,
                        fit: BoxFit.contain,
                      ),
                      width: 100,
                      height: 100,
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
