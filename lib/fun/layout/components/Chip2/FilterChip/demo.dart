
import 'package:flutter/material.dart';

class FilterChipDemo2 extends StatefulWidget {
  _FilterChipDemoState2 createState() => _FilterChipDemoState2();
}

class ActorFilerEntry{
  final String name;
  final String initials;
  const ActorFilerEntry(this.name,this.initials);
}


class _FilterChipDemoState2 extends State<FilterChipDemo2> {
  final List<ActorFilerEntry> _list=<ActorFilerEntry>[
    const ActorFilerEntry('android', 'ad'),
    const ActorFilerEntry('java', 'ja'),
    const ActorFilerEntry('php', 'ph'),
    const ActorFilerEntry('web', 'wb'),
  ];

  List<String> _filters=<String>[];
  Iterable<Widget> get actorWidgets sync*{
    for(ActorFilerEntry actor in _list){
      yield Padding(
        padding: const EdgeInsets.all(4.0),
        child: FilterChip(
          // avatar: CircleAvatar(child: Text(actor.initials),),
          label: Text(actor.name),
          selected: _filters.contains(actor.name),
          onSelected: (bool value){
            setState(() {
                          if(value){
                            _filters.add(actor.name);
                          }else{
                            _filters.retainWhere((String name){
                              return name==actor.name;
                            });
                          }
                        });
          },
        ),
      );
    }
  }
  

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Wrap(
          children: actorWidgets.toList(),
        ),
        Text('look for :${_filters.join(',')}')
      ],
    );
  }
}


  
