import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:graduation_project_app/modules/live_location/livelocation_screen.dart';
import 'package:graduation_project_app/shared/variables.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';
class MqttHandler with ChangeNotifier {
  final ValueNotifier<String> data = ValueNotifier<String>("");
  final client = MqttServerClient('test.mosquitto.org', '');
  Future<int> connect(trainNum) async {
    client.logging(on: true);
    client.setProtocolV311();
    client.keepAlivePeriod = 60;
    client.connectTimeoutPeriod = 3000; // milliseconds
    client.onDisconnected = onDisconnected;
    client.onConnected = onConnected;
    client.onSubscribed = onSubscribed;
    client.pongCallback = pong;
    final connMess = MqttConnectMessage()
        .withClientIdentifier(uId)
        .withWillTopic('willtopic') // If you set this you must set a will message
        .withWillMessage('My Will message')
        .startClean() // Non persistent session for testing
        .withWillQos(MqttQos.atLeastOnce);
    client.connectionMessage = connMess;
    try {
      await client.connect();
    } on NoConnectionException catch (e) {
      // Raised by the client when connection fails.
      client.disconnect();
    }  catch (e) {
      // Raised by the socket layer
      client.disconnect();
    }

    /// Check we are connected
    if (client.connectionStatus!.state == MqttConnectionState.connected) {
    } else {
      /// Use status here rather than state if you also want the broker return code.
      client.disconnect();
      return -1;
    }

    /// Ok, lets try a subscription
    String topic = 'Train $Train'; // Not a wildcard topic
    client.subscribe(topic, MqttQos.atMostOnce);
    client.updates!.listen((List<MqttReceivedMessage<MqttMessage?>>? c) {
      final recMess = c![0].payload as MqttPublishMessage;
      final pt = MqttPublishPayload.bytesToStringAsString(recMess.payload.message);
      List l =(pt.split(','));
      if (l[0]=='5'){
      trian_location_lat=double.parse(l[1]);
      trian_location_long=double.parse(l[2]);
      maps_cubic!.addMarker(LatLng(trian_location_lat,trian_location_long), "train",train_icon);
      maps_cubic!.markersLocations[0]=LatLng(trian_location_lat, trian_location_long,);
      if (maps_cubic!.markersLocations[1]!=const LatLng( 0.0, 0.0)){
        maps_cubic!.mapController?.animateCamera(CameraUpdate.newLatLngBounds(maps_cubic!.getLatLngBounds(maps_cubic!.markersLocations),40));
      }
      else {
        maps_cubic!.mapController?.animateCamera(CameraUpdate.newLatLngZoom(LatLng(trian_location_lat,trian_location_long),5));
      }
}

    });

    client.published!.listen((MqttPublishMessage message) {
    });
    return 0;
  }

  /// The subscribed callback
  void onSubscribed(String topic) {
    print('EXAMPLE::Subscription confirmed for topic $topic');
  }

  /// The unsolicited disconnect callback
  void onDisconnected() {
    print('EXAMPLE::OnDisconnected client callback - Client disconnection');
    if (appNow=="Live location"){
   connect(Train);}
  }

  /// The successful connect callback
  void onConnected() {
    print(
        'EXAMPLE::OnConnected client callback - Client connection was successful');
  }

  /// Pong callback
  void pong() {
    print('EXAMPLE::Ping response client callback invoked');
  }
}