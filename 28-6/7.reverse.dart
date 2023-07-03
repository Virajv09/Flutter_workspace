import 'dart:io';

void main() {
  double reverse = 0;
  print("Enter number for reverse");
  double a = double.parse(stdin.readLineSync()!);

  while (a>= 1)
  {
    if (a < 1)
      reverse = a;
    else
    {
      reverse = a % 10;

      double b = a * 10 + reverse;
      a = a / 10;
    }
    print(reverse);
  }
}