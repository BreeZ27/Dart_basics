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



void main() {
  // print(to_simple(126));
  // print(binConv(12, false));
  // print(binConv(110, true));

}