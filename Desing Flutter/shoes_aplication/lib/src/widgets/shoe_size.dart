import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoes_aplication/src/models/shoe_model.dart';

class ShoePreview extends StatelessWidget {
  final bool fullScreen;


  const ShoePreview({Key key, this.fullScreen = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: fullScreen? EdgeInsets.symmetric(horizontal: 0):EdgeInsets.symmetric(horizontal: 30),
      child: Container(
        width: double.infinity,
        height: 400,
        decoration: BoxDecoration(
          color: Color(0xffFFCF53),
          borderRadius: fullScreen? BorderRadius.circular(0):BorderRadius.circular(50)
        ),
        child: Column(
          children: [        
            _ShoeWithShadow(),
                      
            fullScreen? Container():_ShoeSizes()

          ],
        ),
      ),
    );
  }
}

class _ShoeSizes extends StatelessWidget {
  const _ShoeSizes({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
        _ShoeSizesBox(number: 7,),
        _ShoeSizesBox(number: 7.5,),
        _ShoeSizesBox(number: 8,),
        _ShoeSizesBox(number: 8.5,),
        _ShoeSizesBox(number: 9),
        _ShoeSizesBox(number: 9.5,),
        
      ],
      ),
    );
  }
}

class _ShoeSizesBox extends StatelessWidget {

  final double number;

  const _ShoeSizesBox({
    Key key,
    @required this.number,
    
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final shoeProv = Provider.of<ShoeModel>(context);

    return GestureDetector(
      onTap: () => shoeProv.talla = number,
      child: Container(
        alignment: Alignment.center,
        width: 45,
        height: 45,
        decoration: BoxDecoration(
          color: shoeProv.talla == number? Color(0xffEB8C00):Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow:shoeProv.talla == number? [
            BoxShadow(color: Colors.black26,blurRadius: 10),
          ]
          :[],

        ),

        child: Text('${number.toString().replaceAll('.0', '')}',style: TextStyle(
          color: shoeProv.talla == number? Colors.white:Color(0xffF1A23A),
          fontSize: 16,
          fontWeight: FontWeight.bold
        )),

      ),
    );
  }
}


class _ShoeWithShadow extends StatelessWidget {
  const _ShoeWithShadow({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(30),
      child: Stack(
        children: [
          Positioned(bottom: 20,right: 0,child: _ShoeShadow()),
          Image(image: AssetImage('assets/imgs/azul.png'),)
        ],
      ),
    );
  }
}

class _ShoeShadow extends StatelessWidget {
  const _ShoeShadow({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -0.5,
      child: Container(
        width: 200,
        height: 100,
        
        decoration: BoxDecoration(
          
          borderRadius: BorderRadius.circular(100),
          boxShadow: [
            BoxShadow(color: Colors.black26,blurRadius: 40)
          ]
        ),
      ),
    );
  }
}