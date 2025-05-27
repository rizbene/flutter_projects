# Flutter Navigation
Tujuan praktikum navigation flutter adalah untuk mempelajari navigasi yang dipakai di dalam flutter.
- Named Routes: Navigasi yang menggunakan nama rute sebagai penanda untuk berpindah antar halaman.
- Navigator 2.0: Navigasi yang menggunakan deklaratif routing untuk mengatur tampilan halaman secara lebih fleksibel dan kompleks.
- Nested Navigation: Navigasi yang memungkinkan adanya navigator di dalam navigator, biasanya digunakan pada aplikasi dengan tab atau drawer.
- Deep Linking: Navigasi yang memungkinkan aplikasi dibuka langsung ke halaman tertentu melalui URL atau tautan eksternal.

## 1. Navigation (Named Route)
Navigasi ini merupakan navigasi yang banyak dipakai di project flutter sederhana
### Widget yang dipakai:
- MaterialApp
- route
- ElevatedButton
- HomeScreen
- DetailScreen
- SettingsScreen
- AboutScreen

![image](https://github.com/user-attachments/assets/59434c41-5951-4a35-8883-1085a62c93b1)

## 2. Navigation 2.0
Navigasi ini merupakan versi terbaru dari sistem navigasi di Flutter yang memberikan kontrol lebih besar terhadap manajemen halaman
### Widget yang dipakai:
- MaterialApp
- Navigator
- HomeScreen
- DetailScreen

![image](https://github.com/user-attachments/assets/1427f120-5521-472a-a2d2-4c20d40b869b)

## 3. Nested Navigation
Navigasi ini merupakan navigasi bersarang (nested navigation) yang memungkinkan setiap bagian dari aplikasi, seperti tab atau drawer, memiliki riwayat navigasinya sendiri tanpa memengaruhi navigasi utama.
### Widget yang dipakai:
- MaterialApp
- Navigator
- MaterialPageRoute
- HomeScreen
- SetupFlowScreen
- FindDevicesScreen
- ConnectDeviceScreen
- ConfirmDevice

![image](https://github.com/user-attachments/assets/c18ea71f-141f-4cec-bf56-b2636eedd92c)

## 4. Deep Link Navigation
Navigasi ini memungkinkan pengguna untuk langsung masuk ke halaman tertentu di dalam aplikasi melalui link eksternal
### Widget yang dipakai:
- MaterialApp
- AppRouterDelegate
- AppRouteInformationParser
- HomeScreen
- DetailScreen
- SettingsScreen

![image](https://github.com/user-attachments/assets/235dbb5b-6c45-4b80-a7c0-d329074b46f8)
