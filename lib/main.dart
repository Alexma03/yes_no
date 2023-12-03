import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no/config/theme/app_theme.dart';
import 'package:yes_no/presantation/providers/chat_provider.dart';
import 'package:yes_no/presantation/screens/chat/chat_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ChatProvider()),
      ],
      child: MaterialApp(
        title: 'Material App',
        debugShowCheckedModeBanner: false,
        theme: AppTheme( selectedColor: 8, isDark: true).theme(),
        home: const ChatScreen(),
      ),
    );
  }
}