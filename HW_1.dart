import 'dart:math' as math;

// Вычисление НОК
int nok (int a, int b){
  var c = 1;
  while ((c%a + c%b) != 0){c += 1;}
  return c;}

// Вычисление НОД
int nod (int a, int b){
  var c;
  if (a >= b){c = b;}
  else{c = a;}
  while ((a%c + b%c) != 0){c -= 1;}
  return c;
}

// Разбивает число на простые множители и возвращает их.
to_simple(int a){
 
  List<int> res = [1];
  var b = a;
  var i;
  
  do {
    for (i = 2; i <= a; i++){
      if (b%i == 0){
        print('В результате деления $b на $i получили:');
        b = b~/i;
        print(b);
        res.add(i);
        break;
      }
    }
  } while (i < b);
  return res;
}

// Конвертер чисел из десятичного вида в двоичный и обратно. 
// Принимает число для конвертации и bool, определяющий направление конвертации (true - из Decimal в binary). 
binConv(int a, bool back){
  var b = a;
  num res = 0;
  var subRes;
  var i;
  var k;
  
  if (back == false) {
    List<int> bin = [];
    while (b~/2 != 0) {
      bin.add(b%2);
      b = b~/2;
    }
    if (b%2 == 1){bin.add(1);}
    res += int.parse(bin.reversed.toString().replaceAll('(','').replaceAll(', ','').replaceAll(')',''));
  }

  else{
    List bin = [];
    bin = b.toString().split('').toList().reversed.toList();
    for (i=0; i<bin.length; i++){
      if (bin[i] == '1'){
        subRes = 1;
        for (k=i; k > 0; k--){
          subRes *= 2;
        }
        res += subRes;
      }
    }
  }
  return res;
}

 // Принимает строку слов, разделённых пробелами. Задача — найти в данной строке числа и вернуть коллекцию num этих чисел.
numFinder(String a){

  List<num> numbers = [];
  for (var word in a.replaceAll(',', 'replace').replaceAll('.', 'replace').split(' ')){
    if (double.tryParse(word) != null){
      numbers.add(double.parse(word));}
  }
  return numbers;
}

// Возвращает Map. Данный Map должен соотносить слово и количество его вхождений в данную коллекцию.
wordsCounter(List a){
  Map counter = {};

  for (var word in a){
    if (word != ''){
      if (counter.containsKey(word) == false){counter['$word'] = 1;}
      else{counter['$word'] += 1;}
    }
  }
  return counter;
}

// Возвращант цифры без повторений, которые встречаются в данной строке
numFinder2(String a){
  Map numMap = {'zero': 0,'one': 1, 'two': 2,'three': 3, 'four': 4, 'five': 5, 'six': 6, 'seven': 7, 'eight': 8, 'nine':9};
  Set res = {};
  for (var word in a.replaceAll(',', '').replaceAll('.', '').split(' ')){
    if (word != ''){
      if (numMap.containsKey(word.toLowerCase()) == true){
        res.add(numMap[word]);
      }
    }
  }
  return res;
}

// Класс создания точек в трехмерном декартовом пространстве.
class Point{
  final double x;
  final double y;
  final double z;

  Point(this.x, this.y, this.z);
  Point.zero() : x=0, y=0, z=0;

  factory Point.foreverFirst(){
    return Point(1,1,1);
  }

  // initialize(double newX, double newY, double newZ){
    // x = newX; y = newY; z=newZ;
  // }
 
  position(){
    print('X:$x, Y:$y, Z:$z');
  }
 
  distTo(anotherPoint){
    var difX = (x - anotherPoint.x).abs();
    var difY = (y - anotherPoint.y).abs();
    var difZ = (z - anotherPoint.z).abs();
    var difAbs = math.sqrt(difX*difX + difY*difY + difZ*difZ);
    print('Axis X: $difX, Axis Y: $difY, Axis Z: $difZ, AbsDif = $difAbs');
    return difAbs;
  }

