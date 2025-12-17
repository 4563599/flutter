// 1. 创建一个页面类（继承 StatelessWidget）
class MyFirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 2. 返回页面内容
    return Scaffold(
      appBar: AppBar(
        title: Text('我的第一个页面'),
      ),
      body: Center(
        child: Text('Hello Flutter!'),
      ),
    );
  }
}