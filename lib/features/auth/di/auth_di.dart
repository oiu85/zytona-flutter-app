import 'package:get_it/get_it.dart';
import '../presentation/bloc/auth_bloc.dart';

/// Register auth feature dependencies
void registerAuthDi(GetIt getIt) {
  // Register Auth Bloc
  getIt.registerFactory<AuthBloc>(
    () => AuthBloc(),
  );
}

