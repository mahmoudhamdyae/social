
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social/core/di/di.dart';
import 'package:social/features/tiktok/domain/use_cases/get_videos_use_case.dart';
import 'package:social/features/tiktok/presentation/cubit/tiktok_states.dart';

class TiktokCubit extends Cubit<TiktokState> {

  final GetVideosUseCase _getVideosUseCase;

  TiktokCubit._(
      this._getVideosUseCase,
      ) : super(LoadingGetVideosState());

  static TiktokCubit getInstance() => TiktokCubit._(
    instance.get<GetVideosUseCase>(),
  );

  void getVideos() {
    emit(LoadingGetVideosState());
    getVideosWithoutLoading();
  }

  void getVideosWithoutLoading() {
    _getVideosUseCase.call().then((response) {
      response.fold((error) {
        emit(ErrorGetVideosState(error.message));
      }, (videos) {
        emit(SuccessGetVideosState(videos));
      });
    });
  }
}