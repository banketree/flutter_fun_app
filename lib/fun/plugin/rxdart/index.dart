import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'dart:async';

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

class RxDartDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RxDartDemo'),
        elevation: 0.0,
      ),
      body: RxDartDemoHome(),
    );
  }
}

class RxDartDemoHome extends StatefulWidget {
  @override
  _RxDartDemoHomeState createState() => _RxDartDemoHomeState();
}

class _RxDartDemoHomeState extends State<RxDartDemoHome> {
  PublishSubject<String> _textFieldSubject;

  @override
  void initState() {
    super.initState();

    _textFieldSubject = PublishSubject<String>();

    _textFieldSubject
    // .map((item) => 'item: $item')
    // .where((item) => item.length > 9)
        .debounce(Duration(milliseconds: 500))
        .listen((data) => print(data));

    // Observable<String> _observable =
    //     // Observable(Stream.fromIterable(['hello', 'æ‚¨å¥½']));
    //     // Observable.fromFuture(Future.value('hello ~'));
    //     // Observable.fromIterable(['hello', 'æ‚¨å¥½']);
    //     // Observable.just('hello ~');
    //     Observable.periodic(Duration(seconds: 3), (x) => x.toString());

    // _observable.listen(print);

    // PublishSubject<String> _subject = PublishSubject<String>();
    // BehaviorSubject<String> _subject = BehaviorSubject<String>();
    // ReplaySubject<String> _subject = ReplaySubject<String>(maxSize: 2);

    // _subject.add('hello');
    // _subject.add('hola');
    // _subject.add('hi');
    // _subject.listen((data) => print('listen 1: $data'));
    // _subject.listen((data) => print('listen 2: ${data.toUpperCase()}'));

    // _subject.close();
  }

  @override
  void dispose() {
    super.dispose();
    _textFieldSubject.close();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        primaryColor: Colors.black,
      ),
      child: TextField(
        onChanged: (value) {
          _textFieldSubject.add('input: $value');
        },
        onSubmitted: (value) {
          _textFieldSubject.add('submit: $value');
        },
        decoration: InputDecoration(
          labelText: 'Title',
          filled: true,
        ),
      ),
    );
  }
}

