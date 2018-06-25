import 'package:flutter/material.dart';
import 'package:todos_sqflite_flutter_app/domain/models/todo_model.dart';

class TodosScreen extends StatefulWidget {
  @override
  _TodosScreenState createState() => _TodosScreenState();
}

class _TodosScreenState extends State<TodosScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  final todos = <Todo>[
    Todo('First', 'Some description qqq qqq qqq qqq qq qqq qq qqq', 23),
    Todo('Second', 'Some description qqq qqq qqq qqq qq qqq qq qqq', 23),
    Todo('Third', 'Some description qqq qqq qqq qqq qq qqq qq qqq', 23),
    Todo('Fourth', 'Some description qqq qqq qqq qqq qq qqq qq qqq', 23),
    Todo('Fifth', 'Some description qqq qqq qqq qqq qq qqq qq qqq', 23),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(length: 3, vsync: this);
  }

  Widget _createListTile(Todo todo) {
    return Dismissible(
      key: Key(todo.title),
      background: Container(color: Colors.greenAccent),
      secondaryBackground: Container(color: Colors.redAccent),
//      onDismissed: (direction) => ,
      child: Container(
        padding: EdgeInsets.only(right: 8.0, left: 8.0, top: 4.0, bottom: 4.0),
        child: ListTile(
          title: Text(todo.title),
          subtitle: Text(
            todo.description,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todos'),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.add,
              color: Colors.white,
            ),
            onPressed: () => {},
          )
        ],
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          ListView(
              children: todos.map((todo) => _createListTile(todo)).toList()),
          ListView(
              children: todos.map((todo) => _createListTile(todo)).toList()),
          ListView(
              children: todos.map((todo) => _createListTile(todo)).toList()),
        ],
      ),
      bottomNavigationBar: Material(
        elevation: 8.0,
        color: Colors.white,
        child: TabBar(
          labelColor: Colors.blue,
          tabs: [
            Tab(icon: Icon(Icons.list)),
            Tab(icon: Icon(Icons.done)),
            Tab(icon: Icon(Icons.clear)),
          ],
          controller: _tabController,
        ),
      ),
    );
  }
}
