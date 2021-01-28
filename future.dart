//异步支持
//包含返回Future或Stream对象的函数在设置完耗时任务（例如I/O操作）后就立即返回，不会等待耗任务完成。
//使用async和await关键字可实现异步编程。

//处理Future：通过下面两种方式，可获得Future执行完成的结果：
//1.使用async和await；2.使用Future API

//使用async和await关键字的代码是异步的。例如，下面的代码使用await等待异步函数的执行结果。
//await lookUpVersion();

String lookUpVersion(){
    return "1.0.0";
}

//要使用await，代码必须在异步函数（使用async标记的函数）中
Future checkVersion() async {
    var version = await lookUpVersion(); //使用await等待异步函数的执行结果
    //Do something with version
    print('version: $version');

    //一个异步函数中可以多次使用await，如下面代码中等待了三次函数结果：
    //var entrypoint = await findEntrypoint();
    //var exitCode = await runExecutable(entrypoint, args);
    //await flushThenExit(exitCode);
}
//虽然异步函数可能会执行耗时的操作，但它不会等待这些操作。相反，异步函数只有在遇到第一个await表达式时才会执行。
//也就是说，它返回一个Future对象， 仅在await表达式完成后才恢复执行。

//在await表达式中，表达式的值通常是一个Future对象；如果不是，表达式的值也会被自动包装成一个Future对象。
//Future对象指明返回一个对象的承诺（promise），await表达式执行的结果为这个返回的对象。
//await表达式会阻塞代码的执行，直到需要的对象返回为止。
void main() async {
    var version = await lookUpVersion(); //使用await等待异步函数的执行结果
    print('version: $version');
    checkVersion();
    Future<String> version1 = lookUpVersion1();
    print('version1: $version1');
}

//声明异步函数：如果函数的实现非常耗时，可以其更改为异步函数，返回值是Future，如
Future<String> lookUpVersion1() async => '1.0.1';
//如果函数没有返回有效值，需要设置其返回类型为Future<void>