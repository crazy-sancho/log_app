-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Апр 02 2018 г., 16:26
-- Версия сервера: 10.1.31-MariaDB
-- Версия PHP: 5.6.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `test`
--

-- --------------------------------------------------------

--
-- Структура таблицы `tasks`
--

CREATE TABLE `tasks` (
  `id` int(11) NOT NULL,
  `task_name` text NOT NULL,
  `task_time` text NOT NULL,
  `task_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `tasks`
--

INSERT INTO `tasks` (`id`, `task_name`, `task_time`, `task_date`) VALUES
(2, 'Start project', '1h', '2018-03-21 17:49:20'),
(4, 'Reading \"How to start project for dummies\"', '12h 1min', '2018-03-21 17:59:30'),
(5, 'Burn book', '32min', '2018-03-21 18:00:34'),
(14, 'Buy new one', '1h 7min', '2018-03-21 21:43:55'),
(15, 'Burn it too', '24min', '2018-03-21 21:44:57'),
(19, 'Wake up', '23h', '2018-03-22 00:49:39'),
(20, 'Make up', '2h 13min', '2018-03-22 00:51:50'),
(22, 'Shake up', '4min', '2018-03-22 09:18:58'),
(23, 'Remember about project', '1min', '2018-03-22 09:19:37'),
(24, 'Sleep', '5min', '2018-03-22 09:19:57'),
(39, 'Buy it', '46min', '2018-03-23 10:28:48'),
(40, 'Use it', '2h 33min', '2018-03-23 10:56:56'),
(41, 'Break it', '17min', '2018-03-23 10:57:40'),
(42, 'Fix it', '16h 2min', '2018-03-23 10:58:14'),
(43, 'Trash it', '48min', '2018-03-23 10:58:23'),
(49, 'Look at the time', '13h', '2018-03-24 11:17:07'),
(50, 'Drink', '4h 55min', '2018-03-24 11:18:56'),
(51, 'Get sad', '7h 12min', '2018-03-24 11:19:38'),
(158, 'Finish project', '5h 43min', '2018-03-25 17:55:25'),
(159, 'Delete project', '2min', '2018-03-25 17:55:31'),
(160, 'Start new one', '74h 36min', '2018-03-25 17:55:37'),
(161, 'New entry', '2min', '2018-03-26 09:19:07'),
(194, 'One more', '1h 2min', '2018-03-26 09:19:07');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `tasks`
--
ALTER TABLE `tasks`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `tasks`
--
ALTER TABLE `tasks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=202;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
