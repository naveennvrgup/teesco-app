part of 'group_list_bloc.dart';

abstract class GroupListEvent extends Equatable {
  const GroupListEvent();
}

class FetchGroups extends GroupListEvent {
  @override
  List<Object> get props => [];
}
