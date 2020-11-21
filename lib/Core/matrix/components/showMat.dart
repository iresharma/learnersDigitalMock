import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:learners_1/models/matrix.dart';

class ShowMatrix extends StatefulWidget {
  final double width;
  final double height;
  final Matrix mat;
  final String name;
  final TextStyle style;
  final TextStyle nameStyle;
  final bool input;

  const ShowMatrix(
      {Key key,
      this.height,
      @required this.width,
      @required this.mat,
      this.style: const TextStyle(fontSize: 15, color: Colors.black),
      this.name: '',
      this.nameStyle:
          const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
      this.input: false})
      : super(key: key);

  @override
  _ShowMatrixState createState() => _ShowMatrixState();
}

class _ShowMatrixState extends State<ShowMatrix> {
  Map<int, double> sizes = {2: 50, 3: 40, 4: 30};
  List<int> temp = [];
  List<int> expanded = [];
  TextEditingController _controller = new TextEditingController();
  List<int> cons = [];

  @override
  void initState() {
    super.initState();
    if (widget.input) {
      temp = List.generate(widget.mat.row * widget.mat.col, (index) => null);
      widget.mat.matrix.forEach((element) {
        expanded.addAll(element);
      });
    } else {
      widget.mat.matrix.forEach((element) {
        temp.addAll(element);
      });
      print(temp);
    }
  }

  bool check() {
    bool ret = true;
    for (int i = 0; i < expanded.length; i++) {
      if (expanded[i] != temp[i] && temp[i] != null) {
        setState(() => cons.add(i));
        ret = false;
      }
    }
    return ret;
  }

  @override
  Widget build(BuildContext context) {
    check();
    return Container(
      height: widget.height ?? sizes[widget.mat.col] * widget.mat.row,
      width: widget.width,
      child: widget.name.isEmpty
          ? Center(
              child: Container(
                  width: widget.width,
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
                          crossAxisCount: widget.mat.col,
                          crossAxisSpacing: 0,
                          mainAxisSpacing: 0),
                      itemBuilder: (context, index) => Container(
                            child: Center(
                              child: Text(
                                temp[index] == null
                                    ? '_'
                                    : temp[index].toString(),
                                style: widget.style,
                              ),
                            ),
                          ))),
            )
          : Row(
              children: [
                Text(
                  '${widget.name} = ',
                  style: widget.nameStyle,
                ),
                Container(
                    width: widget.width -
                        (widget.nameStyle.fontSize * widget.name.length) -
                        20,
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
                            crossAxisCount: widget.mat.col,
                            crossAxisSpacing: 0,
                            mainAxisSpacing: 0),
                        itemBuilder: (context, index) => Container(
                              child: Center(
                                child: temp[index] == null
                                    ? IconButton(
                                        icon: Icon(FlutterIcons.edit_2_fea),
                                        onPressed: () => showDialog(
                                            context: context,
                                            builder: (_) => AlertDialog(
                                                  title: Text('Input Value'),
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10)),
                                                  content: TextField(
                                                    controller: _controller,
                                                  ),
                                                  actions: [
                                                    FlatButton(
                                                      onPressed: () =>
                                                          Navigator.of(context)
                                                              .pop(),
                                                      child: Text(
                                                        'Cancel',
                                                      ),
                                                      textColor: Colors.red,
                                                    ),
                                                    FlatButton(
                                                        onPressed: () {
                                                          int x;
                                                          if (_controller
                                                                  .text[0] ==
                                                              '-') {
                                                            x = int.parse(
                                                                _controller.text
                                                                    .substring(
                                                                        1));
                                                            setState(() =>
                                                                temp[index] =
                                                                    x * -1);
                                                          } else {
                                                            setState(() => temp[
                                                                    index] =
                                                                int.parse(
                                                                    _controller
                                                                        .text));
                                                          }
                                                          _controller.clear();
                                                          Navigator.of(context)
                                                              .pop();
                                                        },
                                                        child: Text('Add'))
                                                  ],
                                                )),
                                      )
                                    : InkWell(
                                        child: Text(
                                          temp[index].toString(),
                                          style: TextStyle(
                                            color: cons.contains(index)
                                                ? Colors.red
                                                : widget.style.color,
                                            fontWeight: cons.contains(index)
                                                ? FontWeight.bold
                                                : widget.style.fontWeight,
                                          ),
                                        ),
                                        onTap: () => showDialog(
                                            context: context,
                                            builder: (_) => AlertDialog(
                                                  title: Text('Input Value'),
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10)),
                                                  content: TextField(
                                                    controller: _controller,
                                                  ),
                                                  actions: [
                                                    FlatButton(
                                                      onPressed: () =>
                                                          Navigator.of(context)
                                                              .pop(),
                                                      child: Text(
                                                        'Cancel',
                                                      ),
                                                      textColor: Colors.red,
                                                    ),
                                                    FlatButton(
                                                        onPressed: () {
                                                          setState(() => temp[
                                                                  index] =
                                                              int.parse(
                                                                  _controller
                                                                      .text));
                                                          _controller.clear();
                                                          Navigator.of(context)
                                                              .pop();
                                                        },
                                                        child: Text('Add'))
                                                  ],
                                                )),
                                      ),
                              ),
                            )))
              ],
            ),
    );
  }
}
