# Cross_Platform_Flutter_Application
This is a Cross Platform Flutter Application for CRUD operations on Task (TODO Application)

### Features
1. **List Tasks**: This feature displays a list of Tasks retrieved from the Parse Server.
2. **Add Task**: This feature Adds a new Task with a task title and task description.
3. **Edit Task**: Here we can Modify the details of an existing Task.
4. **Delete Task**: This feature Removes a Task after confirming the deletion.
5. **Share task**: This feature shares the task on WhatsApp.
6. **Share all tasks**: This feature shares list of task on WhatsApp.
7. **Pull-to-Refresh**: Refresh the Task list by pulling down the screen.
8. **About Section**: View information about the developer.
9. **Attractive UI**: The app features a clean and attractive user interface.

### Prerequisites
Before you start, make sure you have the following installed on your Windows 10 machine:
1.	Flutter SDK: Install the Flutter SDK by following the instructions on the official Flutter website: Flutter - Get Started
2.	Git: Ensure that Git is installed on your machine. You can download Git from Git - Downloads.
3.	Android Studio: Install Android Studio, which includes the Android SDK, by visiting Android Studio - Download.
4.	Visual Studio Code (Optional): Although you can use any text editor, Visual Studio Code is recommended for a smoother development experience. Download it from Visual Studio Code.

### Flutter Prerequisites
1.	Add Flutter to System Path: Add the flutter/bin directory to your system path to run Flutter commands globally.
2.	Run flutter doctor: Open a terminal and run the following command to check if there are any dependencies you still need to install: 
```bash
flutter doctor
```
Follow the instructions provided by flutter doctor to resolve any issues.

### Creating and Running a Flutter Application
1.	Create a New Flutter Project:
Run the following commands to create a new Flutter project:
```bash
flutter create my_flutter_app_name
```

2.	Navigate to the Project Directory:
Change to the project directory:
```bash
cd my_flutter_app
```

3.	Open the Project in Visual Studio Code (Optional):
If you're using Visual Studio Code, open the project by running:
```bash
code .
```

4.	Run the App:
Connect your Android device or start an Android emulator. Then, run the app using:
```bash
flutter run
```

This command compiles and runs your Flutter app on the connected device.

5.	Hot Reload:
Make changes to your Flutter code, and press R in the terminal to hot reload the app instantly.


### Installation
1.	Clone the repository:
```bash
git clone https://github.com/your-username/your-repository.git
cd your-repository
```

2.	Install dependencies:
```bash
flutter pub get
```
3.	Update Parse Server keys:
•	Open lib/main.dart.
•	Replace keyApplicationId, keyClientKey, and keyParseServerUrl with your Parse Server details.

4.	Run the App:
Connect your Android device or start an Android emulator. Then, run the app using:
```bash
flutter run
```

