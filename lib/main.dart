import 'package:curso_flutter_2020/ui/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:curso_flutter_2020/data/constant.dart' as constant;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Body(),
    );
  }
}

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int _pointer;

  //Lista de pantallas
  List<Widget> _screens = [
    Home(),
    Container(color: Colors.blue),
    Container(color: Colors.green),
    Container(color: Colors.yellow),
  ];

  Widget _bottomNavigation() {
    return Container(
      decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
      height: 60.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          //para optimizar aun mas el codigo utilizaremos un for para iterar
          //en cada objeto de nuestras constantes
          //Iconos y Textos
          for (int i = 0; i < constant.titlesBottomNavigationBar.length; i++)
            Expanded(
              child: InkWell(
                onTap: () {
                  //Actualizamos el puntero una vez le damos tap al elemento de nuestro menu
                  setState(() {
                    _pointer = i;
                  });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(constant.iconsBottomNavigationBar[i]),
                    Text(constant.titlesBottomNavigationBar[i])
                  ],
                ),
              ),
            )
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    //inicializamos nuestro puntero que manejara nuestras pantallas
    _pointer = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //bottomNavigationBar es un widget que nos permite tomar la parte inferior de nuestra pantalla
        //y adicionarle un widget
        bottomNavigationBar: _bottomNavigation(),
        body: _screens[_pointer]);
  }
}
