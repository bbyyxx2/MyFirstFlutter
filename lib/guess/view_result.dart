import 'package:flutter/material.dart';

class ViewResult extends StatelessWidget {
  final Color color;
  final String info;

  const ViewResult({Key? key, required this.color, required this.info})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
          alignment: Alignment.center,
          color: color,
          child: Text(
            info,
            style: const TextStyle(
                fontSize: 54,
                color: Colors.white,
                fontWeight: FontWeight.bold),
          ),
        ));
  }
}
