
class Point{
    num x; //变量x，初始值为null 
    num y;
}

void main(){
    var point = Point();
    point.x = 4;
    point?.y = 5;
    print('point: ${point.x}, ${point.y}');
    print('point type: ${point.runtimeType}'); //获取对象类型
    //使用”?.“来代替“.”，可以避免左边对象为null导致的异常
    var pTmp;
    pTmp?.y = 5; //如果pTmp非空，则设置属性y的值为4；如果为空也能避免程序异常
}
