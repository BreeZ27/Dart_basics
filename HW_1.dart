int nok (int a, int b){
  var c = 1;
  while ((c%a + c%b) != 0){c += 1;}
  return c;}


int nod (int a, int b){
  var c;
  if (a >= b){c = b;}
  else{c = a;}
  while ((a%c + b%c) != 0){c -= 1;}
  return c;
}

binConv(int a, bool back){
  List<int> bin = [];
  var b = a;
  var res;
  var subRes;
  var i;
  var k;
  
  if (back = false){
    while (b~/2 != 0){
    bin.add(b%2);
    b = b~/2;}
    if (b%2 == 1){bin.add(1);}
    res = int.parse(bin.reversed.toString().replaceAll('(','').replaceAll(', ','').replaceAll(')',''));
  }
  else{
    for (i=b.toString().length-1; i==0; i--){
      subRes = 1;
//       print(subRes);
      for (k=i; k==1; k--){subRes *= 2;}
      res += subRes;
      print(res);
    }
  }
  return res;
}



void main() {
  print(binConv(12, false));
  print(binConv(12, true));
}