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
      height: MediaQuery.of(context).size.height / 3 - 20,
    );
  }
}

class _ListInformation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 3 - 20,
    );
  }
}

