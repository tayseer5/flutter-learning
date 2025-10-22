import 'package:flutter/material.dart';
import 'package:flutter_demo/managers/hive_manager.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_demo/screen/note_module/note_list.dart';
import 'package:flutter_demo/providers/theme_provider.dart';
import 'theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveManager.init();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeProvider);
    
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: themeMode,
      debugShowCheckedModeBanner: false,
      home: const NoteList(),
    );
  }
}