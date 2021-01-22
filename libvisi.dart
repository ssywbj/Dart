//通过import指定一个库命名空间中的类如何在另一个库中使用，其参数只需要一个指向库的URI。

//对于内置库，URI为dart:scheme
import 'dart:html';

//对于其他的库，URI为系统文件路径或package:scheme，package:scheme指定由包管理器（如pub工具）提供的库
import 'package:test/test.dart';

//如果导入两个存在冲突标识符的库，则可以为这两个库或者其中一个指定前缀。例如，如果lib1和lib2都有一个Element类，则
import 'package:lib1/lib1.dart';
import 'package:lib2/lib2.dart' as lib2;

//导入库的一部分
import 'package:lib1/lib1.dart' show foo; //只导入foo
import 'package:lib2/lib2.dart' hide foo2; //除了foo2都导入

//延迟加载库：Deferred loading(也称之为lazy loading)可以让应用在需要的时候再加载库，以下是一些应用场景：
//1.减少APP的启动时间；
//2.执行A/B测试，如尝试各种算法的不同实现；
//3.加载很少使用的功能，如可选的屏幕和对话框等。
//要延迟加载一个库，需要先使用deferred as来导入
import 'package:greetings/hello.dart' deferred as hello; //deferred as
//再在需要使用的时候，使用库标识符调用loadLibrary()函数来加载库
Future greet() async { //async、await、loadLibrary()
    await hello.loadLibrary();
    hello.printGreeting();
}
//使用await关键字暂停代码执行一直到库加载完成。在一个库上可以多次调用loadLibrary()函数，但是库只会载入一次。
//使用延迟加载库的时候，注意以下问题：
//1.延迟加载库的常量在导入的时候是不可用的。只有当库加载完毕的时候，库中常量才可以使用。
//2.在导入文件的时候无法使用延迟库中的类型。如果需要使用类型，则考虑把接口类型移动到另外一个库中，让两个库都分别导入这个接口库。
//3.Dart隐含的把loadLibrary()函数导入到使用deferred as的命名空间中，loadLibrary()方法返回一个Future。

void main() {
    //使用lib1中的Element
    Element element1 = Element();
    //使用lib2中的Element
    lib2.Element element2 = lib2.Element();
}