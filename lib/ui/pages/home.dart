import 'package:flutter/material.dart';

//Vamos a separar toda la pantalla home en una clase distinta

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _Header(),
        _GeneralInformation(),
        _ListInformation(),
      ],
    );
  }
}

//cuando creamos una clase, objeto, variable o funcion con la barra baja "_" antecediendo
//es por que estamos creando un clase de tipo privada
class _Header extends StatelessWidget {
  const _Header({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Container es el widget mas basico que nos proporciona Flutter
    return Container(
      //obtnemos el tamaño de nuestro dispositivo
      //gracias a MediaQuery
      height: MediaQuery.of(context).size.height / 3 - 20,
    );
  }
}

class _GeneralInformation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.orange[200],
        //border radius nos permite dar un borde de tipo redondeado
        borderRadius: BorderRadius.circular(8.0),
      ),
      margin: EdgeInsets.all(32.0),
      padding: EdgeInsets.all(16.0),
      //ListTile es un widget que contiene atributos como items a la izquierda y derecha titulos y otros
      //este se acomoda perfectamente a items de tipo lista
      child: ListTile(
        contentPadding: EdgeInsets.all(0.0),
        //leading es el widget que estara mas proximo a la izquierda
        leading: CircleAvatar(
          child: Icon(Icons.android, color: Colors.white),
        ),
        title: Text('Test Coronavirus'),
        subtitle: Text('Realiza una prueba rapida de coronavirus'),
        //trailing es el widget que estara mas proximo a la derecha
        trailing: Icon(Icons.arrow_forward_ios),
      ),
    );
  }
}

class _ListInformation extends StatelessWidget {
  Widget _title() {
    return Text(
      'Obten más información acerca del coronavirus',
      style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
    );
  }

  Widget _customListTile({String title, Color color, IconData icon}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(color: Colors.grey[100], blurRadius: 4.0, spreadRadius: 5.0)
      ]),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(8.0)),
        child: ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 0.0),
          leading: CircleAvatar(
            backgroundColor: color,
            child: Icon(icon, color: Colors.white),
          ),
          title: Text(title),
          trailing: Icon(Icons.arrow_forward_ios),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
      margin: EdgeInsets.symmetric(horizontal: 16.0),
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _title(),
          ListView(
            shrinkWrap: true,
            children: <Widget>[
              _customListTile(
                  title: 'Administración de casos',
                  color: Colors.orange[400],
                  icon: Icons.home),
              _customListTile(
                  title: 'Información general',
                  color: Colors.red[400],
                  icon: Icons.hourglass_empty),
              _customListTile(
                  title: 'Cuidados',
                  color: Colors.green[400],
                  icon: Icons.insert_emoticon)
            ],
          ),
        ],
      ),
    ));
  }
}
