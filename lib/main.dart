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
            Container(
              height: 150,
              width: 300,
              decoration: BoxDecoration(
                border: Border.all(
                  width: 3,
                  color: Colors.white,
                ),
                image: const DecorationImage(
                  image: AssetImage(
                    "assets/images/AdobeStock_290390054.jpeg",
                  ),
                  fit: BoxFit.contain,
                  alignment: Alignment.center,
                ),
              ),
            ),
            SizedBox(height: 50),
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
      ), // This trailing comma makes auto-formatting nicer for build methods.
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
            "L'homme a marché sur la Lune avant d'inventé la valise à roulette",
        response: true,
        explanation:
            'Le premier alunissage a eu lieu en 1969 tandis que les premières roulettes sont apparues en 1970',
        imagePath: 'suitcase.jpeg'),
    Question(
        question:
            "Une cuillère de miel correspond au travail d'une vie de 12 abeilles ?",
        response: true,
        explanation: "Les abeilles sont indispensables et très fragiles ...",
        imagePath: 'honey.webp'),
    Question(
        question: "Les avions volent plus rapidement aujourd'hui qu'avant ?",
        response: false,
        explanation:
            "Pour des raisons économiques et de carburants, les avions d'aujourd'hui volent moins vite !",
        imagePath: 'airplane.webp'),
    Question(
        question:
            "L'inventeur des publicités pop-ups s'est excusé pour sa création ?",
        response: true,
        explanation:
            "Il est vraiment désolé, c'est intentions étaient bonnes ...",
        imagePath: 'web.webp'),
    Question(
        question: "Possédons-nous un peu d'or dans notre corps ?",
        response: true,
        explanation: "Une personne de 70kg possède environ 0.2mg d'or en elle",
        imagePath: 'gold.webp'),
    Question(
        question:
            "100k, c'est le nombre de combinaisons possibles avec des briques 2x4 de LEGO ?",
        response: false,
        explanation:
            "915,103,765 combinaisons possibles, c'est le résultat obtenu après une semaine de calcul par le programme du mathématicien Soren Eilers",
        imagePath: 'lego.jpeg'),
    Question(
        question:
            "Une vache appelée par son nom produira plus de lait qu'une qui ne l'est pas ?",
        response: true,
        explanation: '258L de lait en plus par an pour être exact !',
        imagePath: 'cow.jpeg'),
    Question(
        question: "Le drapeau des Etats-Unis a été créé par un étudiant ?",
        response: true,
        explanation:
            "Pour un projet de classe, l'étudiant a eu un B puis un A lorsque le congrès l'a choisi comme drapeau national !",
        imagePath: 'america.jpeg'),
    Question(
        question: "Les astronautes peuvent-ils voter depuis l'espace ?",
        response: true,
        explanation:
            "Même dans l'espace, le devoir d'un citoyen doit être effectué !",
        imagePath: 'astronaut.jpeg'),
    Question(
        question:
            "Tout le Nutella vendu en 1 an pourrait être étalé sur environ 50 terrains de football",
        response: false,
        explanation:
            "En realité il pourrait être étalé sur 1000 terrain de football !",
        imagePath: 'nutella.jpeg')
  ];
}

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({Key? key}) : super(key: key);

  @override
  _QuestionScreenState createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Score : 88888'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              'Question 1/10',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 20.0,
                color: Colors.black,
              ),
            ),
          ),
          Image.asset(
            "assets/images/AdobeStock_290390054.jpeg",
            fit: BoxFit.contain,
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              'Quel est la couleur du rouge',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 25.0,
                color: Colors.black,
              ),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TextButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.green),
                    ),
                    onPressed: () {},
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
                    onPressed: () {},
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
        ],
      ),
    );
  }
}
