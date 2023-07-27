import 'dart:io';

void main()
{
  int num;
  print("enter your choice");
  print("1 for triangle");
  print("2 for rectangle");
  print("3 for circle");

  num = int.parse(stdin.readLineSync()!);

  if(num == 1)
    {
      print("enter two values for triangle ");
      int a = int.parse(stdin.readLineSync()!);
      int b = int.parse(stdin.readLineSync()!);
      var area = a*b/2;
      print(area);
    }
  if(num == 2)
    {
      print("enter values of length and width");
      int len = int.parse(stdin.readLineSync()!);
      int wid = int.parse(stdin.readLineSync()!);
      var rec = len*wid;
      print(rec);
    }
  if(num == 3)
    {
      print("enter value for circle");
      int d = int.parse(stdin.readLineSync()!);
      var cir = 3.14 * d*d;
      print(cir);
    }
}