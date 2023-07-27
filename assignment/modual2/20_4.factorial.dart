import 'dart:io';

void main()
{
  print("Enter numbers");
  int a = int.parse(stdin.readLineSync()!);
  int fact=1;


  for(int i=1;i<=a;i++)
    {
      fact=fact*i;
    }
   print(fact);

}