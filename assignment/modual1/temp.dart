import 'dart:io';

void main()
{
  double c,f;
  print("enter centigrade=");
  c = double.parse(stdin.readLineSync()!);

  f=(c*9/5)+32;

  print("fahrenheit= $f");

}
