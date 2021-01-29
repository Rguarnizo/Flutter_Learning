import 'package:flutter/material.dart';

import 'package:shoes_aplication/src/widgets/orange_button.dart';

class AddCarButton extends StatelessWidget {

  final double price;
  final double scale;
  

  const AddCarButton({
    Key key,
    @required this.price,
    this.scale = 1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      width: double.infinity,
      height: 100*scale,
      decoration: BoxDecoration(
        color: Colors.black12.withOpacity(0.05),
        borderRadius: BorderRadius.circular(100),
      ),
      child: Row(
        children: [
          SizedBox(width: 20,),
          Text('\$$price',style: TextStyle(fontSize: 28*scale,fontWeight: FontWeight.bold),),
          Spacer(),
          OrangeButton(text: 'Add to car',scale: scale),
          SizedBox(width: 20,)
        ],
      ),
    );
  }
}
