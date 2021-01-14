void main() {
    //List、Set、Map字面量指定字面量泛型类型
    var names = <String>['Seth', 'Kathy', 'Lars'];
    var uniqueNames = <String>{'Seth', 'Kathy', 'Lars'};
    var pages = <String, String>{
        'index.html': 'Homepage',
        'robots.txt': 'Hints for web robots',
        'humans.txt': 'We are people, not machines'
    };
}

//为什么使用泛型？1.提高代码质量；2.减少重复的代码。
abstract class Cache<T> {
    T getByKey(String key);
    void setByKey(String key, T value);
}
