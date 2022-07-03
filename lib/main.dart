import 'package:flutter/material.dart';
import 'perguntas.dart';

void main() => runApp(Quizz());

class Quizz extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {

  List<Icon> marcadorPontos = [];

  List<String> perguntas = [
    'Luxemburgo é o país mais rico do mundo.', // Verdadeiro
    'Avatar é o filme com maior bilheteria da história.', // Verdadeiro
    'Felipe Massa pilotou pela Mercedes.' // Falso
  ];

  List<bool> respostas = [
    true,
    true,
    false,
  ];

  Pergunta p1 = Pergunta(
    questao: 'Luxemburgo é o país mais rico do mundo.', respostaDaQuestao: true,
  );
  Pergunta p2 = Pergunta(
    questao: 'Avatar é o filme com maior bilheteria da história.', respostaDaQuestao: true,
  );

  int numeroDaQuestaoAtual = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Center(
              child: Text(
                perguntas[numeroDaQuestaoAtual],
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25.0,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15),
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.indigo,
              ),
              child: Text(
                'Verdadeiro',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                bool respostaCerta = respostas[numeroDaQuestaoAtual];

                if(respostaCerta == true){
                  print('Resposta Certa!');
                }else{
                  print('Resposta Errada!');
                }

                setState(() {
                  numeroDaQuestaoAtual++;
                });
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15),
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              child: Text(
                'Falso',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                bool respostaCerta = respostas[numeroDaQuestaoAtual];

                if(respostaCerta == false){
                  print('Resposta Certa!');
                }else{
                  print('Resposta Errada!');
                }

                setState(() {
                  numeroDaQuestaoAtual++;
                });
              },
            ),
          ),
        ),
        Row(
          children: marcadorPontos,
        ),
      ],
    );
  }
}