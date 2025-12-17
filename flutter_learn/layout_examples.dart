import 'package:flutter/material.dart';

/// 示例1：垂直布局（Column）
class ColumnExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('垂直布局 Column')),
      body: Column(
        // 主轴对齐：垂直方向居中
        mainAxisAlignment: MainAxisAlignment.center,
        // 交叉轴对齐：水平方向居中
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('第一行文字', style: TextStyle(fontSize: 20)),
          SizedBox(height: 20), // 间距
          Text('第二行文字', style: TextStyle(fontSize: 20)),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {},
            child: Text('按钮'),
          ),
          SizedBox(height: 20),
          Icon(Icons.star, size: 50, color: Colors.orange),
        ],
      ),
    );
  }
}

/// 示例2：水平布局（Row）
class RowExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('水平布局 Row')),
      body: Center(
        child: Row(
          // 主轴对齐：水平方向居中
          mainAxisAlignment: MainAxisAlignment.center,
          // 交叉轴对齐：垂直方向居中
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.home, size: 40),
            SizedBox(width: 10), // 水平间距
            Text('首页', style: TextStyle(fontSize: 20)),
            SizedBox(width: 30),
            Icon(Icons.person, size: 40),
            SizedBox(width: 10),
            Text('我的', style: TextStyle(fontSize: 20)),
          ],
        ),
      ),
    );
  }
}

/// 示例3：对齐方式对比
class AlignmentExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('对齐方式对比')),
      body: Column(
        children: [
          // 1. start - 顶部对齐
          Container(
            height: 150,
            color: Colors.blue[50],
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('start - 顶部对齐'),
                Text('第二行'),
              ],
            ),
          ),
          Divider(),
          // 2. center - 居中
          Container(
            height: 150,
            color: Colors.green[50],
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('center - 居中'),
                Text('第二行'),
              ],
            ),
          ),
          Divider(),
          // 3. end - 底部对齐
          Container(
            height: 150,
            color: Colors.orange[50],
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text('end - 底部对齐'),
                Text('第二行'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// 示例4：spaceBetween 和 spaceAround
class SpacingExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('间距分布')),
      body: Row(
        children: [
          // spaceBetween - 两端对齐
          Expanded(
            child: Container(
              color: Colors.blue[50],
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('spaceBetween'),
                  Text('A'),
                  Text('B'),
                  Text('C'),
                  Text('两端对齐'),
                ],
              ),
            ),
          ),
          VerticalDivider(),
          // spaceAround - 均匀分布
          Expanded(
            child: Container(
              color: Colors.green[50],
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text('spaceAround'),
                  Text('A'),
                  Text('B'),
                  Text('C'),
                  Text('均匀分布'),
                ],
              ),
            ),
          ),
          VerticalDivider(),
          // spaceEvenly - 完全均匀
          Expanded(
            child: Container(
              color: Colors.orange[50],
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('spaceEvenly'),
                  Text('A'),
                  Text('B'),
                  Text('C'),
                  Text('完全均匀'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// 示例5：嵌套布局（Column 里放 Row）
class NestedLayoutExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('嵌套布局')),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 标题
            Text(
              '商品详情',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            // 价格和评分（Row）
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // 价格
                Text(
                  '¥299',
                  style: TextStyle(
                    fontSize: 28,
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                // 评分
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.orange, size: 20),
                    Icon(Icons.star, color: Colors.orange, size: 20),
                    Icon(Icons.star, color: Colors.orange, size: 20),
                    Icon(Icons.star, color: Colors.orange, size: 20),
                    Icon(Icons.star_half, color: Colors.orange, size: 20),
                    SizedBox(width: 5),
                    Text('4.5'),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),
            // 描述
            Text(
              '这是一个非常好的商品，质量优良，价格实惠。',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 30),
            // 按钮组（Row）
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text('加入购物车'),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 15),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text('立即购买'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      padding: EdgeInsets.symmetric(vertical: 15),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

/// 示例6：个人信息卡片（实战）
class ProfileCardExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('个人信息卡片')),
      body: Center(
        child: Container(
          width: 300,
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                blurRadius: 10,
                offset: Offset(0, 5),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // 头像
              CircleAvatar(
                radius: 50,
                backgroundColor: Colors.blue,
                child: Icon(Icons.person, size: 50, color: Colors.white),
              ),
              SizedBox(height: 20),
              // 名字
              Text(
                '张三',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              // 职位
              Text(
                'Flutter 开发工程师',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[600],
                ),
              ),
              SizedBox(height: 20),
              Divider(),
              SizedBox(height: 10),
              // 联系方式
              _buildInfoRow(Icons.email, 'zhangsan@example.com'),
              SizedBox(height: 10),
              _buildInfoRow(Icons.phone, '138-0000-0000'),
              SizedBox(height: 10),
              _buildInfoRow(Icons.location_on, '北京市朝阳区'),
              SizedBox(height: 20),
              // 按钮
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {},
                      child: Text('关注'),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text('发消息'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, size: 20, color: Colors.grey[600]),
        SizedBox(width: 10),
        Expanded(
          child: Text(
            text,
            style: TextStyle(fontSize: 14),
          ),
        ),
      ],
    );
  }
}

/// 示例7：底部导航栏
class BottomNavExample extends StatefulWidget {
  @override
  _BottomNavExampleState createState() => _BottomNavExampleState();
}

class _BottomNavExampleState extends State<BottomNavExample> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('底部导航栏')),
      body: Center(
        child: Text(
          '当前选中：$selectedIndex',
          style: TextStyle(fontSize: 24),
        ),
      ),
      bottomNavigationBar: Container(
        height: 60,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              blurRadius: 5,
              offset: Offset(0, -2),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItem(Icons.home, '首页', 0),
            _buildNavItem(Icons.category, '分类', 1),
            _buildNavItem(Icons.shopping_cart, '购物车', 2),
            _buildNavItem(Icons.person, '我的', 3),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, int index) {
    bool isSelected = selectedIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: isSelected ? Colors.blue : Colors.grey,
            size: 28,
          ),
          SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: isSelected ? Colors.blue : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}

/// 主入口：选择示例
class LayoutExamplesHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('布局示例合集')),
      body: ListView(
        children: [
          _buildMenuItem(context, '1. 垂直布局 Column', ColumnExample()),
          _buildMenuItem(context, '2. 水平布局 Row', RowExample()),
          _buildMenuItem(context, '3. 对齐方式对比', AlignmentExample()),
          _buildMenuItem(context, '4. 间距分布', SpacingExample()),
          _buildMenuItem(context, '5. 嵌套布局', NestedLayoutExample()),
          _buildMenuItem(context, '6. 个人信息卡片', ProfileCardExample()),
          _buildMenuItem(context, '7. 底部导航栏', BottomNavExample()),
        ],
      ),
    );
  }

  Widget _buildMenuItem(BuildContext context, String title, Widget page) {
    return ListTile(
      title: Text(title),
      trailing: Icon(Icons.arrow_forward_ios),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
    );
  }
}
