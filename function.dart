
//Dart是一门真正面向对象的语言，甚至其中的函数也是对象，并且有它的类型Function。这意味着函数可以被赋值给变量或者作为参数传递给其他函数。也可以把Dart类的实例当做方法来调用。

void main(){
    print('equals: ${isNoble(0)}');
    print('equals: ${isNoble2(1)}');
    print('equals: ${isNoble3(0)}');

    //调用可选参数函数，使用指定命名参数：paramName:value
    //enableFlags(true, false);//错误的写法
    enableFlags(bold:true, hidden:false);
    enableFlags(bold:true);
    enableFlags();
    enableFlags3();

    //Flutter 创建实例的表达式可能很复杂，因此窗口小部件构造函数仅使用命名参数，这样创建实例的表达式更易于阅读。
    enableFlags2(bold:false, hidden:true);

    print(say("wbj", "ssy"));
    print(say("wbj", "ssy", "wsh"));
    print(say2("wbj", "ssy"));
    print(say2("wbj", "ssy", "BBB"));
    print(say2("wbj", "ssy", "BBB", "CCC"));
    doStuff();

    var list = ['apples', 'bananas', 'oranges'];
    list.forEach((item){//匿名函数
        print('${list.indexOf(item)}: $item');
    });
    print('如果函数只有一条语句，可以使用箭头(=>)简写');
    list.forEach((item) => print('${list.indexOf(item)}: $item'));

    //创建一个加2的函数
    var add2 = makeAdder(2);
    print("add 2 function: ${add2(3)}");
    //创建一个加3的函数
    var add3 = makeAdder(3);
    print("add 3 function: ${add3(7)}");

    var x;
    print('比较顶级函数：${x == foo}');
    x = foo;
    print('比较顶级函数：${x == foo}');
    x = A.bar;
    print('比较静态方法：${A.bar == x}');
    var v = A(); //A的1号实例
    var w = A(); //A的2号实例
    var y = w;
    x = w.baz;
    //两个闭包引用同一实例(2号)，它们相等
    print("比较实例方法：${y.baz == x}");
    //两个闭包引用非同一个实例，它们不相等
    print("比较实例方法：${v.baz == w.baz}");

    print('函数都有返回值：${foo2() == null}');
}

//函数示例
bool isNoble(int atomicNumber) {
  return atomicNumber == 0;
}

//虽然在Effective Dart中推荐公共API中声明类型, 但是省略类型声明，函数依旧可以正常使用
isNoble2(num) {
  return num == 0;
}

//如果函数中只有一句表达式，可以使用简写语法：=> expr语法是{return expr;} 的简写。=>符号也被称为箭头语法
bool isNoble3(int num) => num == 0; 
//在箭头(=>)和分号(;)之间只能使用一个表达式，不能是语句。例如：不能使用if语句，但是可以使用条件表达式

//命名可选参数函数：使用{param1, param2, ...}来指定命名参数
enableFlags({bool bold, bool hidden}){
    print("bold: $bold, hidden: $hidden");
}

enableFlags2({bool bold, /*@required*/ bool hidden}){
    print("enableFlags2, bold: $bold, hidden: $hidden");
}
//设置命名可选参数默认值
enableFlags3({bool bold, bool hidden = false}){
    print("enableFlags3, bold: $bold, hidden: $hidden");
}

//位置可选参数函数:将参数放到[]中来标记参数是可选的
String say(String from, String msg, [String device]){
    var result = '$from says $msg';
    if (device != null) {
        result = '$result with a $device';
    }
    return result;
}
//设置位置可选参数默认值
String say2(String from, String msg, [String device = "Wei", String mood]){
    var result = '$from says $msg';
    if (device != null) {
        result = '$result with a $device';
    }

    if (mood != null) {
        result = '$result (in a $mood mood)';
    }
    return result;
}
//使用List和Map做默认值
doStuff({List<int> list = const [1, 2, 3], 
        Map<String, String> map = const {
        'one':'1',
        'two':'2'}}){
    print("$list");
    print("$map");
}

//闭包即函数对象，即使函数对象的调用在它原始作用域之外，但依然能够访问在它词法作用域内的变量。
Function makeAdder(num addBy){
    return (num i) => addBy + i;
}

void foo(){} //顶级函数

class A {
    static void bar() {} //静态方法
    void baz() {} //示例方法
}

//所有函数都会返回一个值。如果没有明确指定返回值，函数体会被隐式的添加return null;语句
foo2(){}
