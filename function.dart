
//Dart是一门真正面向对象的语言，甚至其中的函数也是对象，并且有它的类型Function。这意味着函数可以被赋值给变量或者作为参数传递给其他函数。也可以把Dart类的实例当做方法来调用。
int main(){
    print('equals: ${isNoble(0)}');
    print('equals: ${isNoble2(1)}');
    print('equals: ${isNoble3(0)}');
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

