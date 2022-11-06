import 'package:flutter/material.dart';

// callback que seria o mais basico de tudo mas da um pouco trabalho
// usar formulários
// provider
// inheritedwidget
// mobx
// bloc
// rxdart

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final List<String> moodSections = ['Ambiente', 'Comida', 'Atendimento'];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            floatingActionButton: const Icon(Icons.save),
            body: ListView.builder(
                itemCount: moodSections.length,
                itemBuilder: ((context, index) =>
                    MoodWidget(sectionTitle: moodSections[index]))),
            appBar: AppBar(title: const Text('Home luist test lgalazao'))));
  }
}

class MoodWidget extends StatefulWidget {
  const MoodWidget({
    required this.sectionTitle,
    Key? key,
  }) : super(key: key);

  final String sectionTitle;

  @override
  State<MoodWidget> createState() => _MoodWidgetState();
}

class _MoodWidgetState extends State<MoodWidget> {
  final selectedColor = Colors.red;
  final defaultColor = Colors.black;

  int selectedIndex = -1;

  final List<String> moodFaces = ['Ruim', 'Bom', 'Ótimo'];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Text(
            widget.sectionTitle,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: moodFaces
              .map(
                (String mood) => InkWell(
                  onTap: () => _onMoodTapHandler(mood),
                  child: MoodFace(
                      title: mood,
                      color: selectedIndex == moodFaces.indexOf(mood)
                          ? selectedColor
                          : defaultColor),
                ),
              )
              .toList(),
        ),
      ],
    );
  }

  _onMoodTapHandler(String mood) {
    setState(() {
      selectedIndex = moodFaces.indexOf(mood);
    });
  }
}

class MoodFace extends StatelessWidget {
  MoodFace({
    required this.color,
    required this.title,
  });
  Color color;
  String title;

  Map<String, dynamic> iconsFace = {
    "Ruim": Icons.face_retouching_natural,
    "Bom": Icons.face,
    "Ótimo": Icons.clean_hands,
  };

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Builder(builder: (context) {
          return Container(
            child: Icon(
              iconsFace[title],
              color: color,
              size: 50,
            ),
          );
        }),
        Text(title)
      ],
    );
  }
}
