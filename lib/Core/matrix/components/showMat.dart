import 'package:flutter/material.dart';
import 'package:learners_1/models/matrix.dart';

class ShowMatrix extends StatelessWidget {
  final double width;
  final double height;
  final Matrix mat;
  final String name;
  final TextStyle style;
  final TextStyle nameStyle;

  const ShowMatrix(
      {Key key,
      this.height,
      @required this.width,
      @required this.mat,
      this.style: const TextStyle(
        fontSize: 15,
      ),
      this.name: '',
      this.nameStyle:
          const TextStyle(fontSize: 20, fontWeight: FontWeight.w700)})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map<int, double> sizes = {2: 50, 3: 40, 4: 30};
    List<int> temp = [];
    mat.matrix.forEach((element) {
      temp.addAll(element);
    });
    return Container(
      height: height ?? sizes[mat.col] * mat.row,
      width: width,
      child: name.isEmpty
          ? Center(
              child: Container(
                  width: width,
                  decoration: BoxDecoration(
                      border: Border(
                    bottom: BorderSide.none,
                    top: BorderSide.none,
                    left: BorderSide(width: 1, color: Colors.black),
                    right: BorderSide(width: 1, color: Colors.black),
                  )),
                  child: GridView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: temp.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: mat.col,
                          crossAxisSpacing: 0,
                          mainAxisSpacing: 0),
                      itemBuilder: (context, index) => Container(
                            child: Center(
                              child: Text(
                                temp[index].toString(),
                                style: style,
                              ),
                            ),
                          ))),
            )
          : Row(
              children: [
                Text(
                  '$name = ',
                  style: nameStyle,
                ),
                Container(
                    width: width - (nameStyle.fontSize * name.length) - 20,
                    decoration: BoxDecoration(
                        border: Border(
                      bottom: BorderSide.none,
                      top: BorderSide.none,
                      left: BorderSide(width: 1, color: Colors.black),
                      right: BorderSide(width: 1, color: Colors.black),
                    )),
                    child: GridView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: temp.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: mat.col,
                            crossAxisSpacing: 0,
                            mainAxisSpacing: 0),
                        itemBuilder: (context, index) => Container(
                              child: Center(
                                child: Text(
                                  temp[index].toString(),
                                  style: style,
                                ),
                              ),
                            )))
              ],
            ),
    );
  }
}
