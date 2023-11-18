# Cross_Platform_Flutter_Application
This is a Cross Platform Flutter Application for CRUD operations on Task (TODO Application)

### Features
1. **List Tasks**: This feature displays a list of Tasks retrieved from the Parse Server.
2. **Add Task**: This feature Adds a new Task with a task title and task description.
3. **Edit Task**: Here we can Modify the details of an existing Task.
4. **Delete Task**: This feature Removes a Task after confirming the deletion.
5. **Task Detail View**: This feature displays the details of the app when clicked on the task.
6. **Share task**: This feature shares the task on WhatsApp.
7. **Share all tasks**: This feature shares list of task on WhatsApp.
8. **Pull-to-Refresh**: Refresh the Task list by pulling down the screen.
9. **About Section**: View information about the developer.
10. **Attractive UI**: The app features a clean and attractive user interface.
11. **Named Symbol**: Every task is having a symbol on the left side with the letter indicating the initial letter of the task

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
•	Replace keyApplicationId, keyClientKey, keyParseServerUrl and masterKey with your Parse Server details.

4.	Run the App:
Connect your Android device or start an Android emulator. Then, run the app using:
```bash
flutter run
```

### Devices to run the application on

1. Simulator/Emulator: You can run your Flutter app on a simulator/emulator to test and debug your application in an environment that emulates a specific device (iOS simulator or Android emulator).
2. Connected device (wifi): You can run on the device connecting through wifi.
3. Connected device (USB): You can run on the device connecting through USB.
4. Web: Flutter supports running applications on the web, allowing you to build and test your app in a web browser.



### Screenshots:
### Add Products feature
### Here we have a “+” icon from where we can add the task.
<img src="https://github.com/anuragkulkarni13/Cross_Platform_Flutter_Application/raw/main/assests/images/ss1.png" width="250" height="550">

### Once we click on the “+” sign we will get a page with 2 text boxes for title and description.
<img src="https://github.com/anuragkulkarni13/Cross_Platform_Flutter_Application/raw/main/assests/images/ss2.png" width="250" height="550">

### We have to enter the title and description in the fields and click on “add” button to add the task, and “cancel” button to cancel your operation.
<img src="https://github.com/anuragkulkarni13/Cross_Platform_Flutter_Application/raw/main/assests/images/ss3.png" width="250" height="550">

### Here we can see the task has been added to the list.
<img src="https://github.com/anuragkulkarni13/Cross_Platform_Flutter_Application/raw/main/assests/images/ss4.png" width="250" height="550">


### Edit Products feature
### For the edit option we have a “pencil symbol” for every task.
<img src="https://github.com/anuragkulkarni13/Cross_Platform_Flutter_Application/raw/main/assests/images/ss5.png" width="250" height="550">

### Once we click on the pencil symbol, we get navigated to the edit product page where we get the details of the task and we can add or remove the content from the from title and description.
### Next we can click on “save” button to save and “cancel” button to cancel the operation.
<img src="https://github.com/anuragkulkarni13/Cross_Platform_Flutter_Application/raw/main/assests/images/ss6.png" width="250" height="550">

### Here we can see the “Task 1” task has been changed to “Task 1 edited” and changes in description are also seen
 <img src="https://github.com/anuragkulkarni13/Cross_Platform_Flutter_Application/raw/main/assests/images/ss7.png" width="250" height="550">


### Delete Products feature
### Here for every task, we have a delete symbol
 <img src="https://github.com/anuragkulkarni13/Cross_Platform_Flutter_Application/raw/main/assests/images/ss8.png" width="250" height="550">

### Once we click on the delete symbol the task gets deleted from the list and the updated list is shown.
 <img src="https://github.com/anuragkulkarni13/Cross_Platform_Flutter_Application/raw/main/assests/images/ss9.png" width="250" height="550">


### Task Details View feature
### Here when we click on the task, we can see the details of the task on a new view
<img src="https://github.com/anuragkulkarni13/Cross_Platform_Flutter_Application/raw/main/assests/images/ss10.png" width="250" height="550">
<img src="https://github.com/anuragkulkarni13/Cross_Platform_Flutter_Application/raw/main/assests/images/ss11.png" width="250" height="550">

### Share Products feature
### Here we have the share symbol for every task for sharing the task details on WhatsApp
<img src="https://github.com/anuragkulkarni13/Cross_Platform_Flutter_Application/raw/main/assests/images/ss12.png" width="250" height="550">

### Once we click on share button we will be redirected to WhatsApp and after selecting the recipient the task details will be shared 
<img src="https://github.com/anuragkulkarni13/Cross_Platform_Flutter_Application/raw/main/assests/images/ss13.png" width="250" height="550">

### Share All Products feature
### Here we have a share icon on the task bar which on click we can share all the tasks in the list.
<img src="https://github.com/anuragkulkarni13/Cross_Platform_Flutter_Application/raw/main/assests/images/ss14.png" width="250" height="550">

### In the below image we can see all the task details shared on WhatsApp
<img src="https://github.com/anuragkulkarni13/Cross_Platform_Flutter_Application/raw/main/assests/images/ss15.png" width="250" height="550">

### About Page
### Here we have an options menu on the right corner in the taskbar which when clicked we get and option for About page
<img src="https://github.com/anuragkulkarni13/Cross_Platform_Flutter_Application/raw/main/assests/images/ss16.png" width="250" height="550">

### Once we click on the about page, we get the details about the application
<img src="https://github.com/anuragkulkarni13/Cross_Platform_Flutter_Application/raw/main/assests/images/ss17.png" width="250" height="550">

### Named Symbol for every task
### Here we have a named symbol for every task with the initial letter of the task.
<img src="https://github.com/anuragkulkarni13/Cross_Platform_Flutter_Application/raw/main/assests/images/ss18.png" width="250" height="550">

### Back4App Integration
### We have a Task Class in Back4App Dashboard and title and description as the columns
<img src="https://github.com/anuragkulkarni13/Cross_Platform_Flutter_Application/raw/main/assests/images/ss19.png" width="250" height="550">
