
import 'package:flutter/material.dart';

class FilterChipDemo3 extends StatefulWidget {
  _FilterChipDemoState3 createState() => _FilterChipDemoState3();
}

class InputEntry{
  final String name;
  final String initials;
  const InputEntry(this.name,this.initials);
  
}
 
class _FilterChipDemoState3 extends State<FilterChipDemo3> {

final List<InputEntry> _lists=<InputEntry>[
    const InputEntry('android', 'A'),
    const InputEntry('java', 'J'),
    const InputEntry('php', 'P'),
    const InputEntry('web', 'W'),
];

List<InputEntry> _inputLists=<InputEntry>[];
Iterable<Widget> get inputWidget sync*{
  for(InputEntry value in _lists){
    _inputLists.add(value);
    yield Padding(
      padding: const EdgeInsets.all(4.0),
      child: InputChip(
        avatar: CircleAvatar(
           backgroundColor: Colors.redAccent.shade400,
           child: Text(value.initials),
        ),
        label: Text(value.name),
        onDeleted: (){
          setState(() {
                      _lists.remove(value);
                    });
         
        },
        
      ),
    );
  }
}

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
         Wrap(
          children: inputWidget.toList(),
        ),
      //   InputChip(
      //   label: Text('刷新'),
      //   onSelected: (bool value){
          
      //   },
      // )
      ],

      

    );
  }
}


  
