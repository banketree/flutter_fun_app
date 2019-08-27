//定义一个state
class ReduxState {
  String name;
  ReduxState.initState() : name = "666";
}

//定义action
enum ActionX {
  Change
}

//定义reducer
ReduxState getReduce(ReduxState state, action) {
  if(action == ActionX.Change) {
    String nname = "1";
    state.name = state.name + nname;
  }
  return state;
}

