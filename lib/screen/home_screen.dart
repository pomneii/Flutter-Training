import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizzapp/mock_data.dart';
import 'package:quizzapp/widgets/question_card_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo[900],
        title: Text(
          "Quiz App", 
            style: GoogleFonts.prompt(
            fontSize: 20, fontWeight: FontWeight.bold,
            color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Center(
          child: Column(
            children: [
              Text(
                "Quiz List",
                style: GoogleFonts.prompt(
                fontSize: 18, fontWeight: FontWeight.bold,)),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.75,
              height: MediaQuery.of(context).size.width * 0.75,
              child: ListView.separated(
                itemBuilder: (BuildContext context, int idx) {
                  return questionCard(quizzes[idx], context);
                }, 
                separatorBuilder: (BuildContext context, int idx) {
                  return const SizedBox(
                    height: 10,
                  );
                }, 
                itemCount: quizzes.length),
            ),
            const SizedBox(
              height: 10),
            ]
          )
        )
      )
    );
  }
}