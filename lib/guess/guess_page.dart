import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_first_flutter/guess/view_result.dart';
import 'package:toast/toast.dart';

class GuessPage extends StatefulWidget {
  const GuessPage({super.key, required this.title});

  final String title;

  @override
  State<GuessPage> createState() => _GuessPageState();
}

class _GuessPageState extends State<GuessPage> {
  String _counter = '';
  int _randomValue = 0;
  int _guessStatus = 0;
  final TextEditingController _controller = TextEditingController();

  void _generateRandomValue() {
    setState(() {
      Random random = Random();
      _randomValue = random.nextInt(100);
      _counter = '';
      _guessStatus = 0;
      //根据_randomValue的位数来设置_counter是一个*还是多个*的string
      for (int i = 0; i < _randomValue.toString().length; i++) {
        _counter += '*';
      }
    });
  }

  void _checkValue() {
    setState(() {
      int guess = int.parse(_controller.text);
      if (guess == _randomValue) {
        _counter = _randomValue.toString();
        _guessStatus = 0;
      } else if (guess > _randomValue) {
        _guessStatus = 1;
      } else if (guess < _randomValue) {
        _guessStatus = -1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var toastContext = ToastContext();
    toastContext.init(context);
    return Scaffold(
      appBar: AppBar(
        leading: PopupMenuButton<String>(
          icon: const Icon(Icons.menu, color: Colors.black),
          itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
             const PopupMenuItem<String>(
              value: 'Item 1',
              child: Text('Item 1'),
            ),
            const PopupMenuItem<String>(
              value: 'Item 2',
              child: Text('Item 2'),
            ),
          ],
          onSelected: (String value) {
            // 在这里处理选中的值
            Toast.show(value, duration: Toast.lengthShort, gravity: Toast.bottom);
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.check, color: Colors.blue),
            onPressed: _checkValue,
            splashRadius: 20,
          ),
        ],
        title: TextField(
          controller: _controller,
          keyboardType: TextInputType.number, //键盘类型: 数字
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          onSubmitted:(value){
            _checkValue();
          },
          decoration: const InputDecoration( //装饰
              filled: true,
              //填充
              fillColor: Color(0xffF3F6F9),
              //填充颜色
              constraints: BoxConstraints(maxHeight: 35),
              //约束信息
              border: UnderlineInputBorder( //边线信息
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.all(Radius.circular(6))
              ),
              hintText: '输入 0~99 之间的数字',
              hintStyle: TextStyle(fontSize: 14)
          ),
        ),
      ),
      body: Stack(
        children: [
          ViewResult(flag: _guessStatus),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  '点击生成随机数值：',
                ),
                Text(
                  _counter,
                  style: Theme
                      .of(context)
                      .textTheme
                      .headlineMedium,
                ),
              ],
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _generateRandomValue,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
