import 'package:ditonton/domain/entities/tv.dart';
import 'package:ditonton/domain/entities/tv_detail.dart';
import 'package:ditonton/domain/usecases/get_tv_detail.dart';
import 'package:ditonton/domain/usecases/get_now_playing_tv.dart';
import 'package:ditonton/domain/usecases/get_popular_tv.dart';
import 'package:ditonton/domain/usecases/get_tv_recommendation.dart';
import 'package:ditonton/domain/usecases/get_top_rated_tv.dart';
import 'package:ditonton/domain/usecases/get_tv_wacthlist.dart';
import 'package:ditonton/domain/usecases/get_tv_wacthlist_status.dart';
import 'package:ditonton/domain/usecases/remove_tv_wacthlist.dart';
import 'package:ditonton/domain/usecases/tv_watchlist.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'tv_event.dart';
part 'tv_state.dart';

class NowPlayingTvBloc extends Bloc<TvEvent, TvState> {
  final GetNowPlayingTv _getNowPlayingTv;

  NowPlayingTvBloc(this._getNowPlayingTv) : super(TvEmpty()) {
    on<FetchNowPlayingTv>((event, emit) async {
      emit(TvLoading());
      final result = await _getNowPlayingTv.execute();

      result.fold((failure) {
        emit(TvHasError(failure.message));
      }, (tvData) {
        emit(TvHasData(tvData));
      });
    });
  }
}

class PopularTvBloc extends Bloc<TvEvent, TvState> {
  final GetPopularTv _getPopularTv;

  PopularTvBloc(this._getPopularTv) : super(TvEmpty()) {
    on<FetchPopularTv>((event, emit) async {
      emit(TvLoading());
      final result = await _getPopularTv.execute();

      result.fold((failure) {
        emit(TvHasError(failure.message));
      }, (tvData) {
        emit(TvHasData(tvData));
      });
    });
  }
}

class TopRatedTvBloc extends Bloc<TvEvent, TvState> {
  final GetTopRatedTv _getTopRatedTv;

  TopRatedTvBloc(this._getTopRatedTv) : super(TvEmpty()) {
    on<FetchTopRatedTv>((event, emit) async {
      emit(TvLoading());
      final result = await _getTopRatedTv.execute();

      result.fold((failure) {
        emit(TvHasError(failure.message));
      }, (tvData) {
        emit(TvHasData(tvData));
      });
    });
  }
}

class TvBloc extends Bloc<TvEvent, TvState> {
  final GetTvDetail _getTvDetail;

  TvBloc(this._getTvDetail) : super(TvEmpty()) {
    on<FetchTvDetail>((event, emit) async {
      final id = event.id;
      emit(TvLoading());
      final result = await _getTvDetail.execute(id);

      result.fold(
        (failure) {
          emit(TvHasError(failure.message));
        },
        (tv) {
          emit(TvDetailHasData(tv));
        },
      );
    });
  }
}

class RecommendationTvBloc extends Bloc<TvEvent, TvState> {
  final GetTvRecomend _getTVRecommendation;

  RecommendationTvBloc(this._getTVRecommendation) : super(TvEmpty()) {
    on<FetchTvRecommendation>((event, emit) async {
      final int id = event.id;

      emit(TvLoading());
      final result = await _getTVRecommendation.execute(id);

      result.fold((failure) {
        emit(TvHasError(failure.message));
      }, (tvData) {
        emit(TvHasData(tvData));
      });
    });
  }
}

class WatchlistTvBloc extends Bloc<TvEvent, TvState> {
  final GetWatchlistTv getWatchlistTv;
  final GetWatchListStatusTv getWatchListStatusTv;
  final SaveWatchlistTv saveWatchlistTv;
  final RemoveWatchlistTv removeWatchlistTv;

  static const watchlistAddSuccessMessage = 'Added to Watchlist';
  static const watchlistRemoveSuccessMessage = 'Removed from Watchlist';

  WatchlistTvBloc(this.getWatchlistTv, this.getWatchListStatusTv,
      this.saveWatchlistTv, this.removeWatchlistTv)
      : super(TvEmpty()) {
    on<FetchWatchlistTv>((event, emit) async {
      emit(TvLoading());
      final result = await getWatchlistTv.execute();

      result.fold((failure) {
        emit(TvHasError(failure.message));
      }, (tvData) {
        emit(WatchlistTvHasData(tvData));
      });
    });
    on<AddWatchlistTv>((event, emit) async {
      final tv = event.tv;

      emit(TvLoading());
      final result = await saveWatchlistTv.execute(tv);

      result.fold((failure) {
        emit(TvHasError(failure.message));
      }, (successMessage) {
        emit(WatchlistTvMessage(successMessage));
      });
    });
    on<LoadWatchlistTvStatus>((event, emit) async {
      final id = event.id;

      emit(TvLoading());
      final result = await getWatchListStatusTv.execute(id);

      emit(LoadTvWatchlistData(result));
    });
    on<RemoveWatchlistTv>((event, emit) async {
      final tv = event.tv;

      emit(TvLoading());
      final result = await removeWatchlistTv.execute(tv);

      result.fold((failure) {
        emit(TvHasError(failure.message));
      }, (successMessage) {
        emit(WatchlistTvMessage(successMessage));
      });
    });
  }
}
