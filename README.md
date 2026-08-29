# 💜 Rafiq

<p align="center">
  <img src="assets/images/logo.png" width="120" alt="Rafiq Logo"/>
</p>

<h3 align="center">
  A Flutter-based mobile application designed to support mothers through pregnancy and early motherhood.
</h3>

<p align="center">
  <strong>Graduation Project — Faculty of Computers and Information Sciences, Mansoura University</strong>
</p>

<p align="center">
  <a href="https://github.com/Myrnanader/Rafiq_app_Graduation_project">
    <img src="https://img.shields.io/badge/GitHub-Repository-181717?style=for-the-badge&logo=github" alt="GitHub Repository"/>
  </a>
  <img src="https://img.shields.io/badge/Flutter-Mobile%20Development-02569B?style=for-the-badge&logo=flutter" alt="Flutter"/>
  <img src="https://img.shields.io/badge/Dart-Language-0175C2?style=for-the-badge&logo=dart" alt="Dart"/>
</p>

---

## 📱 About Rafiq

**Rafiq** is a cross-platform mobile application built with Flutter as a graduation project.

The application aims to provide mothers with a supportive digital experience by bringing together different services and resources in one mobile platform.

Rafiq focuses on providing a simple, accessible, and user-friendly experience while using modern mobile development practices and a scalable application structure.

---

## ✨ Key Features

The application includes multiple modules designed around the needs of mothers, including:

* 🔐 **Authentication & User Management**
* 💬 **Chat & Communication**
* 🩺 **Doctor Discovery & Healthcare Services**
* 🧠 **Mental Health & Depression Support**
* 🎙️ **Audio Recording & Media Handling**
* 📅 **Appointments & Calendar-related Features**
* 📊 **Data Visualization & Tracking**
* 🌐 **Localization**
* 🔒 **Secure Local Data Storage**
* 📱 **Device Permissions & Media Access**

> The application is structured as a collection of independent features to make the codebase easier to maintain, test, and scale.

---

## 🏗️ Architecture

Rafiq follows a **Feature-Based Architecture** with an **MVVM-oriented structure**.

The project is organized around application features rather than placing all screens, widgets, and business logic into shared folders.

### High-Level Structure

```text
lib/
├── core/
│   ├── constants/
│   ├── network/
│   ├── routing/
│   ├── services/
│   ├── theme/
│   └── ...
│
├── features/
│   ├── auth/
│   ├── chat/
│   ├── cry/
│   ├── depression/
│   ├── find_a_doctor_now/
│   ├── notification/
│   └── ...
│
└── main.dart
```

This structure helps separate responsibilities and makes individual features easier to develop and maintain.

---

## 🧩 Tech Stack

### Mobile Development

* **Flutter**
* **Dart**

### State Management

* **BLoC**
* **Cubit**

### Architecture & Code Organization

* **MVVM**
* **Feature-Based Architecture**
* **Dependency Injection**
* **Clean Code Principles**

### Networking

* **Dio**
* **Retrofit**
* **RESTful APIs**
* **JSON Serialization**

### Dependency Injection

* **GetIt**
* **Injectable**

### Local Storage

* **Flutter Secure Storage**
* **Shared Preferences**

### Navigation & Localization

* **GoRouter**
* **Flutter Localization**

### Device & Media

* **Image Picker**
* **Photo Manager**
* **File Picker**
* **Permission Handler**
* **Video Player**
* **Audio Recording**

### Additional Tools

* **Git**
* **GitHub**
* **Logger**
* **Connectivity Plus**

---

## 🔌 API Integration

The application communicates with backend services through **RESTful APIs**.

The networking layer uses:

```text
Flutter
   ↓
BLoC / Cubit
   ↓
Repository / Data Layer
   ↓
Retrofit
   ↓
Dio
   ↓
REST API
```

API models are handled using JSON serialization to provide structured and maintainable data communication.

---

## 🔐 Security & Local Data

Rafiq uses local storage solutions depending on the type of data being handled.

* **Flutter Secure Storage** for sensitive information.
* **Shared Preferences** for lightweight local application data.
* Device permissions are handled through `permission_handler`.

---

## 📂 Project Structure

The project follows a modular feature-oriented structure.

Each feature can contain its own:

```text
feature/
├── data/
├── presentation/
├── widgets/
└── ...
```

This approach reduces coupling between features and makes the application easier to extend.

---

## 🛠️ Getting Started

### Prerequisites

Make sure you have installed:

* Flutter SDK
* Dart SDK
* Android Studio or VS Code
* Android Emulator or a physical device

### Installation

Clone the repository:

```bash
git clone https://github.com/Myrnanader/Rafiq_app_Graduation_project.git
```

Move into the project directory:

```bash
cd Rafiq_app_Graduation_project
```

Get the dependencies:

```bash
flutter pub get
```

Run the application:

```bash
flutter run
```

---

## 🌿 Branches

The main development work is currently maintained on:

```text
development
```

To switch to the development branch:

```bash
git checkout development
```

---

## 👩‍💻 Development

Rafiq was developed as a collaborative graduation project.

The project involved applying software development practices across different stages including:

* Requirements analysis
* UI/UX implementation
* Flutter development
* API integration
* State management
* Testing and debugging
* Git-based collaboration

---

## 🎓 Academic Project

**Rafiq** was developed as a graduation project at:

**Faculty of Computers and Information Sciences**
**Mansoura University**
**2022 – 2026**

---

## 📌 Project Status

🚧 **Graduation Project — Completed**

The repository represents the Flutter mobile application and its development history.

---

## 💜 Built With Flutter

<p align="center">
  Made with Flutter, teamwork, and a lot of coffee ☕💜
</p>
