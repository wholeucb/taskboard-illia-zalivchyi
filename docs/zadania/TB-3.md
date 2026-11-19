# TB-3: Frontend, integracja i oddanie projektu

## Część 1 (poniedziałek 3)

**Termin:** piątek 18:00, zmiany scalone do `main` (deadline oddania projektu).

### Plan dni

- Wtorek: `login.html` i `boards.html`.
- Środa: `board.html`; część 2 na Teams.

### Do zrobienia

- Widoki `login.html`, `boards.html` i `board.html` według makiety (`materialy/makieta/`), na Bootstrapie 5.3 z własnym `css/style.css`.
- Rejestracja na stronie logowania; w nagłówku imię zalogowanej osoby i przycisk „Wyloguj”.
- Tablice w interfejsie: lista, dodawanie, edycja i usuwanie (z potwierdzeniem).
- Modal zadania: dodawanie, edycja i szczegóły.
- Zmiana statusu zadania przyciskiem i usuwanie z potwierdzeniem.
- Treść tego zadania w `docs/zadania/TB-3.md`.

### Gotowe, gdy

- [ ] Po zalogowaniu działają wszystkie trzy widoki.
- [ ] Bez logowania strona przenosi na logowanie.
- [ ] Pull request z branchu `feature/tb-3-frontend` ma zielony workflow i jest scalony przez merge commit.

## Część 2 (środa): Rozbudowa, testy i oddanie projektu

**Termin:** piątek 18:00, zmiany scalone do `main` i tag `v1.0`.

### Plan dni

- Czwartek: filtry, walidacja, telefon, Lighthouse, W3C.
- Piątek: testy, dokumentacja API, README, czysty klon i oddanie projektu.

### Zrealizowane zadania

- Dodano filtrowanie zadań według priorytetu, przypisanej osoby i tytułu.
- Dodano obsługę parametrów `priority`, `assigneeId` i `q` w API.
- Zastosowano parametryzowane zapytania SQL.
- Dodano pasek filtrów oraz przycisk „Wyczyść filtry”.
- Dodano walidację formularzy z komunikatami błędów.
- Dostosowano interfejs do urządzeń mobilnych.
- Sprawdzono dostępność za pomocą Lighthouse.
- Sprawdzono poprawność HTML za pomocą W3C Validator.
- Przygotowano raport testów w `docs/testy.md`.
- Przygotowano dokumentację API w `docs/api.md`.
- Zaktualizowano README i dodano zrzuty ekranu.

### Wyniki sprawdzenia

- Filtry działają pojedynczo i razem.
- Formularze pokazują komunikaty przy błędnych danych.
- Interfejs mobilny wyświetla kolumny jedna pod drugą.
- Lighthouse Accessibility: 100/100 na trzech stronach.
- W3C HTML Validator: brak błędów na trzech stronach.

### Dokumentacja

- [Raport testów](../testy.md)
- [Dokumentacja API](../api.md)
- [README projektu](../../README.md)

### Do zakończenia

- [ ] Sprawdzenie odpowiedzi HTTP 400 dla błędnego `assigneeId`.
- [ ] Sprawdzenie uruchomienia projektu z czystego klona.
- [ ] Pull request i scalenie zmian do `main`.
- [ ] Utworzenie i wysłanie tagu `v1.0`.
