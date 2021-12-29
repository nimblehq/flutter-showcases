import 'package:injectable/injectable.dart';
import 'package:responsive_ui/data/repositories/interest_repository.dart';
import 'package:responsive_ui/data/repositories/post_repository.dart';

abstract class AppContainer {
  PostRepository get postRepository;

  InterestsRepository get interestsRepository;
}

@Singleton(as: AppContainer)
class AppContainerImpl extends AppContainer {
  @override
  InterestsRepository get interestsRepository => FakeInterestRepository();

  @override
  PostRepository get postRepository => FakePostRepository();
}
