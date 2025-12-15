# main.dart 学习指南

## 一、代码功能分析

### 1.1 整体功能概述
`main.dart` 是 Flutter 应用的入口文件，主要实现了以下核心功能：
- **应用启动**：初始化 Flutter 应用
- **缓存预加载**：使用 `HiCache` 进行数据缓存初始化
- **登录状态判断**：根据是否有登录凭证决定显示登录页还是主页
- **屏幕适配**：初始化屏幕适配工具
- **路由导航**：根据登录状态跳转到不同页面

### 1.2 核心代码结构

```dart
void main() {
  runApp(const MyApp());  // 应用入口
}

class MyApp extends StatelessWidget {
  // 应用根组件
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter之旅',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: FutureBuilder<dynamic>(
        future: HiCache.preInit(),  // 异步初始化缓存
        builder: (context, snapshot) {
          // 根据初始化状态和登录状态显示不同页面
        },
      ),
    );
  }
}
```

### 1.3 关键技术点

#### 1. FutureBuilder 异步构建
```dart
FutureBuilder<dynamic>(
  future: HiCache.preInit(),  // 异步任务
  builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
    // 根据 snapshot.connectionState 判断异步任务状态
    if (snapshot.connectionState == ConnectionState.done) {
      // 任务完成后的逻辑
    } else {
      // 显示加载中
      return CircularProgressIndicator();
    }
  },
)
```

#### 2. 登录状态判断
```dart
if (LoginDao.getBoardingPass() == null) {
  return const LoginPage();  // 未登录 -> 登录页
} else {
  return const TabNavigator();  // 已登录 -> 主页导航
}
```

#### 3. 屏幕适配初始化
```dart
ScreenHelper.init(context);  // 初始化屏幕适配工具
```

---

## 二、依赖的第三方库

在 `pubspec.yaml` 中需要添加以下依赖：

```yaml
dependencies:
  flutter:
    sdk: flutter
  cupertino_icons: ^1.0.2
  url_launcher: ^6.2.1          # 打开外部链接
  http: ^1.1.1                  # HTTP 网络请求
  flutter_hi_cache: ^0.0.1      # 缓存管理
  carousel_slider: ^5.0.0       # 轮播图
  underline_indicator: ^0.0.4   # 下划线指示器
  flutter_staggered_grid_view: ^0.7.0  # 瀑布流布局
  transparent_image: ^2.0.1     # 透明图片占位
  webview_flutter: ^4.4.3       # WebView
```

---

## 三、需要创建的文件和目录结构

在开始编写 `main.dart` 之前，需要先创建以下文件结构：

```
lib/
├── main.dart                    # 应用入口（本次学习重点）
├── dao/                         # 数据访问层
│   ├── login_dao.dart          # 登录数据访问
│   └── header_util.dart        # HTTP 请求头工具
├── pages/                       # 页面
│   ├── login_page.dart         # 登录页
│   ├── home_page.dart          # 首页
│   ├── search_page.dart        # 搜索页
│   ├── travel_page.dart        # 旅拍页
│   └── my_page.dart            # 我的页面
├── navigator/                   # 导航
│   └── tab_navigator.dart      # 底部导航栏
├── util/                        # 工具类
│   ├── screen_adapter_helper.dart  # 屏幕适配
│   ├── navigator_util.dart     # 导航工具
│   ├── string_util.dart        # 字符串工具
│   └── view_util.dart          # 视图工具
└── widget/                      # 自定义组件
    ├── input_widget.dart       # 输入框组件
    └── login_widget.dart       # 登录按钮组件
```

---

## 四、学习步骤（循序渐进）

### 第一步：准备工作
1. **安装依赖**
   ```bash
   cd my_trip_app
   flutter pub add flutter_hi_cache http url_launcher
   ```

2. **创建基础目录结构**
   ```bash
   mkdir lib/dao lib/pages lib/navigator lib/util lib/widget
   ```

### 第二步：创建工具类（从简单到复杂）

#### 2.1 创建屏幕适配工具 `util/screen_adapter_helper.dart`
```dart
import 'package:flutter/cupertino.dart';

class ScreenHelper {
  static late MediaQueryData _mediaQueryData;
  static late double screenWith;
  static late double screenHeight;
  static late double ratio;

  static init(BuildContext context, {double baseWidth = 375}) {
    _mediaQueryData = MediaQuery.of(context);
    screenWith = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    ratio = screenWith / baseWidth;
  }

  static double getPx(double size) {
    return ScreenHelper.ratio * size;
  }
}
```

