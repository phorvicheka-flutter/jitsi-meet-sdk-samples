import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:provider/provider.dart';

import '../../change_notifiers/auth_change_notifier.dart';
import '../../constants/dimens.dart';
import '../../data/models/user_register_request/user_register_request.dart';
import '../../routes/routes.dart';

class RegisterPage extends HookWidget {
  RegisterPage({super.key});

  final formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context);
    final AuthChangeNotifier authChangeNotifier =
        context.watch<AuthChangeNotifier>();

    final FocusNode userNameFocusNode = useFocusNode();
    final FocusNode emailFocusNode = useFocusNode();
    final FocusNode passwordFocusNode = useFocusNode();
    final FocusNode confirmedPasswordFocusNode = useFocusNode();
    final password = useState<String>('');

    void navigateBack() {
      // turn off history tracking in the browser for this navigation
      // https://gorouter.dev/web-history
      if (kIsWeb) {
        // coverage:ignore-start
        Router.neglect(
          context,
          () => const LoginRoute().go(context),
        );
        // coverage:ignore-end
      } else {
        const LoginRoute().go(context);
      }
    }

    Future<void> sumbitForm(UserRegisterRequest userRegisterRequest) async {
      // log a user in, letting all the listeners know
      final bool isSuccess = await context
          .read<AuthChangeNotifier>()
          .register(userRegisterRequest);
      if (isSuccess) {
        navigateBack();
      }
    }

    void hanldeOnPressedButtonRegister() {
      if (formKey.currentState!.saveAndValidate()) {
        final userId = formKey.currentState!.value['userId'];
        final userName = formKey.currentState!.value['userName'];
        final email = formKey.currentState!.value['email'];
        final password = formKey.currentState!.value['password'];
        sumbitForm(
          UserRegisterRequest(
            userId: userId,
            userName: userName,
            email: email,
            password: password,
          ),
        );
      }
    }

    return Scaffold(
      appBar: AppBar(title: Text(t!.loginTitle)),
      body: GestureDetector(
        key: const Key('gd_register'),
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
                              .requestFocus(userNameFocusNode);
                        },
                      ),
                      FormBuilderTextField(
                        key: const Key('txt_user_name'),
                        name: 'userName',
                        autofillHints: const [AutofillHints.name],
                        decoration:
                            InputDecoration(labelText: t.formLabelUsername),
                        focusNode: userNameFocusNode,
                        textInputAction: TextInputAction.next,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: FormBuilderValidators.required(),
                        onSubmitted: (_) {
                          FocusScope.of(context).requestFocus(emailFocusNode);
                        },
                      ),
                      FormBuilderTextField(
                        key: const Key('txt_email'),
                        name: 'email',
                        autofillHints: const [AutofillHints.email],
                        decoration:
                            InputDecoration(labelText: t.formLabelEmail),
                        focusNode: emailFocusNode,
                        textInputAction: TextInputAction.next,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(),
                          FormBuilderValidators.email(),
                        ]),
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
                        textInputAction: TextInputAction.next,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(),
                          FormBuilderValidators.minLength(6),
                        ]),
                        onChanged: (value) {
                          if (value != null) {
                            password.value = value;
                          }
                        },
                        onSubmitted: (value) {
                          FocusScope.of(context)
                              .requestFocus(confirmedPasswordFocusNode);
                        },
                      ),
                      FormBuilderTextField(
                        key: const Key('txt_confirmed_password'),
                        name: 'confirmedPassword',
                        obscureText: true,
                        enableSuggestions: false,
                        autocorrect: false,
                        decoration: InputDecoration(
                          labelText: t.formLabelConfirmedPassword,
                        ),
                        focusNode: confirmedPasswordFocusNode,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(),
                          FormBuilderValidators.minLength(6),
                          FormBuilderValidators.equal(
                            password.value,
                            errorText: t.formErrorPasswordsDontMatch,
                          ),
                        ]),
                      ),
                      const SizedBox(
                        height: Dimens.spaceLg,
                      ),
                      ElevatedButton.icon(
                        key: const Key('btn_register'),
                        icon: authChangeNotifier.isLoading
                            ? Transform.scale(
                                scale: 0.5,
                                child: const CircularProgressIndicator(),
                              )
                            : const Icon(Icons.login),
                        label: Text(t.buttonSignUp),
                        onPressed: authChangeNotifier.isLoading
                            ? null
                            : hanldeOnPressedButtonRegister,
                      ),
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
}
