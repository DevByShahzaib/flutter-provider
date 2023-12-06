import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_project/provider/count_provider.dart';

class CountExample extends StatefulWidget {
  const CountExample({super.key});

  @override
  State<CountExample> createState() => _CountExampleState();
}

class _CountExampleState extends State<CountExample> {
  @override
  void initState() {
    final countProvider = Provider.of<CountProvider>(context, listen: false);
    // TODO: implement initState
    super.initState();
    Timer.periodic(Duration(seconds: 1), (timer) {
        countProvider.setCounter();
    });
  }
  @override
  Widget build(BuildContext context) {
  print('build');
    final countProvider = Provider.of<CountProvider>(context, listen: false);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Consumer<CountProvider>(builder: (context,value, child){
              return Text(value.counter .toString(), style: TextStyle(fontSize: 50),);
            },)
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        countProvider.setCounter();
      },
      child: Icon(Icons.add),),
    );
  }
}
