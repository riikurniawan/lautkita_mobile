part of 'article_bloc.dart';

@freezed
class ArticleEvent with _$ArticleEvent {
  const factory ArticleEvent.started() = _Started;
  const factory ArticleEvent.getAll() = _GetAll;
  const factory ArticleEvent.getByCategory(int categoryId) = _GetByCategory;
}