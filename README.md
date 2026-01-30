# Weather App

A simple and elegant weather application built with Flutter. This app provides real-time weather information for any city around the world. It's designed with a clean and user-friendly interface, making it easy to get the weather updates you need.

![App Demo](assets/weather_app.gif)

## 🌟 Features

- **Real-time Weather:** Get the current temperature, weather condition, humidity, and wind speed.
- **City Search:** Easily search for any city to get its weather forecast.
- **Dynamic UI:** The background and icons change according to the weather conditions.
- **State Management:** Built with Riverpod for efficient and scalable state management.
- **API Integration:** Fetches data from a reliable weather API to provide accurate information.

## 🛠️ Getting Started

To get a local copy up and running, follow these simple steps.

### Prerequisites

- Flutter SDK: [Installation Guide](https://flutter.dev/docs/get-started/install)
- A code editor like VS Code or Android Studio.

### Installation

1.  Clone the repo
    ```sh
    git clone https://github.com/your_username/weather_app.git
    ```
2.  Navigate to the project directory
    ```sh
    cd weather_app
    ```
3.  Install dependencies
    ```sh
    flutter pub get
    ```
4.  Run the app
    ```sh
    flutter run
    ```

## Logic Steps & Project Structure

The application is structured to separate concerns, making it scalable and easy to maintain.

-   `lib/`
    -   `main.dart`: The entry point of the application.
    -   `runapp.dart`: Initializes the main app widget and providers.
    -   `secrets.dart`: To store API keys and other sensitive information (make sure to add this to your `.gitignore`).
    -   `model/`: Contains the data models for the weather information received from the API.
        -   `weather_model.dart`: The main model that encapsulates all weather data.
    -   `provider/`: Holds the Riverpod providers for state management.
        -   `weather_provider.dart`: Manages the state of the weather data.
    -   `screen/`: Contains the UI screens of the application.
        -   `home_sceen.dart`: The main screen that displays the weather information.
    -   `services/`: Handles business logic and communication with external services.
        -   `weather_services.dart`: Fetches weather data from the API.
        -   `weather_state.dart`: Defines the different states for the weather data (initial, loading, loaded, error).

## Dependencies

This project uses the following key packages:

-   [flutter_riverpod](https://pub.dev/packages/flutter_riverpod): For state management.
-   [http](https://pub.dev/packages/http): For making HTTP requests to the weather API.

## Contributing

Contributions are what make the open-source community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.

If you have a suggestion that would make this better, please fork the repo and create a pull request. You can also simply open an issue with the tag "enhancement".
Don't forget to give the project a star! Thanks again!

1.  Fork the Project
2.  Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3.  Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4.  Push to the Branch (`git push origin feature/AmazingFeature`)
5.  Open a Pull Request
