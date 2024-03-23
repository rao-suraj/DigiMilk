import 'package:dhood_app/domain/repository/farmer_repository.dart';
import 'package:dhood_app/presentation/cubit/farmer_details_cubit/farmer_details_state.dart';
import 'package:either_dart/either.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class FarmerDetailsCubit extends Cubit<FarmerDetailsState> {
  final IFarmerRepository _farmerRepository;

  FarmerDetailsCubit(this._farmerRepository)
      : super(const FarmerDetailsInitial());

  void getFarmerList() {
    emit(const FarmerDetailsLoading());
    final res = _farmerRepository.getFarmerList();
    res.fold((left) => emit(FarmerDetailsError(left.message!)),
        (right) => emit(FarmerDetailsSuccrss(farmerInfo: right)));
  }
}
