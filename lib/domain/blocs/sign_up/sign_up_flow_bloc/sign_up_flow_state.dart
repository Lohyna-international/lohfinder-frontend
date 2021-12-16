import 'package:equatable/equatable.dart';

import 'sign_up_flow_bloc.dart';

abstract class SignUpFlowState extends Equatable {
  const SignUpFlowState();

  @override
  List<Object?> get props => [];
}

class SignUpFlowInitial extends SignUpFlowState {}

class SignUpFlowStarted extends SignUpFlowState {
  final SignUpFlowType type;

  const SignUpFlowStarted({required this.type});

  @override
  List<Object?> get props => [type];
}
