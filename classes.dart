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