import 'package:flutter/material.dart';

class StatFul extends StatefulWidget {
  const StatFul({super.key});

  @override
  State<StatFul> createState() => _StatFulState();
}

class _StatFulState extends State<StatFul> {
  int x = 0;
  @override
  Widget build(BuildContext context) {
  print('Zaibi');
    return Scaffold(
      appBar: AppBar(
        title: Text('Statful Widget'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(DateTime.now().toString()),
            Container(
              child: Center(child: Text(x.toString(), style: TextStyle(fontSize: 50),)),
            )
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        x++;
        setState(() {

        });
        print(x);
      },
      child: Icon(Icons.add),),
    );
  }
}
