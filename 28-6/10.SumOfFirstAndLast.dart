import 'dart:io';
void main()
{
  int last;
  int sum = 0;
  print("enter numbers");
  int a = int.parse(stdin.readLineSync()!);
  last = a % 10;

  while(a >=10)
    {
      a = a / 10 as int ;
    }
    int first = a;
    sum = first + last;

    print(sum);
}