**学习要点**：
- `MediaQuery` 获取屏幕信息
- 屏幕适配的原理：设计稿宽度 / 实际屏幕宽度 = 缩放比例

#### 2.2 创建导航工具 `util/navigator_util.dart`
```dart
import 'package:flutter/material.dart';
import 'package:my_trip_app/navigator/tab_navigator.dart';
import 'package:my_trip_app/pages/login_page.dart';

class NavigatorUtil {
  static BuildContext? _context;

  static void updateContext(BuildContext context) {
    _context = context;
  }

  static void goToHome(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const TabNavigator()),
    );
  }

  static void goToLogin() {
    Navigator.pushReplacement(
      _context!,
      MaterialPageRoute(builder: (context) => const LoginPage()),
    );
  }
}
```

**学习要点**：
- `Navigator.pushReplacement` 替换当前页面（不可返回）
- 保存全局 context 用于退出登录

### 第三步：创建数据访问层

#### 3.1 创建 HTTP 请求头工具 `dao/header_util.dart`
```dart
Map<String, String> hiHeaders() {
  return {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };
}
```

#### 3.2 创建登录 DAO `dao/login_dao.dart`
```dart
import 'dart:convert';
import 'package:flutter_hi_cache/flutter_hi_cache.dart';
import 'package:http/http.dart' as http;
import 'package:my_trip_app/util/navigator_util.dart';
import 'header_util.dart';

class LoginDao {
  static const boardingPass = "boarding_pass";

  // 登录方法
  static login({required String userName, required String password}) async {
    Map<String, String> paramsMap = {};
    paramsMap['userName'] = userName;
    paramsMap['password'] = password;
    var uri = Uri.https('api.geekailab.com', '/uapi/user/login', paramsMap);
    final response = await http.post(uri, headers: hiHeaders());
    Utf8Decoder utf8decoder = const Utf8Decoder();
    String bodyString = utf8decoder.convert(response.bodyBytes);
    
    if (response.statusCode == 200) {
      var result = json.decode(bodyString);
      if (result['code'] == 0 && result['data'] != null) {
        _saveBoardingPass(result['data']);
      } else {
        throw Exception(bodyString);
      }
    } else {
      throw Exception(bodyString);
    }
  }

  // 保存登录凭证
  static void _saveBoardingPass(String value) {
    HiCache.getInstance().setString(boardingPass, value);
  }

  // 获取登录凭证
  static getBoardingPass() {
    return HiCache.getInstance().get(boardingPass);
  }

  // 登出
  static void logOut() {
    HiCache.getInstance().remove(boardingPass);
    NavigatorUtil.goToLogin();
  }
}
```

**学习要点**：
- HTTP POST 请求的使用
- JSON 数据解析
- 使用 `HiCache` 持久化存储登录凭证
- 异步编程 `async/await`

### 第四步：创建页面

#### 4.1 创建简单的登录页 `pages/login_page.dart`（先创建简化版）
```dart
import 'package:flutter/material.dart';
import 'package:my_trip_app/dao/login_dao.dart';
import 'package:my_trip_app/util/navigator_util.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? userName;
  String? password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('登录')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: const InputDecoration(labelText: '账号'),
              onChanged: (text) => userName = text,
            ),
            const SizedBox(height: 20),
            TextField(
              decoration: const InputDecoration(labelText: '密码'),
              obscureText: true,
              onChanged: (text) => password = text,
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: _login,
              child: const Text('登录'),
            ),
          ],
        ),
      ),
    );
  }

  _login() async {
    try {
      await LoginDao.login(userName: userName!, password: password!);
      NavigatorUtil.goToHome(context);
    } catch (e) {
      print('登录失败: $e');
    }
  }
}
```

#### 4.2 创建底部导航 `navigator/tab_navigator.dart`
```dart
import 'package:flutter/material.dart';
import 'package:my_trip_app/pages/home_page.dart';
import 'package:my_trip_app/pages/search_page.dart';
import 'package:my_trip_app/pages/travel_page.dart';
import 'package:my_trip_app/pages/my_page.dart';
import '../util/navigator_util.dart';

class TabNavigator extends StatefulWidget {
  const TabNavigator({Key? key}) : super(key: key);

  @override
  State<TabNavigator> createState() => _TabNavigatorState();
}

class _TabNavigatorState extends State<TabNavigator> {
  final PageController _controller = PageController(initialPage: 0);
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    NavigatorUtil.updateContext(context);
    return Scaffold(
      body: PageView(
        controller: _controller,
        physics: const NeverScrollableScrollPhysics(),
        children: const [
          HomePage(),
          SearchPage(),
          TravelPage(),
          MyPage()
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Colors.blue,
        currentIndex: _currentIndex,
        onTap: (index) {
          _controller.jumpToPage(index);
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: '首页'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: '搜索'),
          BottomNavigationBarItem(icon: Icon(Icons.camera_alt), label: '旅拍'),
          BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: '我的'),
        ],
      ),
    );
  }
}
```

