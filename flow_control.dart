
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
}
