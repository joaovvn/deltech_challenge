# Pokedex

Flutter-based mobile application for searching and viewing details of all the Pokémons provided by PokeAPI.

## Functionalities

- ### Authentication

  Signup and login through Firebase Authentication.

- ### Find your Pokémon

  Search for or look through the list of Pokémons.

- ### Find details about each Pokémon
  You can see details about all the Pokémons.

## Technologies

- **Mobile:** [Flutter](https://docs.flutter.dev/).

- **API:** [PokéAPI](https://pokeapi.co/).

- **Firebase:** [Firebase](https://firebase.google.com).

## External Libraries

- **_State Management:_** [MobX](https://pub.dev/packages/mobx).

- **_Dependency Injection:_** [GetIt](https://pub.dev/packages/get_it).

- **_HTTP Networking:_** [Dio](https://pub.dev/packages/dio).

## Running

1. Clone the repository:

   ```bash
   git clone https://github.com/user/project.git
   ```

2. Install dependencies:

   ```bash
   dart pub get
   ```

3. Generate \*.g.dart files

   ```bash
   dart run build_runner build
   ```

4. Choose your emulator

   Your emulator **must** use Android API 23 or above, preferably above 31.

5. Run

   ```bash
   flutter run
   ```

## Project Structure

- ### lib/core/constants

  App Constants

- ### lib/controllers

  Controllers for the screens

- ### lib/core

  Essencials for app funcionalities

- ### lib/extensions

  Strings and number manipulation extensions

- ### lib/models

  API data models

- ### lib/services

  API fetching services

- ### lib/theme

  Contains the app theme

- ### lib/utils

  Utility functions

- ### lib/views

  Contains the UI

- ### lib/widgets
  Contains reusable UI widgets
