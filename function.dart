
//Dart是一门真正面向对象的语言，甚至其中的函数也是对象，并且有它的类型Function。这意味着函数可以被赋值给变量或者作为参数传递给其他函数。也可以把Dart类的实例当做方法来调用。

int main(){
    print('equals: ${isNoble(0)}');
    print('equals: ${isNoble2(1)}');
    print('equals: ${isNoble3(0)}');

    //调用可选参数函数，使用指定命名参数：paramName:value
    //enableFlags(true, false);//错误的写法
    enableFlags(bold:true, hidden:false);
    enableFlags(bold:true);
    enableFlags();

    //Flutter 创建实例的表达式可能很复杂，因此窗口小部件构造函数仅使用命名参数，这样创建实例的表达式更易于阅读。
    enableFlags2(bold:false, hidden:true);
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

//定义参数可选函数：使用{param1, param2, ...}来指定命名参数
enableFlags({bool bold, bool hidden}){
    print("bold: $bold, hidden: $hidden");
}

enableFlags2({bool bold, /*@required*/ bool hidden}){
    print("enableFlags2, bold: $bold, hidden: $hidden");
}

