import 'package:flutter/material.dart';

class QuizAppScreen extends StatefulWidget {
  const QuizAppScreen({super.key});

  @override
  State<QuizAppScreen> createState() => _QuizAppScreenState();
}

class _QuizAppScreenState extends State<QuizAppScreen> {
  int _currentQuestionIndex = 0;
  int _score = 0;
  bool _quizCompleted = false;

  final List<Map<String, Object>> _questions = [
    {
      'questionText': 'What is the capital of France?',
      'answers': [
        {'text': 'Berlin', 'isCorrect': false},
        {'text': 'Madrid', 'isCorrect': false},
        {'text': 'Paris', 'isCorrect': true},
        {'text': 'Rome', 'isCorrect': false},
      ],
    },
    {
      'questionText': 'Which language is used to build Flutter apps?',
      'answers': [
        {'text': 'Java', 'isCorrect': false},
        {'text': 'Dart', 'isCorrect': true},
        {'text': 'Kotlin', 'isCorrect': false},
        {'text': 'Swift', 'isCorrect': false},
      ],
    },
    {
      'questionText': 'Who developed Flutter?',
      'answers': [
        {'text': 'Microsoft', 'isCorrect': false},
        {'text': 'Apple', 'isCorrect': false},
        {'text': 'Meta', 'isCorrect': false},
        {'text': 'Google', 'isCorrect': true},
      ],
    },
  ];

  void _answerQuestion(bool isCorrect) {
    if (isCorrect) {
      _score++;
    }

    setState(() {
      _currentQuestionIndex++;
      if (_currentQuestionIndex >= _questions.length) {
        _quizCompleted = true;
      }
    });
  }

  void _resetQuiz() {
    setState(() {
      _currentQuestionIndex = 0;
      _score = 0;
      _quizCompleted = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz App'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: _quizCompleted
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Quiz Completed!',
                      style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Your Score: $_score / ${_questions.length}',
                      style: const TextStyle(fontSize: 24),
                    ),
                    const SizedBox(height: 40),
                    ElevatedButton(
                      onPressed: _resetQuiz,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurple,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                      ),
                      child: const Text('Restart Quiz', style: TextStyle(fontSize: 18)),
                    )
                  ],
                ),
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Question ${_currentQuestionIndex + 1}/${_questions.length}',
                    style: const TextStyle(fontSize: 20, color: Colors.grey),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    _questions[_currentQuestionIndex]['questionText'] as String,
                    style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 40),
                  ...(_questions[_currentQuestionIndex]['answers'] as List<Map<String, Object>>)
                      .map((answer) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 15.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          backgroundColor: Colors.deepPurple[100],
                          foregroundColor: Colors.deepPurple[900],
                          textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                        onPressed: () => _answerQuestion(answer['isCorrect'] as bool),
                        child: Text(answer['text'] as String),
                      ),
                    );
                  }),
                ],
              ),
      ),
    );
  }
}
