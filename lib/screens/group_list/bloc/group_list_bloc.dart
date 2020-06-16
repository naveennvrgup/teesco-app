import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'group_list_event.dart';
part 'group_list_state.dart';

class GroupListBloc extends Bloc<GroupListEvent, GroupListState> {
  @override
  GroupListState get initialState => GroupListInitial();

  @override
  Stream<GroupListState> mapEventToState(
    GroupListEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
