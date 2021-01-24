import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_db_storage/utility/bloc/data_event.dart';
import 'package:flutter_db_storage/utility/bloc/data_state.dart';

class DataBloc extends Bloc<DataEvent, DataState> {
  DataBloc(DataState initialState) : super(initialState);

  @override
  DataState get initialState => NotInsertingDataState();

  @override
  Stream<DataState> mapEventToState(DataEvent event) async* {
    if (event is InsertDataEvent) {
      yield NotInsertingDataState();
    } else if (event is ViewDataEvent) {
      yield DataInsertedState();
    } else if (event is RefreshEvent) {
      yield DataInsertedState();
    } else if (event is ResetDataEvent) {
      yield NotInsertingDataState();
    }
  }
}
