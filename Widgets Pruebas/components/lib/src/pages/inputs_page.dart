import 'package:flutter/material.dart';



class InputsPage extends StatefulWidget {
  InputsPage({Key key}) : super(key: key);

  @override
  _InputsPageState createState() => _InputsPageState();
}

class _InputsPageState extends State<InputsPage> {


  String _nombre = '';
  String _email = '';
  String _fecha = '';
  String _poderSelecionado = 'Volar';
  List<String> _poderes = ['Volar','Rayos X','Super Aliento','Super Fuerza'];

  TextEditingController _inputFieldDateController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Inputs'),),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 20.0,horizontal: 10.0),
        children: [
          _crearNombre(),
          Divider(),
          _crearEmail(),
          Divider(),
          _crearPassword(),
          Divider(),
          _crearFecha(),
          Divider(),
          _crearDropdown(),
          Divider(),
          _mostrarInfo(),
        ],
      ),
    );

  }

  Widget _crearNombre() {
    return TextField(
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        counter: Text('Letras ${_nombre.length}'),
        hintText: 'Nombre de persona',
        helperText: 'Solo es el nombre',
        suffixIcon: Icon(Icons.accessibility),
        icon: Icon(Icons.account_circle)
      ),
      onChanged: (value) {
        _nombre = value;
        setState(() {
          
        });
      },
    );
  }

  Widget _mostrarInfo() {
    return ListTile(
      title: Text('Nombre: $_nombre'),
      subtitle: Text('Correo: $_email'),
      trailing: Text(_poderSelecionado),
    );
  }

  Widget _crearEmail() {

    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        
        hintText: 'Email',
        helperText: 'Email',
        suffixIcon: Icon(Icons.alternate_email),
        icon: Icon(Icons.email)
      ),
      onChanged: (value) {
        _email = value;
        setState(() {
          
        });
      },
    );
  }

  Widget _crearPassword() {
    return TextField(
      obscureText: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        
        hintText: 'Password',
        helperText: 'Password',
        suffixIcon: Icon(Icons.lock_open),
        icon: Icon(Icons.lock)
      ),
      onChanged: (value) {
        _email = value;
        setState(() {
          
        });
      },
    );
  }

  Widget _crearFecha() {
    return  TextField(
      controller: _inputFieldDateController,
      enableInteractiveSelection: false,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        
        hintText: 'Password',
        helperText: 'Password',
        suffixIcon: Icon(Icons.calendar_today),
        icon: Icon(Icons.perm_contact_calendar),
      ),
      onTap: (){
        FocusScope.of(context).requestFocus(new FocusNode());
        _selectDate(context);
      },
      
    );
  }

  _selectDate(BuildContext context) async{
    DateTime picked = await showDatePicker(
      context: context, 
      initialDate: DateTime.now(), 
      firstDate: DateTime(2018), 
      lastDate: DateTime(2025),
      locale: Locale('es','ES'));


      if(picked != null){
        setState(() {
          _fecha = 'Dia: ${picked.day} Mes: ${picked.month} Año: ${picked.year}';
          _inputFieldDateController.text = _fecha;
        });
      }
  }

  List<DropdownMenuItem<String>>  getOpcionesDropDown(){
    
    List<DropdownMenuItem<String>> lista = new List();

    _poderes.forEach((poder) {
      lista.add( DropdownMenuItem(
        child: Text(poder),
        value: poder,
        ));
    });

    return lista;
  }

  Widget _crearDropdown() {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.select_all),
        SizedBox(width: 30,),
        Expanded(
                  child: DropdownButton(
            items: getOpcionesDropDown(), 
            value: _poderSelecionado,
            onChanged: (opt){
              setState(() {
                _poderSelecionado = opt;
              });
            }),
        ),
      ],
    );
  }
}