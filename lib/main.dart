import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(title: 'Flutter Demo Home Page'),
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
  TextEditingController mycontroller = TextEditingController();
  String? mycontrol;
  String? notes;
  List<String> priorityList = ['Low', 'Medium', 'High'];
  String currentValue = 'Low'; // Make currentValue a state variable
  List<String>? mainTitle = ['ABC', 'acb'];
  List<String> mainPriority = ['Low', 'High'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My TODO',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            const Spacer(flex: 1),
            const Text('Nothing is added'),
            const Spacer(flex: 1),
            ListView.builder(
              shrinkWrap: true,
              itemCount: mainTitle!.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(mainTitle![index]),
                  subtitle: Text(mainPriority[index]),
                );
              },
            ),
            ElevatedButton(
              child: const Icon(Icons.add),
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return SizedBox(
                      height: 600,
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'Enter your text here',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                              ),
                              controller: mycontroller,
                            ),
                          ),
                          const SizedBox(height: 20),
                          const Text('Select Priority'),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: priorityList.map((priority) {
                              return Row(
                                children: [
                                  Radio<String>(
                                    value: priority,
                                    groupValue: currentValue,
                                    onChanged: (value) {
                                      setState(() {
                                        currentValue = value!;
                                      });
                                    },
                                  ),
                                  Text(priority),
                                ],
                              );
                            }).toList(),
                          ),
                          ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  mainTitle!.add(mycontroller.toString());
                                  mainPriority.add(currentValue);
                                });
                              },
                              child: Text('Add'))
                        ],
                      ),
                    );
                  },
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
