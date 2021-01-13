import 'dart:math';

class Point{
    num x; //变量x，初始值默认为null
    num y;
    //所有实例变量都会隐式生成getter和setter方法
}

class Point2{
    num x;
    num y;

    /*Point2(num x, num y){
        this.x = x;
        this.y = y;
    }*/

    Point2(this.x, this.y); //语法糖设置变量x和y的值

    Point2.origin(){ //命名构造函数
        x = 21;
        y = 23;
    }

    //重写运算符
    Point2 operator +(Point2 p) => Point2(x + p.x, y + p.y);
    Point2 operator -(Point2 p) => Point2(x - p.x, y - p.y);

    @override
    void noSuchMethod(Invocation invocation) {
        print('You tried to use a non-existent member: ' +
            '${invocation.memberName}');
    }
}
void main(){
    //var p1 = new Point();
    var point = Point();//等价于new Point()，在Dart2中，new关键字变成可选的
    point.x = 4;
    point?.y = 5;
    print('point: ${point.x}, ${point.y}');
    print('point type: ${point.runtimeType}'); //获取对象类型
    //使用”?.“来代替“.”，可以避免左边对象为null导致的异常
    var pTmp;
    pTmp?.y = 5; //如果pTmp非空，则设置属性y的值为4；如果为空也能避免程序异常

    //提供常量构造函数的类在使用常量构造函数时，需在构造函数名之前加const关键字来创建编译时常量，如：
    //var p = const ImmutablePoint(2, 2);
    //构造两个相同的编译时常量会产生一个唯一的标准的实例，如
    //var a = const ImmutablePoint(1, 1);
    //var b = const ImmutablePoint(1, 1);
    //assert(identical(a, b)); // 它们是同一个实例。

    //在常量上下文中，构造函数或者字面量前的const可以省略。例如，下面代码创建了一个const类型的map对象：
    /*const pointAndLine = const { //有很多的const关键字
        'point': const [const ImmutablePoint(0, 0)],
        'line': const [const ImmutablePoint(1, 10), const ImmutablePoint(-2, 11)],
    };*/
    //以上代码可以只保留第一个const关键字，其余的全部省略：
    /*const pointAndLine = { //仅有一个const ，由该const建立常量上下文
        'point': [ImmutablePoint(0, 0)],
        'line': [ImmutablePoint(1, 10), ImmutablePoint(-2, 11)],
    };*/
    //如果常量构造函数在常量上下文之外且省略const关键字，此时创建的对象是非常量对象
    //var a = const ImmutablePoint(1, 1); //创建一个常量对象
    //var b = ImmutablePoint(1, 1); //创建一个非常量对象
    //assert(!identical(a, b)); //两者不是同一个实例

    var pnt = Point2(3, 5);
    print('pnt: ${pnt.x}, ${pnt.y}');
    pnt = new Point2(11, 6);
    print('pnt: ${pnt.x}, ${pnt.y}');
    pnt = Point2.origin(); //使用命名构造函数
    print('pnt: ${pnt.x}, ${pnt.y}');

    //默认情况下，子类的构造函数会自动调用父类的默认构造函数(匿名，无参数)，父类的构造函数在子类构造函数体开始执行的位置被调用。
    //如果父类中没有匿名无参的构造函数，则需要手工调用父类的其他构造函数：当前构造函数冒号(:)之后函数体之前使用super关键字调用父类构造函数。
    var emp = Employee.fromJson({});
    //在构造函数体执行之前初始化变量
    Person.fromPoint({});
    Person.withAssert(-1, 6);
    Person.withSqrt(3, 4);
    var psn = Person.single(30);
    print('person:{${psn.x}, ${psn.y}}');

    var logger = Logger('UI');
    logger.log('Button clicked');

    var rect = Rectangle(3, 4, 20, 15);
    print('rect: ${rect.left}');
    rect.right = 12;
    print('rect: ${rect.left}');

    print(greetBob(Person2('Kathy')));
    print(greetBob(Impostor()));

    var p2 = Point2(9, 7);
    var p3 = Point2(1, 3);
    var p23 = p2 + p3;
    print('p23: (${p23.x}, ${p23.y})');
    var p23_ = p2 - p3;
    print('p23_: (${p23_.x}, ${p23_.y})');
}

class Person {
    String firstName;

    Person.fromJson(Map map){
        print('in Person');
    }

    num x, y, z;

    Person.fromPoint(Map<String, num> json)
        : x = json['1'],
          y = json['2']{
      print('in Person: Point($x, $y)');
    }

    //在开发期间，可以使用assert来验证输入的初始化列表
    Person.withAssert(this.x, this.y) : assert(x >= 0, 'x need bigger than 0') {
      print('In Person.withAssert(): ($x, $y)');
    }

    Person.withSqrt(this.x, this.y)
        :z = sqrt(x * x + y * y){
      print('In Person.withAssert(): ($x, $y, $z)');
    }

    Person(this.x, this.y);

    Person.single(x) : this(x, 2); //构造函数重定向
}

class Employee extends Person {
    Employee.fromJson(Map map) : super.fromJson(map){
        print('in Employee');
    }
}

//常量构造函数
//如果类生成的对象固定不变，那么就可以把这些对象定义为编译时常量。为此，需要定义一个const构造函数，并且声明所有实例变量为final。
class ImmutablePoint{
    static final ImmutablePoint origin = const ImmutablePoint(1, 2);

    final num x, y;
    const ImmutablePoint(this.x, this.y);
}
//注意：常量构造函数创建的实例并不总是常量

//工厂构造函数
//当执行构造函数并不总是创建类的新实例时，则使用factory关键字。例如，一个工厂构造函数可能会返回一个cache中的实例，或者可能返回一个子类的实例:
class Logger{
    final String name;
    bool mute = false;

    static final Map<String, Logger> _cache = <String, Logger>{};

    factory Logger(String name) {
        if (_cache.containsKey(name)) {
            return _cache[name];
        } else {
            final logger = Logger._internal(name);
            _cache[name] = logger;
            return logger;
        }
    }

    Logger._internal(this.name);

    void log(String msg) {
        if (!mute) print(msg);
    }
}

//Getter和Setter
//Getter和Setter是用于对象属性读和写的特殊方法。每个实例变量都有一个隐式Getter和Setter，
//使用get和set关键字实现Getter和Setter，能够为实例创建额外的属性。
class Rectangle {
    num left, top, width, height;

    Rectangle(this.left, this.top, this.width, this.height);

    //定义两个计算属性：right和bottom
    num get right => left + width;
    set right(num value) => left = value - width;
    num get bottom => top + height;
    set bottom(num value) => top = value - height;
}
//最开始实现Getter和Setter也许是直接返回成员变量；随着需求变化，Getter和Setter可能需要进行计算处理
//而使用方法来实现，但是调用对象的代码不需要做任何修改。

//隐式接口
//每个类都隐式定义了一个接口，接口包含类所有的实例成员及其实现的接口。如果要创建A类，A要支持B类的API，
//但是不需要继承B的实现，那么可以通过A实现B的接口。
//person类，隐式接口里面包含greet()方法声明
class Person2 {
    //包含在接口里，但只在当前库中可见。
    final _name;

    //不包含在接口里，因为这是构造函数。
    Person2(this._name);

    //包含在接口里。
    String greet(String who) => 'Hello, $who. I am $_name.';
}
//person接口的实现
class Impostor implements Person2 {
    get _name => '';

    String greet(String who) => 'Hi $who. Do you know who I am?';
}
String greetBob(Person2 person) => person.greet('Bob');