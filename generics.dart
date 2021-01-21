void main() {
    //使用List、Set、Map字面量指定字面量泛型类型
    var names = <String>['Seth', 'Kathy', 'Lars']; //List或Set在声明语句前加<type>前缀
    var uniqueNames = <String>{'Seth', 'Kathy', 'Lars'};
    var pages = <String, String>{ //Map在声明语句前加<keyType, valueType>前缀
        'index.html': 'Homepage',
        'robots.txt': 'Hints for web robots',
        'humans.txt': 'We are people, not machines'
    };

    //使用泛型构造函数：在类名字后面使用尖括号（<...>）来指定泛型类型
    var nameSet = Set<String>.from(names);
    var view = Map<int, String>();

    //运行时中的泛型：Dart中泛型类型是固化的，也就是说它们在运行时携带着类型信息
    names = List<String>();
    names.addAll(['Seth', 'Kathy', 'Lars']);
    print("泛型固化：${names is List<String>}"); //true
    //相反，Java中的泛型会被擦除，也就是说在运行时泛型类型参数的信息是不存在的。在Java中，
    //可以测试对象是否为List类型，但无法测试它是否为List<String> 。

    print("first<T>：${first(names)}");
}

//为什么使用泛型？1.提高代码质量；2.减少重复的代码。
abstract class Cache<T> {
    T getByKey(String key);
    void setByKey(String key, T value);
}

//泛型方法
T first<T>(List<T> ts) {
    T tmp = ts[0];
    return tmp;
}
