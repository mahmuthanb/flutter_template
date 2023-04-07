import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/dashboard/cubit/dashboard_cubit.dart';
import 'package:flutter_template/l10n/l10n.dart';
import 'package:flutter_template/shared/widget/loading_widget.dart';

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
      listener: (context, state) {
        state.maybeWhen(
          initial: () => ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text('Initial'))),
          loading: () {
            ScaffoldMessenger.of(context)
                .showSnackBar(const SnackBar(content: Text('Loading')));
          },
          orElse: () {},
        );
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(title: Text(l10n.counterAppBarTitle)),
          body: state.when(
            initial: () => const Center(child: CounterText()),
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

class CounterText extends StatelessWidget {
  const CounterText({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final count = context.select((DashboardCubit cubit) => cubit.state);
    return Text('$count', style: theme.textTheme.displaySmall);
  }
}
