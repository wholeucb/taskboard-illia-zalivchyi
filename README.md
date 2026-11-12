# TaskBoard

TaskBoard to aplikacja internetowa służąca do zarządzania zadaniami. Umożliwia dodawanie, przeglądanie i organizowanie zadań w jednym miejscu.

## Technologie

- **Frontend:** HTML, CSS, JavaScript
- **Backend:** Node.js
- **Baza danych:** MySQL
- **Narzędzia:** Visual Studio Code, Git, GitHub, XAMPP

## Wymagane środowisko

- Windows 11
- Visual Studio Code
- Git
- XAMPP
- Przeglądarka internetowa

## Uruchomienie

1. Sklonuj repozytorium na komputer.
2. Otwórz projekt w Visual Studio Code.
3. Zainstaluj Node.js.
4. Uruchom bazę danych MySQL.
5. Zainstaluj zależności poleceniem `npm install`.
6. Uruchom backend poleceniem `npm start`.
7. Otwórz aplikację w przeglądarce internetowej.

## Struktura projektu

| Folder | Za co odpowiada |
| --- | --- |
| `frontend/` | Zawiera pliki odpowiedzialne za wygląd i interfejs użytkownika. |
| `backend/` | Zawiera kod odpowiedzialny za działanie aplikacji. |
| `database/` | Zawiera pliki i strukturę bazy danych. |
| `docs/` | Zawiera dokumentację projektu i zadania. |

## Materiały

Pliki potrzebne podczas praktyk są w folderze [materialy](materialy/README.md).

## Autor

Illia Zalivchyi 3TP

## Baza danych

Aplikacja korzysta z bazy danych MySQL.

### Tabele i relacje

- `users` – przechowuje użytkowników.
- `boards` – przechowuje tablice użytkowników.
- `tasks` – przechowuje zadania.

Jeden użytkownik może mieć wiele tablic.
Jedna tablica może mieć wiele zadań.
Zadanie może być przypisane do użytkownika.

### Soft delete

Usunięcie zadania ustawia `isDeleted = 1`
oraz zapisuje datę w `deletedAt`.
Zadanie pozostaje w bazie danych.

### Odtwarzanie bazy

Bazę można odtworzyć przez import pliku
`database/taskboard.sql` w phpMyAdmin.

Konta bazy danych można skonfigurować
na podstawie `database/konta.sql`,
po ustawieniu własnych haseł.

### Backup

Kopia zapasowa znajduje się w `database/backup/`.
Poprawność kopii sprawdzono przez odtworzenie
bazy `taskboard_test`.