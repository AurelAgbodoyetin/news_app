part of 'headlines_bloc.dart';

abstract class HeadlinesEvent extends Equatable {
  const HeadlinesEvent();

  @override
  List<Object> get props => [];
}

class HeadlinesLoadEvent extends HeadlinesEvent {
  @override
  List<Object> get props => [];
}
