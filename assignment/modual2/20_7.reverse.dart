import 'dart:io';

void main()
{
  double reverse =0;
  print("Enter number for reverse");
  double a =double.parse(stdin.readLineSync()!);

  while(a>0)
    {
      double b = a % 10;
      reverse = reverse * 10 + b;
      a /= 10;
    }
    print(reverse);
}