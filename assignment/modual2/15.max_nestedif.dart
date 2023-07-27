import 'dart:io';

void main()
{
  int a,b,c;
  print("enter three numbers");
  a = int.parse(stdin.readLineSync()!);
  b = int.parse(stdin.readLineSync()!);
  c = int.parse(stdin.readLineSync()!);

  if(a>b)
    {
      if(a>c)
        {
          print("$a is maximum");
        }
      else{
        print("$c is maximum");
      }

    }
    else if(b>a)
    {
        if(b>c)
          {
            print("$b is maximum");
          }
        else{
          print("$c is maximum");
        }

    }

}