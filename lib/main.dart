import 'package:flutter/material.dart';

void main() {
  ///funcion correr aplicación
  ///la funcion runApp es la que insertara y/o correra nuestro primer widget
  ///esta recibe justamente como parametro nuestro widget 
  ///se recomienda que dicho primer wudget sea llamado [MyApp]
  runApp(MyApp());
}

///primer widget que esta heredando su estado (estatico) de una clase superior
///los widgets de tipo statelessWidget heredan un estado estatico
///al ser de este tipo su valor nunca cambiara en el tiempo
///Atajo de tecla para construir dicho widget: [stles] y darle [intro] a la opcion sugerida
class MyApp extends StatelessWidget {
  //metodo de construcción de nuestro primer widget
  @override
  Widget build(BuildContext context) {
    ///Widget padre que contiene las caracteristicas esenciales y herramientas de desarrollador (MaterialApp)
    ///Material App es sumamente importante, dado que sera este widget el que contendra la estructura base de una
    ///aplicacion en flutter
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Body(),
    );
  }
}

///Mi primer widget de tipo dinamico
///El widget de tipo dinamico, adicionalmente de heredar un comportamiento, debe
///heredar un estado en este caso de la clase "State"
///Al ser un widget de tipo dinamico, nos permitira que los valores encapsulados en dicho widget tengan
///un valor dinamico (que se puede cambiar a lo largo del tiempo)
///Atajo de teclas: [stful] y autocompletar
class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int numero;

  ///(funcion que inicializa el estado de mi aplicacion y las variables que necesite
  ///la funcion inicial es sumanente importante, ya que esta definira cual sera el estado con el que 
  ///arranque dicho widget, cabe recalcar que es necesario siempre llamar a su clase padre y que esta
  ///también inicialice su estado [super.initState()]
  ///atajo de teclas: [init] y autocompletar
  @override
  void initState() {
    super.initState();
    numero = 0;
  }

  @override
  Widget build(BuildContext context) {
    //Scaffold es un widget que funciona como template para aplicaciones android
    ///Scaffold es un widget que nos permitira el uso de varios widgets propios de material design
    ///como snackbar, alert, modalsheet, entre otros, este tambien nos permitira que nuestros 
    ///componentes adopten un estilo propio de Android
    return Scaffold(
        ///un Widget puede contener otro widget (caja dentro otra caja)
        ///los widgets pueden contener como propiedades a: eventos, caracteristicas u otros widgets
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            ///funcion que actualiza el estado de mi aplicacion
            ///setState es sumamente importante si queremos actualizar el estado de una variable o widget
            ///ya que por si solos estos no lo hacen, entonces debemos llamar a esta funcion anonima que actualiza
            ///los estados
            ///atajo de tecla [set] y autocompletar
            setState(() {
              numero++;
              print(numero);
            });
          },
        ),
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text('Mi primera aplicación en flutter'),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Número de veces que estornude hoy:'),
              Text("$numero", style: TextStyle(fontSize: 32.0)),
            ],
          ),
        ));
  }
}
