// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final counterProvider = StateProvider<int>((ref) {
  return 0;
});

class Loan {
  final String title;
  final double minCapPrice;

  Loan({
    required this.title,
    required this.minCapPrice,
  });
}

final List<Loan> _loans = [
  Loan(
    title: 'Regular loan',
    minCapPrice: 60,
  ),
  Loan(
    title: 'Business loan',
    minCapPrice: 10,
  ),
  Loan(
    title: 'Z Capital investment loan',
    minCapPrice: 20,
  ),
];

final loanSortTypeProvider = StateProvider<LoanSortType>((ref) {
  return LoanSortType.title;
});

enum LoanSortType { title, min }

final loansProvider = Provider<List<Loan>>(
  (ref) {
    final sortProvider = ref.watch(loanSortTypeProvider);
    switch (sortProvider) {
      case LoanSortType.title:
        return _loans.sorted((a, b) => a.title.compareTo(b.title));
      case LoanSortType.min:
        return _loans.sorted((a, b) => a.minCapPrice.compareTo(b.minCapPrice));
    }
  },
);

class HomeScreen extends ConsumerWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loans = ref.watch(loansProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Loan'),
        actions: [
          DropdownButton<LoanSortType>(
            alignment: AlignmentDirectional.centerEnd,
            value: ref.watch(loanSortTypeProvider),
            onChanged: (value) =>
                ref.read(loanSortTypeProvider.notifier).state = value!,
            items: const [
              DropdownMenuItem(
                value: LoanSortType.title,
                child: Text('title'),
              ),
              DropdownMenuItem(
                value: LoanSortType.min,
                child: Text('min'),
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(counterProvider.notifier).state++;
        },
      ),
      body: ListView.builder(
        itemCount: loans.length,
        itemBuilder: (context, index) {
          final loan = loans[index];
          return ListTile(
            title: Row(
              children: [
                Text(loan.title),
                const SizedBox(
                  width: 20,
                ),
              ],
            ),
            subtitle: Text('price: ${loan.minCapPrice} \$'),
          );
        },
      ),
    );
  }
}

class CounterText extends ConsumerWidget {
  const CounterText({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int counterValue = ref.watch(counterProvider);
    return Text(
      '$counterValue',
      style: const TextStyle(
        color: Colors.white,
      ),
    );
  }
}
