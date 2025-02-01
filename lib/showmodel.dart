import 'package:flutter/material.dart';

class BottomSheet extends StatefulWidget {
  const BottomSheet({super.key});

  @override
  State<BottomSheet> createState() => _BottomSheetState();
}

class _BottomSheetState extends State<BottomSheet> {
  @override
  Widget build(BuildContext context) {
    List<String> priority_List = ['Low', 'Medium', 'High'];
    String currentValue = priority_List[0];

    return SizedBox(
      height: 600,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextField(
            decoration: InputDecoration(
              hintText: 'Enter your text here',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
          ),
        const  Text('Select Priority'),
          Row(
            children: [
              Radio(
                  value: 'Low',
                  groupValue: currentValue,
                  onChanged: (value) {
                    setState(() {
                      currentValue = value.toString();
                    });
                  }),
              Radio(
                  value: 'Medium',
                  groupValue: currentValue,
                  onChanged: (value) {
                    setState(() {
                      currentValue = value.toString();
                    });
                  }),
              Radio(
                  value: 'High',
                  groupValue: currentValue,
                  onChanged: (value) {
                    setState(() {
                      currentValue = value.toString();
                    });
                  })
            ],
          )
        ],
      ),
    );
  }
}
