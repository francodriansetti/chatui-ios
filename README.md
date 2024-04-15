**Chat Interface iOS App**

**Project Overview:**

This project is an iOS application aimed at creating a chat interface. The application allows users to exchange messages in a chat interface that follows specific rules and requirements outlined below.

The app has been developed using Swift and SwiftUI.

Demo app short video: 
https://we.tl/t-VqbmEhl1kU


**Project Structure:**

The project follows clean architecture concept:

-   **Scenes:** Contains modules related to different scenes of the application. 
    -   **View:** Contains SwiftUI views for the chat interface.
    -   **ViewModel:** Holds the business logic and data for the chat interface.
    -   **Repository:** Handles data access and storage operations.
    -   **UseCase:** Contains the core functionality of the application, such as sending and loading messages.
    -   **Model:** Defines data models used throughout the application.
-   **Services:** Contains external services utilized by the application (Realm).
    -   **Persistence:** Handles data persistence using technologies (Realm).
        -   **Database:** Includes database management utilities.
        -   **Repository:** Implements data repository interfaces for accessing persistent data.
-   **Utils:** Contains utility functions and extensions used across the application.
    -   **Extensions:** Includes extensions for built-in Swift types, such as Date extensions.

**Functionality:**

The application implements the following features and functionalities in compliance with the provided rules:

-   Chat UI pages in the opposite direction, with older messages displayed when reaching the top of the scroll view.
-   Messages are added to the chat interface upon sending.
-   Sent and received messages are visually distinguished by aligning them left or right, respectively.
-   Messages are encased in a bubble, adhering to the provided screenshot reference.
-   Messages are grouped based on specific criteria:
    -   Messages separated by more than an hour are sectioned with the date and time.
    -   Messages from the same user sent within 20 seconds of each other have smaller vertical spacing, appearing grouped together.
-   Message persistence is implemented using Realm, CoreData, or SwiftData, ensuring data is stored locally for future retrieval.

**Assumptions and Decisions:**

In the implementation of this project, the following assumptions and decisions were made:

-   **UI Implementation:** The user interface was designed to closely resemble the provided screenshots while ensuring responsiveness and usability.
-   **Architecture:** The project follows a modular architecture pattern, separating concerns and promoting maintainability.
-   **Data Persistence:** Realm was chosen for message persistence and solution for storing chat data.
-   **Testing:** An example of unit tests is included

**Improvments and ToDo's:**
-   **Dependency injection (DI)** Consider to use third party libraries for DI such as Swinject
-   **Message view model** Improve the view model
-   **UI and usabilityl** Improve the chat view with better animations and usability 
-   **Unit testing** Add coverage 80%
-   


**Franco Driansetti**
