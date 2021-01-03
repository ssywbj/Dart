
void main(){
    //闭包在Dart的for循环中会捕获循环的index索引值，来避免JavaScript中常见的陷阱
    var callbacks = [];
    for(int i = 0;i < 2;i++){
        callbacks.add(()=>print(i));
    }
    //符合期望，输出的是0和1。但是示例中的代码在JavaScript中会连续输出两个2
    callbacks.forEach((c) => c());                

    //实现Iterable的类（如List和Set）同样也支持使用for-in进行迭代操作iteration 
    var collection = [9, 4, 5];
    for(var x in collection){
        print("x = $x");
    }

    //在非空case中实现fall-through形式：使用continue语句结合lable 的方式实现
    var command = 'CLOSED';
    switch(command){
        case 'CLOSED':
            print('case close'); 
            continue newClose; //continue label形式
        case 'OPENED':
            print('case opened');
            break;
        newClose:
        case 'NEW_CLOSED': //执行'CLOSED'又执行'NEW_CLOSED'
            print('case new closed');
            break;
        default:
            print('case default');
    }

    //assert
    //如果assert语句中的布尔条件为false，那么正常的程序执行流程会被中断
    var number = 101; //确认变量值小于100
    //运行：dart --enable-asserts flow_control.dart
    assert(number < 100);
    //assert的第二个参数可以为其添加一个字符串消息
    //assert(number < 100, 'the number should bigger than 100');
    print('no exec to here!');
    //assert语句只在开发环境中有效，在生产环境无效；Flutter中的assert只在debug模式中有效。开发用的工具，如dartdevc默认开启assert功能。其他的一些工具，例如dart和dart2js, 支持通过命令行开启assert：--enable-asserts

    //异常
    //和Java有所不同，Dart中的所有异常是非检查异常，方法不会声明它们抛出的异常，也不要求捕获任何异常。
    //throw
    //抛出异常示例
    //throw FormatException('Expected at least 1 section');
    //可以抛出任意的对象
    //throw 'Out of llamas!';
    //提示：高质量的代码通常会实现Error或Exception类型的异常抛出
    //因为抛出异常是一个表达式，所以可以在 => 语句中使用，也可以在其他使用表达式的地方抛出异常，如
    //void distanceTo(Point other) => throw UnimplementedError();
    //catch
    //捕获异常可以避免异常继续传递（除非重新抛出（rethrow）异常）
    //捕获语句中可以同时使用on和catch，也可以单独分开使用。使用on来指定异常类型，使用catch来捕获异常对象
    //catch()函数可以指定1到2个参数，第一个参数为抛出的异常对象，第二个为堆栈信息(一个StackTrace对象)
    try{
        print('1 + 2:${1 + 2}');
    } on FormatException {
        print('on format excepiotn');
    }
    try{
        dynamic flag = true;
        print(flag++);
    } on FormatException { //一个特殊的异常
        print('on format exception');
    } on Exception catch(e) { //其他任何异常
        print('on exception: $e');
    } catch(e, s){ //没有指定的类型，处理所有异常
        print('on catch: \n$e');
        print('Stack trace: \n$s');
    }
    try{
        misbehave();
    } catch(e) {
        print('main() finished handling ${e.runtimeType}.');
    } finally {
        print('on finally');
    }
    //finally
    //不管是否抛出异常，finally中的代码都会被执行。如果catch没有匹配到异常，异常会在finally执行完成后，再次被抛出
}

//如果仅需要部分处理异常，那么可以使用关键字rethrow将异常重新抛出。
void misbehave() {
    try {
        dynamic foo = true;
        print(foo++); //Runtime error
    } catch (e) {
        print('misbehave() partially handled ${e.runtimeType}.');
        rethrow; //Allow callers to see the exception.
    }
}
