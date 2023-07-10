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
    for(j=5; j>s;j--)
    {
      stdout.write(" $i");
    }
    stdout.writeln();
  }
}