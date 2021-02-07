part of 'widgets.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 30),
        width: size.width,        
        child: GestureDetector(
          onTap: (){
            
          },
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
            alignment: Alignment.centerLeft,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black12, blurRadius: 5, offset: Offset(0, 5))
                ]),
                child: Text('¿A dónde iremos hoy?',style: TextStyle(color: Colors.black87, ),),
          ),
        ),
      ),
    );
  }
}
