import 'dart:io';

void main()
{
/*
  int s1=40;
  int s2=70;
  int s3=80;
  int s4=100;
  int s5=90;
*/


  int total=500;

   print("Enter subjects name");
   int s1 = int.parse(stdin.readLineSync()!);
   int s2 = int.parse(stdin.readLineSync()!);
   int s3 = int.parse(stdin.readLineSync()!);
   int s4 = int.parse(stdin.readLineSync()!);
   int s5 = int.parse(stdin.readLineSync()!);

   var sum = s1+s2+s3+s4+s5;
   print("This is total mark = $sum");

  double per=(sum * 100)/ total;
  print("This is percentages $per");
}