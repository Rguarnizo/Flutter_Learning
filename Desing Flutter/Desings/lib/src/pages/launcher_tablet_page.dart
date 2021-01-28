import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:headers/src/models/layout_model.dart';
import 'package:headers/src/pages/slideshow_page.dart';
import 'package:headers/src/theme/theme.dart';
import 'package:provider/provider.dart';
import '../routes/routes.dart';

class LauncherTabletPage extends StatelessWidget {

  

  @override
  Widget build(BuildContext context) {

    final appTheme = Provider.of<ThemeChanger>(context);
    final layout = Provider.of<LayoutModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Diseños Flutter - Tablet'),
        backgroundColor: appTheme.currentTheme.accentColor,
      ),
      drawer: _MenuPrincipal(),
      body: Row(
        children: [
          Container(
            width:300,
            height: double.infinity,
            child: _ListaOpciones(),
          ),
          Container(
            width: 1,
            height: double.infinity,
            color: appTheme.darkTheme? Colors.grey:appTheme.currentTheme.accentColor,
          ),
          Expanded(child: 
          layout.currentPage
          )
          
        ],
      ),
    );
  }
}

class _ListaOpciones extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final appTheme = Provider.of<ThemeChanger>(context);
     final layout = Provider.of<LayoutModel>(context);



    return ListView.separated(
        physics: BouncingScrollPhysics(),
        itemBuilder: (_, i) => ListTile(
              leading: FaIcon(
                pageRoutes[i].icon,
                color: appTheme.currentTheme.accentColor
              ),
              title: Text(pageRoutes[i].titulo),
              trailing: Icon(Icons.chevron_right),
              onTap: () => layout.currentPage = pageRoutes[i].page,
              
            ),
        separatorBuilder: (_, i) => Divider(
              color: Colors.blue,
            ),
        itemCount: pageRoutes.length);
  }
}

class _MenuPrincipal extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    
    
    final appTheme = Provider.of<ThemeChanger>(context);


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
              leading: Icon(Icons.lightbulb_outline,color: appTheme.currentTheme.accentColor),
              title:Text('Dark Mode'),
              trailing: Switch.adaptive(value: appTheme.darkTheme, onChanged: (value){
                appTheme.darkTheme = value;
              }),
            ),
            ListTile(
              leading: Icon(Icons.dashboard_customize,color: appTheme.currentTheme.accentColor),
              title:Text('Custom Theme'),
              trailing: Switch.adaptive(value: appTheme.customTheme, onChanged: (value){
                appTheme.customTheme = value;
              }),
            )
          ],
        ),
      ),
    );
  }
}
