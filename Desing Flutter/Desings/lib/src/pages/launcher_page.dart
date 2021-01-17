import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LauncherPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Diseños Flutter'),
      ),
      drawer: _MenuPrincipal(),
      body: _ListaOpciones(),
    );
  }
}

class _ListaOpciones extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        physics: BouncingScrollPhysics(),
        itemBuilder: (_, i) => ListTile(
              leading: FaIcon(
                FontAwesomeIcons.slideshare,
                color: Colors.blue,
              ),
              title: Text('Hola Mundo'),
              trailing: Icon(Icons.chevron_right),
              onTap: () => null,
            ),
        separatorBuilder: (_, i) => Divider(
              color: Colors.blue,
            ),
        itemCount: 10);
  }
}

class _MenuPrincipal extends StatelessWidget {
  const _MenuPrincipal({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        child: Column(
          children: [
            SafeArea(
                child: Container(
                padding: EdgeInsets.all(20),
                width: double.infinity,
                height: 200,
                child: CircleAvatar(
                  child: Text(
                    'FH',
                    style: TextStyle(fontSize: 50),
                  ),
                ),
              ),
            ),
            Expanded(
              child: _ListaOpciones(),
            ),
            ListTile(
              leading: Icon(Icons.lightbulb_outline,color:Colors.blue),
              title:Text('Dark Mode'),
              trailing: Switch.adaptive(value: true, onChanged: (value){}),
            ),
            ListTile(
              leading: Icon(Icons.dashboard_customize,color:Colors.blue),
              title:Text('Custom Theme'),
              trailing: Switch.adaptive(value: true, onChanged: (value){}),
            )
          ],
        ),
      ),
    );
  }
}
