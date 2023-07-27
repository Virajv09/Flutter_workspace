import 'dart:io';
void main()
{
  double sum = 0;
  print("enter numbers");
  double a = double.parse(stdin.readLineSync()!);
  double last = a % 10;

  while(a >=10)
    {
      a = a / 10;
    }
    double first = a;
    sum = first + last;

    print(sum);
}