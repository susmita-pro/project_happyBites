# 🍔 HappyBites – Online Food Delivery Web Application

HappyBites is a Java-based online food delivery web application inspired by food delivery platforms such as Zomato.

The application allows users to register and log in, browse restaurants, view food menus, add items to a cart, manage their profile, and proceed through the food ordering workflow.

The project was developed to gain practical experience in Java web development, JDBC, JSP, Servlets, MySQL, HTML, CSS, and MVC-based application structure.

---

## 📌 Project Overview

HappyBites provides an interactive platform where users can explore restaurants and their menus and manage food items through a shopping-cart-based ordering system.

The application follows a layered structure using:

- Model classes
- DAO interfaces
- DAO implementation classes
- Servlets
- JSP pages
- MySQL database

This separation makes the application easier to understand, maintain, and extend.

---

## ✨ Features

### 👤 User Management
- User registration
- User login
- User authentication
- User profile management
- Forgot-password functionality

### 🍽️ Restaurant & Menu
- Browse available restaurants
- View restaurant details
- View food menus
- Display restaurant and food images
- Browse different food items

### 🛒 Cart Management
- Add food items to cart
- View cart items
- Update item quantities
- Remove items from cart
- Calculate cart-related details

### 📦 Order Management
- Checkout workflow
- Order confirmation
- View orders
- Manage order-related information

### 🎨 User Interface
- Responsive web pages
- HTML and CSS based interface
- JSP-based dynamic pages
- Restaurant and food images
- Navigation between application modules

---

## 🛠️ Technologies Used

### Backend
- Java
- Java Servlets
- JSP
- JDBC

### Frontend
- HTML5
- CSS3
- JavaScript

### Database
- MySQL

### Server
- Apache Tomcat

### Development Tools
- Eclipse IDE
- MySQL
- GitHub

---

## 🏗️ Project Architecture

The application follows a layered/MVC-style architecture.

```text
User
  ↓
JSP / HTML
  ↓
Servlet
  ↓
DAO
  ↓
DAOImpl
  ↓
JDBC
  ↓
MySQL Database
