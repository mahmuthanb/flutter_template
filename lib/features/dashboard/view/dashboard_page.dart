import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/core/router.dart';
import 'package:flutter_template/core/widget/custom_button.dart';
import 'package:flutter_template/core/widget/loading_widget.dart';
import 'package:flutter_template/features/dashboard/cubit/dashboard_cubit.dart';
import 'package:flutter_template/l10n/l10n.dart';
import 'package:go_router/go_router.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => DashboardCubit(),
      child: const DashboardView(),
    );
  }
}

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    // final state = context.select((DashboardCubit cubit) => cubit.state);
    final l10n = context.l10n;
    return BlocBuilder<DashboardCubit, DashboardState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(title: Text(l10n.dashboardAppBarTitle)),
          body: state.when(
            initial: () => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomButton(
                  text: 'go to detail page',
                  onPressed: () => context.push(
                    '${AppRoutes.userDetailsPage}/2',
                  ),
                ),
                CustomButton(
                  text: 'settings',
                  onPressed: () => context.push(
                    AppRoutes.settingsPage,
                  ),
                ),
              ],
            ),
            loading: LoadingPlaceholder.new,
          ),
          floatingActionButton: state.maybeWhen(
            initial: () => FloatingActionButton(
              onPressed: () => context.read<DashboardCubit>().increment(),
              child: const Icon(Icons.abc),
            ),
            loading: () => FloatingActionButton(
              onPressed: () => context.read<DashboardCubit>().decrement(),
              child: const Icon(Icons.live_help),
            ),
            orElse: () {
              return null;
            },
          ),
        );
      },
    );
  }
}
