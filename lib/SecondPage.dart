
import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('New Page'),
      ),
      body: Stack(
        children: [
          Center(       //main body
            child: Container(
                width: 300,
                height: 250,
                color: Colors.lightGreen,

                child: Column(
                  children: [
                    Card(
                      elevation: 12,
                      shadowColor: Colors.blueGrey,
                      child: Text(
                        "This is a new page..",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          backgroundColor: Colors.deepPurple
                        ),
                      ),
                    ),

                    LinearProgressIndicator(
                      value: 0.6,
                      minHeight: 40,
                      color: Colors.green,
                      backgroundColor: Colors.blue,
                    ),

                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        "Hello",
                        style: TextStyle(
                          fontSize: 21,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),

                  ],
                ),
            ),
          ),

          Positioned(
              top: 20,
              right: 25,
              height: 75,
              width: 75,
              child: Container(
                color: Colors.grey,
              ),

          ),

          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              children: [
                Expanded(
                    child: Container(
                      margin: EdgeInsets.only(
                        bottom: 20,
                        right: 20,
                        left: 20,
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: const [BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0.0, 0.0),
                          blurRadius: 10.0,
                          spreadRadius: 0.0,
                        ),],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextField(
                        //controller: textController,
                        decoration: InputDecoration(
                          hintText: "Add a new item",
                          border: InputBorder.none,
                        ),
                      ),
                    )
                ),
                Container(
                  margin: EdgeInsets.only(
                    bottom: 20,
                    right: 20,
                  ),
                  child: ElevatedButton(
                    child: Text("+", style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),),
                    onPressed: (){
                      //print(textController.text);
                      print(DateTime.now().millisecondsSinceEpoch.toString());
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blueAccent,
                      minimumSize: Size(60, 60),
                      elevation: 10,
                    ),
                  ),
                )
              ],
            ),
          )

        ],
      ),

    );
  }
}
