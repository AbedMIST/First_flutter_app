
import 'dart:io';

void main(){

  print("Welcome to Dart.");

  for(int i=0;i<5;i++){
    print("Hello ${i+1}..");
  }

  List<String> names = ["Raj", "John", "Max"];
  print("Value of names is $names");
  print("Value of names[0] is ${names[0]}"); // index 0

  var list = [10,20,30];
  list.add(100);
  list.insert(1, 11);
  list.remove(30);
  print(list);

  list.removeAt(0);
  print(list);
  print(list.length);
  print(list.reversed);

  for(int x in list){
    print(x);
  }

  stdout.write("Enter your name:");
  var name = stdin.readLineSync();
  print("Hello ${name}");

}