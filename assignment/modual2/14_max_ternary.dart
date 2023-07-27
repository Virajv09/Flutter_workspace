import 'dart:io';

void main()
{

  int a = 10;
  int b = 20;
  int c = 30;
  int max;

  max = (a>b)?(a>c ? a:c):(b>c ? b:c);

  print("$max is a maximum number");

}