import 'dart:io';

void main()
{
  double a,b,c,d,e;
  double total = 500;
  print("enter 5 subjects marks");
  a = double.parse(stdin.readLineSync()!);
  b = double.parse(stdin.readLineSync()!);
  c = double.parse(stdin.readLineSync()!);
  d = double.parse(stdin.readLineSync()!);
  e = double.parse(stdin.readLineSync()!);

  double sum = a+b+c+d+e;
  print("this is sum: $sum");
  double per = (sum*100) / total;
  print("this is percentage: $per");

  if(per > 75)
    {
      print("Distinction");
    }
  else if (per > 60 || per <= 75)
    {
      print("first class");
    }
  else if(per >50 || per <= 60)
    {
      print("second class");
    }
  else if (per >35 || per <= 50)
    {
      print("pass class");
    }
  else
    {
      print("fail");
    }
}