# Task Manager App 📝

A Flutter-based Task Manager application using **Back4App** as a Backend-as-a-Service (BaaS).

---

## 👩‍💻 Author

| Field | Details |
|---|---|
| **Name** | Madhuri |
| **Student ID** | 2024MT13019 |
| **Course** | Cross Platform Development |

---

## 📋 Table of Contents
- [Overview](#overview)
- [Features](#features)
- [Technology Stack](#technology-stack)
- [Setup Instructions](#setup-instructions)
- [Back4App Configuration](#back4app-configuration)
- [Project Structure](#project-structure)
- [Screenshots](#screenshots)
- [App Flow](#app-flow)
- [CRUD Operations](#crud-operations)

---

## 🎯 Overview

This project demonstrates a full-stack mobile application using **Flutter** for the frontend and **Back4App (Parse Server)** as the backend. The app enables user authentication and complete task management (CRUD operations) without requiring a custom server setup.

---

## ✨ Features

### 🔐 User Authentication
- Register with email and password
- Secure login and logout
- Session management (auto-login)

### 📋 Task Management (CRUD)
- ✅ **Create** — Add new tasks with title and description
- 📖 **Read** — View all your tasks in a scrollable list
- ✏️ **Update** — Edit task details and toggle completion status
- 🗑️ **Delete** — Remove tasks with confirmation dialog

### 🔄 Real-Time Sync
- Tasks sync automatically with Back4App cloud database
- Pull-to-refresh functionality

### 🎨 Modern UI
- Material Design 3
- Clean and intuitive user experience

---

## 🛠️ Technology Stack

| Component | Technology |
|---|---|
| Frontend | Flutter (Dart) |
| Backend | Back4App (Parse Server) |
| Database | Back4App Cloud Database |
| Authentication | Parse User Authentication |
| Version Control | GitHub |

---

## 🚀 Setup Instructions

### 1. Clone the Repository
```bash
git clone https://github.com/YOUR_USERNAME/taskmanagerapp.git
cd taskmanagerapp
```

### 2. Install Dependencies
```bash
flutter pub get
```

### 3. Configure Back4App Credentials
Open `lib/main.dart` and replace the placeholder values:
```dart
const keyApplicationId = 'YOUR_APP_ID_HERE';
const keyClientKey = 'YOUR_CLIENT_KEY_HERE';
```

### 4. Run the App
```bash
flutter run
```

---

## ⚙️ Back4App Configuration

### Step 1: Create a Back4App Account
- Go to [back4app.com](https://www.back4app.com) and sign up (free)

### Step 2: Create a New App
- Click **"Build new app"**
- Name it: `TaskManager`

### Step 3: Get API Keys
- Go to **App Settings → Security & Keys**
- Copy **Application ID** and **Client Key**

### Step 4: Create Task Class in Database
- Go to **Database → Create a class**
- Class name: `Task`
- Add these columns:

| Column Name | Type | Required |
|---|---|---|
| title | String | Yes |
| description | String | Yes |
| isCompleted | Boolean | No (default: false) |
| user | Pointer\<\_User\> | Yes |

---

## 📁 Project Structure

```
taskmanagerapp/
├── lib/
│   ├── main.dart                    # App entry point & Back4App initialization
│   ├── models/
│   │   └── task.dart                # Task data model
│   ├── services/
│   │   ├── auth_service.dart        # Login, Register, Logout logic
│   │   └── task_service.dart        # CRUD operations for tasks
│   ├── screens/
│   │   ├── splash_screen.dart       # Initial loading screen
│   │   ├── login_screen.dart        # User login
│   │   ├── register_screen.dart     # User registration
│   │   ├── home_screen.dart         # Task list display
│   │   └── task_form_screen.dart    # Create / Edit task
│   └── widgets/
│       └── task_card.dart           # Task item card widget
├── screenshots/                     # App screenshots
├── pubspec.yaml                     # Dependencies
└── README.md                        # This file
```

---

## 📸 Screenshots

| Splash Screen | Login | Register |
|---|---|---|
| ![Splash](screenshots/splash.png) | ![Login](screenshots/login.png) | ![Register](screenshots/register.png) |

| Home (Empty) | Home (With Tasks) | Create Task |
|---|---|---|
| ![Empty](screenshots/home_empty.png) | ![Tasks](screenshots/home_tasks.png) | ![Create](screenshots/create_task.png) |

| Edit Task | Delete Confirmation |
|---|---|
| ![Edit](screenshots/edit_task.png) | ![Delete](screenshots/delete_confirm.png) |

---

## 🔄 App Flow

```
App Launch
    │
    ▼
Splash Screen (checks session)
    │
    ├──── Logged In ──────► Home Screen
    │                            │
    └──── Not Logged In          ├── View Tasks (Read)
              │                  ├── Add Task (Create)
              ▼                  ├── Edit Task (Update)
         Login Screen            ├── Delete Task (Delete)
              │                  └── Toggle Complete (Update)
              ▼
        Register Screen
```

---

## 📝 CRUD Operations

| Operation | Service Method | Description |
|---|---|---|
| **Create** | `TaskService.createTask()` | Saves new task to Back4App |
| **Read** | `TaskService.getTasks()` | Fetches all tasks for current user |
| **Update** | `TaskService.updateTask()` | Modifies title, description, or status |
| **Delete** | `TaskService.deleteTask()` | Permanently removes task |

---

## 📄 License

This project is created for educational purposes as part of the Cross Platform Development coursework.

**Student:** Madhuri | **ID:** 2024MT13019 | **Year:** 2026
