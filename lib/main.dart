import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_example/providers/movie_provider.dart';
import 'package:flutter_riverpod_example/screens/new_user_screen.dart';
import 'package:flutter_riverpod_example/widgets/movie_card.dart';
import 'models/movie.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
    statusBarColor: Colors.transparent, // optional
  ));

  runApp(
    const ProviderScope(child: MyApp()
      // MovieApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: NewUserScreen(),
      ),
    );
  }
}


class MovieApp extends ConsumerWidget {
  const MovieApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ThemeData theme = ThemeData();

    List<Movie> formattedMovies = ref
        .watch(moviesProvider)
        .movies;
    bool isLoading = ref
        .watch(moviesProvider)
        .isLoading;

    return MaterialApp(
      theme: theme.copyWith(
        colorScheme: theme.colorScheme.copyWith(
          primary: Colors.black,
          secondary: Colors.blue,
        ),
      ),
      title: 'Le Movie App',
      home: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 8, vertical: 20),
                child: TextField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter a search term',
                  ),
                  onChanged: (text) async {
                    // text here is the inputed text
                    await ref.read(moviesProvider.notifier).filterMovies(text);
                  },
                ),
              ),
              isLoading
                  ? const CircularProgressIndicator()
                  : Expanded(
                child: Container(
                  color: Colors.white,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: formattedMovies.length,
                    itemBuilder: (BuildContext context, int index) {
                      Movie movie = formattedMovies[index];

                      return MovieCard(movie: movie);
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
