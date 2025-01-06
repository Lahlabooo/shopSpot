import 'package:go_router/go_router.dart';
import 'package:shopspot/feature/login/peresentation/manager/auth_cubit.dart';
import '../../feature/home/presentation/views/cat_product_view.dart';
import '../../feature/home/presentation/views/fav_view.dart';
import '../../feature/home/presentation/views/home_page.dart';
import '../../feature/login/peresentation/views/login_view.dart';
import '../../feature/login/peresentation/views/registration_view.dart';
import '../../feature/login/peresentation/views/signup_view.dart';
import '../../feature/splash/peresentation/views/splash_view.dart';

abstract class AppRouter {
  static const kHomeView = "/homeView";
  static const kLogin = "/loginView";
  static const kSignup = "/SignupView";
  static const kRegister = "/RegisterView";
  static const kCatProductView = "/CatProductView";
  static const kFavouriteView = "/FavouriteView";

  static final routers = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: kHomeView,
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: kLogin,
        builder: (context, state) =>  LoginView(cubitValue:state.extra as AuthCubit ,),
      ),
      GoRoute(
        path: kSignup,
        builder: (context, state) =>  SignupView(cubitValue: state.extra as AuthCubit,),
      ),
      GoRoute(
        path: kRegister,
        builder: (context, state) => const Registration(),
      ),
      GoRoute(
        path: kCatProductView,
        builder: (context, state) {
          final data = state.extra as Map<String, dynamic>;
          return CatProductView(title: data['title'],
            value: data['value']);
        }  ,
      ),
      GoRoute(
        path: kFavouriteView,
        builder: (context, state) {

          return FavouriteView();
        }  ,
      ),
    ],
  );
}
