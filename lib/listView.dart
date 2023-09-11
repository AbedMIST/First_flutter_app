
import 'package:flutter/material.dart';

class listView extends StatelessWidget {

  var names = ["Raman","Rajesh","Reza", "Mouneeta","Abed","Tawfiq vai","Rafiq vai","Shisir vai"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text('ListView:' ,style: TextStyle(fontWeight: FontWeight.bold),),
        ),
        // body: ListView(
        //     children: [
        //       Text("Hello", style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold)),
        //       Text("hi", style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold)),
        //       Text("how", style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold)),
        //       Text("are", style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold)),
        //       Text("you", style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold)),
        //     ]
        // ),
        // body: ListView.builder(itemBuilder: (context, index){
        //         return Text(names[index], style: TextStyle(fontSize: 21, fontWeight: FontWeight.w500));
        //       },
        //       itemCount: names.length,
        //       itemExtent: 120,
        // )
        body: ListView.separated(itemBuilder: (context, index){
          return Text(names[index], style: TextStyle(fontSize: 21, fontWeight: FontWeight.w500));
        },
          itemCount: names.length,
          separatorBuilder: (context,index){
            return Divider(height: 150, thickness: 2,);
          },
        )
    );
  }
}
