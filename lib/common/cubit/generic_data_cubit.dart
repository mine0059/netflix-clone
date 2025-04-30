import 'package:bloc/bloc.dart';
import 'package:netflix/core/usecase/usecase.dart';

part 'generic_data_state.dart';

class GenericDataCubit extends Cubit<GenericDataState> {
  GenericDataCubit() : super(DataLoading());

  void getData<T>(useCase usecase, {dynamic params}) async {
    var returnedData = await usecase.call(params: params);
    returnedData.fold((error) {
      emit(FailureLoadData(errorMessage: error));
    }, (data) {
      emit(DataLoaded(data: data));
    });
  }
}
