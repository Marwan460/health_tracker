import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_nutrition/core/widgets/custom_progress_hud.dart';
import 'package:food_nutrition/features/Auth/presentation/cubits/signup_cubit/signup_cubit.dart';
import 'package:food_nutrition/features/Auth/presentation/views/complete_profile.dart';
import 'package:food_nutrition/features/Auth/presentation/views/widgets/signup_view_body.dart';
import '../../../../core/services/get_it_service.dart';
import '../../../../core/utils/app_colors.dart';
import '../../domain/repos/auth_repo.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignupCubit(getIt<AuthRepo>()),
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: Builder(builder: (context) {
          return BlocConsumer<SignupCubit, SignupState>(
            listener: (context, state) {
              if (state is SignupSuccess) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CompleteProfile()));
              }
              if (state is SignupFailure) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(state.message)));
              }
            },
            builder: (context, state) {
              return CustomProgressHud(
                isLoading: state is SignupLoading ? true : false,
                child: const SignupViewBody(),
              );
            },
          );
        }),
      ),
    );
  }
}
