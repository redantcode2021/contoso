import 'package:flutter/material.dart';

class ProductPage extends StatefulWidget {
  ProductPage({Key key, this.productId}) : super(key: key);

  final String productId;

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("Product Page"),
    );
  }
}
