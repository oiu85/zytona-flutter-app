import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../routing/navigation_observer.dart';
// TODO: Uncomment when features are created
// import '../../features/subcategories_campaign/di/subcategories_campaign_di.dart';
// import '../../features/campaign/di/campaign_di.dart';
// import '../../features/blog/di/blog_di.dart';
// import '../../features/payment/di/payment_di.dart';
// import '../../features/auth/di/auth_di.dart';
// import '../../features/menu/di/menu_di.dart';
// import '../../features/profile/di/profile_di.dart';
// import '../../features/calculator/di/calculator_di.dart';
// import '../../features/my_contributions/di/contributions_di.dart';
// import '../../features/my_subscriptions/di/subscriptions_di.dart';
// import '../../features/trancparncy_file/di/transparency_di.dart';
// import '../../features/global_search/di/global_search_di.dart';
// import '../../features/favorite/di/favorite_di.dart';
import '../storage/app_storage_service.dart';
import '../network/network_client.dart';
import '../auth/guest_mode_guard.dart';
// TODO: Uncomment when home feature is created
// import '../../features/home/data/data_source/home_remote_data_source.dart';
// import '../../features/home/data/repository_impl/home_repository_impl.dart';
// import '../../features/home/domain/repositories/home_repository.dart';
// import '../../features/home/presentation/bloc/home_bloc.dart';

final getIt = GetIt.instance;

/// Configure and initialize all dependencies
/// This must be called after WidgetsFlutterBinding.ensureInitialized()
Future<GetIt> configureDependencies() async {
  // Initialize SharedPreferences first
  final prefs = await SharedPreferences.getInstance();
  
  // Register SharedPreferences manually
  getIt.registerSingleton<SharedPreferences>(prefs);
  
  // Register storage service
  getIt.registerLazySingleton<AppStorageService>(
    () => SharedPreferencesStorageService(getIt<SharedPreferences>()),
  );
  
  // Register GuestModeGuard
  getIt.registerLazySingleton<GuestModeGuard>(
    () => GuestModeGuard(getIt<AppStorageService>()),
  );
  
  // Register NavigationStateNotifier as singleton
  getIt.registerSingleton<NavigationStateNotifier>(
    NavigationStateNotifier(),
  );
  
  // Register NetworkClient (@singleton)
  getIt.registerSingleton<NetworkClient>(
    NetworkClient(getIt<AppStorageService>()),
  );
  
  // TODO: Uncomment when home feature is created
  // Register Home feature dependencies
  // getIt.registerLazySingleton<HomeRemoteDataSource>(
  //   () => HomeRemoteDataSourceImpl(getIt<NetworkClient>()),
  // );
  // getIt.registerLazySingleton<HomeRepository>(
  //   () => HomeRepositoryImpl(getIt<HomeRemoteDataSource>()),
  // );
  // getIt.registerFactory<HomeBloc>(
  //   () => HomeBloc(getIt<HomeRepository>()),
  // );
  
  // TODO: Uncomment when features are created
  // Register SubcategoriesCampaign feature dependencies
  // registerSubcategoriesCampaignDi(getIt);
  
  // Register Campaign feature dependencies
  // registerCampaignDi(getIt);
  
  // Register Blog feature dependencies
  // registerBlogDi(getIt);
  
  // Register Payment feature dependencies
  // registerPaymentDi(getIt);
  
  // Register Auth feature dependencies
  // registerAuthDi(getIt);
  
  // Register Menu feature dependencies
  // registerMenuDi(getIt);
  
  // Register Profile feature dependencies
  // registerProfileDi(getIt);
  
  // Register Calculator feature dependencies
  // registerCalculatorDi(getIt);
  
  // Register My Contributions feature dependencies
  // registerContributionsDi(getIt);
  
  // Register My Subscriptions feature dependencies
  // registerSubscriptionsDi(getIt);
  
  // Register Transparency File feature dependencies
  // registerTransparencyDi(getIt);
  
  // Register Global Search feature dependencies
  // registerGlobalSearchDi(getIt);
  
  // Register Favorite feature dependencies
  // registerFavoriteDi(getIt);
  
  return getIt;
}
