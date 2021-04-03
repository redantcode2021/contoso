import 'package:flutter/material.dart';

class BottomTabs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12.0),
          topRight: Radius.circular(12.0),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            spreadRadius: 1.0,
            blurRadius: 30.0,
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          BottomTabsButton(
            imagePath: 'assets/images/tab_home.png',
          ),
          BottomTabsButton(
            imagePath: 'assets/images/tab_search.png',
          ),
          BottomTabsButton(
            imagePath: 'assets/images/tab_saved.png',
          ),
          BottomTabsButton(
            imagePath: 'assets/images/tab_logout.png',
          ),
        ],
      ),
    );
  }
}

class BottomTabsButton extends StatelessWidget {
  const BottomTabsButton({Key key, this.imagePath, this.selected})
      : super(key: key);

  final String imagePath;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 24.0,
        horizontal: 16.0,
      ),
      child: Image(
        image: AssetImage(imagePath ?? 'assets/images/tab_home.png'),
        width: 22.0,
        height: 22.0,
      ),
    );
  }
}
