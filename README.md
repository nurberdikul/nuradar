# nuradar 🎯

Умный трекер задач и фокуса, разработанный на Flutter. **nuradar** помогает не просто составлять списки дел, но и приступать к ним в нужное время и в нужном месте, используя геолокацию и механизмы контроля внимания.

## 🚀 Основные возможности

* **Геозоны и Радар:** Привязка задач к конкретным координатам. Приложение уведомляет о необходимости начать работу, когда вы находитесь в радиусе 100 метров от места задачи.
* **Многопользовательский режим:** Полная изоляция данных. Задачи каждого пользователя хранятся в отдельном зашифрованном хранилище Hive на основе UID из Firebase.
* **Switch Detector (Контроль фокуса):** Система мониторинга жизненного цикла приложения. Сессия фокуса автоматически прерывается, если пользователь сворачивает таймер или переключается на соцсети.
* **Аналитика продуктивности:** Наглядные графики и расчет личного «Индекса фокуса» на основе истории выполненных задач.

## 🛠 Стек технологий

* **Frontend:** Flutter / Dart
* **State Management:** Provider
* **Database (Local):** Hive CE 
* **Backend:** Firebase Auth, Cloud Firestore
* **Maps:** `flutter_map`, `latlong2`
* **Architecture:** Clean Architecture
* <img width="1170" height="2532" alt="Simulator Screenshot - iPhone 16e - 2026-04-29 at 13 00 04" src="https://github.com/user-attachments/assets/ec932b2b-01a6-44ea-a133-80d3167bce41" />
<img width="1170" height="2532" alt="Simulator Screenshot - iPhone 16e - 2026-04-29 at 13 00 33" src="https://github.com/user-attachments/assets/f52d7e90-40db-4dc6-95c9-a717f62740af" />
<img width="1170" height="2532" alt="Simulator Screenshot - iPhone 16e - 2026-04-29 at 13 00 43" src="https://github.com/user-attachments/assets/0a42ad6e-9b3b-41d0-a698-81bbb270c90b" />
<img width="1170" height="2532" alt="Simulator Screenshot - iPhone 16e - 2026-04-29 at 13 01 03" src="https://github.com/user-attachments/assets/908754f1-f26d-47c7-830a-a3f950b3ceff" />
<img width="1170" height="2532" alt="Simulator Screenshot - iPhone 16e - 2026-04-30 at 23 31 22" src="https://github.com/user-attachments/assets/79fb68f2-787c-4ea2-afd5-44b4f8150ee5" />
<img width="1170" height="2532" alt="Simulator Screenshot - iPhone 16e - 2026-04-30 at 23 36 31" src="https://github.com/user-attachments/assets/a38e5cbc-a4a6-4f21-985a-1f5ccfcc19dd" />
<img width="1170" height="2532" alt="Simulator Screenshot - iPhone 16e - 2026-05-08 at 23 38 45" src="https://github.com/user-attachments/assets/6797570b-d101-4876-8553-3d22894196ca" />
