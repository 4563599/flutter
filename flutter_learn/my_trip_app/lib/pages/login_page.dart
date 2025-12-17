import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? username;
  String? password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('登录')),
      body: Padding(padding: const EdgeInsets.all(20),child: Column(
        mainAxisAlignment: MainAxisAlignment.center,children: [TextField(decoration: const InputDecoration(labelText: '账号'), onChanged: (text){
        username=text;
      }),
        const SizedBox(height: 20),
        // --- 第三个组件：密码输入框 ---
        TextField(
          decoration: const InputDecoration(labelText: '密码'),
          obscureText: true, // 【重要】开启密码模式，显示为圆点
          onChanged: (text) => password = text, // 简写模式：存密码
        ),
        // --- 第四个组件：更大的占位符 ---
        // 按钮通常离输入框远一点，所以设为 40
        const SizedBox(height: 40),

        // --- 第五个组件：登录按钮 ---
        ElevatedButton(
          // 点击事件：调用 _login 方法
          onPressed: _login,
          child: const Text('登录'), // 按钮上的字
        ),
      ],
      )),
    );
  }
  _login() async {
    try {
      // await LoginDao.login(userName: userName!, password: password!);
      // NavigatorUtil.goToHome(context);
    } catch (e) {
      // print('登录失败: $e');
    }
  }
}


