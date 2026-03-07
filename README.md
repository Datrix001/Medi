# 🌿 Medi App

A calm, minimal meditation experience built with Flutter for the ArvyaX Flutter Developer Assignment.

> Explore Ambiences → Start Session → Control Player → Journal → History

---

## 📱 Demo

> *(Add your screen recording or screenshots here)*

---

## ✨ Features

- 🎵 **Ambience Library** — Browse 6 ambiences loaded from local JSON with search and tag filtering
- 🔍 **Details Screen** — Hero image, description, sensory recipe chips, and session start
- ▶️ **Session Player** — Play/pause, seek bar, session timer, breathing animation, and per-ambience background image
- 🎙️ **Mini Player** — Persistent bottom bar on Home and Details screens while a session is active
- 📝 **Post-Session Reflection** — Mood selector and journal entry saved after each session
- 📖 **Journal History** — Full list of past reflections with tap-to-detail view
- 💾 **Local Persistence** — Journal entries saved with Hive

---

## 🏗️ Architecture

This project follows a clean feature-first architecture with strict separation of concerns.

```
lib/
├── features/
│   ├── ambience/
│   │   ├── data/
│   │   │   ├── datasources/        # Loads ambience JSON from assets
│   │   │   ├── model/              # AmbienceModel, AmbienceType (json_serializable)
│   │   │   └── repository/         # Abstract repo + implementation
│   │   └── presentation/
│   │       ├── cubit/              # AmbienceCubit, AmbienceState
│   │       ├── screens/            # AmbienceScreen, AmbienceDetailsScreen
│   │       └── widgets/            # AmbienceCard, SensoryElements
│   ├── player/
│   │   └── presentation/
│   │       ├── cubit/              # PlayerCubit, PlayerState
│   │       ├── screens/            # PlayerScreen
│   │       └── widgets/            # MiniPlayer, EndSessionDialog
│   └── journal/
│       ├── data/
│       │   ├── datasources/        # Hive box read/write
│       │   ├── model/              # JournalModel
│       │   └── repository/         # Abstract repo + implementation
│       └── presentation/
│           ├── cubit/              # JournalCubit, JournalState
│           ├── screens/            # JournalScreen, JournalDetailScreen, ReflectionScreen
│           └── widgets/            # JournalCard
├── utils/
│   ├── navigation/                 # AppNavigator — go_router config
│   ├── styles/                     # AppTextStyles, AppFontSize, text helpers
│   └── custom_button.dart
└── gen/                            # FlutterGen generated (colors, assets)
```

### State Management

**BLoC / Cubit** is used throughout.

| Cubit | Responsibility |
|---|---|
| `AmbienceCubit` | Loads ambiences from JSON, exposes loading / success / failure states |
| `PlayerCubit` | Owns the single `AudioPlayer` instance, manages session countdown timer, play/pause, seek, and auto-end |
| `JournalCubit` | Reads and writes journal entries via Hive |

### Data Flow

```
Assets (JSON / Hive)
        ↓
   DataSource
        ↓
   Repository
        ↓
     Cubit
        ↓
  UI (BlocBuilder)
```

The UI never interacts with datasources directly. All business logic lives in cubits. The repository layer keeps datasources swappable.

> **Note:** The `player` feature has no `data/` layer — it reads the audio path directly from `AmbienceModel` passed via navigation, since audio is a local asset with no persistence needs of its own.

---

## 🚀 Getting Started

### Prerequisites

- Flutter SDK `^3.10.3`
- Android Studio or VS Code with Flutter/Dart plugins
- Connected device or emulator

### Run the app

```bash
# Install dependencies
flutter pub get

# Generate code (JSON serialization + asset gen)
dart run build_runner build --delete-conflicting-outputs

# Run
flutter run
```

### Build release APK

```bash
flutter build apk --release
```

Output: `build/app/outputs/flutter-apk/app-release.apk`

---

## 📦 Packages

| Package | Version | Purpose |
|---|---|---|
| `flutter_bloc` | ^9.1.1 | State management — clean separation of UI and logic |
| `go_router` | ^17.1.0 | Declarative routing with typed `extra` params |
| `just_audio` | ^0.9.36 | Reliable audio playback with loop support |
| `hive` + `hive_flutter` | ^2.2.3 | Fast, lightweight local persistence for journal entries |
| `flutter_screenutil` | ^5.9.3 | Responsive sizing across screen sizes |
| `json_annotation` + `json_serializable` | ^4.11.0 | Type-safe JSON deserialization via code generation |
| `flutter_gen_runner` | ^5.13.0 | Type-safe asset and color references |
| `intl` | ^0.19.0 | Date formatting for journal history |
| `path_provider` | ^2.1.5 | File system path access for Hive |

---

## ⚖️ Tradeoffs & What I'd Improve

### What I'd improve with more time

**Session state persistence**
If the app is force-killed during an active session, the mini-player does not restore on relaunch. I'd persist `currentModel`, `elapsed`, and `sessionActive` to Hive on every timer tick and rehydrate `PlayerCubit` on app start.

**App lifecycle handling**
The session timer continues running when the app goes to background. I'd use `WidgetsBindingObserver` to pause the timer on `AppLifecycleState.paused` and resume it on `resumed`, keeping elapsed time accurate.

**Haptic feedback**
`HapticFeedback.lightImpact()` on play/pause and `mediumImpact()` on save reflection would make the app feel more tactile and premium — a small addition with a big UX payoff.

**Unique audio per ambience**
All 6 ambiences currently share one audio file for demo purposes. In production each would have a unique loop tailored to its mood and tag.

### Tradeoffs made

- **Cubit over full Bloc** — The app's interactions are simple method calls, not complex event streams. Cubit keeps the code lean without sacrificing structure or testability.
- **Hive over SQLite** — Journal entries are simple flat objects with no relational queries. Hive is faster to set up, has no schema migrations, and performs well for this use case.
- **Single `AudioPlayer` instance at top-level** — `PlayerCubit` is provided at the root `MultiBlocProvider` so the player persists across the entire navigation stack. This is what enables the mini-player on all screens without prop drilling or re-initialisation bugs.

---
## 👨‍💻 Built With

Flutter · Dart · BLoC · Hive · just_audio · go_router
