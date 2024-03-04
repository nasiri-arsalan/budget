import 'package:bloc/bloc.dart';
import 'package:budget/domain/use_case/budget/budget_use_case.dart';

import 'budget_event.dart';
import 'budget_state.dart';

class BudgetBloc extends Bloc<BudgetEvent, BudgetState> {
  BudgetBloc({required this.budgetUseCase}) : super(BudgetLoading()) {
    on<BudgetStarted>(_onStarted);
  }

  final BudgetUseCase budgetUseCase;

  Future<void> _onStarted(
      BudgetStarted event, Emitter<BudgetState> emit) async {
    emit(BudgetLoading());
    try {
      final item = await budgetUseCase.invoke("");
      emit(BudgetLoaded(item));
    } catch (e) {
      emit(BudgetError(e));
    }
  }
}
