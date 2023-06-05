import 'package:simple_bank/model/scribs_model.dart';

class WatchlistModel {
  String? watchListName;
  String? watchListType;
  String? desc;
  int? scribsCount;
  List<ScribsListModel>? scribsList;

  WatchlistModel({
    this.scribsCount,
    this.desc,
    this.watchListType,
    this.watchListName,
    this.scribsList,
  });
}
