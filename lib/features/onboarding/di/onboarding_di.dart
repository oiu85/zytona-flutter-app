import 'package:get_it/get_it.dart';
import '../presentation/bloc/onboarding_bloc.dart';

/// Register onboarding feature dependencies
void registerOnboardingDi(GetIt getIt) {
  // Register Onboarding Bloc
  getIt.registerFactory<OnboardingBloc>(
    () => OnboardingBloc(),
  );
}

