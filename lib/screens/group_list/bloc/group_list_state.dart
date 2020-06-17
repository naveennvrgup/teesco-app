part of 'group_list_bloc.dart';

abstract class GroupListState extends Equatable {
  const GroupListState();
}

class GroupListInitial extends GroupListState {
  final List<OrgGroup> groups;

  GroupListInitial(this.groups);

  @override
  List<Object> get props => [groups];
}

class GroupListLoading extends GroupListState {
  @override
  List<Object> get props => [];
}
