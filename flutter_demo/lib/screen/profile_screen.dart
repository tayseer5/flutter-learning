import 'package:flutter/material.dart';
import '../extentions/build_context_extentions.dart';
import '../widgets/app_card_container.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(context.screenWidth * 0.09),
          child: AppCardContainer(
            padding: EdgeInsets.all(context.screenWidth * 0.09),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 60,
                    backgroundColor: colorScheme.outline.withValues(alpha: 0.2),
                    backgroundImage: const NetworkImage('https://encrjypted-tbwewqewqen0.gstatic.com/images?q=tbn:ANd9GcQmLlz4kiZ23iny0wdtSPKQSpK-tpZfuM2QAQ&s'),
                    onBackgroundImageError: (exception, stackTrace) {
                      debugPrint('tayseer Image loading failed: $exception');
                      debugPrint('tayseer Stack trace: $stackTrace');
                    },
                    child: Icon(
                      Icons.person,
                      size: 60,
                      color: colorScheme.outline,
                    ),
                  ),
                  const SizedBox(height: 24),
                  
                  // Name
                  Text(
                    'John Doe',
                    style: theme.textTheme.titleLarge?.copyWith(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  
                  // Bio
                  Text(
                    'Software Developer & Flutter Enthusiast',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      fontSize: 16,
                      fontStyle: FontStyle.italic,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  
                  Expanded(
                    child: Text(
                      'Passionate about creating beautiful mobile applications and exploring new technologies. Love to code, learn, and share knowledge with the community. I have extensive experience in Flutter development, working with various state management solutions like Provider, Bloc, and Riverpod. My expertise includes building responsive UIs, implementing complex animations, integrating third-party APIs, and optimizing app performance. I enjoy mentoring junior developers and contributing to open-source projects. In my free time, I love experimenting with new Flutter packages and staying updated with the latest mobile development trendsmobile applications and exploring new technologies. Love to code, learn, and share knowledge with the community. I have extensive experience in Flutter development, working with various state management solutions like Provider, Bloc, and Riverpod. My expertise includes building responsive UIs, implementing complex animations, integrating third-party APIs, and optimizing app performance. I enjoy mentoring junior developers and contributing to open-source projects. In my free time, I love experimenting with new Flutter packages and staying updated with the latest mobile development trends.',
                      style: theme.textTheme.bodySmall?.copyWith(
                        fontSize: 14,
                        height: 1.5,
                      ),
                      textAlign: TextAlign.center,
                      maxLines: 20,
                      overflow: TextOverflow.fade,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
