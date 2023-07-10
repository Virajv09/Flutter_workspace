import 'dart:io';

void main()
{
  int count=0;

   for(int i=1;i<=5;i++)
     {
       for(int j=1;j<=i;j++)
         {
           count++;
           stdout.write(count);
         }
       stdout.writeln();
     }
}