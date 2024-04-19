part of 'app_routes_import.dart';

Route<dynamic>? generateRoutes(RouteSettings settings) {
  switch (settings.name) {
    case LoginScreen.route:
      return MaterialPageRoute(
        builder: (_) => const LoginScreen(),
      );
    case ForgotPasswordScreen.route:
      return MaterialPageRoute(
        builder: (_) => const ForgotPasswordScreen(),
      );
    case ChooseCountryScreen.route:
      return MaterialPageRoute(
        builder: (_) => const ChooseCountryScreen(),
      );
    case OtpScreen.route:
      return MaterialPageRoute(
        builder: (_) => const OtpScreen(),
      );
    case AddUserDetailsScreen.route:
      final bool? isUpdate = settings.arguments as bool?;
      return MaterialPageRoute(
        builder: (_) => AddUserDetailsScreen(
          isUpdate: isUpdate ?? false,
        ),
      );
    case ChooseSpeakersScreen.route:
      return MaterialPageRoute(
        builder: (_) => const ChooseSpeakersScreen(),
      );
    case UsersInterestScreen.route:
      final bool? isFromSettings = settings.arguments as bool?;
      return MaterialPageRoute(
        builder: (_) => UsersInterestScreen(
          isFromSettings: isFromSettings ?? false,
        ),
      );
    case HomeScreen.route:
      return MaterialPageRoute(
        builder: (_) => const HomeScreen(),
      );
    case SearchScreen.route:
      return MaterialPageRoute(
        builder: (_) => const SearchScreen(),
      );
    case ChatListScreen.route:
      return MaterialPageRoute(
        builder: (_) => const ChatListScreen(),
      );
    case NotificationScreen.route:
      return MaterialPageRoute(
        builder: (_) => const NotificationScreen(),
      );
    case ProfileScreen.route:
      final Speaker speaker = settings.arguments as Speaker;
      return MaterialPageRoute(
        builder: (_) => ProfileScreen(speaker: speaker),
      );
    case MainEventScreen.route:
      final arg = settings.arguments as Map<String, dynamic>;
      final Event event = arg['event'];
      final bool? isMyEvent = arg['isMyEvent'];
      return MaterialPageRoute(
        builder: (_) => MainEventScreen(
          event: event,
          isMyEvent: isMyEvent ?? false,
        ),
      );
    case AddEventScreen.route:
      final arg = settings.arguments as Map<String, dynamic>?;
      final Event? event = arg?['event'];
      final bool? isUpdateEvent = arg?['isUpdateEvent'];
      return MaterialPageRoute(
        builder: (_) =>
            AddEventScreen(event: event, isUpdateEvent: isUpdateEvent ?? false),
      );
    case WalletScreen.route:
      return MaterialPageRoute(
        builder: (_) => WalletScreen(),
      );
    case SettingScreen.route:
      return MaterialPageRoute(
        builder: (_) => const SettingScreen(),
      );
    case NewChatScreen.route:
      return MaterialPageRoute(
        builder: (_) => const NewChatScreen(),
      );
    case ChatScreen.route:
      final arg = settings.arguments as Map<String, dynamic>;
      final ChatModel? sender = arg['sender'];
      final Speaker? newReceiver = arg['newReceiver'];
      return MaterialPageRoute(
        builder: (_) => ChatScreen(
          sender: sender,
          newReceiver: newReceiver,
        ),
      );
    case FaqsScreen.route:
      return MaterialPageRoute(
        builder: (_) => const FaqsScreen(),
      );
    case TermsConditionsScreen.route:
      return MaterialPageRoute(
        builder: (_) => const TermsConditionsScreen(),
      );
    case CommunityGuidelines.route:
      return MaterialPageRoute(
        builder: (_) => const CommunityGuidelines(),
      );
    case PrivacyPolicyScreen.route:
      return MaterialPageRoute(
        builder: (_) => const PrivacyPolicyScreen(),
      );
    default:
      return null;
  }
}
