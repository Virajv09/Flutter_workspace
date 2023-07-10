import 'dart:io';

void main()
{
  int i,j,s;
  for(i=1; i<=5; i++)
    {
      for(s=0;s!=(5-i); s++)
        {
          stdout.write(" ");
        }
      for(j=i; j>=1;j--)
        {
            stdout.write(j);
        }
      stdout.writeln();
    }
}