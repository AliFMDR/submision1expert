import 'package:dartz/dartz.dart';
import 'package:ditonton/domain/usecases/get_tv_wacthlist.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../dummy_data/dummy_tv.dart';
import '../../helpers/test_helper.mocks.dart';

void main() {
  late GetWatchlistTv usecase;
  late MockTvRepository mockMovieRepository;

  setUp(() {
    mockMovieRepository = MockTvRepository();
    usecase = GetWatchlistTv(mockMovieRepository);
  });

  test('should get list of Tv from the repository', () async {
    // arrange
    when(mockMovieRepository.getWatchlistTv())
        .thenAnswer((_) async => Right(testTVList));
    // act
    final result = await usecase.execute();
    // assert
    expect(result, Right(testTVList));
  });
}
