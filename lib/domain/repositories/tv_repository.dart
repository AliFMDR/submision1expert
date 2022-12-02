import 'package:dartz/dartz.dart';
import 'package:ditonton/domain/entities/tv.dart';
import 'package:ditonton/domain/entities/tv_detail.dart';
import 'package:ditonton/common/failure.dart';

abstract class TvRepository {
  Future<Either<Failure, List<TV>>> getNowPlayingTv();
  Future<Either<Failure, List<TV>>> getPopularTv();
  Future<Either<Failure, List<TV>>> getTopRatedTv();
  Future<Either<Failure, TvSeriesDetail>> getTvDetail(int id);
  Future<Either<Failure, List<TV>>> getTvRecommendations(int id);
  Future<Either<Failure, List<TV>>> searchTv(String query);
  Future<Either<Failure, String>> saveWatchlistTv(TvSeriesDetail series);
  Future<Either<Failure, String>> removeWatchlistTv(TvSeriesDetail series);
  Future<bool> isAddedToWatchlistTv(int id);
  Future<Either<Failure, List<TV>>> getWatchlistTv();
}
