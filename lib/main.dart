import 'package:flutter/material.dart';
import 'pergunta.dart';

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

  /*Pergunta p1 = Pergunta(
    questao: 'Luxemburgo é o país mais rico do mundo.', respostaDaQuestao: true,
  );
  Pergunta p2 = Pergunta(
    questao: 'Avatar é o filme com maior bilheteria da história.', respostaDaQuestao: true,
  );
  Pergunta p3 = Pergunta(
    questao: 'Felipe Massa pilotou pela Mercedes.', respostaDaQuestao: false,
  );
   */

  List<Pergunta> bancoDePerguntas = [
    Pergunta(questao: 'Felipe Massa pilotou pela Mercedes.', respostaDaQuestao: false,), // 1° objeto
    Pergunta(questao: 'Luxemburgo é o país mais rico do mundo.', respostaDaQuestao: true,), // 2° objeto
    Pergunta(questao: 'Avatar é o filme com maior bilheteria da história.', respostaDaQuestao: true,), // 3° objeto
  ];

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
                bancoDePerguntas[numeroDaQuestaoAtual].questao,
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
                bool respostaCerta = bancoDePerguntas[numeroDaQuestaoAtual].respostaDaQuestao;

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
                bool respostaCerta = bancoDePerguntas[numeroDaQuestaoAtual].respostaDaQuestao;

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