**学习要点**：
- `PageView` 实现页面滑动切换
- `BottomNavigationBar` 底部导航栏
- `PageController` 控制页面跳转

#### 4.3 创建四个占位页面
```dart
// pages/home_page.dart
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('首页')),
    );
  }
}
```

同样创建 `search_page.dart`、`travel_page.dart`、`my_page.dart`（内容类似，只改文字）

### 第五步：编写 main.dart（核心）

```dart
import 'package:flutter/material.dart';
import 'package:flutter_hi_cache/flutter_hi_cache.dart';
import 'package:my_trip_app/dao/login_dao.dart';
import 'package:my_trip_app/util/screen_adapter_helper.dart';
import 'package:my_trip_app/navigator/tab_navigator.dart';
import 'package:my_trip_app/pages/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter之旅',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FutureBuilder<dynamic>(
        future: HiCache.preInit(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          ScreenHelper.init(context);
          if (snapshot.connectionState == ConnectionState.done) {
            if (LoginDao.getBoardingPass() == null) {
              return const LoginPage();
            } else {
              return const TabNavigator();
            }
          } else {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        },
      ),
    );
  }
}
```

---

## 五、运行和测试

### 5.1 运行应用
```bash
flutter run
```

### 5.2 测试流程
1. 首次启动 -> 显示加载动画 -> 跳转到登录页
2. 输入账号密码登录 -> 跳转到主页（底部导航）
3. 点击底部导航切换页面
4. 关闭应用重新打开 -> 直接进入主页（已登录状态）

### 5.3 注册测试账号
访问：https://api.geekailab.com/uapi/swagger-ui.html#/Account/registrationUsingPOST

---

## 六、关键知识点总结

### 6.1 Flutter 应用启动流程
```
main() 
  -> runApp(MyApp) 
  -> MaterialApp 
  -> FutureBuilder 异步初始化
  -> 根据状态显示不同页面
```

### 6.2 FutureBuilder 的三种状态
- `ConnectionState.none`：未开始
- `ConnectionState.waiting`：等待中
- `ConnectionState.done`：完成

### 6.3 页面导航方式
- `Navigator.push`：压栈，可返回
- `Navigator.pushReplacement`：替换，不可返回
- `Navigator.pop`：出栈，返回上一页

### 6.4 状态管理
- `StatelessWidget`：无状态组件（不可变）
- `StatefulWidget`：有状态组件（可变）
- `setState()`：更新 UI

---

## 七、常见问题和解决方案

### 问题 1：导入包报错
**解决**：运行 `flutter pub get` 安装依赖

### 问题 2：HiCache 初始化失败
**解决**：确保在 `FutureBuilder` 中等待 `HiCache.preInit()` 完成

### 问题 3：页面跳转后黑屏
**解决**：检查目标页面是否正确创建，是否有语法错误

### 问题 4：登录后刷新还是显示登录页
**解决**：检查 `LoginDao.getBoardingPass()` 是否正确保存和读取

---

## 八、进阶优化方向

1. **美化登录页**：添加背景图、自定义输入框样式
2. **错误处理**：显示登录失败提示（SnackBar 或 Dialog）
3. **加载状态**：登录时显示 loading 动画
4. **表单验证**：检查账号密码格式
5. **记住密码**：使用 SharedPreferences 保存账号
6. **启动页**：添加 Splash Screen

---

## 九、下一步学习计划

1. ✅ **main.dart**（本文档）
2. 📝 **home_page.dart**：首页布局、轮播图、网格列表
3. 📝 **search_page.dart**：搜索功能、列表展示
4. 📝 **travel_page.dart**：旅拍页、瀑布流布局
5. 📝 **my_page.dart**：个人中心、退出登录

---

## 十、参考资料

- Flutter 官方文档：https://flutter.dev/docs
- Dart 语言教程：https://dart.dev/guides
- pub.dev 包管理：https://pub.dev/
- Flutter 中文网：https://flutterchina.club/

---

**祝你学习顺利！遇到问题可以随时查阅这份文档。** 🚀
