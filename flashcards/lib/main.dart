import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(QuizApp());
}

class QuizApp extends StatelessWidget {
  const QuizApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Domande SO',
      theme: ThemeData(primarySwatch: Colors.orange),
      home: QuestionScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key});

  @override
  _QuestionScreenState createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  List<String> questions = [
    "1. Quali sono le componenti hardware che deve gestire un SO?",
    "2. Cosa è il multiplexing?",
    "3. A cosa serve il DMA?",
    "4. Cosa fanno i registri PC, PSW, SP?",
    "5. Descrivi la struttura di un SO a kernel monolitico",
    "6. Descrivi la struttura di un SO a strati",
    "7. Descrivi la struttura di un SO a microkernel",
    "8. Quanti modalità di esecuzione ci sono?",
    "9. Ogni processo che informazioni porta con sé? Dove vengono memorizzate?",
    "10. Che stato può avere un processo? Descrivi la macchina a stati finiti.",
    "11. Che stato può avere un thread? Descrivi la macchina a stati finiti.",
    "12. In che occasioni viene creato un processo?",
    "13. Che tipi di terminazioni per i processi esistono?",
    "14. Descrivi le gerarchie di processi in Linux e Windows.",
    "15. Che difficoltà dobbiamo affrontare in sistemi multicore?",
    "16. I thread condividono delle informazioni? Quali condivide? Quali ogni thread tiene per sé?",
    "17. Stato dei thread e la macchina a stati finiti che ne descrive i passaggi.",
    "18. Che operazioni sui thread abbiamo?",
    "19. Descrivi i thread a livello kernel. In quale altro modo si chiamano?",
    "20. Descrivi i thread a livello utente. In quale altro modo si chiamano?",
    "21. Elenca le operazioni che possiamo effettuare sui thread.",
    "22. Descrivi i 4 principi per gestire bene situazioni di race condition.",
    "23. Disabilitazione degli interrupt per problemi di race condition. Problemi?",
    "24. Uso di una variabile di lock per race condition. Problemi?",
    "25. Uso di alternanza stretta per race condition + pseudocodice. Problemi?",
    "26. Uso di TSL per race condition + pseudocodice. Problemi?",
    "27. Uso di sleep e wakeup per il problema del produttore-consumatore + pseudocodice.",
    "28. Uso di semafori per produttore-consumatore + pseudocodice.",
    "29. Uso di monitor per produttore-consumatore + pseudocodice.",
    "30. Un buon algoritmo per sistemi batch cosa deve fare?",
    "31. Descrivi FCFS per sistemi batch",
    "32. Descrivi SJF per sistemi batch",
    "33. Descrivi SRTN per sistemi batch",
    "34. Un buon algoritmo per sistemi interattivi cosa deve fare?",
    "35. Descrivi RR per sistemi interattivi",
    "36. Descrivi Algoritmo a priorità per sistemi interattivi",
    "37. Cosa sono i processi CPU-bounded e IO-bounded?",
    "38. Descrivi Algoritmo a lotteria per sistemi interattivi",
    "39. Algoritmi di Scheduling per Thread",
    "40. Scheduling in multi elaborazione Asimmetrica",
    "41. Scheduling in multi elaborazione Simmetrica",
    "42. Cosa è la memorizzazione?",
    "43. Cosa è la multiprogrammazione?",
    "44. Problemi con memorizzazione senza astrazione.",
    "45. Descrivi lo Swapping. E se un processo cresce nel tempo?",
    "46. Meccanismi per locazioni libere/occupate nello Swapping?",
    "47. Metodo bitmap e segmentazione. Perché è fondamentale la dimensione?",
    "48. Lista per lo swapping: algoritmi di ricerca.",
    "49. Memoria virtuale: come è diviso il processo? Chi traduce gli indirizzi?",
    "50. Traduzione indirizzi virtuale -> fisico?",
    "51. Bit di stato nelle tabelle delle pagine oltre il bit di presenza?",
    "52. Problemi da risolvere nella tabella delle pagine?",
    "53. Problemi di velocità della mappatura: come li risolve?",
    "54. Problemi di dimensione nella mappatura. Esempio 32bit e 64bit.",
    "55. Formula EAT (tempo medio accesso memoria) con TLB.",
    "56. Algoritmo di sostituzione OPT",
    "57. Algoritmo FIFO per sostituzione delle pagine",
    "58. Algoritmo Seconda Chance",
    "59. Algoritmo LRU",
    "60. Algoritmo Aging",
    "61. Anomalia di Belady: cosa è? Chi ne soffre?",
    "62. Allocazione proporzionale: come si fa?",
    "63. Soft link e hard link",
    "64. Formula dell’overhead del context switch",
    "65. Quali sono le 7 informazioni associate ad ogni file?",
  ];

  List<int> shuffledIndexes = [];
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _shuffleQuestions();
  }

  void _shuffleQuestions() {
    shuffledIndexes = List.generate(questions.length, (index) => index);
    shuffledIndexes.shuffle(Random());
    currentIndex = 0;
  }

  void _nextQuestion() {
    if (currentIndex < questions.length - 1) {
      setState(() {
        currentIndex++;
      });
    }
  }

  void _previousQuestion() {
    if (currentIndex > 0) {
      setState(() {
        currentIndex--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    String question = questions[shuffledIndexes[currentIndex]];

    return Scaffold(
      appBar: AppBar(
        title: Text('Domande Sistemi Operativi'),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(Icons.arrow_left, size: 36),
                onPressed: _previousQuestion,
              ),
              Expanded(
                child: Card(
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Text(
                      question,
                      style: TextStyle(fontSize: 18),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              IconButton(
                icon: Icon(Icons.arrow_right, size: 36),
                onPressed: _nextQuestion,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
