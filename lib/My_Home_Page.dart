import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do/provider.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController mycontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My TODO',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: Consumer<ChangeManager>(
        builder: (context, changevalue, child) => Center(
          child: Column(
            children: [
              context.watch<ChangeManager>().mainTitle.isEmpty == true
                  ? const Text('Nothing is added')
                  : ListView.builder(
                      shrinkWrap: true,
                      itemCount: changevalue.mainTitle.length,
                      itemBuilder: (context, index) {
                        return Dismissible(
                          key: ValueKey<int>(index),
                          onDismissed: (DismissDirection derection) {
                            setState(() {
                              changevalue.mainTitle.removeAt(index);
                            changevalue.mainPriority.removeAt(index);
                            });
                          },
                          child: ListTile(
                            title: Text(
                              changevalue.mainTitle[index],
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w600),
                            ),
                            leading: IconButton(
                              onPressed: () {
                                // Set the current text in the controller
                                changevalue.mycontroller.text =
                                    changevalue.mainTitle[index];

                                // Show the bottom sheet for editing
                                showModalBottomSheet(
                                  context: context,
                                  builder: (context) => Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: SizedBox(
                                      height: 500,
                                      child: Column(
                                        children: [
                                          TextFormField(
                                            decoration: InputDecoration(
                                              hintText: 'Enter your text here',
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20.0),
                                              ),
                                            ),
                                            controller:
                                                changevalue.mycontroller,
                                          ),
                                          ElevatedButton(
                                            onPressed: () {
                                              // Update the title using the provider
                                              changevalue.updateMainTitle(
                                                index,
                                                changevalue.mycontroller.text,
                                              );

                                              // Close the bottom sheet
                                              Navigator.pop(context);
                                            },
                                            child: const Text('Update Value'),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                              icon: const Icon(Icons.edit),
                            ),
                            trailing: IconButton(
                                onPressed: () {
                                  changevalue.deleteValue(index);
                                },
                                icon: const Icon(Icons.delete)),
                            subtitle: Text(changevalue.mainPriority[index],
                                style: const TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold)),
                          ),
                        );
                      },
                    ),
              const Spacer(flex: 1),
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
                              child: TextFormField(
                                decoration: InputDecoration(
                                  hintText: 'Enter your text here',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                ),
                                controller: mycontroller,
                                onTap: () {
                                  mycontroller.clear();
                                },
                              ),
                            ),
                            const SizedBox(height: 20),
                            const Text('Select Priority'),
                            const SizedBox(height: 10),
                            Consumer<ChangeManager>(
                              builder: (context, value, child) => Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: value.priorityList.map((priority) {
                                  return Row(
                                    children: [
                                      Radio<String>(
                                        value: priority,
                                        groupValue: value.currentValue,
                                        onChanged: (value) {
                                          changevalue
                                              .updateCurrentValue(value!);
                                        },
                                      ),
                                      Text(priority),
                                    ],
                                  );
                                }).toList(),
                              ),
                            ),
                            ElevatedButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                  changevalue.updateValue(mycontroller.text);
                                },
                                child: const Text('Add'))
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
      ),
    );
  }
}
