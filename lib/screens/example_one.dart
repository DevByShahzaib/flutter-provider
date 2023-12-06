import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_project/provider/example_one_provider.dart';

class Example0ne extends StatefulWidget {
  const Example0ne({super.key});

  @override
  State<Example0ne> createState() => _Example0neState();
}

class _Example0neState extends State<Example0ne> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ExampleOneProvider>(context, listen: false);
    print('buid');
    return Scaffold(
      appBar: AppBar(
        title: Text('Example One'),
        centerTitle: true,

      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Consumer<ExampleOneProvider>(builder: (context,value,child){
            return Slider(
                min: 0,
                max: 1,
                value: value.value, onChanged: (val){
              value.setValue(val);

            });
          }),
            Consumer<ExampleOneProvider>(builder: (context,value,child){
              return Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 100,
                      decoration: BoxDecoration(
                          color: Colors.green.withOpacity(value.value)
                      ),
                      child: const Center(
                        child: Text('Container 1'),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 100,
                      decoration: BoxDecoration(
                          color: Colors.red.withOpacity(value.value)
                      ),
                      child: const Center(
                        child: Text('Container 2'),
                      ),
                    ),
                  )
                ],
              );
            })

        ],
      ),
    );
  }
}
