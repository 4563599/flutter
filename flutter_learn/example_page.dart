import 'package:flutter/material.dart';

/// 示例1：最简单的页面
class SimplePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('我的第一个页面'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Text(
          'Hello Flutter!',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

/// 示例2：计数器页面（可以点击）
class CounterPage extends StatefulWidget {
  @override
  _CounterPageState createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  int count = 0; // 计数器变量

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('计数器示例'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '你点击了：',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              '$count 次',
              style: TextStyle(
                fontSize: 50,
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                // setState 会刷新页面
                setState(() {
                  count++; // 数字加1
                });
              },
              child: Text('点我 +1'),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              ),
            ),
            SizedBox(height: 10),
            TextButton(
              onPressed: () {
                setState(() {
                  count = 0; // 重置为0
                });
              },
              child: Text('重置'),
            ),
          ],
        ),
      ),
    );
  }
}

/// 示例3：登录页面（输入框 + 按钮）
class SimpleLoginPage extends StatefulWidget {
  @override
  _SimpleLoginPageState createState() => _SimpleLoginPageState();
}

class _SimpleLoginPageState extends State<SimpleLoginPage> {
  // 控制器：用来获取输入框的内容
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('登录'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 用户名输入框
            TextField(
              controller: usernameController,
              decoration: InputDecoration(
                labelText: '用户名',
                prefixIcon: Icon(Icons.person),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            // 密码输入框
            TextField(
              controller: passwordController,
              obscureText: true, // 密码隐藏显示
              decoration: InputDecoration(
                labelText: '密码',
                prefixIcon: Icon(Icons.lock),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 30),
            // 登录按钮
            ElevatedButton(
              onPressed: () {
                // 获取输入框内容
                String username = usernameController.text;
                String password = passwordController.text;
                
                // 打印到控制台
                print('用户名：$username');
                print('密码：$password');
                
                // 显示提示框
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text('登录信息'),
                    content: Text('用户名：$username\n密码：$password'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text('确定'),
                      ),
                    ],
                  ),
                );
              },
              child: Text('登录'),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50), // 按钮宽度占满
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    // 释放控制器资源
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}

/// 示例4：列表页面
class ListPage extends StatelessWidget {
  final List<String> items = [
    '苹果',
    '香蕉',
    '橙子',
    '西瓜',
    '葡萄',
    '草莓',
    '芒果',
    '樱桃',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('水果列表'),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(Icons.apple),
            title: Text(items[index]),
            subtitle: Text('第 ${index + 1} 个水果'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              print('点击了：${items[index]}');
            },
          );
        },
      ),
    );
  }
}
