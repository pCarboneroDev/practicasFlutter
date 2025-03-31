import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:practicas_flutter/models/band.dart';
import 'package:practicas_flutter/services/socket_service.dart';
import 'package:provider/provider.dart';

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
  void initState() {
    final socketService = Provider.of<SocketService>(context, listen: false);

    socketService.socket.on('active-bands', _handleAciveBands);
    super.initState();
  }

  _handleAciveBands(dynamic payload){
      this.bands = (payload as List).map(
        (band) => Band.fromMap(band)
      ).toList();
      setState(() {});
  }

  @override
  void dispose() {
    final socketService = Provider.of<SocketService>(context, listen: false);
    socketService.socket.off('active-bands');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final socketService = Provider.of<SocketService>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('BandNames'),
        centerTitle: true,
        elevation: 1,
        actions: [
          Container(
            margin: EdgeInsets.only(right: 10),
            child: 
              (socketService.serverStatus == ServerStatus.Online)
              ? Icon(Icons.check_circle, color: Colors.blue[300])
              : Icon(Icons.offline_bolt, color: Colors.red),
          )
        ],
      ),
      body: Column(
        children: [

          _showGraph(),

          Expanded(
            child: ListView.builder(
              itemCount: bands.length,
              itemBuilder: (BuildContext context, int index) => _bandTile(bands[index])
                  ),
          )
        ],
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

    final socketService = Provider.of<SocketService>(context,listen: false);

    return Dismissible(
      key: Key(band.id),
      direction: DismissDirection.startToEnd,

      onDismissed: (direction) {
        socketService.socket.emit('delete-band', {'id': band.id});
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
              socketService.socket.emit('vote-band', {
                  'id': band.id
              });
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
    final socketService = Provider.of<SocketService>(context, listen: false);
    if (name.isNotEmpty) {
      socketService.socket.emit('create-band', {'name': name});
    }
    Navigator.pop(context);
  }


  // grafica
  Widget _showGraph(){
    Map<String, double> dataMap = new Map(); {
      //"Flutter": 5,
      bands.forEach((band){
        dataMap.putIfAbsent(band.name, () => band.votes.toDouble());
      });
    }
    return PieChart(dataMap: dataMap);
    /*return PieChart(
      dataMap: dataMap,
      animationDuration: Duration(milliseconds: 800),
      chartLegendSpacing: 32,
      chartRadius: MediaQuery.of(context).size.width / 3.2,
      initialAngleInDegree: 0,
      chartType: ChartType.ring,
      ringStrokeWidth: 32,
      centerText: "HYBRID",
      legendOptions: LegendOptions(
        showLegendsInRow: false,
        legendPosition: LegendPosition.right,
        showLegends: true,
        legendTextStyle: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      chartValuesOptions: ChartValuesOptions(
        showChartValueBackground: true,
        showChartValues: true,
        showChartValuesInPercentage: false,
        showChartValuesOutside: false,
        decimalPlaces: 1,
      ),
      // gradientList: ---To add gradient colors---
      // emptyColorGradient: ---Empty Color gradient---
    );*/
  }
}