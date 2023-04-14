import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/core/router.dart';
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
    return BlocConsumer<DashboardCubit, DashboardState>(
      // listener: (context, state) {
      //   state.maybeWhen(
      //     initial: () => ScaffoldMessenger.of(context)
      //         .showSnackBar(const SnackBar(content: Text('Initial'))),
      //     loading: () {
      //       ScaffoldMessenger.of(context)
      //           .showSnackBar(const SnackBar(content: Text('Loading')));
      //     },
      //     orElse: () {},
      //   );
      // },
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(title: Text(l10n.counterAppBarTitle)),
          body: state.when(
            initial: () => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Center(
                  child: TextButton(
                    onPressed: () => context.go(
                      '${AppRoutes.userDetailsPage}/2',
                      // pathParameters: {'userId': '2'},
                    ),
                    child: const Text('go to userdetail/2'),
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