  trlSqr(anothPoint1, anothPoint2){
    var a = distTo(anothPoint1);
    var b = distTo(anothPoint2);
    var c = anothPoint2.distTo(anothPoint1);
    var p = 0.5*(a + b +c);
    var s = math.sqrt(p*(p-a)*(p-b)*(p-c));
    return s;
  }


}

// Расширение для класса num производит вычисление корня степени n из числа a
extension expCalc on num{
  exp(int n){
    int i;
    int iterator = 0;

    if (n < 1){return throw Exception("Невозможно вычислить");}
    if (n == 1){return this;}
    if (n > 1){
      num xZeroN;
      num xNext = this;
      num xZero = this/n;

      while (xZero.toStringAsFixed(8) != xNext.toStringAsFixed(8)){
        xZero = xNext;
        xZeroN = xZero;

        for (i=1; i<(n-1); i++){xZeroN *= xZero;}

        xNext = 1/n*((n-1)*xZero + this/(xZeroN));
        iterator += 1;

        if (iterator > 5000){break;}
      }
      // print('Было сделано $iterator итераций.');
      return xZero;

    }
  }
}

class User{
  String email;
  User(this.email);

  void emailOut() {
    print(this.email);
  }
}

class AdminUser extends User with MailSystem{
  AdminUser(String email) : super (email);
  }

mixin MailSystem on User{
  void getMailSystem() {print(email.split('@')[1]);}
}

class GeneralUser extends User{
    GeneralUser(String email) : super (email);
}

class UserManager<T extends User>{
  List userList = [];

  void addUser(User){userList.add(User);}
  void delUser(User){userList.remove(User);}
  void show(){
    int i;
    for (i=0; i<userList.length; i++){
      if (userList[i].runtimeType == GeneralUser){
        print(userList[i].emailOut());
      }
      else {
        print(userList[i].getMailSystem());
      }
    }
  }
}


void main() {

  String text = 'Phasellus laoreet 2 tincidunt justo 1. Fusce suscipit 15 arcu dui 111, eu commodo urna interdum 2 sed. Pellentesque eget 1 urna in 1 sapien aliquam porttitor. '*3;
  List parsedText = text.replaceAll(',', '').replaceAll('.', '').split(' ');
  String mycollection = 'one, two, three, cat, dog, four, four';

  // print(to_simple(126));
  // print(binConv(12, false));
  // print(binConv(110, true));
  // print(numFinder(text));
  // print(wordsCounter(parsedText));
  // print(numFinder2(mycollection));

  final point1 = Point(1,-1,1);
  final point2 = Point(5,6,7);
  final point3 = Point(2,2,2);
  final point4 = Point.zero();
  final point5 = Point.foreverFirst();

  // point1.initialize(1, -1, 1); // Пробовал работать с инициализацией
  point1.position();

  // point2.initialize(5, 6, 7); // Пробовал работать с инициализацией
  point2.position();

  // point3.initialize(2, 2, 2); // Пробовал работать с инициализацией
  point3.position();
  point4.position();
  point5.position();
 
  point1.distTo(point2);
  print(point1.trlSqr(point3, point2));

  User user1 = GeneralUser('lol@korvalola.net');
  User user2 = GeneralUser('luk@otca.net');
  User user3 = GeneralUser('chubaka@thebig.com');
  User user4 = GeneralUser('cat@sleep.net');
  user1.emailOut();

  AdminUser admin = AdminUser('admin@system.true');
  admin.email = 'admin@system.true';
  admin.getMailSystem();




  UserManager manager = UserManager();
  manager.addUser(user1);
  manager.addUser(user2);
  manager.addUser(user3);
  manager.addUser(user4);
  manager.addUser(admin);

  manager.show();


  // num a = 15;
  // print(a.exp(3));
  // print(a.exp(1));
  // print(a.exp(0));  // Вывовет исключение


  
}