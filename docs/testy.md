# Raport testów – TaskBoard

## Informacje

- Projekt: TaskBoard
- Zadanie: TB-3, część 2
- Środowisko: Windows 11, Edge, Node.js, MySQL

## Przypadki testowe

| ID | Scenariusz | Kroki | Oczekiwany wynik | Wynik |
| --- | --- | --- | --- | --- |
| T01 | Walidacja rejestracji | Otwórz rejestrację i wyślij pusty formularz | Czerwone pola i komunikaty błędów | PASS |
| T02 | Walidacja tablicy | Dodaj tablicę bez nazwy | Komunikat błędu pod polem nazwy | PASS |
| T03 | Walidacja zadania | Dodaj zadanie bez tytułu | Komunikat błędu pod polem tytułu | PASS |
| T04 | Filtrowanie po priorytecie | Wybierz priorytet Wysoki | Widoczne tylko zadania o wysokim priorytecie | PASS |
| T05 | Filtrowanie po osobie | Wybierz Annę Nowak | Widoczne zadania przypisane do Anny Nowak | PASS |
| T06 | Wyszukiwanie po tytule | Wpisz `baza` | Widoczne zadanie Baza danych | PASS |
| T07 | Łączenie filtrów | Wybierz Wysoki, Jan Kowalski i wpisz `baza` | Widoczne zadanie Baza danych | PASS |
| T08 | Widok mobilny | Ustaw szerokość iPhone 14 w DevTools | Kolumny wyświetlają się jedna pod drugą | PASS |
| T09 | Lighthouse | Sprawdź Accessibility na trzech stronach | Wynik co najmniej 90 | PASS – 100/100 |
| T10 | W3C HTML Validator | Sprawdź trzy pliki HTML | Brak błędów walidacji | PASS – 0 błędów |
| T11 | Nieprawidłowy assigneeId | Wyślij GET /api/boards/3/tasks?assigneeId=abc | HTTP 400 i komunikat błędu | PASS – HTTP 400 |
| T12 | API – sprawdzenie serwera | GET `/api/health` | HTTP 200 i `ok: true` | PASS – HTTP 200 |
| T13 | API – poprawne logowanie | POST `/api/auth/login` z poprawnymi danymi | HTTP 200 | PASS – HTTP 200 |
| T14 | API – błędne logowanie | POST `/api/auth/login` z błędnym hasłem | HTTP 401 | PASS – HTTP 401 |
| T15 | API – lista tablic | GET `/api/boards` po zalogowaniu | HTTP 200 i lista tablic | PASS – HTTP 200 |
| T16 | API – lista zadań | GET `/api/boards/3/tasks` po zalogowaniu | HTTP 200 i lista zadań | PASS – HTTP 200 |

## Podsumowanie

Przeprowadzono 16 testów, w tym 6 testów API.

Wszystkie testy zakończyły się wynikiem PASS.
