import 'dart:async';
import 'dart:ui';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:handichatcraft_w1986581/introduction.dart';
import 'package:handichatcraft_w1986581/kasuni/CalendarPage/notification/notification_details.dart';
import 'package:handichatcraft_w1986581/kasuni/CalendarPage/notification/notification_list.dart';
import 'package:handichatcraft_w1986581/navo/edit_profile_page.dart';
import 'package:handichatcraft_w1986581/navo/profile_page.dart';
import 'package:handichatcraft_w1986581/navo/setting_page.dart';
import 'package:handichatcraft_w1986581/navo/theme/provider.dart';
import 'package:handichatcraft_w1986581/welocme.dart';
import 'package:provider/provider.dart';
import 'package:device_preview/device_preview.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {

print('Title: ${message.notification?.title}');
print('Body: ${message.notification?.body}');
print('Payload: ${message.data}');


}
//Create a [AndroidNotificationChannel] for heads up notifications
late AndroidNotificationChannel channel;


//Initialize the [FlutterLocalNotificationsPlugin] package
late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

Future <void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
   options:const FirebaseOptions(
    apiKey: 'AIzaSyC0QN-sggU_TNk0x50o54ZmUPrewmc9Nps',
    appId: '1:339966306380:android:005b6204952aa1de272ce9',
    messagingSenderId: '339966306380',
    projectId: 'signin-signup-4c0e6',
    ),
  );

  //Set the background messaging handler early on, as a named-top level function
   FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

   if (!kIsWeb) {
    channel = const AndroidNotificationChannel(
      'high_importance_channel',//id
      'High Importance Notifications',//title
      //"This channel is used for important notifications.", //description"
      importance: Importance.high,
    );
flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
//create an Android Notification Channel.
///
///We use this channel in the "AndroidManifest.xml" file to override the 
/// default FCM channel to enable heads up notifications.
await flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<
AndroidFlutterLocalNotificationsPlugin>()?.createNotificationChannel(channel);

//Update iOS foreground notification options to allow 
///heads up notifications.
await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
  alert: true,
  badge: true,
  sound: true, 
);

   }
   runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => const MyWidget(),
    ),
   );
}

  class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (BuildContext context) => UiProvider()..init(),
        child: Consumer<UiProvider>(
            builder: (context, UiProvider notifier, child) {
    return GetMaterialApp(
      // ignore: deprecated_member_use
      scrollBehavior: MyCustomScrollBehavior(),
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      debugShowCheckedModeBanner: false,
      themeMode: notifier.isDark ? ThemeMode.dark : ThemeMode.light,

            //dark custom theme applied
            darkTheme:
                notifier.isDark ? notifier.darkTheme : notifier.lightTheme,
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
              useMaterial3: true,
            ),
      home: const Welcome(),
      initialRoute: '/',
      routes: {
        '/welcome': (context) => const Welcome(),
        '/INtroduction':(context) => const Introduction(),
        '/profile': (context) => const ProfilePage(),
        '/editprofilepage': (context) => EditProfilePage(
                    initialName: 'John Doe',
                    onUpdateName: (String) {},
                  ),
        '/accountsettingepage': (context) => AccountSettingPage(),
        '/application':(context) => Application(),
        '/message':(context) => MessageView(),
      },
    );
   }));        
  }
}
   //Renders the example application.
   class Application extends StatefulWidget{
    @override
    State<StatefulWidget> createState()=> _Application();
   }
   class _Application extends State<Application> {

    FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

    void getToken() async {
      final token = _firebaseMessaging.getToken().then((value)=> print("Token:$value"));
      await _firebaseMessaging.requestPermission();
  /*try {
    String? token = await _firebaseMessaging.getToken();
    if (token != null) {
      print("Token: $token");
    } else {
      print("Unable to get FCM token.");
    }
  } catch (e) {
    print("Error getting FCM token: $e");
  }
}*/}
    @override
    void initState() {
      super.initState();
      getToken();

      FirebaseMessaging.instance
      .getInitialMessage().then((RemoteMessage?message) {
        if(message != null) {
          Navigator.pushNamed(
            context,
            '/message',
            arguments: MessageArguments(message, true),
          );
        }
      });

      FirebaseMessaging.onMessage.listen((RemoteMessage message){
        RemoteNotification? notification = message.notification;
        AndroidNotification? android = message.notification?.android;
        if(notification != null && android != null && !kIsWeb) {
          flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
              android: AndroidNotificationDetails(
                channel.id,
                channel.name,
                //channel.description,
                

                //TODO add a proper drawable resource to android, for now using
                //one that already exists in example app.
                icon:'launch_background',
              ),
            ),
          );
        }
        
      }
      );

FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
  print('A new onMessageOpenedAppevent was published!');
  Navigator.pushNamed(
    context,
    '/message',
    arguments: MessageArguments(message,true),
  );
});
    }
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Notifications"),
          leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_outlined),
        ),
        leadingWidth: 100,
      
        actions:[
        
          IconButton(onPressed: (){}, icon:const Icon(
            Icons.notifications, color: Colors.orange,
          ))
        ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(16),
                child: Center(
                  child: Text(
                    'Notification List',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  ),
                ),
                MessageList(),
            ]
          ),
        ),
      );
    }
   }

   class MyCustomScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
  };
}


