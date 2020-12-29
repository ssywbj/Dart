
void main(){
    //对于有两个操作数的运算符，运算符的功能由左边的操作数决定。例如, 如果有两个操作数Vector和Point，aVector+aPoint使用的是Vector中定义的+运算符。

    //类型判定运算符：is、as、is!
    var obj;
    print('obj is Object: ${obj is Object}');
    int num = 2;
    print('num is String: ${num is String}');
    print('num is int: ${num is int}');
    print('num is not String: ${num is! String}');

    var str = 'WBJ';
    if(str is String){
        print("$str lowercase: ${str.toLowerCase()}");
    }
    var tmp = (str as String).toLowerCase();
    print('$str lowercase: $tmp');
    //以上代码不等价。如果str为null或者不是String对象，那么第一个is的示例，后面将不会执行；而第二个as的示例会抛出异常。

    //如果b为空，将赋值给b；否则b的值保持不变
    var b = 1;
    b ??= 4;
    print('??=, b: $b');
    var c;
    c ??= 4;
    print('??=, c: $c');

    //??，expr1 ?? expr2：如果expr1非空，返回expr1的值；否则返回expr2的值。
    var aa = '----';
    var bb;
    var cc = (aa ?? bb);
    print('cc: $cc');
    var dd = '====';
    var ee = bb ?? dd;
    print('ee: $ee');

    //..，级联运算符(..)可以实现对同一个对像进行一系列的操作，如：
    /*querySelector('#confirm') //获取对象。
        ..text = 'Confirm' //调用成员变量。
        ..classes.add('important')
        ..onClick.listen((e) => window.alert('Confirmed!'));*/
    //级联运算符可以嵌套，如：
    /*final addressBook = (AddressBookBuilder()
            ..name = 'jenny'
            ..email = 'jenny@example.com'
            ..phone = (PhoneNumberBuilder()
                ..number = '415-555-0100'
                ..label = 'home')
            .build())
        .build();*/
    //在返回对象的函数中谨慎使用级联操作符。例如下面错误的代码：
    /*var sb = StringBuffer();
    sb.write('foo')
        ..write('bar');*/ //Error:'void'没有定义write函数
    //sb.write()函数调用返回void，不能在void对象上创建级联操作。
    //严格的来讲，“两个点”的级联语法不是一个运算符。它只是Dart的一个特殊语法
}
