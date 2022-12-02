import 'package:dartz/dartz.dart';
import 'package:ditonton/domain/entities/tv.dart';
import 'package:ditonton/domain/repositories/tv_repository.dart';
import 'package:ditonton/common/failure.dart';

class GetTvRecomend {
  final TvRepository repository;

  GetTvRecomend(this.repository);

  Future<Either<Failure, List<TV>>> execute(id) {
    return repository.getTvRecommendations(id);
  }
}
