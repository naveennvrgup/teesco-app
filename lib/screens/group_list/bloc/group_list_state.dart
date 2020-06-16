part of 'group_list_bloc.dart';

abstract class GroupListState extends Equatable {
  const GroupListState();
}

class GroupListInitial extends GroupListState {
  @override
  List<Object> get props => [];
}
