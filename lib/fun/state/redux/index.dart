import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'redux_state.dart';


class ReDuxDemo3 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final store = Store<ReduxState>(
        getReduce,
        initialState: ReduxState.initState()
    );

    return StoreProvider(
        store: store,
        child: StoreBuilder<ReduxState>(builder: (BuildContext context, Store<ReduxState> store){
          return MaterialApp(
            title: 'ReduxDemo3',
            theme: new ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: OnePage(),
          );
        })
    );
  }
}

class OnePage extends StatefulWidget {
  @override
  _OnePageState createState() => _OnePageState();
}

class _OnePageState extends State<OnePage> {
  @override
  Widget build(BuildContext context) {

    return StoreBuilder<ReduxState>(
        builder: (BuildContext context, Store<ReduxState> store){
          return Scaffold(
            appBar: AppBar(
              title: Text("ReduxDemo3"),
            ),
            body: Center(
                child: Column(
                  children: <Widget>[
                    Text(store.state.name),
                    SizedBox(height: 100,),
                    FlatButton(
                        onPressed: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context){
                            return TwoPage();
                          }));
                        },
                        child: Text("下一页")
                    )
                  ],
                )
            ),
          );
        }
    );
  }
}


class TwoPage extends StatefulWidget {
  @override
  _TwoPageState createState() => _TwoPageState();
}

class _TwoPageState extends State<TwoPage> {
  @override
  Widget build(BuildContext context) {
    return StoreBuilder<ReduxState>(
        builder: (BuildContext context, Store<ReduxState> store){
          return Scaffold(
              body: Center(
                  child: Column(
                    children: <Widget>[
                      StoreConnector<ReduxState, String>(
                        converter: (store) => store.state.name,
                        builder: (BuildContext context, String name) {
                          return Text(name);
                        },
                      ),
                      SizedBox(height: 100,),
                      StoreBuilder<ReduxState>(
                          builder: (context, store) {
                            return FlatButton(
                                onPressed: (){
                                  store.dispatch(ActionX.Change);
                                },
                                child: Text("点击变换数据")
                            );
                          }
                      ),
                    ],
                  )
              ),
          );
        }
    );
  }
}
