import 'package:equatable/equatable.dart';

import 'sign_up_flow_bloc.dart';

abstract class SignUpFlowEvent extends Equatable {
  const SignUpFlowEvent();

  @override
  List<Object?> get props => [];
}

class FlowStarted extends SignUpFlowEvent {
  final SignUpFlowType type;

  const FlowStarted({required this.type});

  @override
  List<Object?> get props => [type];
}
