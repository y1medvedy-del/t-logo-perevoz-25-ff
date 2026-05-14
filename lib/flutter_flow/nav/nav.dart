import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/backend/schema/structs/index.dart';

import '/backend/supabase/supabase.dart';

import '/auth/base_auth_user_provider.dart';

import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';

import '/index.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

GlobalKey<NavigatorState> appNavigatorKey = GlobalKey<NavigatorState>();

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  BaseAuthUser? initialUser;
  BaseAuthUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(BaseAuthUser newUser) {
    final shouldUpdate =
        user?.uid == null || newUser.uid == null || user?.uid != newUser.uid;
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    // No need to update unless the user has changed.
    if (notifyOnAuthChange && shouldUpdate) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      navigatorKey: appNavigatorKey,
      errorBuilder: (context, state) =>
          appStateNotifier.loggedIn ? General1Widget() : Onbording1Widget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) =>
              appStateNotifier.loggedIn ? General1Widget() : Onbording1Widget(),
          routes: [
            FFRoute(
              name: CreatinApllication3Widget.routeName,
              path: CreatinApllication3Widget.routePath,
              requireAuth: true,
              builder: (context, params) => CreatinApllication3Widget(),
            ),
            FFRoute(
              name: Onbording1Widget.routeName,
              path: Onbording1Widget.routePath,
              builder: (context, params) => Onbording1Widget(
                companyID: params.getParam(
                  'companyID',
                  ParamType.int,
                ),
              ),
            ),
            FFRoute(
              name: Onbording2Widget.routeName,
              path: Onbording2Widget.routePath,
              builder: (context, params) => Onbording2Widget(
                companyID: params.getParam(
                  'companyID',
                  ParamType.int,
                ),
              ),
            ),
            FFRoute(
              name: RegistrationFIZ1PhoneWidget.routeName,
              path: RegistrationFIZ1PhoneWidget.routePath,
              requireAuth: true,
              builder: (context, params) => RegistrationFIZ1PhoneWidget(),
            ),
            FFRoute(
              name: RegistrationResetPasswordCodWidget.routeName,
              path: RegistrationResetPasswordCodWidget.routePath,
              requireAuth: true,
              builder: (context, params) => RegistrationResetPasswordCodWidget(
                mail: params.getParam(
                  'mail',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: RegistrationFIZ3Widget.routeName,
              path: RegistrationFIZ3Widget.routePath,
              requireAuth: true,
              builder: (context, params) => RegistrationFIZ3Widget(),
            ),
            FFRoute(
              name: RegistrationFIZ4Widget.routeName,
              path: RegistrationFIZ4Widget.routePath,
              requireAuth: true,
              builder: (context, params) => RegistrationFIZ4Widget(
                user: params.getParam<UserRow>(
                  'user',
                  ParamType.SupabaseRow,
                ),
              ),
            ),
            FFRoute(
              name: RegistrationFIZ5Widget.routeName,
              path: RegistrationFIZ5Widget.routePath,
              requireAuth: true,
              builder: (context, params) => RegistrationFIZ5Widget(),
            ),
            FFRoute(
              name: RegistrationUR1EmailWidget.routeName,
              path: RegistrationUR1EmailWidget.routePath,
              builder: (context, params) => RegistrationUR1EmailWidget(
                companyID: params.getParam(
                  'companyID',
                  ParamType.int,
                ),
                flag: params.getParam(
                  'flag',
                  ParamType.bool,
                ),
              ),
            ),
            FFRoute(
              name: Enter1EmailWidget.routeName,
              path: Enter1EmailWidget.routePath,
              builder: (context, params) => Enter1EmailWidget(
                companyID: params.getParam(
                  'companyID',
                  ParamType.int,
                ),
              ),
            ),
            FFRoute(
              name: ForgodPasswordWidget.routeName,
              path: ForgodPasswordWidget.routePath,
              requireAuth: true,
              builder: (context, params) => ForgodPasswordWidget(),
            ),
            FFRoute(
              name: RegistrationUR2Widget.routeName,
              path: RegistrationUR2Widget.routePath,
              requireAuth: true,
              builder: (context, params) => RegistrationUR2Widget(),
            ),
            FFRoute(
              name: RegistrationUR3Widget.routeName,
              path: RegistrationUR3Widget.routePath,
              requireAuth: true,
              builder: (context, params) => RegistrationUR3Widget(
                error: params.getParam(
                  'error',
                  ParamType.bool,
                ),
              ),
            ),
            FFRoute(
              name: RegistrationUR4IPWidget.routeName,
              path: RegistrationUR4IPWidget.routePath,
              requireAuth: true,
              builder: (context, params) => RegistrationUR4IPWidget(),
            ),
            FFRoute(
              name: RegistrationUR5Widget.routeName,
              path: RegistrationUR5Widget.routePath,
              requireAuth: true,
              builder: (context, params) => RegistrationUR5Widget(),
            ),
            FFRoute(
              name: RegistrationUR4OOOWidget.routeName,
              path: RegistrationUR4OOOWidget.routePath,
              requireAuth: true,
              builder: (context, params) => RegistrationUR4OOOWidget(),
            ),
            FFRoute(
              name: General1Widget.routeName,
              path: General1Widget.routePath,
              requireAuth: true,
              builder: (context, params) => General1Widget(
                cityFilter: params.getParam(
                  'cityFilter',
                  ParamType.int,
                ),
                date1Filter: params.getParam(
                  'date1Filter',
                  ParamType.DateTime,
                ),
                date2Filter: params.getParam(
                  'date2Filter',
                  ParamType.DateTime,
                ),
                companyID: params.getParam(
                  'companyID',
                  ParamType.int,
                ),
              ),
            ),
            FFRoute(
              name: General2FilterWidget.routeName,
              path: General2FilterWidget.routePath,
              requireAuth: true,
              builder: (context, params) => General2FilterWidget(
                city: params.getParam(
                  'city',
                  ParamType.int,
                ),
                date1: params.getParam(
                  'date1',
                  ParamType.DateTime,
                ),
                date2: params.getParam(
                  'date2',
                  ParamType.DateTime,
                ),
                page: params.getParam(
                  'page',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: CreatinApllication1Widget.routeName,
              path: CreatinApllication1Widget.routePath,
              requireAuth: true,
              builder: (context, params) => CreatinApllication1Widget(),
            ),
            FFRoute(
              name: CreatinApllication2Widget.routeName,
              path: CreatinApllication2Widget.routePath,
              requireAuth: true,
              builder: (context, params) => CreatinApllication2Widget(
                cityPageParametr: params.getParam(
                  'cityPageParametr',
                  ParamType.String,
                ),
                area: params.getParam(
                  'area',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: CreatinApllication4Widget.routeName,
              path: CreatinApllication4Widget.routePath,
              requireAuth: true,
              builder: (context, params) => CreatinApllication4Widget(),
            ),
            FFRoute(
              name: CreatinApllication5Widget.routeName,
              path: CreatinApllication5Widget.routePath,
              requireAuth: true,
              builder: (context, params) => CreatinApllication5Widget(),
            ),
            FFRoute(
              name: CreatinApllication6Widget.routeName,
              path: CreatinApllication6Widget.routePath,
              requireAuth: true,
              builder: (context, params) => CreatinApllication6Widget(),
            ),
            FFRoute(
              name: CreatinApllication7Widget.routeName,
              path: CreatinApllication7Widget.routePath,
              requireAuth: true,
              builder: (context, params) => CreatinApllication7Widget(
                cityAbriviature: params.getParam(
                  'cityAbriviature',
                  ParamType.String,
                ),
                typePayment: params.getParam(
                  'typePayment',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: CreatinApllication8Widget.routeName,
              path: CreatinApllication8Widget.routePath,
              requireAuth: true,
              builder: (context, params) => CreatinApllication8Widget(
                aplicationDoc: params.getParam<AplicationRow>(
                  'aplicationDoc',
                  ParamType.SupabaseRow,
                ),
              ),
            ),
            FFRoute(
              name: Chat1Widget.routeName,
              path: Chat1Widget.routePath,
              requireAuth: true,
              builder: (context, params) => Chat1Widget(
                idChatBack: params.getParam(
                  'idChatBack',
                  ParamType.int,
                ),
              ),
            ),
            FFRoute(
              name: Chat2Widget.routeName,
              path: Chat2Widget.routePath,
              requireAuth: true,
              builder: (context, params) => Chat2Widget(
                idChat: params.getParam(
                  'idChat',
                  ParamType.int,
                ),
                idResipient: params.getParam(
                  'idResipient',
                  ParamType.int,
                ),
                textMessage: params.getParam(
                  'textMessage',
                  ParamType.String,
                ),
                namePage: params.getParam(
                  'namePage',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: Apllication1Widget.routeName,
              path: Apllication1Widget.routePath,
              requireAuth: true,
              builder: (context, params) => Apllication1Widget(
                idAplication: params.getParam(
                  'idAplication',
                  ParamType.int,
                ),
                info: params.getParam(
                  'info',
                  ParamType.bool,
                ),
              ),
            ),
            FFRoute(
              name: Apllication3Widget.routeName,
              path: Apllication3Widget.routePath,
              requireAuth: true,
              builder: (context, params) => Apllication3Widget(
                applicationID: params.getParam(
                  'applicationID',
                  ParamType.int,
                ),
                answerID: params.getParam(
                  'answerID',
                  ParamType.int,
                ),
              ),
            ),
            FFRoute(
              name: Apllication2Widget.routeName,
              path: Apllication2Widget.routePath,
              requireAuth: true,
              builder: (context, params) => Apllication2Widget(
                idApplication: params.getParam(
                  'idApplication',
                  ParamType.int,
                ),
              ),
            ),
            FFRoute(
              name: Profil1Widget.routeName,
              path: Profil1Widget.routePath,
              requireAuth: true,
              builder: (context, params) => Profil1Widget(),
            ),
            FFRoute(
              name: ProfilEditNameWidget.routeName,
              path: ProfilEditNameWidget.routePath,
              requireAuth: true,
              builder: (context, params) => ProfilEditNameWidget(
                name: params.getParam(
                  'name',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: ProfilEditSurnameWidget.routeName,
              path: ProfilEditSurnameWidget.routePath,
              requireAuth: true,
              builder: (context, params) => ProfilEditSurnameWidget(
                surname: params.getParam(
                  'surname',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: ProfilEditPhoneWidget.routeName,
              path: ProfilEditPhoneWidget.routePath,
              requireAuth: true,
              builder: (context, params) => ProfilEditPhoneWidget(
                phone: params.getParam(
                  'phone',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: ProfilEditEmailWidget.routeName,
              path: ProfilEditEmailWidget.routePath,
              requireAuth: true,
              builder: (context, params) => ProfilEditEmailWidget(
                email: params.getParam(
                  'email',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: ProfilEditPostEmployeWidget.routeName,
              path: ProfilEditPostEmployeWidget.routePath,
              requireAuth: true,
              builder: (context, params) => ProfilEditPostEmployeWidget(
                idEmploye: params.getParam(
                  'idEmploye',
                  ParamType.int,
                ),
              ),
            ),
            FFRoute(
              name: ProfilAddEmployeWidget.routeName,
              path: ProfilAddEmployeWidget.routePath,
              requireAuth: true,
              builder: (context, params) => ProfilAddEmployeWidget(),
            ),
            FFRoute(
              name: ProfilEmployeWidget.routeName,
              path: ProfilEmployeWidget.routePath,
              requireAuth: true,
              builder: (context, params) => ProfilEmployeWidget(
                idEmploye: params.getParam(
                  'idEmploye',
                  ParamType.int,
                ),
              ),
            ),
            FFRoute(
              name: ProfilEditCompanyWidget.routeName,
              path: ProfilEditCompanyWidget.routePath,
              requireAuth: true,
              builder: (context, params) => ProfilEditCompanyWidget(),
            ),
            FFRoute(
              name: Reviews1Widget.routeName,
              path: Reviews1Widget.routePath,
              requireAuth: true,
              builder: (context, params) => Reviews1Widget(
                idApplication: params.getParam(
                  'idApplication',
                  ParamType.int,
                ),
              ),
            ),
            FFRoute(
              name: Reviews3Widget.routeName,
              path: Reviews3Widget.routePath,
              requireAuth: true,
              builder: (context, params) => Reviews3Widget(),
            ),
            FFRoute(
              name: Compleint1Widget.routeName,
              path: Compleint1Widget.routePath,
              requireAuth: true,
              builder: (context, params) => Compleint1Widget(
                applicationID: params.getParam(
                  'applicationID',
                  ParamType.int,
                ),
              ),
            ),
            FFRoute(
              name: Compleint2Widget.routeName,
              path: Compleint2Widget.routePath,
              requireAuth: true,
              builder: (context, params) => Compleint2Widget(
                complainReasons: params.getParam(
                  'complainReasons',
                  ParamType.String,
                ),
                applicationID: params.getParam(
                  'applicationID',
                  ParamType.int,
                ),
              ),
            ),
            FFRoute(
              name: Compleint3Widget.routeName,
              path: Compleint3Widget.routePath,
              requireAuth: true,
              builder: (context, params) => Compleint3Widget(),
            ),
            FFRoute(
              name: Feedback1Widget.routeName,
              path: Feedback1Widget.routePath,
              requireAuth: true,
              builder: (context, params) => Feedback1Widget(
                textMessage: params.getParam(
                  'textMessage',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: Feedback2Widget.routeName,
              path: Feedback2Widget.routePath,
              requireAuth: true,
              builder: (context, params) => Feedback2Widget(),
            ),
            FFRoute(
              name: AplicationReviewsWidget.routeName,
              path: AplicationReviewsWidget.routePath,
              requireAuth: true,
              builder: (context, params) => AplicationReviewsWidget(
                idCreatorAnsver: params.getParam(
                  'idCreatorAnsver',
                  ParamType.int,
                ),
                idAnswer: params.getParam(
                  'idAnswer',
                  ParamType.int,
                ),
                priceAnswer: params.getParam(
                  'priceAnswer',
                  ParamType.int,
                ),
                idApplication: params.getParam(
                  'idApplication',
                  ParamType.int,
                ),
              ),
            ),
            FFRoute(
              name: ProfilReviewsWidget.routeName,
              path: ProfilReviewsWidget.routePath,
              requireAuth: true,
              builder: (context, params) => ProfilReviewsWidget(
                rating: params.getParam(
                  'rating',
                  ParamType.double,
                ),
              ),
            ),
            FFRoute(
              name: WalletWidget.routeName,
              path: WalletWidget.routePath,
              requireAuth: true,
              builder: (context, params) => WalletWidget(
                date1Filter: params.getParam(
                  'date1Filter',
                  ParamType.DateTime,
                ),
                date2Filter: params.getParam(
                  'date2Filter',
                  ParamType.DateTime,
                ),
                tapePayment: params.getParam(
                  'tapePayment',
                  ParamType.String,
                ),
                tapeOperation: params.getParam(
                  'tapeOperation',
                  ParamType.String,
                ),
                tabBar: params.getParam(
                  'tabBar',
                  ParamType.int,
                ),
              ),
            ),
            FFRoute(
              name: RegistrationUR6Widget.routeName,
              path: RegistrationUR6Widget.routePath,
              requireAuth: true,
              builder: (context, params) => RegistrationUR6Widget(),
            ),
            FFRoute(
              name: General2FilterAnanimusWidget.routeName,
              path: General2FilterAnanimusWidget.routePath,
              requireAuth: true,
              builder: (context, params) => General2FilterAnanimusWidget(),
            ),
            FFRoute(
              name: Application12EditAddressWidget.routeName,
              path: Application12EditAddressWidget.routePath,
              requireAuth: true,
              builder: (context, params) => Application12EditAddressWidget(
                idApllication: params.getParam(
                  'idApllication',
                  ParamType.int,
                ),
                city: params.getParam(
                  'city',
                  ParamType.String,
                ),
                idCity: params.getParam(
                  'idCity',
                  ParamType.int,
                ),
              ),
            ),
            FFRoute(
              name: Application11EditCityWidget.routeName,
              path: Application11EditCityWidget.routePath,
              requireAuth: true,
              builder: (context, params) => Application11EditCityWidget(
                idApplication: params.getParam(
                  'idApplication',
                  ParamType.int,
                ),
                city: params.getParam(
                  'city',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: Application13EditDataTimeWidget.routeName,
              path: Application13EditDataTimeWidget.routePath,
              requireAuth: true,
              builder: (context, params) => Application13EditDataTimeWidget(
                idApplication: params.getParam(
                  'idApplication',
                  ParamType.int,
                ),
                time: params.getParam(
                  'time',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: Application14EditWorksWidget.routeName,
              path: Application14EditWorksWidget.routePath,
              requireAuth: true,
              builder: (context, params) => Application14EditWorksWidget(
                idApplication: params.getParam(
                  'idApplication',
                  ParamType.int,
                ),
                visibli: params.getParam(
                  'visibli',
                  ParamType.bool,
                ),
              ),
            ),
            FFRoute(
              name: Application17DescriptionWidget.routeName,
              path: Application17DescriptionWidget.routePath,
              requireAuth: true,
              builder: (context, params) => Application17DescriptionWidget(
                idApplication: params.getParam(
                  'idApplication',
                  ParamType.int,
                ),
                description: params.getParam(
                  'description',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: RegistrationURErrorWidget.routeName,
              path: RegistrationURErrorWidget.routePath,
              requireAuth: true,
              builder: (context, params) => RegistrationURErrorWidget(),
            ),
            FFRoute(
              name: Chat3AdminWidget.routeName,
              path: Chat3AdminWidget.routePath,
              requireAuth: true,
              builder: (context, params) => Chat3AdminWidget(
                idChat: params.getParam(
                  'idChat',
                  ParamType.int,
                ),
                textMessage: params.getParam(
                  'textMessage',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: NavigeiteCarrierWidget.routeName,
              path: NavigeiteCarrierWidget.routePath,
              requireAuth: true,
              builder: (context, params) => NavigeiteCarrierWidget(),
            ),
            FFRoute(
              name: Apllication4Widget.routeName,
              path: Apllication4Widget.routePath,
              requireAuth: true,
              builder: (context, params) => Apllication4Widget(
                applicationID: params.getParam(
                  'applicationID',
                  ParamType.int,
                ),
                answerID: params.getParam(
                  'answerID',
                  ParamType.int,
                ),
              ),
            ),
            FFRoute(
              name: Apllication5Widget.routeName,
              path: Apllication5Widget.routePath,
              requireAuth: true,
              builder: (context, params) => Apllication5Widget(
                paymentType: params.getParam(
                  'paymentType',
                  ParamType.String,
                ),
                applicationID: params.getParam(
                  'applicationID',
                  ParamType.int,
                ),
              ),
            ),
            FFRoute(
              name: Apllication6Widget.routeName,
              path: Apllication6Widget.routePath,
              requireAuth: true,
              builder: (context, params) => Apllication6Widget(
                applicationID: params.getParam(
                  'applicationID',
                  ParamType.int,
                ),
                answerID: params.getParam(
                  'answerID',
                  ParamType.int,
                ),
              ),
            ),
            FFRoute(
              name: WalletTypeRepleceWidget.routeName,
              path: WalletTypeRepleceWidget.routePath,
              requireAuth: true,
              builder: (context, params) => WalletTypeRepleceWidget(
                summ: params.getParam(
                  'summ',
                  ParamType.double,
                ),
                replaceOutput: params.getParam(
                  'replaceOutput',
                  ParamType.bool,
                ),
              ),
            ),
            FFRoute(
              name: WalletTypeFineWidget.routeName,
              path: WalletTypeFineWidget.routePath,
              requireAuth: true,
              builder: (context, params) => WalletTypeFineWidget(
                fine: params.getParam(
                  'fine',
                  ParamType.int,
                ),
              ),
            ),
            FFRoute(
              name: ProfilRecvisitesCompanyOooWidget.routeName,
              path: ProfilRecvisitesCompanyOooWidget.routePath,
              requireAuth: true,
              builder: (context, params) => ProfilRecvisitesCompanyOooWidget(),
            ),
            FFRoute(
              name: ProfilRecvisitesCompanyIpWidget.routeName,
              path: ProfilRecvisitesCompanyIpWidget.routePath,
              requireAuth: true,
              builder: (context, params) => ProfilRecvisitesCompanyIpWidget(),
            ),
            FFRoute(
              name: ProfilDocumentWidget.routeName,
              path: ProfilDocumentWidget.routePath,
              requireAuth: true,
              builder: (context, params) => ProfilDocumentWidget(),
            ),
            FFRoute(
              name: Reviews2Widget.routeName,
              path: Reviews2Widget.routePath,
              requireAuth: true,
              builder: (context, params) => Reviews2Widget(
                idApplication: params.getParam(
                  'idApplication',
                  ParamType.int,
                ),
                estimation: params.getParam(
                  'estimation',
                  ParamType.int,
                ),
                description: params.getParam(
                  'description',
                  ParamType.String,
                ),
                applicationNumber: params.getParam(
                  'applicationNumber',
                  ParamType.String,
                ),
                idReviews: params.getParam(
                  'idReviews',
                  ParamType.int,
                ),
                executer: params.getParam(
                  'executer',
                  ParamType.int,
                ),
              ),
            ),
            FFRoute(
              name: ReviewsAnswerWidget.routeName,
              path: ReviewsAnswerWidget.routePath,
              requireAuth: true,
              builder: (context, params) => ReviewsAnswerWidget(
                idReviews: params.getParam(
                  'idReviews',
                  ParamType.int,
                ),
                raiting: params.getParam(
                  'raiting',
                  ParamType.double,
                ),
              ),
            ),
            FFRoute(
              name: AsdasdgsdgsdfgsdfgsWidget.routeName,
              path: AsdasdgsdgsdfgsdfgsWidget.routePath,
              requireAuth: true,
              builder: (context, params) => AsdasdgsdgsdfgsdfgsWidget(),
            ),
            FFRoute(
              name: ProfilEditPatronymicWidget.routeName,
              path: ProfilEditPatronymicWidget.routePath,
              requireAuth: true,
              builder: (context, params) => ProfilEditPatronymicWidget(
                patronymic: params.getParam(
                  'patronymic',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: Apllication7CancelWidget.routeName,
              path: Apllication7CancelWidget.routePath,
              requireAuth: true,
              builder: (context, params) => Apllication7CancelWidget(
                idApplication: params.getParam(
                  'idApplication',
                  ParamType.int,
                ),
              ),
            ),
            FFRoute(
              name: Enter2PasswordResetWidget.routeName,
              path: Enter2PasswordResetWidget.routePath,
              requireAuth: true,
              builder: (context, params) => Enter2PasswordResetWidget(),
            ),
            FFRoute(
              name: Enter3TemporaryPasswordWidget.routeName,
              path: Enter3TemporaryPasswordWidget.routePath,
              builder: (context, params) => Enter3TemporaryPasswordWidget(
                email: params.getParam(
                  'email',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: Enter4NewPasswordWidget.routeName,
              path: Enter4NewPasswordWidget.routePath,
              requireAuth: true,
              builder: (context, params) => Enter4NewPasswordWidget(
                email: params.getParam(
                  'email',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: Application18EditDriveWidget.routeName,
              path: Application18EditDriveWidget.routePath,
              requireAuth: true,
              builder: (context, params) => Application18EditDriveWidget(
                applicationID: params.getParam(
                  'applicationID',
                  ParamType.int,
                ),
                surnameDriver: params.getParam(
                  'surnameDriver',
                  ParamType.String,
                ),
                nameDraiver: params.getParam(
                  'nameDraiver',
                  ParamType.String,
                ),
                patronumicDriver: params.getParam(
                  'patronumicDriver',
                  ParamType.String,
                ),
                phoneDriver: params.getParam(
                  'phoneDriver',
                  ParamType.String,
                ),
                gosNumber: params.getParam(
                  'gosNumber',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: HelpWidget.routeName,
              path: HelpWidget.routePath,
              requireAuth: true,
              builder: (context, params) => HelpWidget(),
            ),
            FFRoute(
              name: Help1Widget.routeName,
              path: Help1Widget.routePath,
              requireAuth: true,
              builder: (context, params) => Help1Widget(
                nameQuestion: params.getParam(
                  'nameQuestion',
                  ParamType.String,
                ),
                idQuestion: params.getParam(
                  'idQuestion',
                  ParamType.int,
                ),
              ),
            ),
            FFRoute(
              name: ArchiveWidget.routeName,
              path: ArchiveWidget.routePath,
              requireAuth: true,
              builder: (context, params) => ArchiveWidget(
                cityFilter: params.getParam(
                  'cityFilter',
                  ParamType.int,
                ),
                date1Filter: params.getParam(
                  'date1Filter',
                  ParamType.DateTime,
                ),
                date2Filter: params.getParam(
                  'date2Filter',
                  ParamType.DateTime,
                ),
              ),
            ),
            FFRoute(
              name: OfferAndRulesWidget.routeName,
              path: OfferAndRulesWidget.routePath,
              requireAuth: true,
              builder: (context, params) => OfferAndRulesWidget(
                companyID: params.getParam(
                  'companyID',
                  ParamType.int,
                ),
              ),
            ),
            FFRoute(
              name: Notification1Widget.routeName,
              path: Notification1Widget.routePath,
              requireAuth: true,
              builder: (context, params) => Notification1Widget(),
            ),
            FFRoute(
              name: Application15TypePaymentWidget.routeName,
              path: Application15TypePaymentWidget.routePath,
              requireAuth: true,
              builder: (context, params) => Application15TypePaymentWidget(
                typePayment: params.getParam(
                  'typePayment',
                  ParamType.String,
                ),
                idApplication: params.getParam(
                  'idApplication',
                  ParamType.int,
                ),
              ),
            ),
            FFRoute(
              name: General1AnanimusWidget.routeName,
              path: General1AnanimusWidget.routePath,
              builder: (context, params) => General1AnanimusWidget(
                cityFilter: params.getParam(
                  'cityFilter',
                  ParamType.int,
                ),
                date1Filter: params.getParam(
                  'date1Filter',
                  ParamType.DateTime,
                ),
                date2Filter: params.getParam(
                  'date2Filter',
                  ParamType.DateTime,
                ),
                companyID: params.getParam(
                  'companyID',
                  ParamType.int,
                ),
              ),
            ),
            FFRoute(
              name: WalletCopyAnanimusWidget.routeName,
              path: WalletCopyAnanimusWidget.routePath,
              requireAuth: true,
              builder: (context, params) => WalletCopyAnanimusWidget(),
            ),
            FFRoute(
              name: Feedback1AnonimusWidget.routeName,
              path: Feedback1AnonimusWidget.routePath,
              requireAuth: true,
              builder: (context, params) => Feedback1AnonimusWidget(
                textMessage: params.getParam(
                  'textMessage',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: Chat1AnanimusWidget.routeName,
              path: Chat1AnanimusWidget.routePath,
              requireAuth: true,
              builder: (context, params) => Chat1AnanimusWidget(
                idChatBack: params.getParam(
                  'idChatBack',
                  ParamType.int,
                ),
              ),
            ),
            FFRoute(
              name: WalletFilterWidget.routeName,
              path: WalletFilterWidget.routePath,
              requireAuth: true,
              builder: (context, params) => WalletFilterWidget(
                date1: params.getParam(
                  'date1',
                  ParamType.DateTime,
                ),
                date2: params.getParam(
                  'date2',
                  ParamType.DateTime,
                ),
                tapePayment: params.getParam(
                  'tapePayment',
                  ParamType.String,
                ),
                tapeOperation: params.getParam(
                  'tapeOperation',
                  ParamType.String,
                ),
                tabBar: params.getParam(
                  'tabBar',
                  ParamType.int,
                ),
              ),
            ),
            FFRoute(
              name: RegistrationFIZ2CodWidget.routeName,
              path: RegistrationFIZ2CodWidget.routePath,
              requireAuth: true,
              builder: (context, params) => RegistrationFIZ2CodWidget(
                phone: params.getParam(
                  'phone',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: WalletWebViewWidget.routeName,
              path: WalletWebViewWidget.routePath,
              requireAuth: true,
              builder: (context, params) => WalletWebViewWidget(
                summ: params.getParam(
                  'summ',
                  ParamType.double,
                ),
                replaceOutput: params.getParam(
                  'replaceOutput',
                  ParamType.bool,
                ),
                urlPayment: params.getParam(
                  'urlPayment',
                  ParamType.String,
                ),
                paymentId: params.getParam(
                  'paymentId',
                  ParamType.String,
                ),
                orderId: params.getParam(
                  'orderId',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: WalletSuccessfullyWidget.routeName,
              path: WalletSuccessfullyWidget.routePath,
              requireAuth: true,
              builder: (context, params) => WalletSuccessfullyWidget(),
            ),
            FFRoute(
              name: WalletPaymentFailWidget.routeName,
              path: WalletPaymentFailWidget.routePath,
              requireAuth: true,
              builder: (context, params) => WalletPaymentFailWidget(),
            )
          ].map((r) => r.toRoute(appStateNotifier)).toList(),
        ),
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
      observers: [routeObserver],
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState => AppStateNotifier.instance;
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      appState.updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(uri.queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.allParams.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, {
    bool isList = false,
    StructBuilder<T>? structBuilder,
  }) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(
      param,
      type,
      isList,
      structBuilder: structBuilder,
    );
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (context, state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.uri.toString());
            return '/onbording1';
          }
          return null;
        },
        pageBuilder: (context, state) {
          fixStatusBarOniOS16AndBelow(context);
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? isWeb
                  ? Container()
                  : Container(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      child: Center(
                        child: Image.asset(
                          'assets/images/photo_2025-01-17_06-53-29.jpg',
                          width: 300.0,
                          height: 300.0,
                          fit: BoxFit.contain,
                        ),
                      ),
                    )
              : page;

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  name: state.name,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).buildTransitions(
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ),
                )
              : MaterialPage(
                  key: state.pageKey, name: state.name, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => TransitionInfo(hasTransition: false);
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouterState.of(context).uri.toString();
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}

extension GoRouterLocationExtension on GoRouter {
  String getCurrentLocation() {
    final RouteMatch lastMatch = routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : routerDelegate.currentConfiguration;
    return matchList.uri.toString();
  }
}
