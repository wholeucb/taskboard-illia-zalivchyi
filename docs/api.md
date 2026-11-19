# Dokumentacja API – TaskBoard

## Informacje ogólne

TaskBoard korzysta z API REST utworzonego w Node.js i Express.
Dane są przechowywane w bazie MySQL.

- Adres API: `http://localhost:3000/api`
- Format danych: JSON
- Autoryzacja: sesja użytkownika
- Dostęp do tablic, zadań i użytkowników wymaga zalogowania.

## Lista endpointów

### Serwer

| Metoda | Endpoint | Opis | Kody HTTP |
| --- | --- | --- | --- |
| GET | `/api/health` | Sprawdzenie działania serwera | 200 |

### Autoryzacja

| Metoda | Endpoint | Opis | Kody HTTP |
| --- | --- | --- | --- |
| POST | `/api/auth/register` | Rejestracja użytkownika | 201, 400, 409 |
| POST | `/api/auth/login` | Logowanie | 200, 401 |
| POST | `/api/auth/logout` | Wylogowanie | 204 |
| GET | `/api/auth/me` | Dane zalogowanego użytkownika | 200, 401 |

### Użytkownicy

| Metoda | Endpoint | Opis | Kody HTTP |
| --- | --- | --- | --- |
| GET | `/api/users` | Lista użytkowników | 200, 401 |

### Tablice

| Metoda | Endpoint | Opis | Kody HTTP |
| --- | --- | --- | --- |
| GET | `/api/boards` | Lista aktywnych tablic | 200, 401 |
| POST | `/api/boards` | Dodanie tablicy | 201, 400, 401 |
| PUT | `/api/boards/:id` | Edycja tablicy | 200, 400, 401, 404 |
| DELETE | `/api/boards/:id` | Miękkie usunięcie tablicy | 204, 401, 404 |
| GET | `/api/boards/:boardId/tasks` | Zadania tablicy z filtrami | 200, 400, 401, 404 |

### Zadania

| Metoda | Endpoint | Opis | Kody HTTP |
| --- | --- | --- | --- |
| GET | `/api/tasks/:id` | Szczegóły zadania | 200, 401, 404 |
| POST | `/api/tasks` | Dodanie zadania | 201, 400, 401 |
| PUT | `/api/tasks/:id` | Edycja zadania | 200, 400, 401, 404 |
| DELETE | `/api/tasks/:id` | Miękkie usunięcie zadania | 204, 401, 404 |

W przypadku nieoczekiwanego błędu serwera API może zwrócić kod 500.

## Filtrowanie zadań

Endpoint `GET /api/boards/:boardId/tasks` obsługuje parametry:

| Parametr | Opis | Przykład |
| --- | --- | --- |
| `priority` | Priorytet: low, medium, high | `high` |
| `assigneeId` | Dodatnia liczba całkowita – ID użytkownika | `2` |
| `q` | Fragment tytułu zadania | `baza` |

Przykładowe zapytanie:

`GET /api/boards/3/tasks?priority=high&assigneeId=2&q=baza`

Filtry można łączyć. Zapytania do bazy wykorzystują
parametry SQL zamiast bezpośredniego wstawiania danych.

Nieprawidłowy priorytet lub identyfikator osoby zwraca HTTP 400.

## Przykłady odpowiedzi JSON

### GET /api/health

HTTP 200:

```json
{
  "ok": true
}
```

### POST /api/auth/register

Przykładowe dane:

```json
{
  "login": "test123",
  "password": "haslo1234",
  "firstName": "Jan",
  "lastName": "Kowalski"
}
```

HTTP 201 – przykładowa odpowiedź:

```json
{
  "id": 5,
  "login": "test123",
  "firstName": "Jan",
  "lastName": "Kowalski"
}
```

### POST /api/boards

Przykładowe dane:

```json
{
  "name": "Moja tablica",
  "description": "Zadania szkolne"
}
```

HTTP 201 – przykładowa odpowiedź:

```json
{
  "id": 5,
  "name": "Moja tablica"
}
```

### GET /api/boards/:boardId/tasks

HTTP 200 – przykładowa odpowiedź:

```json
[
  {
    "id": 1,
    "title": "Baza danych",
    "status": "todo",
    "priority": "high",
    "deadline": "2026-11-20",
    "assigneeId": 2
  }
]
```

### POST /api/tasks

Przykładowe dane:

```json
{
  "title": "Nowe zadanie",
  "description": "Opis zadania",
  "status": "todo",
  "priority": "medium",
  "deadline": "2026-11-25",
  "boardId": 3,
  "assigneeId": 2
}
```

HTTP 201 – przykładowa odpowiedź:

```json
{
  "id": 10,
  "title": "Nowe zadanie"
}
```

### Błąd walidacji

Zapytanie:

`GET /api/boards/3/tasks?assigneeId=abc`

HTTP 400:

```json
{
  "error": "Nieprawidłowa osoba"
}
```

### Nieznaleziona tablica

HTTP 404:

```json
{
  "error": "Nie znaleziono tablicy"
}
```

## Walidacja danych

- Rejestracja wymaga loginu, imienia, nazwiska i hasła.
- Hasło musi mieć co najmniej 8 znaków.
- Nazwa tablicy musi mieć od 1 do 80 znaków.
- Tytuł zadania musi mieć od 3 do 100 znaków.
- Status zadania: `todo`, `in_progress`, `done`.
- Priorytet zadania: `low`, `medium`, `high`.
- Data zadania ma format `YYYY-MM-DD`.
- Zadanie musi należeć do istniejącej, aktywnej tablicy.
- Przypisany użytkownik musi istnieć w bazie danych.

## Kody odpowiedzi HTTP

| Kod | Znaczenie |
| --- | --- |
| 200 | Operacja zakończona poprawnie |
| 201 | Utworzono nowy zasób |
| 204 | Operacja zakończona bez treści odpowiedzi |
| 400 | Nieprawidłowe dane |
| 401 | Brak autoryzacji lub niepoprawne dane logowania |
| 404 | Nie znaleziono zasobu |
| 409 | Login jest już zajęty |
| 500 | Wewnętrzny błąd serwera |

Usuwanie tablic i zadań jest miękkie (soft delete).
Rekordy pozostają w bazie danych, ale nie są wyświetlane
na listach aktywnych zasobów.
