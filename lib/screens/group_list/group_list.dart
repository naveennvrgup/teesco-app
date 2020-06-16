import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teesco/screens/group_list/bloc/group_list_bloc.dart';
import 'package:teesco/screens/group_list/widgets/group_list_tile.dart';

class GroupList extends StatelessWidget {
  @override
  Widget buildInitial(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.arrow_back,
          color: Colors.black,
        ),
        elevation: 1,
        backgroundColor: Colors.white,
        title: Text(
          'Groups',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Icon(
              Icons.search,
              color: Colors.black,
            ),
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: ListView.builder(
          itemCount: 8,
          itemBuilder: (context, index) {
            return GroupListTile();
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Color(0xFF898989),
        child: Icon(Icons.add),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => GroupListBloc(),
        child: BlocListener<GroupListBloc, GroupListState>(
          listener: (event, state) {},
          child: BlocBuilder<GroupListBloc, GroupListState>(
            builder: (event, state) {
              return buildInitial(context);
            },
          ),
        ),
      ),
    );
  }
}
