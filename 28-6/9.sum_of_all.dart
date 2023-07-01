import 'dart:io';

void main()
{
  double sum =0;
  print("enter number");
  double a =double.parse(stdin.readLineSync()!);

  while(a!=0)
    {
      sum += a % 10;
      a = a / 10;
    }
    print(sum);
}