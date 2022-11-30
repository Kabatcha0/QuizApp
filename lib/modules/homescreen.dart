import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizapp/cubit/cubit.dart';
import 'package:quizapp/cubit/states.dart';

class QuizApp extends StatelessWidget {
  const QuizApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => QuizCubit(),
      child: BlocConsumer<QuizCubit, QuizStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = QuizCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.deepPurple,
              elevation: 0,
              centerTitle: true,
              title: const Text(
                "Quiz App",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: cubit.icon,
                  ),
                  Expanded(
                      flex: 4,
                      child: Column(
                        children: [
                          Image.asset(
                            cubit.questions[cubit.index].questionImage,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            cubit.questions[cubit.index].questionText,
                            textDirection: TextDirection.rtl,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          )
                        ],
                      )),
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Container(
                      decoration: const BoxDecoration(
                          gradient: LinearGradient(
                              begin: AlignmentDirectional.topStart,
                              end: AlignmentDirectional.bottomEnd,
                              colors: [Colors.green, Colors.greenAccent])),
                      child: MaterialButton(
                        onPressed: () {
                          cubit.checkAnswers(true);
                          cubit.changeQuestion();
                        },
                        child: const Text(
                          "صح",
                          textDirection: TextDirection.rtl,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  )),
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Container(
                      decoration: const BoxDecoration(
                          gradient: LinearGradient(
                              begin: AlignmentDirectional.topStart,
                              end: AlignmentDirectional.bottomEnd,
                              colors: [Colors.red, Colors.redAccent])),
                      child: MaterialButton(
                        onPressed: () {
                          cubit.checkAnswers(false);
                          cubit.changeQuestion();
                        },
                        child: const Text(
                          "خطأ",
                          textDirection: TextDirection.rtl,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  )),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
