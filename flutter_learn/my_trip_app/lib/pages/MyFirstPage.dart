import 'package:flutter/material.dart';

class MyFirstPage  extends StatefulWidget {
  @override
  _CounterPageSate createState() => _CounterPageSate();
}

class _CounterPageSate extends State<MyFirstPage> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('计数器')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('点击次数：', style: TextStyle(fontSize: 20)),
            Text('$count', style: TextStyle(fontSize: 50, color: Colors.blue)),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  count++; // 点击后数字加1
                });
              },
              child: Text('点我 +1'),
            ),
          ],
        ),
      ),
    );
  }
}
