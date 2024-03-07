import 'package:club_92/controllers/events/add_event_controller.dart';
import 'package:club_92/controllers/events/event_controller.dart';
import 'package:club_92/controllers/google_ads/google_ad.dart';
import 'package:club_92/controllers/theme/theme.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void setUp() {
  locator.registerSingleton<AddEventController>(
    AddEventController(),
  );
  locator.registerSingleton<EventController>(
    EventController(),
  );
  locator.registerFactory<ThemeController>(
    () => ThemeController(),
  );
  locator.registerSingleton<GoogleAdController>(
    GoogleAdController(),
  );
}
