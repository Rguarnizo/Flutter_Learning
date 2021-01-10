import 'package:flutter/material.dart';


class ChatPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(children: [
          CircleAvatar(child: Text('Te',style: TextStyle(fontSize: 15)),backgroundColor: Colors.blueAccent,),
          SizedBox(width: 10,),
          Text('Melissa Flores',style: TextStyle(color: Colors.black)),
        ],),
        
      ),
      body: Container(
        child: Column(

          children: [
            Flexible(child: ListView.builder(
              physics: BouncingScrollPhysics(),
              itemBuilder: (_,i) => Text('$i'),
              itemCount: 50,
              reverse: true,
            ),),


            Divider(height: 1,),

            Container(
              color: Colors.white,
              height: 50,
            )


          ],
        ),
      ),
     );
  }
}