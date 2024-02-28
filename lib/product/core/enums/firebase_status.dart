import '../../utils/localization/locale_keys.g.dart';

enum FirebaseStatus {
  success(LocaleKeys.erroStatus_success),
  userNotFound(LocaleKeys.erroStatus_userNotFound),
  weakPassword(LocaleKeys.erroStatus_weakPassword),
  tooManyRequests(LocaleKeys.erroStatus_tooManyRequests),
  undefined(LocaleKeys.erroStatus_undefined),
  wrongPassword(LocaleKeys.erroStatus_wrongPassword),
  emailAlreadyInUse(LocaleKeys.erroStatus_emailAlreadyInUse),
  invalidEmail(LocaleKeys.erroStatus_invalidEmail),
  userDisabled(LocaleKeys.erroStatus_userDisabled),
  operationNotAllowed(LocaleKeys.erroStatus_operationNotAllowed),
  invalidPassword(LocaleKeys.erroStatus_invalidPassword),
  invalidArgument(LocaleKeys.erroStatus_invalidArgument),
  notFound(LocaleKeys.erroStatus_notFound),
  alreadyExists(LocaleKeys.erroStatus_alreadyExists),
  permissionDenied(LocaleKeys.erroStatus_permissionDenied),
  unauthenticated(LocaleKeys.erroStatus_unauthenticated),
  resourceExhausted(LocaleKeys.erroStatus_resourceExhausted),
  aborted(LocaleKeys.erroStatus_aborted),
  outOfRange(LocaleKeys.erroStatus_outOfRange),
  unimplemented(LocaleKeys.erroStatus_unimplemented),
  internal(LocaleKeys.erroStatus_internal),
  unavailable(LocaleKeys.erroStatus_unavailable),
  dataLoss(LocaleKeys.erroStatus_dataLoss),
  emailNotVerified(LocaleKeys.erroStatus_verifyEmail),
  invalidLoginCredentials(LocaleKeys.erroStatus_invalidCredential),
  ;

  final String value;
  const FirebaseStatus(this.value);
}
