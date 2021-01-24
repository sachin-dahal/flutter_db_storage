import 'package:equatable/equatable.dart';

class DataState extends Equatable {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class NotInsertingDataState extends DataState {}

class InsertingDataState extends DataState {}

class DataInsertedState extends DataState {}
