import 'package:event_bus_plus/event_bus_plus.dart';

class EventAppBus{
  static EventBus eventVideo = EventBus();

static IEventBus ieventBus = EventBus();

}


class EventVideoPauseEvent extends AppEvent{

  EventVideoPauseEvent(this.videoPause);

  final String? videoPause;

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}