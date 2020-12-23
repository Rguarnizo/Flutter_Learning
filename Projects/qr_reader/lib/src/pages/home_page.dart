import 'package:flutter/material.dart';
import 'package:qr_reader/src/pages/direcciones_page.dart';
import 'package:qr_reader/src/pages/mapas_page.dart';
import 'package:qrscan/qrscan.dart' as scanner;

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QR SCanner'),
        actions: [
        IconButton(icon: Icon(Icons.delete_forever),onPressed: (){},),
      ],),
      bottomNavigationBar: _bottonNaviBar(),
      body: _callPage(currentIndex),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.filter_center_focus),
        onPressed: () {
          scanQR();
        },
        backgroundColor: Theme.of(context).primaryColor,
      ),
    );
  }

  _bottonNaviBar() {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.map),label: 'Mapas'),
        BottomNavigationBarItem(icon: Icon(Icons.brightness_5),label: 'Direcciones'),
        
      ],
      currentIndex: currentIndex,
      onTap: (index){

        setState(() {
          currentIndex = index;
        });
      },
    );
  }

  _callPage(int paginaActual) {
    
    switch(paginaActual){
      case 0: return MapasPage();
      break;
      case 1: return DireccionesPage();
      break;
      default: return MapasPage();

    }


  }

  void scanQR() async{
    String resultScan = '';


    try{
      String cameraScanResult = await scanner.scan();
    }catch(e){
      resultScan = e.toString();
    }


    print('Future string: $resultScan');

    if(resultScan != null){
      print('Temenos Información');
    }



  }
}