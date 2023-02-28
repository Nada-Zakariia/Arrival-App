abstract class MainStates {}

class MainIntialState extends MainStates {}

class ChangeNavBarState extends MainStates {}

class ResetSeatsSuccessState extends MainStates{}

class ResetSeatsErrorState extends MainStates {
  final String error;
  ResetSeatsErrorState(this.error);
}

class CheckExpiredDateErrorState extends MainStates {
  final String error;
  CheckExpiredDateErrorState(this.error);
}
class CheckExpiredDateSuccesState extends MainStates {}

