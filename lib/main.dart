import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class IconesWidged extends StatelessWidget {
  const IconesWidged({super.key, required this.resumo});

  final String resumo;

  @override
  Widget build(BuildContext context) {
    Color color = Colors.blue;
    return Row(children: [
      Expanded(
        child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                padding: const EdgeInsets.all(18),
                child: Text(
                  resumo,
                  style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _withbutton(color, Icons.call, 'Otimo'),
                  _withbutton(color, Icons.near_me, 'Bom'),
                  _withbutton(color, Icons.share, 'Ruim')
                ],
              )
            ]),
      )
    ]);
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final List<String> lista = [
      'SABOR DOS PRATOS',
      'APRESENTAÇÃO DAS PREPARAÇÕES',
      'TEMPERATURA DOS ALIMENTOS',
      'VARIEDADE DAS PREPARAÇÕES',
      'CORTESIA NO ATENDIMENTO',
      'APRESENTAÇÃO PESSOAL'
    ];

    return MaterialApp(
      title: 'AVALIE NOSSOS SERVIÇOS!',
      home: Scaffold(
          appBar: AppBar(
            title: const Text('AVALIE NOSSOS SERVIÇOS!'),
          ),
          body: Container(
            color: Colors.blue[200],
            child: ListView.builder(
              itemCount: lista.length,
              itemBuilder: (context, index) {
                return IconesWidged(
                  resumo: lista[index],
                );
              },
            ),
          )),
    );
  }
}

class IconButton extends StatefulWidget {
  const IconButton(
      {super.key,
      required this.color,
      required this.icon,
      required this.texto,
      required this.isSelected});

  final Color color;
  final IconData icon;
  final String texto;
  final bool isSelected;

  @override
  State<StatefulWidget> createState() => IconButtonState();
}

class IconButtonState extends State<IconButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox.fromSize(
    size: const Size(56, 56),
    child: ClipOval(
      child: Material(
        color: ,
        child: InkWell(
          splashColor: Colors.green,
          onTap: () {},
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                widget.icon,
                color: Colors.white,
              ),
              Text(
                widget.texto,
                style: const TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    ),
  );
  }
}

SizedBox _withbutton(
    Color color, IconData icon, String texto, bool IsSelected) {
  return SizedBox.fromSize(
    size: const Size(56, 56),
    child: ClipOval(
      child: Material(
        color: color,
        child: InkWell(
          overlayColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.pressed)) {
                return Colors.redAccent;
              } //<-- SEE HERE
              return null; // Defer to the widget's default.
            },
          ),
          splashColor: Colors.green,
          onTap: () {},
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                icon,
                color: Colors.white,
              ),
              Text(
                texto,
                style: const TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
