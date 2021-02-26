import 'package:flutter_test/flutter_test.dart';
import 'package:marvel/features/series/data/datasources/series_datasources.dart';
import 'package:marvel/features/series/data/repositories/series_repository_remote.dart';
import 'package:marvel/features/series/domain/usecases/get_series_usecase.dart';

void main() {
  testWidgets('Get series test', (WidgetTester tester) async {
    final usecase = GetSeriesUsecase(
      repository:
          SeriesRepositoryRemote(SeriesDataSourceLocal("assets/serie.json")),
    );
    final param = GetSeriesParamsTest();
    final series = await usecase(param);
    expect(series.length(), param.limit);
  });
}
