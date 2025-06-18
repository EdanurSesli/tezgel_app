// onesignal_service.dart (Temel ve uyarlanabilir sürüm)

import 'dart:async';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class PendingNotification {
  final Map<String, dynamic> data;
  PendingNotification(this.data);
}

class StartupNotification {
  final Map<String, dynamic> data;
  StartupNotification(this.data);
}

class OneSignalService {
  static PendingNotification? pendingNotification;
  static StartupNotification? startupNotification;

  static Future<void> initOneSignal() async {
    OneSignal.Debug.setLogLevel(OSLogLevel.verbose);
    OneSignal.Debug.setAlertLevel(OSLogLevel.none);
    OneSignal.initialize(
      Platform.isAndroid
          ? '74ed5ade-a142-4c5c-ba1d-eaab6b081317'
          : '74ed5ade-a142-4c5c-ba1d-eaab6b081317',
    );
    await OneSignal.Notifications.requestPermission(true);
    _setupNotificationListeners();
  }

  static void _setupNotificationListeners() {
    OneSignal.Notifications.addClickListener((event) {
      if (kDebugMode) {
        print('OneSignal => Bildirime tıklandı: ${event.notification}');
      }
      final data = event.notification.additionalData;
      if (data != null) {
        _handleNotificationData(data);
      }
    });

    OneSignal.Notifications.addForegroundWillDisplayListener((event) {
      if (kDebugMode) {
        print("OneSignal => Ön planda bildirim alındı: ${event.notification.jsonRepresentation()}");
      }
      event.preventDefault();
      event.notification.display();
    });
  }

  static Future<void> _handleNotificationData(Map<String, dynamic> data) async {
    final isLoggedIn = await _checkLoginStatus();
    if (isLoggedIn) {
      await _processAndNavigate(data);
    } else {
      if (kDebugMode) {
        print("OneSignal => Kullanıcı giriş yapmamış. Bildirim beklemeye alınıyor.");
      }
      pendingNotification = PendingNotification(data);
    }
  }

  static Future<void> processPendingNotification() async {
    if (pendingNotification != null) {
      if (kDebugMode) print("OneSignal => Bekleyen bildirim işleniyor.");
      await _processAndNavigate(pendingNotification!.data);
      pendingNotification = null;
    }
  }

  static Future<void> _processAndNavigate(Map<String, dynamic> data) async {
    final pageType = data["pageType"] ?? data["PageType"];
    final pageId = data["pageId"] ?? data["PageId"];
    final offerKey = data["offerKey"] ?? data["OfferKey"];
    final url = data["url"] ?? data["Url"];

    if (kDebugMode) {
      print("OneSignal => Yönlendirme verisi: pageType=$pageType, pageId=$pageId, offerKey=$offerKey");
    }

    // Burada kendi route yapılandırmanı ekleyebilirsin:
    // Örn: Navigator.pushNamed(context, '/your-route', arguments: data);
  }

  static Future<void> _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      if (kDebugMode) print('OneSignal => URL açılamadı: $url');
    }
  }

  static Future<bool> handleStartupNotification() async {
    if (startupNotification != null) {
      if (kDebugMode) print("OneSignal => Uygulamayı başlatan bildirim işleniyor.");
      if (await _checkLoginStatus()) {
        await _processAndNavigate(startupNotification!.data);
        startupNotification = null;
        return true;
      }
    }
    return false;
  }

  static Future<bool> _checkLoginStatus() async {
    try {
      // Örnek login kontrolü: accessToken varsa giriş yapılmış sayılır
      // Kendi secure storage sisteminize göre düzenleyin
      return true; // geçici olarak true
    } catch (e) {
      if (kDebugMode) print("OneSignal => _checkLoginStatus hatası: $e");
      return false;
    }
  }

  static Future<void> processStartupNotification() async {
    final Completer<Map<String, dynamic>?> completer = Completer();
    OneSignal.Notifications.addClickListener((event) {
      if (!completer.isCompleted) {
        completer.complete(event.notification.additionalData);
      }
    });

    Future.delayed(const Duration(milliseconds: 1500), () {
      if (!completer.isCompleted) {
        completer.complete(null);
      }
    });

    final Map<String, dynamic>? data = await completer.future;
    if (data != null) {
      if (kDebugMode) {
        print('OneSignal => Uygulamayı başlatan bildirim verisi yakalandı: $data');
      }
      startupNotification = StartupNotification(data);
    }
  }
}