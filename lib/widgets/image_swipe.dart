import 'package:flutter/material.dart';

class ImageSwipe extends StatefulWidget {
  ImageSwipe({Key key, this.imageList}) : super(key: key);

  final List imageList;

  @override
  _ImageSwipeState createState() => _ImageSwipeState();
}

class _ImageSwipeState extends State<ImageSwipe> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400.0,
      child: PageView(
        children: [
          for (var i = 0; i < widget.imageList.length; i++)
            Container(
              child: Image.network(
                "${widget.imageList[i]}",
                fit: BoxFit.cover,
              ),
            ),
        ],
      ),
    );
  }
}
