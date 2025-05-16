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
│   ├── add_item_screen.dart    
│   ├── Item_model.dart        
│   └── item.dart               
│
├── dashboard/
│   ├── dashboard_screen.dart  
│   ├── nav_bar.dart           
│   └── SectionScreen.dart     
│
├── details/
│   ├── details_screen/
│   │   └── details_page.dart   
│   └── details_widget/
│       ├── favorite.dart      
│       ├── season.dart         
│       └── details_widget.dart 
│
├── favorite/
│   ├── favorite_screen.dart    
│   └── favorite_model.dart     
│
├── login/
│   └── login_screen.dart       
│
├── profile/
│   ├── profile_page/
│   │   ├── profile_page.dart   
│   │   └── options.dart        
│   ├── profile_widget/         
│   ├── user_model.dart        
│   └── user.dart              
│
├── qoute/
│   ├── qoute_screen.dart      
│   ├── quote.dart             
│   └── service.dart           
│
├── signup/
│   └── signup_screen.dart     
│
├── splash/
│   └── splash_screen.dart    
│
├── HeartScreen.dart          
└── main.dart                  
```

## Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter
  cupertino_icons: ^1.0.8
  image_picker: ^0.8.4+5
  path_provider: ^2.1.1
  provider: ^6.1.5
  http: ^1.4.0
  shared_preferences: ^2.1.1
```

## Getting Started

1. Install dependencies:
```bash
flutter pub get
```

2. Run the app:
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

