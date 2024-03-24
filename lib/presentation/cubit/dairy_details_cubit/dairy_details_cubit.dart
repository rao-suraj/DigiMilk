import 'package:dhood_app/domain/repository/dairy_worker_repository.dart';
import 'package:dhood_app/presentation/cubit/dairy_details_cubit/dairy_detials_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class DairyDetailsCubit extends Cubit<DairyDetailsState> {
  final IDairyWorkerRepository _dairyRepository;

  DairyDetailsCubit(this._dairyRepository) : super(const DairyDetailsInitial());

  void getDairyDetails({required String id}) async {
    emit(const DairyDetailsLoading());
    final res = await _dairyRepository.getDairyData(id: id);
    res.fold((left) => emit(DairyDetailsError(left.message!)),
        (right) => emit(DairyDetailsSuccrss(dairyDetails: right)));
  }
}
