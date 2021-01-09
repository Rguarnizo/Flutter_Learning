import 'dart:io';

import 'package:band_names/models/band.dart';
import 'package:band_names/sevices/socket_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Band> bands = [
    Band(id: '1', name: 'Metallica', votes: 5),
    Band(id: '2', name: 'Bobo', votes: 7),
    Band(id: '3', name: 'Bibi', votes: 10),
    Band(id: '4', name: 'Jonson', votes: 1),
    Band(id: '5', name: 'Ben', votes: 4),
  ];

  @override
  void initState() {  
    super.initState();
    final socket = Provider.of<SocketService>(context,listen: false);
    socket.socket.on('active-bands', (data){
    
     this.bands = (data as List).map((e) => Band.fromMap(e)).toList();

      setState(() {
        
      });
    });

  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    final socket = Provider.of<SocketService>(context,listen: false);
    socket.socket.off('active-bands');
  }

  @override
  Widget build(BuildContext context) {

    final socket = Provider.of<SocketService>(context);

    return Scaffold(
    
      floatingActionButton: FloatingActionButton(
        onPressed: addNewBand,
        child: Icon(Icons.add),
        elevation: 2,
      ),
      appBar: AppBar(
        actions: [
          Container(
            margin: EdgeInsets.only(right: 10),
            child: socket.serverStatus == ServerStatus.Online?
            Icon(Icons.check_circle,color: Colors.blue[300],):
            Icon(Icons.offline_bolt,color: Colors.red,),
          )
        ],
        title: Text(
          'BandNames',
          style: TextStyle(color: Colors.black87),
        ),
        backgroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: bands.length,
        itemBuilder: (context, i) => bandTile(bands[i]),
      ),
    );
  }

  Widget bandTile(Band band) => Dismissible(
        key: Key(band.id),
        direction: DismissDirection.startToEnd,
        background: Container(
          color: Colors.red,
          child: Align(
            child: Text(
              'Delete Band',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            alignment: Alignment.centerLeft,
          ),
        ),
        child: ListTile(
          leading: CircleAvatar(
            child: Text(band.name.substring(0, 2)),
            backgroundColor: Colors.blue,
          ),
          title: Text(band.name),
          trailing: Text(
            '${band.votes}',
            style: TextStyle(fontSize: 20),
          ),
          onTap: () {
            print(band.name);
          },
        ),
        onDismissed: (direction) {
          print(direction);
          print('id: ${band.id}');
        },
      );

  addNewBand() {
    final textController = new TextEditingController();

    if (Platform.isAndroid) {
      return showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('New Band Name'),
              content: TextField(
                controller: textController,
              ),
              actions: [
                MaterialButton(
                  onPressed: () {
                    addBandToList(textController.text);
                  },
                  child: Text('add'),
                  textColor: Colors.blue,
                  elevation: 5,
                ),
              ],
            );
          });
    }

    showCupertinoDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: Text('New Band Name'),
          content: CupertinoTextField(
            controller: textController,
          ),
          actions: [
            CupertinoDialogAction(
              isDefaultAction: true,
              child: Text('Add'),
              onPressed: () => addBandToList(textController.text),
            ),
            CupertinoDialogAction(
              isDestructiveAction: true,
              child: Text('Dismiss'),
              onPressed: () => addBandToList(textController.text),
            )
          ],
        );
      },
    );
  }

  void addBandToList(String name) {
    if (name.length > 1) {
      this
          .bands
          .add(new Band(id: DateTime.now().toString(), name: name, votes: 0));
      setState(() {});
    }
    Navigator.pop(context);
  }
}
