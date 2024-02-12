import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:repository_pattern_demo/features/news_trivia/presentation/bloc/number_trivia_bloc/number_trivia_bloc.dart';
import 'package:repository_pattern_demo/features/news_trivia/presentation/pages/local_database_page.dart';

class NumberTriviaPage extends StatefulWidget {
  const NumberTriviaPage({super.key});

  static const String numberTriviaPage = 'numberTriviaPage';

  @override
  State<NumberTriviaPage> createState() => _NumberTriviaPageState();
}

class _NumberTriviaPageState extends State<NumberTriviaPage> {
  final TextEditingController numberTriviaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Number Trivia',
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        centerTitle: true,
        backgroundColor: Colors.green.shade500,
      ),
      body: Container(
        margin: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              BlocBuilder<NumberTriviaBloc, NumberTriviaState>(
                  builder: (context, numberTriviaState) {
                if (numberTriviaState is NumberTriviaInitial) {
                  return Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 2,
                      child: Center(child: Text('Serach Number Trivia')));
                }

                if (numberTriviaState is NumberTriviaLoading) {
                  return Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 2,
                      child: Center(
                          child: CircularProgressIndicator(
                        color: Colors.green.shade500,
                      )));
                }

                if (numberTriviaState is NumberTriviaConcreteLoaded) {
                  return Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 2,
                      child: Center(
                        child: Column(
                          children: [
                            Text(
                              numberTriviaState.result.number.toString(),
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              numberTriviaState.result.text,
                              style: const TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ));
                }

                if (numberTriviaState is NumberTriviaRandomLoaded) {
                  return Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 2,
                      child: Center(
                        child: Column(
                          children: [
                            Text(
                              numberTriviaState.result.number.toString(),
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              numberTriviaState.result.text,
                              style: const TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ));
                }

                if (numberTriviaState is NumberTriviaError) {
                  return Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 2,
                      child: Center(child: Text(numberTriviaState.message)));
                } else {
                  return Container();
                }
              }),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: numberTriviaController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  hintText: 'Input a number',
                  hintStyle: TextStyle(fontSize: 12, color: Colors.grey),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(width: 1, color: Colors.grey)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(width: 1, color: Colors.grey)),
                ),
                onChanged: (value) {
                  numberTriviaController.text = value;
                  setState(() {});
                },
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        context.read<NumberTriviaBloc>().add(
                            GetConcreteNumberTriviaEvent(
                                number: numberTriviaController.text));
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green.shade500,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8))),
                      child: const Text(
                        "Concrete Trivia",
                        style: TextStyle(fontSize: 12, color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        context
                            .read<NumberTriviaBloc>()
                            .add(GetRandomNumberTriviaEvent());
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey.shade500,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8))),
                      child: const Text(
                        "Random Trivia",
                        style: TextStyle(fontSize: 12, color: Colors.black),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green.shade500,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5))),
                  onPressed: () {
                    Navigator.of(context)
                        .pushNamed(LocalDatabasePage.localDatabasePage);
                  },
                  child: const Text(
                    'Test Local Database',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
