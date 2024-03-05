import 'package:club_92/controllers/events/add_event_controller.dart';
import 'package:club_92/controllers/events/event_controller.dart';
import 'package:club_92/controllers/google_ads/google_ad.dart';
import 'package:club_92/controllers/theme/theme.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void setUp() {
  locator.registerLazySingleton<AddEventController>(
    () => AddEventController(),
  );
  locator.registerLazySingleton<EventController>(
    () => EventController(),
  );
  locator.registerLazySingleton<ThemeController>(
    () => ThemeController(),
  );
  locator.registerLazySingleton<GoogleAdController>(
    () => GoogleAdController(),
  );
}
