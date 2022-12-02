import 'package:ditonton/domain/usecases/get_tv_wacthlist_status.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../helpers/test_helper.mocks.dart';

void main() {
  late GetWatchListStatusTv usecase;
  late MockTvRepository mockMovieRepository;

  setUp(() {
    mockMovieRepository = MockTvRepository();
    usecase = GetWatchListStatusTv(mockMovieRepository);
  });

  test('should get watchlist status from repository', () async {
    // arrange
    when(mockMovieRepository.isAddedToWatchlistTv(1))
        .thenAnswer((_) async => true);
    // act
    final result = await usecase.execute(1);
    // assert
    expect(result, true);
  });
}
