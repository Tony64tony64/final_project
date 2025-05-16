[UI](https://drive.google.com/file/d/1amVO0BsNyU9GqnQgOJK2_Y2g3SiTEjfx/view?usp=sharing)


# Flutter Notes App

A modern and feature-rich Flutter application for creating and managing notes with images. This project follows MVVM architecture pattern and implements Provider for state management.

## Features

- 📝 Create and manage notes with titles and descriptions
- 📸 Add multiple images to notes
- ❤️ Mark notes as favorites
- 🎨 Beautiful UI with custom background
- 💾 Persistent data storage using SharedPreferences
- 🌐 RESTful API integration
- 📱 Responsive design for various screen sizes

## Architecture

This project follows the MVVM (Model-View-ViewModel) architecture pattern:

- **Models**: Data models for notes and other entities
- **Views**: UI components and screens
- **ViewModels**: Business logic and state management using Provider

## Project Structure

```
lib/
├── add_item/
│   ├── add_item_screen.dart    # Add note screen
│   ├── item_model.dart         # Note model
│   └── item.dart              # Item data class
├── dashboard/
│   └── nav_bar.dart           # Navigation bar
└── main.dart                  # Application entry point
```

## Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter
  provider: ^6.0.0
  shared_preferences: ^2.0.0
  http: ^0.13.0
```

## Getting Started

1. Clone the repository:
```bash
git clone https://github.com/yourusername/flutter-notes-app.git
```

2. Install dependencies:
```bash
flutter pub get
```

3. Run the app:
```bash
flutter run
```

## State Management

The app uses Provider for state management. The `ItemModel` class serves as the ViewModel, managing the state of notes and handling business logic.

## Data Persistence

- **SharedPreferences**: Used for storing user preferences and app settings
- **API Integration**: RESTful API calls for data synchronization (if implemented)

## Best Practices

- Clean and organized code structure
- Proper separation of concerns (MVVM)
- Efficient state management with Provider
- Error handling and data validation
- Responsive UI design
- Code documentation and comments

## Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License - see the LICENSE file for details.
