# 📱 L-Tech iOS App

[![Swift](https://img.shields.io/badge/Swift-6-orange?logo=swift)](https://swift.org)
[![Platform](https://img.shields.io/badge/iOS-17%2B-blue?logo=apple)](https://developer.apple.com/ios/)
[![UI Framework](https://img.shields.io/badge/UIKit-SnapKit-informational)]()
[![License](https://img.shields.io/badge/License-MIT-lightgrey)]()

Приложение для тестового задания на позицию iOS-разработчика.  
Загружает и отображает список новостей с сервера, реализует авторизацию, переходы между экранами и отображение деталей.

---

## 🔧 Стек технологий

- **Swift 6**
- **iOS 17+**
- **Clean Architecture (Coordinators + MVP-like structure)**
- `Alamofire` – для сетевых запросов  
- `SnapKit` – для Auto Layout  
- `SDWebImage` – загрузка и кеширование изображений  
- `InputMask` – маска ввода номера телефона

  ---

## 📦 Структура проекта

- `Auth` — экран авторизации с маской телефона
- `Home` — список новостей (данные с сервера + сохранение в Core Data)
- `Details` — экран детального просмотра новости
- `Favorites`, `Profile` — заготовки вкладок
- `Coordinator` — управление навигацией

  ---

## 🧪 Реализовано по ТЗ

- ✅ Экран авторизации
  - Маска телефона загружается с сервера
  - POST запрос с параметрами
- ✅ Парсинг и отображение списка новостей
  - Динамическая высота ячеек
  - Переход на экран детализации
- ✅ Разделение проекта по слоям
- ✅ Использование SnapKit, Alamofire, SDWebImage, InputMask

  ---

## ⚠️ Частично реализовано

- ⛔️ **Keychain** — не успел реализовать сохранение логина/пароля
- ⛔️ **Обновление карточек при изменении на сервере** — не реализовано
- ⛔️ **Удаление устаревших записей** — не реализовано
- ⛔️ **Сортировка, лайки, шейринг** — пока не реализованы

  ---

## 🚀 Запуск проекта

1. Клонируйте репозиторий:

   ```bash
   git clone https://github.com/Pixel-ux-source/PowerWeatherApp.git

2.	Откройте `.xcworkspace` в Xcode.
3.	Установите зависимости через Swift Package Manager.

   ---

## 🌐 Эндпоинты

- Маска телефона: `GET http://dev-exam.l-tech.ru/api/v1/phone_masks`
- Авторизация: `POST http://dev-exam.l-tech.ru/api/v1/auth`
- Новости: `GET http://dev-exam.l-tech.ru/api/v1/posts`

  ---

## 📌 Комментарии

Приложение построено с возможностью масштабирования, поддержкой `UITabBarController`, разделением логики через координаторы и сервисы. Основной акцент сделан на структуру и чистоту кода.

---

## 👨‍💻 Автор

Разработка: Pixel-ux-source

---
