part of 'tv_bloc.dart';

abstract class TvEvent extends Equatable {
  const TvEvent();

  @override
  List<Object> get props => [];
}

class FetchNowPlayingTv extends TvEvent {}

class FetchPopularTv extends TvEvent {}

class FetchTopRatedTv extends TvEvent {}

class FetchTvDetail extends TvEvent {
  final int id;
  const FetchTvDetail(this.id);

  @override
  List<Object> get props => [id];
}

class FetchTvRecommendation extends TvEvent {
  final int id;
  const FetchTvRecommendation(this.id);

  @override
  List<Object> get props => [id];
}

class FetchWatchlistTv extends TvEvent {}

class AddWatchlistTv extends TvEvent {
  final TvSeriesDetail tv;

  const AddWatchlistTv(this.tv);
  @override
  List<Object> get props => [tv];
}

class RemoveWatchlistTv extends TvEvent {
  final TvSeriesDetail tv;

  const RemoveWatchlistTv(this.tv);
  @override
  List<Object> get props => [tv];

  execute(TvSeriesDetail tv) {}
}

class LoadWatchlistTvStatus extends TvEvent {
  final int id;

  const LoadWatchlistTvStatus(this.id);
  @override
  List<Object> get props => [id];
}
