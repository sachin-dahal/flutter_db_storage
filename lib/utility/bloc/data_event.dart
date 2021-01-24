import 'package:equatable/equatable.dart';

class DataEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class InsertDataEvent extends DataEvent {}

class ViewDataEvent extends DataEvent {}

class RefreshEvent extends DataEvent {}

class ResetDataEvent extends DataEvent {}
