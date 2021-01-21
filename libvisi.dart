//通过import指定一个库命名空间中的类如何在另一个库中使用，其参数只需要一个指向库的URI。

//对于内置库，URI为dart:scheme
import 'dart:html';

//对于其他的库，URI为系统文件路径或package:scheme，package:scheme指定由包管理器（如pub工具）提供的库
import 'package:test/test.dart';

//如果导入两个存在冲突标识符的库，则可以为这两个库或者其中一个指定前缀。例如，如果lib1和lib2都有一个Element类，则
import 'package:lib1/lib1.dart';
import 'package:lib2/lib2.dart' as lib2;

//导入库的一部分gi
import 'package:lib1/lib1.dart' show foo; //只导入foo
import 'package:lib2/lib2.dart' hide foo; // 除了foo都导入

void main() {
    //使用lib1中的Element
    Element element1 = Element();
    //使用lib2中的Element
    lib2.Element element2 = lib2.Element();
}