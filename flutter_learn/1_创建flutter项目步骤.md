# Flutter 项目创建步骤详细教程

## 前言
本教程将手把手教你如何在 Android Studio Otter 上创建一个 Flutter 项目，帮助你从零开始学习 Flutter 开发。

---

## 一、环境准备检查

在创建项目之前，请确保已经安装并配置好以下环境：

### 1. Flutter SDK
- 确保 Flutter SDK 已经安装
- 打开命令行，输入 `flutter doctor` 检查环境是否正常

### 2. Android Studio 配置
- 确保已安装 Android Studio Otter 版本
- 确保已安装 Flutter 和 Dart 插件

---

## 二、创建 Flutter 项目步骤

### 方法一：通过 Android Studio 创建（推荐新手）

#### 第 1 步：启动 Android Studio
1. 打开 Android Studio Otter
2. 如果有项目已打开，点击菜单 `File` → `Close Project` 关闭当前项目，回到欢迎界面

#### 第 2 步：创建新项目
1. 在欢迎界面点击 `New Flutter Project`
   - 如果没有看到这个选项，点击 `New Project`，然后选择 `Flutter`
2. 如果提示选择 Flutter SDK 路径，请选择你的 Flutter SDK 安装目录

#### 第 3 步：配置项目信息
1. **Project name（项目名称）**
   - 输入项目名称，例如：`my_trip_app`
   - 注意：只能使用小写字母、数字和下划线，不能使用大写字母和特殊字符

2. **Project location（项目位置）**
   - 选择项目保存的目录
   - 建议路径：`C:\android\flutter\flutter_learn\my_trip_app`

3. **Description（描述）**
   - 填写项目描述，例如：`A Flutter travel app for learning`

4. **Project type（项目类型）**
   - 选择 `Application` (应用程序)

5. **Organization（组织域名）**
   - 填写反向域名，例如：`com.example`
   - 这将用于生成应用包名，如：`com.example.my_trip_app`

6. **Android language（Android 语言）**
   - 选择 `Kotlin`（推荐）或 `Java`

7. **iOS language（iOS 语言）**
   - 选择 `Swift`（推荐）或 `Objective-C`

8. **Platforms（平台）**
   - 勾选需要支持的平台：
     - ✅ Android
     - ✅ iOS
     - ✅ Web
     - ✅ Windows
     - ⬜ Linux
     - ⬜ macOS

#### 第 4 步：创建项目
1. 确认所有配置无误后，点击 `Create` 按钮
2. Android Studio 会自动创建项目并下载依赖包
3. 等待项目初始化完成（首次创建可能需要几分钟）

---

### 方法二：通过命令行创建

如果你更喜欢使用命令行，可以按以下步骤操作：

#### 第 1 步：打开命令行
1. 按 `Win + R`，输入 `cmd` 或 `powershell`，回车打开命令行
2. 切换到 flutter_learn 目录：
```bash
cd C:\android\flutter\flutter_learn
```

#### 第 2 步：创建项目
执行以下命令：
```bash
flutter create my_trip_app
```

可选参数：
```bash
flutter create --org com.example --project-name my_trip_app my_trip_app
```

#### 第 3 步：打开项目
1. 在 Android Studio 中，点击 `File` → `Open`
2. 选择刚创建的项目目录 `C:\android\flutter\flutter_learn\my_trip_app`
3. 点击 `OK` 打开项目

---

## 三、项目结构说明

创建完成后，你会看到以下目录结构：

```
my_trip_app/
├── android/           # Android 平台相关代码
├── ios/              # iOS 平台相关代码
├── lib/              # Flutter/Dart 主要代码目录
│   └── main.dart     # 应用入口文件
├── test/             # 测试代码目录
├── web/              # Web 平台相关文件
├── windows/          # Windows 平台相关文件
├── pubspec.yaml      # 项目配置文件（依赖管理）
└── README.md         # 项目说明文档
```

### 重要文件说明

#### 1. `lib/main.dart`
- Flutter 应用的入口文件
- 包含应用的主要逻辑代码
- 这是你主要编写代码的地方

#### 2. `pubspec.yaml`
- 项目配置文件
- 管理项目依赖（第三方库）
- 配置资源文件（图片、字体等）

#### 3. `android/` 和 `ios/`
- 原生平台的配置文件
- 一般情况下不需要修改
- 需要配置原生功能时才会用到

---

## 四、运行项目

### 1. 连接设备或启动模拟器

#### Android 设备：
- **真机**：用 USB 连接手机，开启开发者模式和 USB 调试
- **模拟器**：点击 Android Studio 工具栏的 `Device Manager`，创建并启动 AVD

#### Web 浏览器：
- 选择 Chrome 或 Edge 浏览器

#### Windows 桌面：
- 选择 Windows (desktop)

### 2. 选择运行设备
在 Android Studio 顶部工具栏，点击设备下拉框，选择你想要运行的设备

### 3. 运行项目
有以下几种方式运行：

#### 方式一：点击运行按钮
- 点击工具栏的绿色三角形 ▶️ 按钮（Run）

#### 方式二：使用快捷键
- Windows：`Shift + F10`

