int main(){
    print('Hello World!');

    var number = 4;//通过var声明局部变量而非使用指定的类型，建议使用这种方式申明创建变量
    printInteger(number);

    dynamic name = 'Bob';//如果一个对象的引用不局限于单一的类型，可以根据将其指定为Object或dynamic类型
    String name2 = 'Bob';//指定类型
    int lineCount;//在Dart中，未初始化的变量拥有一个默认的初始化值：null。即便数字也是如此，因为在Dart中一切皆为对象，数字也不例外
    assert(lineCount == null);
    //assert() 的调用将会在生产环境的代码中被忽略掉。在开发过程中，assert(condition)将会在条件判断为false时抛出一个异常
    print("name: $name, name2: $name2, lineCount: $lineCount");

    //如果不想更改一个变量，可以使用关键字final或者const修饰变量，这两个关键字可以替代var关键字或者加在一个具体的类型前。一个final变量只可以被赋值一次；一个const 变量是一个编译时常量（const变量同时也是final的）。顶层的final变量或者类的final变量在其第一次使用的时候被初始化。
    //实例变量可以是final的但不可以是const的， final实例变量必须在构造器开始前被初始化，比如在声明实例变量时初始化，或者作为构造器参数，或者将其置于构造器的初始化列表中。
    final name4 = 'Bob'; // Without a type annotation
    final String nickname = 'Bobby';
    name = 'Alice'; // Error: a final variable can only be set once.
    print("name4: $name4, nickname: $nickname");
    //使用关键字const修饰变量表示该变量为编译时常量。如果使用const修饰类中的变量，则必须加上static关键字，即static const（顺序不能颠倒）。在声明const变量时可以直接为其赋值，也可以使用其它的const变量为其赋值：
    const bar = 1000000;// 直接赋值 [Unit of pressure (dynes/cm2)]
    const double atm = 1.01325 * bar; //利用其它const变量赋值(Standard atmosphere)
    print("bar: $bar, atm: $atm");
    //const关键字不仅仅可以用来定义常量，还可以用来创建常量值，该常量值可以赋予给任何变量。也可以将构造函数声明为const，这种类型的构造函数创建的对象是不可改变。
    var foo = const [];
    final bar2 = const [];
    const baz = [];//相当于`const []` (Equivalent to `const []`)
    //baz = [42]; // 报错：常量不可以被赋值。(Error: Constant variables can't be assigned a value.)
    //如果使用初始化表达式为常量赋值可以省略掉关键字const，比如上面的常量baz的赋值就省略掉了const
    print("foo: $foo, bar2: $bar2, baz: $baz");
    //从Dart 2.5开始，可以在常量中使用类型检查和强制类型转换(is and as)、collection if以及spread operators(... and ...?)：
    const Object i = 3; // Where i is a const Object with an int value...
    const list = [i as int]; // Use a typecast.
    const map = {if (i is int) i: "int"}; // Use is and collection if.
    const set = {if (list is List<int>) ...list}; // ...and a spread.
    print("i: $i, list: $list, map: $map, set: $set");
}

void printInteger(int number){
    print("The number is $number");
}
