import 'package:api_with_block/bloc/recepie_result_bloc.dart';
import 'package:api_with_block/screen/eroorPage.dart';
import 'package:api_with_block/screen/homePage.dart';
import 'package:api_with_block/screen/loadedPage.dart';
import 'package:api_with_block/screen/loadingPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: BlocProvider<RecepieResultBloc>(
          create: (context) => RecepieResultBloc(),
          child: const MyHomePage(title: 'Flutter Demo Home Page')),
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
      body: BlocBuilder<RecepieResultBloc, RecepieResultState>(
        bloc: context.read<RecepieResultBloc>(),
        builder: (context, state) {
          if (state is RecepieResultInitial) {
            return HomePage();
          } else if (state is RecepieResultLoading) {
            return LoadingPage();
          } else if (state is RecepieResultLoaded) {
            return LoadedPage(recepie: state.list);
          } else {
            return ErrorPage();
          }
        },
      ),
      floatingActionButton: ElevatedButton(
          onPressed: () {
            context.read<RecepieResultBloc>().add(RecepieResultEvent());
          },
          child: const Text('Fetch Data From Api')),
    );
  }
}
