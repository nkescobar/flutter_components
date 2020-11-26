import 'package:flutter/material.dart';
import 'package:flutter_componentes/src/providers/menu_provider.dart';
import 'package:flutter_componentes/src/utils/icono_string_util.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componentes'),
      ),
      body: ListaWidget(),
    );
  }
}

class ListaWidget extends StatelessWidget {
  const ListaWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: menuProvider.cargarData(),
      initialData: [],
      builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
        return ListView(children: _listaItems(snapshot.data, context));
      },
    );
  }

  List<Widget> _listaItems(List<dynamic> data, BuildContext context) {
    return data.map((item) {
      return Column(
        children: [
          ListTile(
            title: Text(item['texto']),
            //leading: Icon(getIconUsingPrefix(name: item['icon'])),
            leading: getIcon(item['icon']),
            trailing: Icon(
              Icons.keyboard_arrow_right,
              color: Colors.blue,
            ),
            onTap: () {
              //context cual pagina anterior, encima pagina a regresar
              Navigator.pushNamed(context, item['ruta']);
              /*final route = MaterialPageRoute(
                builder: (context) => AlertPage(),
              );
              Navigator.push(context, route);*/
            },
          ),
          Divider()
        ],
      );
    }).toList();
  }
}
