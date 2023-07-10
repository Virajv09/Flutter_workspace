

import 'dart:io';

void main() {
  //int a=4;
  // int b=3;

  print("enter numbers");
  String a = stdin.readLineSync().toString();
  String? b = stdin.readLineSync();
 print(a);
 print(b);

  var e =stdin.readLineSync();
  if(e!=null)
    {
      int.parse(e);
    }

  print(e);


}