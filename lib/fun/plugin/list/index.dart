import 'package:flutter/material.dart';


void testList(){
  List list = new List();
  list.add(true);
  list.add(100);
  list.add('a');
  list.add("华为");
  list.add("zhongxing");
  list[0]= "中国"; //修改值
  print(list);  //打印结果 [true, 100, a, 华为]

  print(list[0]); //打印第一个元素 true

  // for
  for (var value in list) {
    print(value);  // 循环打印 true 100 a 华为
  }

  //forEach
  list.forEach((f){
    print(f);      //循环打印 true 100 a 华为
  });

  //截取集合
  print("第一次截取的是");
  print(list.sublist(2)); //设定一个开始位置，默认为最后一个位置   [a, 华为, zhongxing]
  print("第二次截取的是");
//  print(list.sublist(2,list.length ));
  print(list.sublist(2,3)); //不包含最后一个位数 [a]

  var index = list.indexOf("华为");
  print("华为的位置是");
  print(index); // 3

  var isContain = list.contains("华为");
  print("是否存在这个元素");
  print(isContain); //true

//  list.elementAt(1);
  print("list中位置为1的元素");
  print(list.elementAt(1)); //100

  list.removeAt(1);//删除位置为1的元素

  list.remove("zhongxing");

  list.lastIndexOf("华为");

  print(list);

  print("join的用法");//join的用法好像是给每个元素凭借拼接一段数据
  print(list.join("华为"));  //中国华为a华为华为华为zhongxing


  //any
  List numList = [1,2,3,4];
  var any = numList.any((num) => num > 3);
  print(any); //只要有>3的任何元素,返回true

  //every
  var every = numList.every((num)=> num <5);
  print(every);//全部元素<5,返回true

  var one = numList.every((num)=> num <3);
  print(one);//全部元素<3,返回true,否则false
}

void test2(){
  List numList = new List();
  //map
  var mapTest = numList.map((f)=> f*5);
  print(mapTest); //转化成一个map
  print("mapTest的长度"+ mapTest.length.toString());
  mapTest.forEach((f){
    print(f);
  });
  print(mapTest.contains(15)) ;
  print(mapTest.elementAt(1)) ;

  var a = mapTest.toList();//转化成list
  print(a);

  //创建映射表
  var pp = { "a": 100,"b":true,"c":"yy","d":"today","e":"is","f":"a","g":"good","h":"day"};
  print(pp);
  pp["c"]= 5; //更改value
  print(pp.containsKey("today"));
  print(pp.containsValue("today"));
  pp.forEach((k,v){
    print(k+"=="+v.toString());  //类型不一样的时候就toString()
  });

  pp.remove("a");

  pp.keys.forEach((f){
    print(f); //打印所有的key
  });

  pp.values.forEach((f)=>print(f)); //打印所有的value

  //添加新元素 给不存在的key ,赋值
//  pp.putIfAbsent("k", (){55;});
  print(pp);  //{b: true, c: 5, d: today, e: is, f: a, g: good, h: day, k: null}

  pp.putIfAbsent("o", ()=> "love" );
  print(pp); //{b: true, c: 5, d: today, e: is, f: a, g: good, h: day, k: null, o: love}



  Map<String, int> scores = {'Bob': 36};
  for (var key in ['Bob', 'Rohan', 'Sophena']) {
    scores.putIfAbsent(key, () => key.length);
  }
  print(scores);

  //添加一个map
  pp.addAll(scores);  //{b: true, c: 5, d: today, e: is, f: a, g: good, h: day, k: null, o: love, Bob: 36, Rohan: 5, Sophena: 7}{b: true, c: 5, d: today, e: is, f: a, g: good, h: day, k: null, o: love, Bob: 36, Rohan: 5, Sophena: 7}

  print(pp);
}

class ListDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('List集合'),),
      body: Container(),
      floatingActionButton: FloatingActionButton(onPressed: null),
    );
  }
}
