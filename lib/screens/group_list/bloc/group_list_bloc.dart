import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:teesco/models/orgGroup.dart';
import 'package:teesco/screens/group_list/repository.dart';

part 'group_list_event.dart';
part 'group_list_state.dart';

class GroupListBloc extends Bloc<GroupListEvent, GroupListState> {
  @override
  GroupListState get initialState => GroupListInitial();

  @override
  Stream<GroupListState> mapEventToState(
    GroupListEvent event,
  ) async* {
    yield GroupListLoading();

    if (event is FetchGroups) {
      List<OrgGroup> groups = await APIGroupListRepository().fetchGroups();
      yield GroupListInitial(groups);
    }
  }
}
