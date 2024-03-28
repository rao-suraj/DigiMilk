import 'package:dhood_app/domain/repository/farmer_repository.dart';
import 'package:dhood_app/presentation/cubit/add_farmer_cubit/add_farmer_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class AddFarmerCubit extends Cubit<AddFarmerStates> {
  final IFarmerRepository _farmerRepository;

  AddFarmerCubit(this._farmerRepository) : super(const AddFarmerInitial());

  Future<void> addFarmer(
      {required String name,
      required String id,
      required String password}) async {
    final res = await _farmerRepository.addFarmer(
        name: name, id: id, password: password);
    emit(res.fold((left) => AddFarmerError(left.message!),
        (right) => const AddFarmerSuccess()));
  }
}
