# 📰 News App

A simple and elegant news application built with Flutter. It allows users to browse the latest articles from various sources and categories, with a clean and intuitive user interface.

---

### 🎥 **App Demo**

[Watch the screen record of the app in action](https://drive.google.com/file/d/1XRCFO9VozKbmqQEzA7tGTDvzLAdAlD4E/view?usp=sharing)

*(Note: For a better preview, you can convert the screen record to a GIF and embed it here.)*

---

### ✨ **Features**

*   **Browse News**: 🗞️ Explore articles from different categories like Sports, Technology, Science, and more.
*   **Search**: 🔍 Quickly find articles on any topic with the integrated search functionality.
*   **Localization**: 🌍 Switch between **English** and **Arabic** languages on-the-fly.
*   **Theming**: 🎨 Seamlessly toggle between a sleek **Light Mode** and an eye-friendly **Dark Mode**.

---

### 🏗️ **Architecture**

This project follows the **Clean Architecture** principles to ensure a scalable, maintainable, and testable codebase. The code is structured into three main layers:

*   **Domain**: Contains the core business logic, use cases, and entities. It is the innermost layer and has no dependencies on other layers.
*   **Data**: Responsible for retrieving data from remote sources (News API) and implements the repositories defined in the domain layer.
*   **Presentation (View)**: The UI layer of the application. It is built using **Flutter** and utilizes the **BLoC** pattern for state management, ensuring a clear separation between the UI and business logic.

---

### 🚀 **Getting Started**

To get a local copy up and running, follow these simple steps.

**Prerequisites:**
*   Flutter SDK
*   An IDE like Android Studio or VS Code

**Installation & Run:**

1.  **Clone the repository:**
    ```sh
    git clone <your-repository-url>
    ```
2.  **Navigate to the project directory:**
    ```sh
    cd news_app
    ```
3.  **Install dependencies:**
    ```sh
    flutter pub get
    ```
4.  **Run the code generator for dependency injection and localization:**
    ```sh
    dart run build_runner build --delete-conflicting-outputs
    ```
5.  **Run the app:**
    ```sh
    flutter run
    ```
