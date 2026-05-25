# Med EG

A cross-platform healthcare mobile application built with Flutter. Med EG connects patients, doctors, and clinic assistants for appointments, medical records, messaging, and medication management.

## Features

- **Multi-role access** — Separate flows for patients, doctors, and doctor assistants
- **Appointments** — Book, view, and manage clinic visits
- **Medical records** — Patient history including allergies, diseases, operations, and related details
- **Medicine alerts** — Create and manage medication reminders with local notifications
- **Messaging** — In-app chat between patients and healthcare providers
- **Doctor tools** — Calendar, patient search, and medical record lookup (including face recognition via the backend service)
- **Authentication** — Registration, login, verification, and password recovery

## Tech stack

| Layer | Technologies |
|-------|----------------|
| Mobile app | Flutter, Dart, flutter_bloc, HTTP |
| UI | Material Design, custom assets (SVG/PNG), Encode Sans Expanded |
| Notifications | awesome_notifications |
| Backend (optional) | Python Flask — face encoding and recognition API (`app.py`) |

## Project structure

```
lib/
├── Views/          # Screens (patient, doctor, assistant)
├── cubits/         # BLoC state management
├── services/       # API and data services
├── models/         # Data models
├── widgets/        # Reusable UI components
└── constants/      # App-wide constants (e.g. colors)
```

## Prerequisites

- [Flutter SDK](https://docs.flutter.dev/get-started/install) (Dart SDK `>=3.0.0 <4.0.0`)
- Android Studio / Xcode (for device emulators or physical builds)
- For face recognition: Python 3 with Flask (see `app.py`)

## Getting started

1. **Clone the repository**

   ```bash
   git clone <repository-url>
   cd Flutter
   ```

2. **Install dependencies**

   ```bash
   flutter pub get
   ```

3. **Run the app**

   ```bash
   flutter run
   ```

4. **(Optional) Start the face recognition API**

   ```bash
   pip install flask flask-cors
   python app.py
   ```

   Configure the API base URL in the app where services call the backend (e.g. face recognition endpoints).

## Supported platforms

- Android
- iOS
- Windows
- macOS
- Linux

## License

This project is for educational and portfolio use unless otherwise specified by the repository owner.
