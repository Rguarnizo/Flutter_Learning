part of 'helpers.dart';

showModal(BuildContext context,
    {String title, String subtitle, Function onAccept, Function onDismiss}) {
  showModalBottomSheet(
      context: context,
      builder: (context) => Container(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                Text(
                  title,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                    child: Text(
                  subtitle,
                  style: TextStyle(fontSize: 18),
                )),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [                   
                      MaterialButton(onPressed: onDismiss,color: Colors.red,child: Text('Despues...',style: TextStyle(color: Colors.white),),),
                      MaterialButton(onPressed: onAccept,color: Colors.green,child: Text('¡Vamos a ello!',style: TextStyle(color: Colors.white)),),
                    ],
                  ),
                ),
              ],
            ),
          ));
}
