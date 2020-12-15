int main(){
    var y = 1.1; //如果一个数字包含小数点，那么就是小数类型
    var exponents = 1.42e5;
    print("y: $y, exponents: $exponents");
    //String to int
    var one = int.parse('12');
    //String to double
    var dou = double.parse('1.45');
    print('one: $one, dou: $dou');
    //int to String
    String intToString = 1.toString();
    //double to String
    String douToString = 3.14159.toStringAsFixed(2);
    print('intToString: $intToString, douToString: $douToString');
    print('<<，左移：${3 << 1}'); //0011 << 1 = 0110
    print('>>，右移：${3 >> 1}'); //0011 >> 1 = 0001
    print('|，按位或：${3 | 4}'); //0011 | 0100 = 0111
    print('|，按位或：${7 | 4}'); //0111 | 0100 = 0111
    print('&，按位与：${3 & 4}'); //0011 & 0100 = 0000
    print('&，按位与：${3 & 2}'); //0011 & 0010 = 0010

    //数字类型字面量是编译时常量。在算术表达式中，只要参与计算的因子是编译时常量，那么算术表达式的结果也是编译时常量。
    const msPerSecond = 1000;
    const secondsUntilRetry = 5;
    const msUntilRetry = secondsUntilRetry * msPerSecond;
    //msUntilRetry = 23;//试图改变常量值是一种错误

    //字符串通过单引号或者双引号创建
    //字符串通过${expression}的方式内嵌表达式。如果表达式是一个标识符，则{}可以省略
    var s = 'interpolation';
    print("str: $s, to uppercase: ${s.toUpperCase()}");
    var s1 = '''
        You can create
multi-line strings like this one.
        ''';
    var s2 = """This is also a
    multi-line string.""";
    print("$s1");
    print("$s2");
}
