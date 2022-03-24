import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecomerce_ui/common/injector/injector.dart';
import 'package:flutter_ecomerce_ui/domain/usescases/banner_usecase.dart';
import 'package:flutter_ecomerce_ui/presentation/home/bloc/home_event.dart';
import 'package:flutter_ecomerce_ui/presentation/home/bloc/home_state.dart';
import 'package:flutter_ecomerce_ui/presentation/home/models/home_response.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitialState()) {
    on<HomeLoadEvent>(_onLoadEvent);
    // on<HomeRefreshEvent>(_onRefreshEvent);
  }

  void _onLoadEvent(HomeLoadEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());
    try {
      HomeResponse homeResponse = HomeResponse(
          homeBanner: await getIt.get<BannerUseCase>().fetchBanner());
      emit(HomeLoadedState(homeResponse));
    } catch (e) {
      print(e.toString());
      emit(HomeLoadFailure());
    }
  }

  void _onRefreshEvent(HomeLoadEvent event, Emitter<HomeState> emit) async {
    _onLoadEvent;
  }
}
