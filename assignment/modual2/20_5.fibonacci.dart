import 'dart:io';

void main()
{
 int first = 0;
 int sec = 1;

 int next = first + sec;

 print("enter the numbers of values");
 int n =int.parse(stdin.readLineSync()!);

 for(int i=0; i<n; ++i)
  {
    print("$first");
    first = sec;
    sec = next;
    next = first + sec;
  }


}