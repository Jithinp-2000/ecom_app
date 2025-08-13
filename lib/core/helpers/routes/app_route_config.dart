import 'package:ecom_app/features/home/view/product_details.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../features/home/view/home_page.dart';
import 'app_route_name.dart';
import 'app_route_path.dart';

class AppRoutes {
  static final GoRouter router = GoRouter(
    initialLocation: RoutesPath.homePage,
    routes: [
      GoRoute(
        name: RoutesName.home,
        path: RoutesPath.homePage,
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        name: 'productDetails',
        path: '/product-details/:id',
        builder: (context, state) {
          final id = state.pathParameters['id'];
          return ProductDetailsPage(id: id ?? '');
        },
      ),
    ],
  );
}