#### 方式三：使用命令行
在项目根目录执行：
```bash
flutter run
```

指定设备运行：
```bash
flutter run -d chrome          # 在 Chrome 浏览器运行
flutter run -d windows         # 在 Windows 桌面运行
flutter run -d <device-id>     # 在指定设备运行
```

### 4. 查看运行效果
- 首次运行需要编译，可能需要几分钟
- 编译完成后，会看到一个计数器应用
- 点击右下角的 ➕ 按钮，数字会增加

---

## 五、热重载（Hot Reload）功能

Flutter 最强大的功能之一就是热重载，可以在不重启应用的情况下看到代码修改效果。

### 使用方法：
1. 修改 `lib/main.dart` 中的代码
2. 保存文件（`Ctrl + S`）
3. 方式一：Android Studio 会自动热重载
4. 方式二：点击工具栏的闪电 ⚡ 图标
5. 方式三：在终端按 `r` 键（如果是命令行运行）

### 热重启（Hot Restart）：
如果热重载不生效，可以使用热重启：
- 点击工具栏的刷新 🔄 图标
- 或在终端按 `R` 键（大写）

---

## 六、学习建议

### 1. 理解示例代码
创建项目后，仔细阅读 `lib/main.dart` 中的代码，理解：
- Flutter 应用的基本结构
- StatelessWidget 和 StatefulWidget 的区别
- State 状态管理的基本概念

### 2. 修改尝试
在示例代码基础上进行修改：
- 改变文字内容
- 修改颜色主题
- 调整布局样式
- 添加新的按钮或功能

### 3. 参考 trip_flutter 项目
- 打开 `trip_flutter` 项目代码
- 对比学习项目结构
- 逐步实现相似功能

### 4. 循序渐进
建议按以下顺序学习：
1. **基础组件**：Text、Image、Button、Container 等
2. **布局方式**：Row、Column、Stack、ListView 等
3. **导航路由**：页面跳转和参数传递
4. **网络请求**：HTTP 请求和数据处理
5. **状态管理**：Provider、GetX 等状态管理方案
6. **本地存储**：SharedPreferences、数据库等

---

## 七、常见问题解决

### 1. Flutter SDK 未找到
**问题**：创建项目时提示找不到 Flutter SDK

**解决**：
- 在 Android Studio 中，打开 `File` → `Settings`
- 搜索 `Flutter`，设置 Flutter SDK 路径
- 例如：`C:\flutter` 或你的 Flutter 安装目录

### 2. 依赖下载失败
**问题**：项目创建后，依赖包下载失败

**解决**：
- 打开命令行，进入项目目录
- 执行 `flutter pub get` 重新下载依赖
- 如果还是失败，可能需要配置国内镜像：

```bash
# 配置环境变量（临时）
$env:PUB_HOSTED_URL="https://pub.flutter-io.cn"
$env:FLUTTER_STORAGE_BASE_URL="https://storage.flutter-io.cn"
```

### 3. 模拟器无法启动
**问题**：Android 模拟器无法启动

**解决**：
- 确保 BIOS 中开启了虚拟化技术（VT-x 或 AMD-V）
- 检查 Hyper-V 是否冲突（Windows）
- 尝试创建新的 AVD 设备

### 4. Gradle 构建失败
**问题**：Android 构建时 Gradle 同步失败

**解决**：
- 检查网络连接
- 配置 Gradle 国内镜像
- 在 `android/build.gradle` 中添加阿里云镜像

### 5. 热重载不生效
**问题**：修改代码后热重载没有反应

**解决**：
- 尝试热重启（Shift + F10）
- 某些改动需要完全重启应用
- 检查代码是否有语法错误

---

## 八、下一步学习

完成项目创建后，建议继续学习：

1. **Flutter 基础组件教程**
   - 创建文档：`2_Flutter基础组件.md`
   - 学习常用 Widget 的使用

2. **项目结构分析**
   - 创建文档：`3_trip_flutter项目结构分析.md`
   - 深入理解 trip_flutter 项目架构

3. **实现第一个页面**
   - 创建文档：`4_实现首页布局.md`
   - 从零开始实现旅游应用首页

---

## 九、有用的资源

### 官方文档
- Flutter 官方文档：https://flutter.dev/docs
- Flutter 中文网：https://flutter.cn
- Dart 语言指南：https://dart.cn/guides

### 学习工具
- DartPad：https://dartpad.cn （在线练习 Dart）
- Flutter Widget 目录：https://flutter.cn/docs/development/ui/widgets

### 社区资源
- Flutter 中文社区：https://flutter.cn/community
- Pub.dev：https://pub.dev （Flutter 包管理）

---

## 总结

恭喜你完成了 Flutter 项目的创建！现在你已经：

✅ 了解如何在 Android Studio 中创建 Flutter 项目  
✅ 理解了 Flutter 项目的基本结构  
✅ 学会了如何运行和调试 Flutter 应用  
✅ 掌握了热重载的使用方法  

接下来，你可以开始学习 Flutter 的基础组件和布局，逐步实现一个完整的旅游应用。

**记住**：学习编程最重要的是多动手实践，不要害怕犯错，每一次错误都是学习的机会！

---

*最后更新时间：2025-12-15*

