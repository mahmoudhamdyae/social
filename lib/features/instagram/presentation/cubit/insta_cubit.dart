import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social/core/di/di.dart';
import 'package:social/features/instagram/domain/use_cases/get_insta_use_case.dart';
import 'package:social/features/instagram/presentation/cubit/insta_states.dart';

class InstaCubit extends Cubit<InstaStates> {

  final GetInstaUseCase _getInstaUseCase;

  InstaCubit._(
      this._getInstaUseCase,
      ) : super(LoadingGetInstaState());

  static InstaCubit getInstance() => InstaCubit._(
    instance.get<GetInstaUseCase>(),
  );

  void getInsta() {
    emit(LoadingGetInstaState());
    getInstaWithoutLoading();
  }

  void getInstaWithoutLoading() {
    _getInstaUseCase.call().then((response) {
      response.fold((error) {
        emit(ErrorGetInstaState(error.message));
      }, (posts) {
        emit(SuccessGetInstaState(posts));
      });
    });
  }
}