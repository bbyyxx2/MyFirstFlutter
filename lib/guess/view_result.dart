import 'package:flutter/material.dart';

class ViewResult extends StatelessWidget {
  final int flag;

  const ViewResult({super.key, required this.flag});

  @override
  Widget build(BuildContext context) {

    if (flag == 1) {
      return Column(
        children: [
          Expanded(
              child: Container(
                alignment: Alignment.center,
                color: Colors.redAccent,
                child: const Text(
                  '大了',
                  style: TextStyle(
                      fontSize: 54,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              )),
          const Spacer(),
        ],
      );
    } else if (flag == -1) {
      return Column(
        children: [
          const Spacer(),
          Expanded(
              child: Container(
                alignment: Alignment.center,
                color: Colors.blueAccent,
                child: const Text(
                  '小了',
                  style: TextStyle(
                      fontSize: 54,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              )),
        ],
      );
    } else {
      return Expanded(
        child: Container(
            alignment: Alignment.center,
            color: Colors.white
        ),
      );
    }


  }
}
