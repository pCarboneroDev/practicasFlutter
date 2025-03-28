import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:practicas_flutter/models/band.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<Band> bands = [
    Band(id: '1', name: 'Green Day', votes: 5),
    Band(id: '2', name: 'Sum 41', votes: 3),
    Band(id: '3', name: 'Linkin Park', votes: 7),
    Band(id: '4', name: 'Get Scared', votes: 1),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BandNames'),
        centerTitle: true,
        elevation: 1,
      ),
      body: ListView.builder(
        itemCount: bands.length,
        itemBuilder: (BuildContext context, int index) => _bandTile(bands[index])
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: addNewBand,
        shape: CircleBorder(),
        elevation: 1,
        child: Icon(Icons.add),
      ),
    );
  }



  Widget _bandTile(Band band) {
    return Dismissible(
      key: Key(band.id),
      direction: DismissDirection.startToEnd,

      onDismissed: (direction) {
        print('direccion: $direction');
        // borrar el bicho
      },

      background: Container(
        padding: EdgeInsets.only(left: 8.0),
        color:Colors.red,

        child: Align(
          alignment: Alignment.centerLeft,
          child: Icon(Icons.delete_outline, color: Colors.white,)
        ),
      ),
    
      child: ListTile(
            leading: CircleAvatar(
              child: Text(band.name.substring(0,2)),
              backgroundColor: Colors.blue[100],
            ),
            title: Text(band.name),
            trailing: Text('${band.votes}',style: TextStyle(fontSize: 20)),
            onTap: () {
              print(band.name);
            },
          ),
    );
  }

  addNewBand(){
    final TextEditingController textController = new TextEditingController();

    if (Platform.isAndroid){
      return showDialog(
        context: context, 
        builder: (context) {
          return AlertDialog(
            title: Text('New band name'),
            content: TextField(controller: textController),

            actions: [
              MaterialButton(
                onPressed: () => addBandToList(textController.text),
                elevation: 5,
                textColor: Colors.blue,
                shape: StadiumBorder(),
                child: Text('Add'),
              )
            ],
          );
        }
      );
    }


    showCupertinoDialog(
      context: context, 
        builder: (context) {
          return CupertinoAlertDialog(
            title: Text('New band name'),
            content: TextField(controller: textController),

            actions: [
              CupertinoDialogAction(
                onPressed: () => addBandToList(textController.text),
                child: Text('Add'),
              ),

              CupertinoDialogAction(
                onPressed: () => Navigator.pop(context),
                child: Text('Dismiss'),
              ),
            ],
          );
        }
    );
  }


  void addBandToList(String name) {
    print(name);
    if (name.isNotEmpty) {
      this.bands.add(new Band(id: DateTime.now().toString(), name: name, votes: 0));
      setState(() {});
    }
    Navigator.pop(context);
  }
}