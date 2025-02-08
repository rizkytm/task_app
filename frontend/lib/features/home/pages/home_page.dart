import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/core/constants/utils.dart';
import 'package:frontend/features/home/widgets/date_selector.dart';
import 'package:frontend/features/home/widgets/task_card.dart';

class HomePage extends StatelessWidget {
  static MaterialPageRoute route() =>
      MaterialPageRoute(builder: (context) => const HomePage());
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Tasks'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              CupertinoIcons.add,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          const DateSelector(),
          Row(
            children: [
              Expanded(
                child: TaskCard(
                  color: Color.fromRGBO(246, 222, 194, 1),
                  headerText: 'Hello!',
                  descriptionText:
                      'This is a new task! This is a new task! This is a new task! This is a new task!',
                ),
              ),
              Container(
                height: 10,
                width: 10,
                decoration: BoxDecoration(
                  color: strengthenColor(
                    const Color.fromRGBO(246, 222, 194, 1),
                    0.69,
                  ),
                  shape: BoxShape.circle,
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(12.0),
                child: Text(
                  '10:00AM',
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
