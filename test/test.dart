import 'package:flutter/foundation.dart';

void main(){

  Person preson = Person(name: '', age: 2, height: 0.0, wight: 0.0);
  if (kDebugMode) {
    print(preson.age);
  }
}

double bmi([ double height = 1, double wight = 20]) {
  // 具体算法
  double result = wight / (height * height);
  return result;
}

class Person {
  String name;
  int age;
  double height;
  double wight;

  Person({
    required this.name,
    required this.age,
    required this.height,
    required this.wight,
  });

  @override
  String toString() {
    return 'Person{name: $name, age: $age, height: $height, wight: $wight}';
  }
}
