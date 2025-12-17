import 'package:flutter/material.dart';

/// ============================================================
/// Flutter 布局教程 - 学习 Column、Row 和各种对齐方式
/// ============================================================
///
/// 🎯 核心概念：
/// - Column = 垂直排列（从上到下）
/// - Row = 水平排列（从左到右）
/// - children = 子控件列表，用方括号 [] 包裹
/// - mainAxisAlignment = 主轴对齐（Column是垂直方向，Row是水平方向）
/// - crossAxisAlignment = 交叉轴对齐（Column是水平方向，Row是垂直方向）

/// 布局教程主页面 - 展示所有布局示例的入口
class LayoutTutorialPage extends StatelessWidget {
  const LayoutTutorialPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter 布局教程'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // ========== 教程导航按钮 ==========
          _buildNavButton(
            context,
            '1. 垂直布局 Column',
            const VerticalLayoutPage(),
          ),
          _buildNavButton(context, '2. 水平布局 Row', const HorizontalLayoutPage()),
          _buildNavButton(context, '3. 主轴对齐演示', const MainAxisAlignmentPage()),
          _buildNavButton(
            context,
            '4. 交叉轴对齐演示',
            const CrossAxisAlignmentPage(),
          ),
          _buildNavButton(context, '5. 嵌套布局', const NestedLayoutPage()),
          _buildNavButton(context, '6. 间距使用', const SpacingPage()),
          _buildNavButton(context, '7. 个人信息卡片', const ProfileCardPage()),
          _buildNavButton(context, '8. 底部导航栏', const BottomNavBarPage()),
        ],
      ),
    );
  }

  /// 构建导航按钮的辅助方法
  Widget _buildNavButton(BuildContext context, String title, Widget page) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: ElevatedButton(
        onPressed: () {
          // Navigator.push 用于页面跳转
          Navigator.push(context, MaterialPageRoute(builder: (_) => page));
        },
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(16),
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
        ),
        child: Text(title, style: const TextStyle(fontSize: 16)),
      ),
    );
  }
}

/// ============================================================
/// 示例1：垂直布局 Column
/// ============================================================
/// Column 会把子控件从上到下依次排列
/// 就像 Android 的 LinearLayout (vertical)
class VerticalLayoutPage extends StatelessWidget {
  const VerticalLayoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('垂直布局 Column')),
      body: Column(
        // ========== Column 的 children ==========
        // 所有子控件都放在这个列表里
        // 它们会从上到下依次排列
        children: [
          // 第一个子控件：文本
          const Text('我是第一个', style: TextStyle(fontSize: 20)),

          // 第二个子控件：文本
          const Text('我是第二个', style: TextStyle(fontSize: 20)),

          // 第三个子控件：按钮
          ElevatedButton(
            onPressed: () {
              // 按钮点击事件
              print('按钮被点击了');
            },
            child: const Text('我是按钮'),
          ),

          // 第四个子控件：图标
          const Icon(Icons.star, size: 50, color: Colors.amber),

          // 第五个子控件：带颜色的容器
          Container(
            width: 100,
            height: 50,
            color: Colors.blue,
            child: const Center(
              child: Text('容器', style: TextStyle(color: Colors.white)),
            ),
          ),
        ],
      ),
    );
  }
}

/// ============================================================
/// 示例2：水平布局 Row
/// ============================================================
/// Row 会把子控件从左到右依次排列
/// 就像 Android 的 LinearLayout (horizontal)
class HorizontalLayoutPage extends StatelessWidget {
  const HorizontalLayoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('水平布局 Row')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ========== 基础 Row 示例 ==========
            const Text(
              '基础 Row：',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),

            Row(
              // Row 的 children 会从左到右排列
              children: const [
                Icon(Icons.home, size: 30),
                Text('首页'),
                SizedBox(width: 20), // 水平间距
                Icon(Icons.person, size: 30),
                Text('我的'),
              ],
            ),

            const SizedBox(height: 30),

            // ========== 带背景色的 Row ==========
            const Text(
              '带背景的 Row：',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),

