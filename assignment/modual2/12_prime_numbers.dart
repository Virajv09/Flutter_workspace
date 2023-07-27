import 'dart:io';

void main() {
  int a;
  int flag = 0;

  print("enter numbers");
  a = int.parse(stdin.readLineSync()!);

  if (a == 0 || a == 1) {
    flag = 1;
  }

  for (int i = 2; i <= a / 2; ++i)
    {
      if(a % i == 0)
        {
          flag =1;
          break;

        }
    }
  if(flag ==0) {
    print(" $a is prime number");
  }
  else
    {
      print("$a is not a prime numbers");
    }
}