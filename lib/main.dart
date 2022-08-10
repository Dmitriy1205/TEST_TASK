import 'package:flutter/material.dart';

void main() {
  runApp(const TestApp());
}

class TestApp extends StatelessWidget {
  const TestApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Content(),
    );
  }
}

class Content extends StatelessWidget {
  Content({
    Key? key,
  }) : super(key: key);

  final items = <String>[
    'Item1',
    'Item2',
    'Item3',
    'Item4',
    'Item5',
  ];

  @override
  Widget build(BuildContext context) {
    return RawScrollbar(
      thumbColor: Colors.black54,
      radius: const Radius.circular(10),
      trackVisibility: true,
      thickness: 12,
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.all(15),
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                elevation: 0,
                backgroundColor: Colors.white,
                expandedHeight: 450.0,
                collapsedHeight: 100,
                flexibleSpace: Center(
                  child: Container(
                    margin: const EdgeInsets.all(30),
                    child: Image.asset('assets/logo.png'),
                  ),
                ),
              ),
              SliverGrid(
                delegate: SliverChildBuilderDelegate(
                  childCount: items.length,
                  (BuildContext context, int index) {
                    return Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 3)),
                      child: Center(
                        child: Text(
                          items[index],
                          style: const TextStyle(
                              color: Colors.black, fontSize: 30),
                        ),
                      ),
                    );
                  },
                ),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
