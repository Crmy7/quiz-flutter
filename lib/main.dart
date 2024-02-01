import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Quiz App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Le meilleur quiz du monde',
              style: (TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              )),
              textAlign: TextAlign.center,
            ),
            Container(
              height: 250,
              width: 300,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    "assets/images/AdobeStock_290390054.jpeg",
                  ),
                  fit: BoxFit.contain,
                  alignment: Alignment.center,
                ),
              ),
            ),
            const SizedBox(height: 50),
            TextButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                padding: MaterialStateProperty.all<EdgeInsets>(
                  EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                ),
                side: MaterialStateProperty.all<BorderSide>(
                  BorderSide(color: Colors.blue),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const QuestionScreen()),
                );
              },
              child: const Text(
                'Démarrer le quiz',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Question {
  String question;
  bool response;
  String explanation;
  String imagePath;

  Question(
      {required this.question,
      required this.response,
      required this.explanation,
      required this.imagePath});

  String getImage() => 'assets/images/$imagePath';
}

class QuestionData {
  List<Question> questionList = [
    Question(
        question:
            "Les escargots entraînent le décès d'environ 100.000 personnes chaque année.",
        response: true,
        explanation:
            'L\'escargot transmet un parasite qui s’appelle le schistosome.',
        imagePath: 'escargots.jpeg'),
    Question(
        question: "Un éternuement peut avoir une vitesse de 160km/h.",
        response: false,
        explanation:
            "D'après des études, la vitesse des éternuements est entre 16km/h et 50km/h",
        imagePath: 'sneeze.jpeg'),
    Question(
        question: "Tous les tanks britanniques sont équipés pour boire le thé.",
        response: true,
        explanation:
            "Depuis 1945, les tanks ont une théière pour éviter aux soldats de sortir de la machine à l’heure du thé.",
        imagePath: 'tank.jpeg'),
    Question(
        question:
            "La langue officielle des États-Unis d’Amérique est l’anglais.",
        response: false,
        explanation:
            "L’anglais est la langue parlée par la majorité des Américains, mais elle n'a jamais été adoptée au niveau fédéral.",
        imagePath: 'usa.jpeg'),
    Question(
        question: "Bordeaux a déjà été la capitale de la France. ",
        response: true,
        explanation:
            "Pendant la Première Guerre mondiale, le gouvernement français déménagea brièvement la capitale à Bordeaux.",
        imagePath: 'bordeaux.jpeg'),
    Question(
        question:
            "Aucun pays d’Afrique n’a jamais remporté la Coupe du Monde de foot.",
        response: true,
        explanation:
            "C'est vrai et avant le Maroc en 2022, aucun pays africain n’avait même participé à une demi-finale de Coupe du Monde.",
        imagePath: 'coupedumonde.jpeg'),
    Question(
        question: "Les marmottes ne boivent jamais d’eau.",
        response: true,
        explanation:
            'Vrai, c’est pourquoi elles mangent de préférence à l’aube pendant la rosée.',
        imagePath: 'marmottes.jpeg'),
    Question(
        question:
            "Les habitantes de l'île de Lesbos en Grèce sont appelées des Lesbiennes.",
        response: true,
        explanation: "Les habitants de Lesbos sont des Lesbiens et Lesbiennes.",
        imagePath: 'lesbos.jpeg'),
    Question(
        question: "Certains pays du monde n'ont pas d'aéroport.",
        response: true,
        explanation:
            "Oui car ce sont des petits États. ex: Monaco, le Vatican, San Marin, Liechtenstein et d'Andorre.",
        imagePath: 'airport.jpeg'),
    Question(
        question: "En France, il est interdit de manger du chat et du chien.",
        response: true,
        explanation:
            "Aucune loi n’interdit la consommation de viande de chat ou de chien.",
        imagePath: 'cat.jpeg')
  ];
}

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({Key? key}) : super(key: key);

  @override
  _QuestionScreenState createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  QuestionData questionData = QuestionData();
  int questionNumber = 0;
  int score = 0;

  void checkAnswer(userAnswer) {
    bool correctAnswer = questionData.questionList[questionNumber].response;

    if (userAnswer == correctAnswer) {
      setState(() {
        score++;
      });
    }

    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            userAnswer == correctAnswer ? 'Bonne réponse' : 'Mauvaise réponse',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          content: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(top: 5.0, bottom: 20.0),
                  child: Image.asset(
                    userAnswer == correctAnswer
                        ? "assets/images/correct.gif"
                        : "assets/images/false.gif",
                    fit: BoxFit.fill,
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        questionData.questionList[questionNumber].explanation,
                        style: const TextStyle(
                          fontSize: 18.0,
                          color: Colors.black,
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          actions: <Widget>[
            const Divider(
              height: 1,
              thickness: 1,
              color: Colors.black,
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 20.0, top: 20.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Colors.purpleAccent),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                        setState(() {
                          if (questionNumber <
                              questionData.questionList.length - 1) {
                            questionNumber++;
                          } else {
                            showResult();
                          }
                        });
                      },
                      child: const Text(
                        'Prochaine question',
                        style: TextStyle(fontSize: 22, color: Colors.white),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        );
      },
    );
  }

  void showResult() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Fin du quiz'),
          content: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Text(
                    score >= 5
                        ? 'Félicitations ! tu as eu $score bonnes réponses !'
                        : 'T\'es éclaté au sol tu as eu seulement $score bonne réponses !',
                    style: const TextStyle(
                      fontSize: 18.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    )),
                Container(
                  margin: const EdgeInsets.only(bottom: 20.0, top: 20.0),
                  child: Image.asset(
                    score >= 5
                        ? "assets/images/thats-my-boy-curtis-payne.gif"
                        : "assets/images/worriedface.gif",
                    fit: BoxFit.fill,
                  ),
                )
              ],
            ),
          ),
          actions: <Widget>[
            Expanded(
              child: TextButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.purpleAccent),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                  resetQuiz();
                },
                child: const Text(
                  'Recommencer le quiz',
                  style: TextStyle(fontSize: 22, color: Colors.white),
                ),
              ),
            )
          ],
        );
      },
    );
  }

  void resetQuiz() {
    setState(() {
      questionNumber = 0;
      score = 0;
      Navigator.pop(
        context,
        MaterialPageRoute(
            builder: (context) => const MyHomePage(title: 'Quiz App')),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Score : $score/${questionData.questionList.length}'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              'Question : ' + (questionNumber + 1).toString(),
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 20.0,
                color: Colors.black,
              ),
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(width: 1.0, color: Colors.grey),
                bottom: BorderSide(width: 1.0, color: Colors.grey),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 100, bottom: 100),
              child: Column(
                children: [
                  Container(
                    height: 250,
                    width: 250,
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 3,
                        color: Colors.black,
                      ),
                      borderRadius: BorderRadius.circular(300),
                      image: DecorationImage(
                        image: AssetImage(
                          questionData.questionList[questionNumber].getImage(),
                        ),
                        fit: BoxFit.cover,
                        alignment: Alignment.center,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Container(
                      height: 80,
                      child: Text(
                        questionData.questionList[questionNumber].question,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 20.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20),
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: TextButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.green),
                      ),
                      onPressed: () {
                        checkAnswer(true);
                      },
                      child: const Text(
                        'Vrai',
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: TextButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.red),
                      ),
                      onPressed: () {
                        checkAnswer(false);
                      },
                      child: const Text(
                        'Faux',
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
