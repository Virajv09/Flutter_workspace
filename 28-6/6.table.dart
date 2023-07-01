import 'dart:io';

void main()
{
  print("Enter the value");
  int a =int.parse(stdin.readLineSync()!);

  for(int i=1; i<=10; i++)
  {
    int multi = a * i;
    print("$a x $i = $multi"); // print(a*i);
  }
}