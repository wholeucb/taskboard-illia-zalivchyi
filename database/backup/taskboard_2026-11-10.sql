-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Lis 10, 2026 at 03:05 PM
-- Wersja serwera: 10.4.32-MariaDB
-- Wersja PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `taskboard`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `boards`
--

CREATE TABLE `boards` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(80) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `ownerId` int(10) UNSIGNED NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT current_timestamp(),
  `isDeleted` tinyint(1) NOT NULL DEFAULT 0,
  `deletedAt` datetime DEFAULT NULL,
  `deletedById` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Dumping data for table `boards`
--

INSERT INTO `boards` (`id`, `name`, `description`, `ownerId`, `createdAt`, `isDeleted`, `deletedAt`, `deletedById`) VALUES
(3, 'Aplikacja TaskBoard', 'Zadania zespolu', 1, '2026-11-09 10:42:49', 0, NULL, NULL),
(4, 'Organizacja praktyk', NULL, 2, '2026-11-09 10:42:49', 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `tasks`
--

CREATE TABLE `tasks` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `status` enum('todo','in_progress','done') NOT NULL DEFAULT 'todo',
  `priority` enum('low','medium','high') NOT NULL DEFAULT 'medium',
  `deadline` date DEFAULT NULL,
  `boardId` int(10) UNSIGNED NOT NULL,
  `assigneeId` int(10) UNSIGNED DEFAULT NULL,
  `createdAt` datetime NOT NULL DEFAULT current_timestamp(),
  `isDeleted` tinyint(1) NOT NULL DEFAULT 0,
  `deletedAt` datetime DEFAULT NULL,
  `deletedById` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Dumping data for table `tasks`
--

INSERT INTO `tasks` (`id`, `title`, `description`, `status`, `priority`, `deadline`, `boardId`, `assigneeId`, `createdAt`, `isDeleted`, `deletedAt`, `deletedById`) VALUES
(1, 'Strona glowna', 'Zrobienie strony', 'todo', 'high', '2026-11-15', 3, 1, '2026-11-10 13:44:11', 0, NULL, NULL),
(2, 'Baza danych', 'Tworzenie tabel', 'done', 'high', '2026-11-12', 3, 2, '2026-11-10 13:44:11', 0, NULL, NULL),
(3, 'Logowanie', 'Formularz logowania', 'done', 'medium', '2026-11-10', 3, 3, '2026-11-10 13:44:11', 0, NULL, NULL),
(4, 'Rejestracja', 'Dodanie rejestracji', 'todo', 'medium', '2026-11-20', 3, 4, '2026-11-10 13:44:11', 1, '2026-11-10 15:00:06', 1),
(5, 'Testowanie', 'Testy aplikacji', 'in_progress', 'low', '2026-11-18', 3, 1, '2026-11-10 13:44:11', 0, NULL, NULL),
(6, 'Dokumentacja', 'Opis projektu', 'done', 'low', '2026-11-08', 3, 2, '2026-11-10 13:44:11', 0, NULL, NULL),
(7, 'Plan praktyk', 'Przygotowanie planu', 'todo', 'high', '2026-11-14', 4, 3, '2026-11-10 13:44:11', 0, NULL, NULL),
(8, 'Raport', 'Napisanie raportu', 'in_progress', 'medium', '2026-11-09', 4, 4, '2026-11-10 13:44:11', 0, NULL, NULL),
(10, 'Usuniety raport', 'Stary raport', 'done', 'medium', '2026-10-10', 4, 2, '2026-11-10 13:44:11', 1, '2026-10-15 12:00:00', 1);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `login` varchar(30) NOT NULL,
  `passwordHash` char(60) NOT NULL,
  `firstName` varchar(50) NOT NULL,
  `lastName` varchar(50) NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `login`, `passwordHash`, `firstName`, `lastName`, `createdAt`) VALUES
(1, 'anna.nowak', '$2a$10$qCgFwKm4Qiu60z3cTqCvz.DZUvPNVnkJQjMagc4wtx24LiYjSf./y', 'Anna', 'Nowak', '2026-11-09 10:38:57'),
(2, 'jan.kowalski', '$2a$10$qCgFwKm4Qiu60z3cTqCvz.DZUvPNVnkJQjMagc4wtx24LiYjSf./y', 'Jan', 'Kowalski', '2026-11-09 10:38:57'),
(3, 'ola.wisniewska', '$2a$10$qCgFwKm4Qiu60z3cTqCvz.DZUvPNVnkJQjMagc4wtx24LiYjSf./y', 'Ola', 'Wisniewska', '2026-11-09 10:38:57'),
(4, 'piotr.zielinski', '$2a$10$qCgFwKm4Qiu60z3cTqCvz.DZUvPNVnkJQjMagc4wtx24LiYjSf./y', 'Piotr', 'Zielinski', '2026-11-09 10:38:57'),
(5, 'kasia.lewandowska', '$2a$10$qCgFwKm4Qiu60z3cTqCvz.DZUvPNVnkJQjMagc4wtx24LiYjSf./y', 'Kasia', 'Lewandowska', '2026-11-09 10:38:57');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `boards`
--
ALTER TABLE `boards`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ownerId` (`ownerId`),
  ADD KEY `deletedById` (`deletedById`);

--
-- Indeksy dla tabeli `tasks`
--
ALTER TABLE `tasks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `boardId` (`boardId`),
  ADD KEY `assigneeId` (`assigneeId`),
  ADD KEY `deletedById` (`deletedById`);

--
-- Indeksy dla tabeli `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `login` (`login`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `boards`
--
ALTER TABLE `boards`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tasks`
--
ALTER TABLE `tasks`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `boards`
--
ALTER TABLE `boards`
  ADD CONSTRAINT `boards_ibfk_1` FOREIGN KEY (`ownerId`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `boards_ibfk_2` FOREIGN KEY (`deletedById`) REFERENCES `users` (`id`);

--
-- Constraints for table `tasks`
--
ALTER TABLE `tasks`
  ADD CONSTRAINT `tasks_ibfk_1` FOREIGN KEY (`boardId`) REFERENCES `boards` (`id`),
  ADD CONSTRAINT `tasks_ibfk_2` FOREIGN KEY (`assigneeId`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `tasks_ibfk_3` FOREIGN KEY (`deletedById`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
