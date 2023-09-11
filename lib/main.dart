
import 'package:flutter/material.dart';
import 'package:projects/Voice_to_text.dart';
import 'package:projects/listView.dart';
import 'SecondPage.dart';

void main() {
  runApp(const MyApp());
}


enum SampleItem { itemOne, itemTwo, itemThree }

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {

  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int _counter = 0;
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  SampleItem? selectedMenu;

  List<bool> selectedLang = [true, false];

  void performCounter(int i) {

    setState(() {        //update UI
      if(i==1){
        _counter++;
      }
      else{
        _counter--;
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done

    return Scaffold(
      key: _key,
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        actions: [
          PopupMenuButton<SampleItem>(
            initialValue: selectedMenu,
            // Callback that sets the selected popup menu item.
            onSelected: (SampleItem item) {
              setState(() {
                selectedMenu = item;
              });
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<SampleItem>>[
              const PopupMenuItem<SampleItem>(
                value: SampleItem.itemOne,
                child: Text('Item 1'),
              ),
              const PopupMenuItem<SampleItem>(
                value: SampleItem.itemTwo,
                child: Text('Item 2'),
              ),
              const PopupMenuItem<SampleItem>(
                value: SampleItem.itemThree,
                child: Text('Item 3'),
              ),
            ],
          ),
        ],
      ),
      body: Align(
        alignment: Alignment.center,
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FloatingActionButton(
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => VoiceToText()),
                );
              },
              tooltip: '...',
              child: const Icon(Icons.mic),
            ),

            ToggleButtons(

              direction: Axis.horizontal,
              onPressed: (int index) {
                setState(() {
                  for (int i = 0; i < selectedLang.length; i++) {
                    selectedLang[i] = (i == index);
                  }
                });
              },
              borderColor: Colors.green,
              borderRadius: BorderRadius.all(Radius.circular(10)),
              selectedBorderColor: Colors.green,
              selectedColor: Colors.white,
              fillColor: Colors.green,
              color: Colors.black,
              constraints: const BoxConstraints(
                minHeight: 25.0,
                minWidth: 45.0,
              ),
              isSelected: selectedLang,
              children: [
                Text('English', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold)),
                Text('বাংলা', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold)),
              ],
            ),

            const Text(
              'You have pushed the button:',
            ),
            Text(
              '${_counter}',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SecondPage()),
                );
              },
              icon: Icon(Icons.accessible_forward_rounded),
              label: Text('Next'),
            ),
            TextButton(
                onPressed: (){
                  print("Text button clicked");
                },
                onLongPress: (){
                  print("Long pressed");
                },
                child: Text("Text button"),
            ),
            OutlinedButton(
              onPressed: (){          //show dialog
                print("outlined button clicked");
                dialogBuilder(context);
              },
              onLongPress: (){
                print("Long pressed");
              },
              child: Text("Outlined button for Dialog"),
            ),

          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.green,
              ),
              child: Text(
                'Navigation Drawer',
                style: TextStyle(fontSize: 20),
              ),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: const Text(' My Profile '),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.book),
              title: const Text(' My Course '),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.workspace_premium),
              title: const Text(' Go Premium '),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.video_label),
              title: const Text(' Saved Videos '),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.edit),
              title: const Text(' Edit Profile '),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: const Text('LogOut'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      drawerEnableOpenDragGesture: true,

      floatingActionButton: Row(

        mainAxisAlignment: MainAxisAlignment.spaceEvenly,

        children: [

          FloatingActionButton(
            onPressed: (){
              performCounter(1);
              if(_key.currentState!.isDrawerOpen){
                _key.currentState?.openEndDrawer();
              }else{
                _key.currentState?.openDrawer();
              }
            },
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: (){
              performCounter(2);
            },
            tooltip: 'Increment',
            child: const Icon(Icons.remove),
          ),
          FloatingActionButton(
            onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => listView()),
              );
            },
            tooltip: '...',
            child: const Icon(Icons.account_balance),
          ),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.


    );
  }

  Future<void> dialogBuilder(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('showDialog title'),
          content: const Text(
            'A dialog is a type of modal window that\n'
                'appears in front of app content to\n'
                'for a decision to be made.',
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Disable'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Enable'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
