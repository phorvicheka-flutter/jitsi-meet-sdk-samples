import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';
import '../../change_notifiers/fcm_call_change_notifier.dart';
import '../../constants/app_colors.dart';
import 'package:logger/logger.dart';

var logger = Logger();

class OutgoingCallPage extends HookWidget {
  const OutgoingCallPage({
    required this.roomName,
    required this.calleeName,
    this.calleeAvatar,
    super.key,
  });

  final String roomName;
  final String calleeName;
  final String? calleeAvatar;

  @override
  Widget build(BuildContext context) {
    FcmCallChangeNotifier fcmCallChangeNotifier =
        context.read<FcmCallChangeNotifier>();

    void endCall() {
      // Send request to "Video terminate" Api
      // don't need to use await or care whether request is succeed or not, for user smooth experiences
      fcmCallChangeNotifier.createFcmVideoTerminate(roomName);
    }

    useOnAppLifecycleStateChange(
      (previous, current) async {
        if (current == AppLifecycleState.detached) {
          logger.d(
            'AppLifecycleState.detached - onDestroy - need to call API Video terminate: DELETE /video/room/:roomName',
          );
          endCall();
        }
      },
    );

    Future<void> onPopInvoked(didPop) async {
      if (didPop) {
        return;
      }
      logger.d(
        'onPopInvoked - need to call API Video terminate: DELETE /video/room/:roomName',
      );
      // Close the outgoing call screen
      Navigator.of(context).pop();
      endCall();
    }

    return PopScope(
      canPop: false,
      onPopInvoked: onPopInvoked,
      child: Scaffold(
        body: Center(
          child: Container(
            width: double.infinity,
            color: AppColors.primary, // Change color according to your theme
            child: Column(
              children: [
                // "Calling..." with animation
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      _buildCallingText(),
                      const SizedBox(height: 10),
                      // User avatar and name
                      _buildUserAvatarAndName(
                        userName: calleeName,
                        userAvatar: calleeAvatar,
                      ),
                    ],
                  ),
                ),
                // Button to end the call
                _buildEndCallButton(
                  context,
                  onPressed: () {
                    // Close the outgoing call screen
                    Navigator.of(context).pop();
                    endCall();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCallingText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Calling',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        LoadingAnimationWidget.waveDots(
          color: Colors.white,
          size: 36,
        ),
      ],
    );
  }

  Widget _buildUserAvatarAndName({
    required String userName,
    String? userAvatar,
  }) {
    return Column(
      children: [
        if (userAvatar != null && userAvatar.isNotEmpty)
          Column(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(
                  userAvatar,
                ), // Assuming you have an avatarUrl in your user model
                radius: 50,
              ),
              const SizedBox(height: 10),
            ],
          ),
        Text(
          userName,
          style: const TextStyle(
            fontSize: 18,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  Widget _buildEndCallButton(
    context, {
    required void Function()? onPressed,
  }) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: SizedBox(
        width: double.infinity, // Make the button take full width
        height: 50,
        child: ElevatedButton.icon(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red, // Button color
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                8,
              ), // Optional: You can customize the button's shape
            ),
          ),
          icon: const Icon(Icons.call_end),
          label: const Text(
            'End Call',
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