            Container(
              color: Colors.grey[200],
              padding: const EdgeInsets.all(10),
              child: Row(
                children: const [
                  Text('左边'),
                  SizedBox(width: 20),
                  Text('中间'),
                  SizedBox(width: 20),
                  Text('右边'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// ============================================================
/// 示例3：主轴对齐 MainAxisAlignment
/// ============================================================
/// 主轴 = Column 的垂直方向 / Row 的水平方向
///
/// 对齐方式：
/// - start: 开始位置（Column顶部/Row左边）
/// - center: 居中
/// - end: 结束位置（Column底部/Row右边）
/// - spaceBetween: 两端对齐，中间均分
/// - spaceAround: 均匀分布（两端有一半间距）
/// - spaceEvenly: 完全均匀分布
class MainAxisAlignmentPage extends StatelessWidget {
  const MainAxisAlignmentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('主轴对齐演示')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ========== Row 的主轴对齐（水平方向）==========
            const Text(
              'Row 主轴对齐（水平方向）：',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            // start - 左对齐
            const Text('MainAxisAlignment.start（左对齐）：'),
            _buildRowExample(MainAxisAlignment.start),

            // center - 居中
            const Text('MainAxisAlignment.center（居中）：'),
            _buildRowExample(MainAxisAlignment.center),

            // end - 右对齐
            const Text('MainAxisAlignment.end（右对齐）：'),
            _buildRowExample(MainAxisAlignment.end),

            // spaceBetween - 两端对齐
            const Text('MainAxisAlignment.spaceBetween（两端对齐）：'),
            _buildRowExample(MainAxisAlignment.spaceBetween),

            // spaceAround - 均匀分布
            const Text('MainAxisAlignment.spaceAround（均匀分布）：'),
            _buildRowExample(MainAxisAlignment.spaceAround),

            // spaceEvenly - 完全均匀
            const Text('MainAxisAlignment.spaceEvenly（完全均匀）：'),
            _buildRowExample(MainAxisAlignment.spaceEvenly),
          ],
        ),
      ),
    );
  }

  /// 构建 Row 示例的辅助方法
  Widget _buildRowExample(MainAxisAlignment alignment) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(8),
      color: Colors.grey[200],
      child: Row(
        mainAxisAlignment: alignment, // 设置主轴对齐方式
        children: [
          _buildBox('A', Colors.red),
          _buildBox('B', Colors.green),
          _buildBox('C', Colors.blue),
        ],
      ),
    );
  }

  /// 构建小方块的辅助方法
  Widget _buildBox(String text, Color color) {
    return Container(
      width: 50,
      height: 50,
      color: color,
      child: Center(
        child: Text(
          text,
          style: const TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
    );
  }
}

/// ============================================================
/// 示例4：交叉轴对齐 CrossAxisAlignment
/// ============================================================
/// 交叉轴 = Column 的水平方向 / Row 的垂直方向
///
/// 对齐方式：
/// - start: 开始位置（Column左边/Row顶部）
/// - center: 居中
/// - end: 结束位置（Column右边/Row底部）
/// - stretch: 拉伸填满
class CrossAxisAlignmentPage extends StatelessWidget {
  const CrossAxisAlignmentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('交叉轴对齐演示')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ========== Column 的交叉轴对齐（水平方向）==========
            const Text(
              'Column 交叉轴对齐（水平方向）：',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // start - 左对齐
                _buildColumnExample('start', CrossAxisAlignment.start),
                // center - 居中
                _buildColumnExample('center', CrossAxisAlignment.center),
                // end - 右对齐
                _buildColumnExample('end', CrossAxisAlignment.end),
              ],
            ),

            const SizedBox(height: 30),

            // ========== Row 的交叉轴对齐（垂直方向）==========
            const Text(
              'Row 交叉轴对齐（垂直方向）：',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            // start - 顶部对齐
            const Text('CrossAxisAlignment.start（顶部对齐）：'),
            _buildRowCrossExample(CrossAxisAlignment.start),

            // center - 垂直居中
            const Text('CrossAxisAlignment.center（垂直居中）：'),
            _buildRowCrossExample(CrossAxisAlignment.center),

            // end - 底部对齐
            const Text('CrossAxisAlignment.end（底部对齐）：'),
            _buildRowCrossExample(CrossAxisAlignment.end),
          ],
        ),
      ),
    );
  }

  /// 构建 Column 交叉轴示例
  Widget _buildColumnExample(String label, CrossAxisAlignment alignment) {
    return Column(
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        Container(
          width: 100,
          height: 120,
          color: Colors.grey[200],
          child: Column(
            crossAxisAlignment: alignment, // 设置交叉轴对齐
            children: const [Text('短'), Text('比较长的文字')],
          ),
        ),
      ],
    );
  }

  /// 构建 Row 交叉轴示例
  Widget _buildRowCrossExample(CrossAxisAlignment alignment) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      height: 80,
      color: Colors.grey[200],
      child: Row(
        crossAxisAlignment: alignment, // 设置交叉轴对齐
        children: [
          Container(width: 50, height: 30, color: Colors.red),
          const SizedBox(width: 10),
          Container(width: 50, height: 50, color: Colors.green),
          const SizedBox(width: 10),
          Container(width: 50, height: 70, color: Colors.blue),
        ],
      ),
    );
  }
}

