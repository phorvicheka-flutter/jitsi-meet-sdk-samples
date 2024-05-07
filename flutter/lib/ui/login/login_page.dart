import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:provider/provider.dart';

import '../../change_notifiers/auth_change_notifier.dart';
import '../../change_notifiers/fcm_token_change_notifier.dart';
import '../../constants/dimens.dart';
import '../../main.dart';
import '../../routes/routes.dart';

class LoginPage extends HookWidget {
  LoginPage({this.from, super.key});
  final String? from;

  // https://github.com/flutter/flutter/issues/20042
  final formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context);
    final AuthChangeNotifier authChangeNotifier =
        context.watch<AuthChangeNotifier>();
    String? fcmToken = context.select(
      (FcmTokenChangeNotifier fcmTokenChangeNotifier) =>
          fcmTokenChangeNotifier.fcmToken,
    );

    final FocusNode passwordFocusNode = useFocusNode();

    Future<void> submitForm(
      String userId,
      String password,
    ) async {
      if (fcmToken == null) {
        logger.e('Error: no fcmToken');
        return;
      }
      // log a user in, letting all the listeners know
      await context.read<AuthChangeNotifier>().login(
            userId,
            password,
            fcmToken,
          );

      // We don't need this code to navigate user when login success
      // Because in app_router.dart, there a redirect when user is loggedIn or authChangeNotifier.isLoggedIn
      // if there's a deep link, go there
      /* if (from != null) {
      context.go(from!);
      } */
    }

    void hanldeOnPressedButtonLogin() {
      if (formKey.currentState!.saveAndValidate()) {
        final userId = formKey.currentState!.value['userId'];
        final password = formKey.currentState!.value['password'];
        submitForm(
          userId,
          password,
        );
      }
    }

    return Scaffold(
      appBar: AppBar(title: Text(t!.loginTitle)),
      body: GestureDetector(
        key: const Key('gd_login'),
        behavior: HitTestBehavior.opaque,
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: Dimens.spaceLg),
              child: FormBuilder(
                key: formKey,
                child: AutofillGroup(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      FormBuilderTextField(
                        key: const Key('txt_user_id'),
                        name: 'userId',
                        autofillHints: const [AutofillHints.name],
                        decoration:
                            InputDecoration(labelText: t.formLabelUserId),
                        textInputAction: TextInputAction.next,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: FormBuilderValidators.required(),
                        onSubmitted: (_) {
                          FocusScope.of(context)
                              .requestFocus(passwordFocusNode);
                        },
                      ),
                      FormBuilderTextField(
                        key: const Key('txt_password'),
                        name: 'password',
                        obscureText: true,
                        enableSuggestions: false,
                        autocorrect: false,
                        decoration:
                            InputDecoration(labelText: t.formLabelPassword),
                        focusNode: passwordFocusNode,
                        textInputAction: TextInputAction.done,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(),
                          FormBuilderValidators.minLength(6),
                        ]),
                      ),
                      const SizedBox(
                        height: Dimens.spaceLg,
                      ),
                      ElevatedButton.icon(
                        key: const Key('btn_login'),
                        icon: authChangeNotifier.isLoading
                            ? Transform.scale(
                                scale: 0.5,
                                child: const CircularProgressIndicator(),
                              )
                            : const Icon(Icons.login),
                        label: Text(t.buttonLogin),
                        onPressed: authChangeNotifier.isLoading
                            ? null
                            : hanldeOnPressedButtonLogin,
                      ),
                      const SizedBox(
                        height: Dimens.spaceLg,
                      ),
                      _buildSignupBtn(context),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSignupBtn(BuildContext context) {
    var t = AppLocalizations.of(context);

    return RichText(
      key: const Key('rich_text_sign_up'),
      text: TextSpan(
        children: [
          TextSpan(
            text: t!.labelTextDonthaveAccount,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).colorScheme.outline,
                  fontWeight: FontWeight.normal,
                ),
            recognizer: TapGestureRecognizer()..onTap = null,
          ),
          TextSpan(
            text: t.buttonSignUp,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold,
                ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                // Single tapped.
                const RegisterRoute().push(context);
              },
          ),
        ],
      ),
    );
  }
}
