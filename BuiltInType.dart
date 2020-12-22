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
    //带转义字符
    var sNor = "In a raw string, even \n isn't special.";
    print("nor s: $sNor");
    //使用r前缀，可以创建原始字符串
    var sRow = r"In a raw string, even \n isn't special.";
    print("row s: $sRow");
    //一个编译时常量的字面量字符串中，如果存在插值表达式，而表达式内容也是编译时常量， 那么该字符串依旧是编译时常量。插入的常量值类型可以是null，数值，字符串或布尔值。
    //const 类型数据
    const aConstNum = 0;
    const aConstBool = true;
    const aConstString = 'a constant string';
    const validConstString = '$aConstNum $aConstBool $aConstString';//const类型数据
    print("valid const string: $validConstString");

    //Boolean
    //Dart使用bool类型表示布尔值。Dart只有字面量true和false是布尔类型，这两个对象都是编译时常量。
    //Dart的类型安全意味着不能使用if(nonbooleanValue)或者assert (nonbooleanValue)。 而是应该像下面这样，明确的进行值检查：
    //检查空字符串。
    var fullName = '';
    assert(fullName.isEmpty);
    //检查0值
    var hitPoints = 0;
    assert(hitPoints <= 0);
    //检查null值
    var unicorn;
    assert(unicorn == null);
    //检查NaN
    var iMeantToDoThis = 0 / 0;
    assert(iMeantToDoThis.isNaN);
    
    //List
    var list = [1, 2, 3];//[]
    print("$list len: ${list.length}, one: ${list[0]}");
    list[0] = 12;
    print("$list len: ${list.length}, one: ${list[0]}");
    //在List字面量之前添加const关键字，可以定义List类型的编译时常量
    var listConst = const [18, 2, 3];
    print("$listConst, one: ${listConst[0]}");
    //listConst[0] = 12;//错误：常量不可改变

    //Set
    //在Dart中Set是一个元素唯一且无序的集合。Dart为Set提供了Set字面量和Set类型，虽然Set类型一直是Dart的核心部分，但在Dart2.2中才引入Set字面量
    var halogens = {'fluorine', 'chlorine', 'bromine', 'iodine', 'astatine'};//{}
    //创建一个空集，使用前面带有类型参数的{}，或者将{}赋值给Set类型的变量
    var set1 = <String>{};
    Set<String> set2 = {};
    print("$halogens, $set1, $set2");
    //var names = {};//这样会创建一个Map，而不是Set
    //是Set还是Map？Map字面量语法同Set字面量语法非常相似。因为先有的Map字面量语法，所以{}默认是Map类型。如果忘记在{}上注释类型或赋值到一个未声明类型的变量上，那么Dart会创建一个类型为Map<dynamic, dynamic>的对象。
   set1.add('Wbj');
   set1.addAll(halogens);
   print("$set1, len: ${set1.length}");
   //因为set是无序的，所以无法通过下标（位置）获取set中的元素。
   //print("two: ${set1[1]}");//错误：set没有下标运算符
   //在Set字面量前增加const，来创建一个编译时Set常量
   final constantSet = const {
            'fluorine',
            'chlorine',
            'bromine',
            'iodine',
            'astatine'
    };
    //constantSet.add('helium');//错误：无法改变常量的值
    print("constant set: $constantSet");

    //Map
    var gifts = {
        //Key: Value
        'first': 'partridge',
        'second': 'turtledoves',
        'fifth': 'golden rings'
    };
    var nobleGases = {
        2: 'helium',
        10: 'neon',
        18: 'argon',
    };
    //或
    var gifts1 = Map();
    gifts1['first'] = 'partridge';
    gifts1['second'] = 'turtledoves';
    gifts1['first'] = 'golden rings';

    print('gifts map: $gifts');
    print("gifts map key value: ${gifts['first']}");//通过key获取value
    print("gifts map key value: ${gifts['sixth']}");//通过key获取value
    gifts['sixth'] = "Ssywbj";//添加key-value
    print("gifts map key value: ${gifts['sixth']}");//通过key获取value
    print("gifts map length: ${gifts.length}");//获取key-value的对数
    //创建Map运行时常量，要在Map字面量前加上关键字const
    final constantMap = const {
        2: 'helium',
        10: 'neon',
        18: 'argon',
    };
    print('const map: $constantMap');

    //Rune
    //Rune用来表示字符串中的UTF-32 编码字符。
    //Unicode定义全球的书写系统编码，系统中使用的所有字母、数字和符号都对应唯一的数值编码。由于Dart字符串是一系列UTF-16编码单元，因此要在字符串中表示32位Unicode值需要特殊语法支持。
    //表示Unicode编码的常用方法是\uXXXX, XXXX是一个4位的16进制数。例如，心形符号(♥)是\u2665。对于特殊的非4个数值的情况，把编码值放到大括号中即可。例如，emoji的笑脸是\u{1f600}。
    //String类有一些属性可以获得rune数据，属性codeUnitAt和codeUnit返回16位编码数据，属性runes获取字符串中的Rune。

    //演示Rune、16-bit code units和32-bit code points之间的关系
    var clapping = '\u{1f44f}';
    print(clapping);
    print(clapping.codeUnits);
    print(clapping.runes.toList());
    Runes input = new Runes('\u2665 \u{1f605} \u{1f60e} \u{1f47b} \u{1f596} \u{1f44d}');
    print(new String.fromCharCodes(input));

    //Symbol
    //Symbol对象表示程序中声明的运算符或者标识符。在要按名称引用标识符的API时， Symbol非常有用。因为代码压缩后会改变标识符的名称，但不会改变标识符的符号。通过字面量Symbol，也就是标识符前面添加一个#号，来获取标识符的Symbol 。
    //#radix
    //#bar

}
