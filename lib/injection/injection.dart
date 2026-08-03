import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'injection.config.dart';

/// The global Service Locator instance for dependency injection.
final GetIt getIt = GetIt.instance;

/// Initializes the dependency injection container.
///
/// Annotating with `@InjectableInit` signals the `injectable_generator`
/// to look for classes annotated with `@injectable` or `@lazySingleton`
/// and register them.
@InjectableInit(
  initializerName: 'init', // default
  preferRelativeImports: true, // default
  asExtension: true, // default
)
Future<void> configureDependencies() async => await getIt.init();
