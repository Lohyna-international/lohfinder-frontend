import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'sign_up_flow_event.dart';
import 'sign_up_flow_state.dart';

enum SignUpFlowType { volunteer, organizer }

class SignUpFlowBloc extends Bloc<SignUpFlowEvent, SignUpFlowState> {
  SignUpFlowBloc() : super(SignUpFlowInitial()) {
    on<FlowStarted>(_onFlowStarted);
  }

  FutureOr<void> _onFlowStarted(
    FlowStarted event,
    Emitter<SignUpFlowState> emit,
  ) {
    emit(SignUpFlowStarted(type: event.type));
  }

  bool isVolunteerFlow() {
    final currentState = state;
    if (currentState is SignUpFlowStarted) {
      return currentState.type == SignUpFlowType.volunteer;
    }
    return false;
  }
}
