import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nested Navigation App',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: const TextTheme(
          bodyMedium: TextStyle(fontSize: 16),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}

// Layar Utama (HomeScreen)
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Welcome to the App!',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SetupFlowScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                textStyle: const TextStyle(fontSize: 16),
              ),
              child: const Text('Start Setup Flow'),
            ),
          ],
        ),
      ),
    );
  }
}

// Layar Alur Pengaturan (SetupFlowScreen)
class SetupFlowScreen extends StatefulWidget {
  const SetupFlowScreen({super.key});

  @override
  State<SetupFlowScreen> createState() => _SetupFlowScreenState();
}

class _SetupFlowScreenState extends State<SetupFlowScreen> {
  final _navigatorKey = GlobalKey<NavigatorState>();

  void _onDeviceFound() {
    _navigatorKey.currentState!.pushNamed('connect_device');
  }

  void _onConnectComplete() {
    _navigatorKey.currentState!.pushNamed('confirm_device');
  }

  void _completeSetup(BuildContext context) {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Setup Flow'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Navigator(
        key: _navigatorKey,
        initialRoute: 'find_devices',
        onGenerateRoute: (settings) {
          Widget page;
          switch (settings.name) {
            case 'find_devices':
              page = FindDevicesScreen(onDeviceFound: _onDeviceFound);
              break;
            case 'connect_device':
              page = ConnectDeviceScreen(onConnectComplete: _onConnectComplete);
              break;
            case 'confirm_device':
              page = ConfirmDeviceScreen(onConfirm: () => _completeSetup(context));
              break;
            default:
              page = FindDevicesScreen(onDeviceFound: _onDeviceFound);
          }
          return MaterialPageRoute(builder: (_) => page);
        },
      ),
    );
  }
}

// Layar Pencarian Perangkat
class FindDevicesScreen extends StatelessWidget {
  final VoidCallback onDeviceFound;

  const FindDevicesScreen({super.key, required this.onDeviceFound});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Finding Devices...',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: onDeviceFound,
            child: const Text('Device Found'),
          ),
        ],
      ),
    );
  }
}

// Layar Koneksi Perangkat
class ConnectDeviceScreen extends StatelessWidget {
  final VoidCallback onConnectComplete;

  const ConnectDeviceScreen({super.key, required this.onConnectComplete});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Connecting to Device...',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: onConnectComplete,
            child: const Text('Confirm Device'),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Back'),
          ),
        ],
      ),
    );
  }
}

// Layar Konfirmasi Perangkat (sub-layar ketiga)
class ConfirmDeviceScreen extends StatelessWidget {
  final VoidCallback onConfirm;

  const ConfirmDeviceScreen({super.key, required this.onConfirm});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Confirming Device Settings...',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: onConfirm,
            child: const Text('Finish Setup'),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Back'),
          ),
        ],
      ),
    );
  }
}
