import 'package:crypto_coins_list/repositories/crypto_coins/crypto_coins.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'crypto_coin_event.dart';
part 'crypto_coin_state.dart';

class CryptoCoinDetailBloc extends Bloc<CryptoCoinDetailEvent, CryptoCoinDetailState> {
  CryptoCoinDetailBloc() : super(CryptoCoinDetailInitial()) {
    on<LoadCryptoCoinDetail>((event, emit) {
      try {
        if(state is! CryptoCoinDetailLoaded){
          emit(CryptoCoinDetailLoading());
        }

        emit(CryptoCoinDetailLoaded(coin: event.coin));
      } catch (e) {
        emit(CryptoCoinDetailLoadingFailure(exception: e));
      }
    });
  }

}