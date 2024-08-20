class ImcState {
  final double? imc;

  ImcState({this.imc});
}

class ImcStateLoading extends ImcState {}

class ImcStateError extends ImcState {
  final String msg;

  ImcStateError({super.imc, required this.msg});
}
