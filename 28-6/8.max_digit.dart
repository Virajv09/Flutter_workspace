import 'dart:io';

void main()
{
  print("enter number");
  double a = double.parse(stdin.readLineSync()!);

  double large = 0;
  double b = 0;

  while(a>0)
  {
    b = a%10;
     if(b > large)
       {
         large = b;
       }
     a = a/10;
  }
  print(large);
}