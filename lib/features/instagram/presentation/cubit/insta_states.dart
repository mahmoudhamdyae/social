import 'package:social/features/instagram/domain/models/insta.dart';

abstract class InstaStates {
  const InstaStates();
}

/// Get Insta States
class LoadingGetInstaState extends InstaStates {
  const LoadingGetInstaState();
}
class ErrorGetInstaState extends InstaStates {
  final String? errorMessage;
  const ErrorGetInstaState(this.errorMessage);
}
class SuccessGetInstaState extends InstaStates {
  final List<Insta> insta;
  const SuccessGetInstaState(this.insta);
}