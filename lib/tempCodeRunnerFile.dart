// final GoRouter _router = GoRouter(
// //   routes: <RouteBase>[
// //     GoRoute(
// //       path: '/',
// //       builder: (BuildContext context, GoRouterState state) {
// //         return const HomePage();
// //       },
// //       routes: <RouteBase>[
// //         GoRoute(
// //           path: 'create_profile',
// //           builder: (BuildContext context, GoRouterState state) {
// //             return const CreateProfile();
// //           },
// //         ),
// //       ],
// //     ),
// //   ],
// // );

// // /// The main app
// // class MyApp extends StatelessWidget {
// //   /// Constructs a [MyApp]
// //   const MyApp({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp.router(
// //       routerConfig: _router,
// //     );
// //   }
// // }

// // /// The home screen
// // class HomeScreen extends StatelessWidget {
// //   /// Constructs a [HomeScreen]
// //   const HomeScreen({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(title: const Text('Home Screen')),
// //       body: Center(
// //         child: Column(
// //           mainAxisAlignment: MainAxisAlignment.center,
// //           children: <Widget>[
// //             ElevatedButton(
// //               onPressed: () => context.go('/create_profile'),
// //               child: const Text('Create Profile'),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }

// // /// The details screen
// // class DetailsScreen extends StatelessWidget {
// //   /// Constructs a [DetailsScreen]
// //   const DetailsScreen({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(title: const Text('Details Screen')),
// //       body: Center(
// //         child: Column(
// //           mainAxisAlignment: MainAxisAlignment.center,
// //           children: <ElevatedButton>[
// //             ElevatedButton(
// //               onPressed: () => context.go('/'),
// //               child: const Text('Go back to the Home screen'),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }
// // // void main() {
// // //   runApp(const MyApp());
// // // }

// // // class MyApp extends StatelessWidget {
// // //   const MyApp({super.key});

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return MaterialApp(
// // //         title: 'Ashesi Social Space ',
// // //         theme: ThemeData(
// // //           primarySwatch: Colors.blue,
// // //         ),
// // //         home: const CreateProfile());
// // //   }
// // // }

// // // class MyHomePage extends StatefulWidget {
// // //   const MyHomePage({super.key, required this.title});

// // //   final String title;

// // //   @override
// // //   State<MyHomePage> createState() => _MyHomePageState();
// // // }

// // // class _MyHomePageState extends State<MyHomePage> {
// // //   int _counter = 0;

// // //   void _incrementCounter() {
// // //     setState(() {
// // //       _counter++;
// // //     });
// // //   }

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       appBar: AppBar(
// // //         title: Text(widget.title),
// // //       ),
// // //       body: Center(
// // //         child: Column(
// // //           mainAxisAlignment: MainAxisAlignment.center,
// // //           children: <Widget>[
// // //             const Text(
// // //               'You have pushed the button this many times:',
// // //             ),
// // //             Text(
// // //               '$_counter',
// // //               style: Theme.of(context).textTheme.headline4,
// // //             ),
// // //           ],
// // //         ),
// // //       ),
// // //       floatingActionButton: FloatingActionButton(
// // //         onPressed: _incrementCounter,
// // //         tooltip: 'Increment',
// // //         child: const Icon(Icons.add),
// // //       ),
// // //     );
// // //   }
// // // }
