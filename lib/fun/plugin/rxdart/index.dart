import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

void test(){
  final subject = PublishSubject<int>();

// observer1 will receive all data and done events
  subject.stream.listen(print);
  subject.add(1);
  subject.add(2);

// observer2 will only receive 3 and done event
  subject.stream.listen(print);
  subject.add(3);
  subject.close();


//  final subject2 = BehaviorSubject<int>(seedValue: 0);
//
//  subject2.add(1);
//  subject2.add(2);
//  subject2.add(3);
//
//  subject2.stream.listen(print); // prints 3
//  subject2.stream.listen(print); // prints 3
//  subject2.stream.listen(print); // prints 3
//  subject2.close();


}


void test2(){
//  你可以把stream直接包装成Observable

  var obs = Observable(Stream.fromIterable([1,2,3,4,5]));

  obs.listen(print);
//  输出：1 2 3 4 5

//  通过Future创建：fromFuture

//  obs = Observable.fromFuture(new Future.value("Hello"));
//
//  obs.listen(print);


//  输出：Hello

//  通过Iterable创建：fromIterable

//  var obs = Observable.fromInterable([1,2,3,4,5]);
//  obs.listen(print);

//  var obs = Observable(Stream.fromIterable([1,2,3,4,5]))
//      .map((item)=>++item);
//
//  obs.listen(print);
}