/// ============================================================
/// 示例5：嵌套布局
/// ============================================================
/// Column 里面可以放 Row，Row 里面也可以放 Column
/// 这样就能实现复杂的布局效果
class NestedLayoutPage extends StatelessWidget {
  const NestedLayoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('嵌套布局')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          // 外层 Column - 垂直排列
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ========== 示例1：简单嵌套 ==========
            const Text(
              '示例1：Column 里放 Row',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),

            Container(
              padding: const EdgeInsets.all(16),
              color: Colors.grey[200],
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 第一行：标题
                  const Text('商品标题', style: TextStyle(fontSize: 18)),
                  const SizedBox(height: 8),

                  // 第二行：Row（评分）
                  Row(
                    children: const [
                      Icon(Icons.star, color: Colors.amber, size: 20),
                      SizedBox(width: 4),
                      Text('5.0'),
                      SizedBox(width: 10),
                      Text('已售 1000+', style: TextStyle(color: Colors.grey)),
                    ],
                  ),
                  const SizedBox(height: 8),

                  // 第三行：描述
                  const Text('这是商品的描述信息...'),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // ========== 示例2：复杂嵌套 ==========
            const Text(
              '示例2：多层嵌套',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),

            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                // 外层 Row
                children: [
                  // 左边：图片占位
                  Container(
                    width: 80,
                    height: 80,
                    color: Colors.blue[100],
                    child: const Icon(Icons.image, size: 40),
                  ),
                  const SizedBox(width: 16),

                  // 右边：Column（文字信息）
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          '商品名称',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        const Text(
                          '商品描述信息',
                          style: TextStyle(color: Colors.grey),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              '¥99.00',
                              style: TextStyle(color: Colors.red, fontSize: 18),
                            ),
                            Text('库存: 100'),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// ============================================================
/// 示例6：间距使用
/// ============================================================
/// 两种常用的添加间距方式：
/// 1. SizedBox - 简单直接，推荐使用
/// 2. Padding - 给单个控件添加内边距
class SpacingPage extends StatelessWidget {
  const SpacingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('间距使用')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ========== 方法1：SizedBox ==========
            const Text(
              '方法1：SizedBox（推荐）',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            Container(
              color: Colors.grey[200],
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Container(
                    height: 40,
                    color: Colors.red,
                    child: const Center(child: Text('第一行')),
                  ),

                  // SizedBox 添加垂直间距
                  const SizedBox(height: 20), // 👈 垂直间距 20

                  Container(
                    height: 40,
                    color: Colors.green,
                    child: const Center(child: Text('第二行')),
                  ),

                  const SizedBox(height: 20), // 👈 垂直间距 20

                  Container(
                    height: 40,
                    color: Colors.blue,
                    child: const Center(child: Text('第三行')),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // Row 中使用 SizedBox
            const Text('Row 中使用 SizedBox：'),
            const SizedBox(height: 8),

            Container(
              color: Colors.grey[200],
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Container(width: 60, height: 40, color: Colors.red),

                  const SizedBox(width: 20), // 👈 水平间距 20

                  Container(width: 60, height: 40, color: Colors.green),

                  const SizedBox(width: 20), // 👈 水平间距 20

                  Container(width: 60, height: 40, color: Colors.blue),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // ========== 方法2：Padding ==========
            const Text(
              '方法2：Padding',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            Container(
              color: Colors.grey[200],
              child: Column(
                children: [
                  // Padding 给单个控件添加内边距
                  Padding(
                    padding: const EdgeInsets.all(16), // 👈 四周间距 16
                    child: Container(
                      height: 40,
                      color: Colors.orange,
                      child: const Center(child: Text('四周有间距')),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30, // 👈 左右间距 30
                      vertical: 10, // 👈 上下间距 10
                    ),
                    child: Container(
                      height: 40,
                      color: Colors.purple,
                      child: const Center(
                        child: Text(
                          '左右30，上下10',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(
                      left: 50, // 👈 只有左边间距
                      top: 10,
                      bottom: 10,
                    ),
                    child: Container(
                      height: 40,
                      color: Colors.teal,
                      child: const Center(
                        child: Text(
                          '只有左边间距',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // ========== EdgeInsets 用法总结 ==========
            const Text(
              'EdgeInsets 用法总结：',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),

            Container(
              padding: const EdgeInsets.all(16),
              color: Colors.blue[50],
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('• EdgeInsets.all(10) - 四周都是 10'),
                  SizedBox(height: 4),
                  Text('• EdgeInsets.symmetric(horizontal: 10, vertical: 5)'),
                  Text('  - 左右 10，上下 5'),
                  SizedBox(height: 4),
                  Text('• EdgeInsets.only(left: 10, top: 5)'),
                  Text('  - 只设置指定方向'),
                  SizedBox(height: 4),
                  Text('• EdgeInsets.fromLTRB(10, 5, 10, 5)'),
                  Text('  - 左、上、右、下分别设置'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// ============================================================
/// 示例7：个人信息卡片（实战）
/// ============================================================
/// 综合运用 Column、Row、SizedBox 等布局组件
class ProfileCardPage extends StatelessWidget {
  const ProfileCardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('个人信息卡片')),
      body: Center(
        // Center 让子控件居中显示
        child: Column(
          // 主轴居中（垂直方向居中）
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // ========== 头像 ==========
            const Icon(Icons.account_circle, size: 100, color: Colors.blue),

            // 间距
            const SizedBox(height: 20),

            // ========== 名字 ==========
            const Text(
              '张三',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            // ========== 邮箱行（Row 嵌套）==========
            Row(
              // 主轴居中（水平方向居中）
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.email, size: 16, color: Colors.grey),
                SizedBox(width: 5),
                Text('zhangsan@example.com'),
              ],
            ),

            const SizedBox(height: 10),

            // ========== 电话行（Row 嵌套）==========
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.phone, size: 16, color: Colors.grey),
                SizedBox(width: 5),
                Text('138-0000-0000'),
              ],
            ),

            const SizedBox(height: 30),

            // ========== 操作按钮 ==========
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.edit),
                  label: const Text('编辑'),
                ),
                const SizedBox(width: 20),
                OutlinedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.share),
                  label: const Text('分享'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

/// ============================================================
/// 示例8：底部导航栏（实战）
/// ============================================================
/// 使用 Row + Column 嵌套实现底部导航栏效果
class BottomNavBarPage extends StatelessWidget {
  const BottomNavBarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('底部导航栏')),

      // 页面主体内容
      body: const Center(child: Text('页面内容区域', style: TextStyle(fontSize: 20))),

      // ========== 自定义底部导航栏 ==========
      bottomNavigationBar: Container(
        height: 60,
        decoration: BoxDecoration(
          color: Colors.white,
          // 添加顶部阴影
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              blurRadius: 10,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: Row(
          // spaceAround 让子控件均匀分布
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // 每个导航项都是一个 Column（图标 + 文字）
            _buildNavItem(Icons.home, '首页', true),
            _buildNavItem(Icons.category, '分类', false),
            _buildNavItem(Icons.shopping_cart, '购物车', false),
            _buildNavItem(Icons.person, '我的', false),
          ],
        ),
      ),
    );
  }

  /// 构建单个导航项
  /// [icon] - 图标
  /// [label] - 文字
  /// [isSelected] - 是否选中
  Widget _buildNavItem(IconData icon, String label, bool isSelected) {
    final color = isSelected ? Colors.blue : Colors.grey;

    return Column(
      // 垂直方向居中
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: color,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ],
    );
  }
}

/// ============================================================
/// 🎯 布局知识点总结
/// ============================================================
///
/// 1. Column（垂直布局）
///    - 子控件从上到下排列
///    - mainAxisAlignment 控制垂直方向对齐
///    - crossAxisAlignment 控制水平方向对齐
///
/// 2. Row（水平布局）
///    - 子控件从左到右排列
///    - mainAxisAlignment 控制水平方向对齐
///    - crossAxisAlignment 控制垂直方向对齐
///
/// 3. 对齐方式
///    - start: 开始位置
///    - center: 居中
///    - end: 结束位置
///    - spaceBetween: 两端对齐
///    - spaceAround: 均匀分布
///    - spaceEvenly: 完全均匀
///
/// 4. 间距
///    - SizedBox(height: 20) - 垂直间距
///    - SizedBox(width: 20) - 水平间距
///    - Padding - 给控件添加内边距
///
/// 5. 嵌套布局
///    - Column 里可以放 Row
///    - Row 里可以放 Column
///    - 灵活组合实现复杂布局
///
/// 6. 对比 Android
///    - Column = LinearLayout (vertical)
///    - Row = LinearLayout (horizontal)
///    - mainAxisAlignment = android:gravity
///    - crossAxisAlignment = android:layout_gravity
/// ============================================================
