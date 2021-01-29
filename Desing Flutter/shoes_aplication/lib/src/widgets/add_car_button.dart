import 'package:flutter/material.dart';
import 'package:shoes_aplication/src/widgets/orange_button.dart';

class AddCarButton extends StatelessWidget {

  final double price;
  

  const AddCarButton({
    Key key,
    @required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      width: double.infinity,
      height: 100,
      decoration: BoxDecoration(
        color: Colors.black12.withOpacity(0.05),
        borderRadius: BorderRadius.circular(100),
      ),
      child: Row(
        children: [
          SizedBox(width: 20,),
          Text('\$$price',style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold),),
          Spacer(),
          OrangeButton(text: 'Add to car',),
          SizedBox(width: 20,)
        ],
      ),
    );
  }
}
