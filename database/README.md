# Database

Folder zawiera pliki bazy danych projektu TaskBoard.
Sa tutaj tabele users, boards i tasks oraz zapytania SQL.

## Kopia zapasowa bazy danych

Aktualna kopia zapasowa znajduje się w pliku
`database/backup/taskboard_2026-11-21.sql`.

Kopia została wykonana 21.11.2026 z bazy `taskboard`.

### Odtwarzanie kopii zapasowej

1. Uruchom MySQL w XAMPP.
2. Otwórz phpMyAdmin.
3. Utwórz pustą bazę danych `taskboard_restore`.
4. Wybierz bazę `taskboard_restore`.
5. Przejdź do zakładki Import.
6. Wybierz plik `database/backup/taskboard_2026-11-21.sql`.
7. Kliknij Wykonaj.

### Sprawdzenie danych

Po odtworzeniu kopii wykonaj zapytanie:

```sql
SELECT COUNT(*) AS liczba_zadan FROM tasks;
```

W bazie `taskboard` znajduje się 15 zadań.
Po odtworzeniu kopii liczba zadań również powinna wynosić 15.
