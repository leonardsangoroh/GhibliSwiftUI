# GhibliSwiftUI

An iOS app for discovering Studio Ghibli films, built entirely with SwiftUI. Browse the studio's film catalogue, search by title, explore film and character details, and save favorites locally for later.

## Features

- Browse Studio Ghibli films in a native SwiftUI interface
- View film artwork, descriptions, directors, producers, release years, running times, and Rotten Tomatoes scores
- Load character details for each film concurrently
- Search the catalogue by film title
- Add and remove favorite films
- Persist favorites between launches with `UserDefaults`
- Choose a system, light, or dark appearance
- Configure locally stored preferences
- Preview screens with mock API and storage services

## Screens

The app is organized around four tabs:

### Movies
The complete Studio Ghibli film catalogue
<br>
<img width="196" height="380" alt="Movies Screenshot" src="https://github.com/user-attachments/assets/9c429c83-d961-4b58-937d-9f80d787e0ee" />

### Favorites
Films saved on the device
<br>
<img width="195" height="384" alt="Favorites Screenshot" src="https://github.com/user-attachments/assets/d69b62bf-23a4-49f9-a52b-aa71aff2af56" />

### Settings
Appearance and local preferences
<br>
<img width="195" height="382" alt="Settings" src="https://github.com/user-attachments/assets/ae5dcc78-d32f-4360-8591-d0ae4f987d18" />

### Search
Title-based film search
<br>
<img width="193" height="379" alt="Search" src="https://github.com/user-attachments/assets/e878b312-35a4-4f9e-8b13-ca09486104c7" />

## Requirements

- Xcode 26 or later
- iOS 26 or later
- An internet connection for film and character data

## Getting Started

1. Clone the repository:

   ```bash
   git clone https://github.com/leonardsangoroh/GhibliSwiftUI.git
   ```

2. Open the Xcode project:

   ```bash
   cd GhibliSwiftUI
   open GhibliSwiftUI.xcodeproj
   ```

3. Select an iOS 26 simulator or a compatible device.
4. Build and run the `GhibliSwiftUI` scheme.

No API key or additional dependency setup is required.

## Architecture

GhibliSwiftUI separates its UI, observable state, networking, and persistence concerns:

```text
GhibliSwiftUI/
├── Models/       Film and person data models
├── Networking/   Observable view models, loading state, and API errors
│   └── Services/ API and favorites-storage abstractions
├── Views/        Film list, details, search, favorites, and settings
└── Assets.xcassets
```

The app uses:

- SwiftUI for the interface and navigation
- Observation's `@Observable` for view-model state
- Swift concurrency (`async`/`await` and task groups) for network requests
- Protocol-based services for substituting live and mock implementations
- `UserDefaults` and `@AppStorage` for local persistence
- A reusable `LoadingState` model for idle, loading, loaded, and error UI states

## Data Source

Film and character information comes from the public [Studio Ghibli API](https://ghibliapi.vercel.app/). The app currently requests the `/films` endpoint and follows the character URLs included in each film response.

## Privacy

Favorites and settings are stored locally on the device. The app does not require an account or an API key.

## Acknowledgements

- [Studio Ghibli](https://www.ghibli.jp/) for the films that inspired this project
- The community-maintained [Studio Ghibli API](https://ghibliapi.vercel.app/) for film and character data

This project is unofficial and is not affiliated with or endorsed by Studio Ghibli.

## License
TBD
