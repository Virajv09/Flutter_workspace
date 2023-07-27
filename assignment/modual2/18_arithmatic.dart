import 'dart:io';

int a = 4;
int b = 5;

arithmetic()
{
  return a+b;
}

subtraction()
{
  return a - b;
}

multiplication()
{
  return a * b;
}
division()
{
  return a/b;
}

void main()
{

  var num;
  print("enter your choice");
  print("1 for addition");
  print("2 for subtraction");
  print("3 for multiplication");
  print("4 for division");

  num = double.parse(stdin.readLineSync()!);
  // int a = int.parse(stdin.readLineSync()!);
  // int b = int.parse(stdin.readLineSync()!);

  switch(num)
      {
    case 1:print(arithmetic());
    break;

    case 2:print(subtraction());
    break;

    case 3:print(multiplication());
    break;

    case 4:print(division());
    break;

    default:print("not valid number");
    break;
  }
}