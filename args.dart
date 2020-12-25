
void main(List<String> arguments){
    print(arguments);
    print("argument len: ${arguments.length}");

    var msg = loudify('hello');
    print("msg => $msg");
}

var loudify = (msg) => '!!! ${msg.toUpperCase()} !!!';
