import 'package:flutter/material.dart';

class ListRow extends StatelessWidget {
  //
  final String image;

  ListRow({this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.network(
        image,
        fit: BoxFit.cover,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
      ),
    );
  }
}
