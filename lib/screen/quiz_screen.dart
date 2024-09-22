import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({required this.quiz, super.key});

  final Map<String, dynamic> quiz;

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int currenTQuestion = 0;
  int score = 0;

  void nextQuestion(int answer) {
    setState(() {
      if (widget.quiz["problems"][currenTQuestion]["answer"] == answer) {
        score++;
      }
      if (currenTQuestion < widget.quiz["problems"].length - 1) {
        currenTQuestion++;
      } else {
        showDialog(context: context, builder: (context) {
          return AlertDialog(
            title: Text("Quiz Finished!", 
              textAlign: TextAlign.center,
              style: GoogleFonts.prompt(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            content: Text("Your score is ${score} / ${widget.quiz["problems"].length}",
              textAlign: TextAlign.center,
              style: GoogleFonts.prompt(fontSize: 16),
            ),
            actions: [
              TextButton(
                onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
              }, 
                child: Text("OK",
                style: GoogleFonts.prompt(fontSize: 16),
                )
              ),
              TextButton(
                onPressed: () {
                Navigator.pop(context);
                setState(() {
                  currenTQuestion = 0;
                  score = 0;
                });
                }, 
                child: Text("Retry",
                  style: GoogleFonts.prompt(fontSize: 16),
                )
              )
            ],
          );
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> problems = widget.quiz["problems"];
    int totalQuestion = problems.length;
    return Scaffold(
      backgroundColor: Colors.indigo[900],
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 37, 208, 255),
        centerTitle: true,
        title: Text(widget.quiz["quiz_name"],
          style: GoogleFonts.prompt(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularPercentIndicator(
                radius: 50,
                lineWidth: 10,
                progressColor: Colors.lightBlue,
                percent: currenTQuestion / totalQuestion,
                center: Text("${(currenTQuestion / totalQuestion * 100).toStringAsFixed(2)}%",
                          style: 
                            GoogleFonts.prompt(
                              color: Colors.white,
                            ),
                          ),
              ),
            const SizedBox(height: 10,),
            Text("Question ${currenTQuestion + 1}/${totalQuestion}",
              style: GoogleFonts.prompt(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold)
            ),
            const SizedBox(height: 10,),
            Text(problems[currenTQuestion]["question"],
              style: GoogleFonts.prompt(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,)
            ),
            const SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () => nextQuestion(1), 
                  style: ButtonStyle(
                    foregroundColor: 
                      WidgetStatePropertyAll(Colors.indigo[900]),
                    textStyle: 
                      WidgetStatePropertyAll(GoogleFonts.prompt(fontSize: 12)),
                    backgroundColor: WidgetStatePropertyAll(Colors.white),
                  ),
                  child: Text(problems[currenTQuestion]["options"][0])
                ),
                const SizedBox(width: 5,),
                TextButton(
                  onPressed: () => nextQuestion(2), 
                  style: ButtonStyle(
                    foregroundColor: 
                      WidgetStatePropertyAll(Colors.indigo[900]),
                    textStyle: 
                      WidgetStatePropertyAll(GoogleFonts.prompt(fontSize: 12)),
                    backgroundColor: WidgetStatePropertyAll(Colors.white),
                  ),
                  child: Text(problems[currenTQuestion]["options"][1])
                )
              ],
            ),
            const SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () => nextQuestion(3), 
                  style: ButtonStyle(
                    foregroundColor: 
                      WidgetStatePropertyAll(Colors.indigo[900]),
                    textStyle: 
                      WidgetStatePropertyAll(GoogleFonts.prompt(fontSize: 12)),
                    backgroundColor: WidgetStatePropertyAll(Colors.white),
                  ),
                  child: Text(problems[currenTQuestion]["options"][2])
                ),
                const SizedBox(width: 5,),
                TextButton(
                  onPressed: () => nextQuestion(4), 
                  style: ButtonStyle(
                    foregroundColor: 
                      WidgetStatePropertyAll(Colors.indigo[900]),
                    textStyle: 
                      WidgetStatePropertyAll(GoogleFonts.prompt(fontSize: 12)),
                    backgroundColor: WidgetStatePropertyAll(Colors.white),
                  ),
                  child: Text(problems[currenTQuestion]["options"][3])
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}