import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopnew/data/repo/cart_repo.dart';
import 'package:shopnew/screens/auth/cubit/auth_cubit.dart';
import 'package:shopnew/screens/auth/send_sms_screen.dart';
import 'package:shopnew/screens/cart/bloc/cart_bloc.dart';
import 'package:shopnew/screens/mainscreen/main_screen.dart';
import 'package:shopnew/utils/shared_prefrences_manager.dart';

import 'component/themes.dart';
import 'routs/routs.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefrencesManager().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: MaterialApp(
        title: "Sky Line",
        theme: lightTheme(),
        // initialRoute: ScreenNames.root,
        routes: routs,
        home: BlocBuilder<AuthCubit, AuthState>(
          builder: (context, state) {
            if (state is LoggedInState) {
              return MultiBlocProvider(
                providers: [
                  BlocProvider(
                    create: (context) {
                      final cartBloc = CartBloc(cartRepository);
                      cartBloc.add(CartInitEvent());
                      cartBloc.add(CartItemCountEvent());
                      return cartBloc;
                    },
                  ),
                ],
                child: const MainScreen(),
              );
            } else if (state is LoggedOutState) {
              return SendSmsScreen();
            } else {
              return SendSmsScreen();
            }
          },
        ),
      ),
    );
  }
}
