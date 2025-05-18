# 👚 Clothing Store App — SwiftUI Mobile Programming Project

## 📋 Project Info

* **Submitted By**: Dana Barhoom (A00200)
* **Course**: Mobile Programming (COSC 348)
* **University**: American University of Bahrain (AUBH)
* **Degree**: BSc in Computer Engineering
* **Submission Date**: 15/12/2024

---

## 📱 Project Overview

This project is a simple, interactive **clothing store app** built using **SwiftUI** in **Xcode**. It allows users to browse, search, favorite, and manage clothing items through a clean and user-friendly interface. The app also features user login, profile management, and a functional shopping cart.

---

## 🎯 Objectives

* Develop a functional retail shopping app in Swift.
* Demonstrate SwiftUI and MVVM architecture knowledge.
* Implement core features such as login, product browsing, cart management, and data persistence.

---

## 🔍 Scope

The app includes:

* Login page (name & email)
* Home screen with featured products
* Product grid with filtering (e.g., Shoes, Tops)
* Item details page
* Cart (favorites) with quantity editing
* Profile screen with editable address & order history
* Local data storage using `UserDefaults`

---

## 🛠️ Technical Stack

* **Language**: Swift
* **Framework**: SwiftUI
* **IDE**: Xcode (macOS)
* **Architecture**: MVVM (Model-View-ViewModel)
* **Storage**: `UserDefaults`, JSONEncoding/Decoding

---

## 📦 Key Features

### 1. **Login Page**

* Collects and stores user name and email.
* Displays info on the profile page.

### 2. **Home Screen**

* Animated product highlights.
* Horizontal product list with clickable items.
* Grid view navigation.

### 3. **Item Details**

* Detailed product view with image, rating, and color.
* Add to Cart functionality.

### 4. **Products Page**

* Grid layout of all products.
* Quick add to cart (+ button).
* Category filtering (Shoes, Tops, Bags, etc.)

### 5. **Cart / Favorites**

* View all added items.
* Edit quantity or delete items.
* Checkout simulation via ApplePay button.
* Total price calculation.

### 6. **Profile Page**

* Display name, email, address, and phone number.
* Edit address.
* View past orders.
* Sign out functionality.

---

## 💾 Data Management

* Uses `@State`, `@Binding`, and `UserDefaults` for local storage.
* JSONEncoder/Decoder used for saving cart contents.
* Cart data persists across app sessions.

---

## 🧪 Testing & Validation

### ✅ Unit Testing

* Tested item addition, deletion, and quantity updates.
* Verified correct total price updates.

### ✅ Manual User Testing

* Simulated user actions to test:

  * Navigation
  * Cart updates
  * Profile editing

---

## 🧩 Challenges & Solutions

### ❗ Problem:

Cart data was lost when the app closed.

### ✔ Solution:

Implemented `UserDefaults` and JSON encoding/decoding to persist data between sessions.

---

## 🚀 Future Enhancements

* **Push Notifications**: Remind users about items in cart.
* **Dark Mode**: Optional theme toggle for better UX.
