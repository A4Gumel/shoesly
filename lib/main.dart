import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_project/main/app.dart';
import 'package:flutter_project/main/app_env.dart';
import 'package:flutter_project/main/observers.dart';
import 'package:flutter_project/shared/data/dummy_data.dart';
import 'package:flutter_project/shared/domain/models/featured_item/featured_item_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() => mainCommon();

Future<void> mainCommon() async {

  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle.light.copyWith(
      statusBarColor: Colors.black,
      statusBarBrightness: Brightness.light,
    ),
  );

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(ProviderScope(
    observers: [
      Observers(),
    ],
    child: MyApp(),
  ));
}

