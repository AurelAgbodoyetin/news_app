import 'package:equatable/equatable.dart';

class SearchParams extends Equatable {
  final String keyword;

  SearchParams({this.keyword});
  @override
  List<Object> get props => [keyword];
}
