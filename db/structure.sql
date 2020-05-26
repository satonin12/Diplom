-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Июн 30 2019 г., 16:53
-- Версия сервера: 10.3.15-MariaDB
-- Версия PHP: 7.3.6

-- TODO: Подумать, над тем, чтобы хранить как можно больше данных в бд, чтобы
-- сайт работал быстрее (объяснить это и расписать в вкр!)

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";
-- База данных: `structure`
-- --------------------------------------------------------
-- Структура таблицы `ea_location`
CREATE TABLE `ea_location` (
  `id` int(11) NOT NULL,
  `address` varchar(256) CHARACTER SET utf8mb4 NOT NULL,
  `cluster` varchar(64) CHARACTER SET utf8mb4 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
-- --------------------------------------------------------
-- Структура таблицы `ea_appointments`
CREATE TABLE `ea_appointments` (
  `id` int(11) NOT NULL,
  `end_datetime` datetime DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `hash` text DEFAULT NULL,
  `is_unavailable` tinyint(4) DEFAULT 0,
  `id_provider` int(11) DEFAULT NULL,
  `id_customer` int(11) DEFAULT NULL,
  `id_services` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
-- --------------------------------------------------------
-- Структура таблицы `ea_consents`
CREATE TABLE `ea_consents` (
  `id` int(11) NOT NULL,
  `created` datetime DEFAULT current_timestamp(),
  `modified` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `first_name` varchar(256) DEFAULT NULL,
  `last_name` varchar(256) DEFAULT NULL,
  `email` varchar(512) DEFAULT NULL,
  `ip` varchar(256) DEFAULT NULL,
  `type` varchar(256) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
-- --------------------------------------------------------
-- Структура таблицы `ea_roles`
CREATE TABLE `ea_roles` (
  `id` int(11) NOT NULL,
  `name` varchar(256) DEFAULT NULL,
  `slug` varchar(256) DEFAULT NULL,
  `is_admin` tinyint(4) DEFAULT NULL,
  `appointments` int(11) DEFAULT NULL,
  `customers` int(11) DEFAULT NULL,
  `services` int(11) DEFAULT NULL,
  `users` int(11) DEFAULT NULL,
  `system_settings` int(11) DEFAULT NULL,
  `user_settings` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
-- --------------------------------------------------------
-- Структура таблицы `ea_secretaries_providers`
CREATE TABLE `ea_secretaries_providers` (
  `id_secretary` int(11) NOT NULL,
  `id_provider` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
-- --------------------------------------------------------
-- Структура таблицы `ea_services`
CREATE TABLE `ea_services` (
  `id` int(11) NOT NULL,
  `name` varchar(256) DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
  `book_datetime` datetime DEFAULT NULL,
  `start_datetime` datetime DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `currency` varchar(32) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `availabilities_type` varchar(32) DEFAULT 'flexible',
  `attendants_number` int(11) DEFAULT 1,
  `serviceInfo_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
-- -------------------------------------------------------
-- Структура таблицы `ea_services_providers`
CREATE TABLE `ea_servicesInfo` (
  `serviceInfo_id` int(11) NOT NULL,
  `seriveName` varchar(50) NOT NULL,
  `priceList_id` int(11) NOT NULL,
  `description` text DEFAULT NULL,
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
-- --------------------------------------------------------
-- Структура таблицы `ea_priceList`
CREATE TABLE `ea_priceList` (
  `ea_priceList_id` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `description` text DEFAULT NULL,
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
-- --------------------------------------------------------
-- Структура таблицы `ea_reg_type`
CREATE TABLE `ea_reg_type` (
  `RegType_id` int(11) NOT NULL,
  `RegTypeName` varchar(256) DEFAULT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
-- --------------------------------------------------------
-- Структура таблицы `ea_users`
CREATE TABLE `ea_users` (
  `id` int(11) NOT NULL,
  `username` varchar(256) DEFAULT NULL,
  `password` varchar(512) DEFAULT NULL,
  `userphoto` varchar(300) CHARACTER SET utf8mb4 NOT NULL,
  `gender` varchar(1000) CHARACTER SET utf8mb4 NOT NULL,
  `online` int(100) NOT NULL,
  `first_name` varchar(256) CHARACTER SET utf8mb4 NOT NULL,
  `last_name` varchar(512) CHARACTER SET utf8mb4 NOT NULL,
  `email` varchar(512) CHARACTER SET utf8mb4 NOT NULL,
  `mobile_number` varchar(128) CHARACTER SET utf8mb4 NOT NULL,
  `address` varchar(256) CHARACTER SET utf8mb4 NOT NULL,
  `city` varchar(256) CHARACTER SET utf8mb4 NOT NULL,
  `country` varchar(128) CHARACTER SET utf8mb4 NOT NULL,
  `zip_code` varchar(64) CHARACTER SET utf8mb4 NOT NULL,
  `notes` text NOT NULL,
  `id_roles` int(11) NOT NULL,
  `admin` varchar(50) CHARACTER SET utf8mb4 NOT NULL,
  `RegType_iD` int(11) NOT NULL utf8mb4,
  `PriceExecute` money(16) NOT NULL utf8mb4
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
--========================================================================================
-- Индексы таблицы `ea_appointments`
ALTER TABLE `ea_appointments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_customer` (`id_customer`),
  ADD KEY `id_services` (`id_services`),
  ADD KEY `id_provider` (`id_provider`);
--
-- Индексы таблицы `ea_consents`
--
ALTER TABLE `ea_consents`
  ADD PRIMARY KEY (`id`);
--
-- Индексы таблицы `ea_roles`
--
ALTER TABLE `ea_roles`
  ADD PRIMARY KEY (`id`);
--
-- Индексы таблицы `ea_secretaries_providers`
--
ALTER TABLE `ea_secretaries_providers`
  ADD PRIMARY KEY (`id_secretary`,`id_provider`),
  ADD KEY `id_secretary` (`id_secretary`),
  ADD KEY `id_provider` (`id_provider`);
--
-- Индексы таблицы `ea_services`
--
ALTER TABLE `ea_services`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_service_categories` (`id_service_categories`);
--
-- Индексы таблицы `ea_services_providers`
--
ALTER TABLE `ea_services_providers`
  ADD PRIMARY KEY (`id`,`id_services`),
  ADD KEY `id_services` (`id_services`);
--
-- Индексы таблицы `ea_reg_type`
--
ALTER TABLE `ea_reg_type`
  ADD PRIMARY KEY (`id`);
--
-- Индексы таблицы `ea_settings`
--
ALTER TABLE `ea_settings`
  ADD PRIMARY KEY (`id`);
-- AUTO_INCREMENT для таблицы `ea_appointments`
--
ALTER TABLE `ea_appointments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `ea_consents`
--
ALTER TABLE `ea_consents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `ea_roles`
--
ALTER TABLE `ea_roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `ea_services`
--
ALTER TABLE `ea_services`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `ea_reg_type`
--
ALTER TABLE `ea_reg_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `ea_settings`
--
ALTER TABLE `ea_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Ограничения внешнего ключа таблицы `ea_appointments`
--
ALTER TABLE `ea_appointments`
  ADD CONSTRAINT `ea_appointments_ibfk_1` FOREIGN KEY (`id_provider`) REFERENCES `signup` (`id`),
  ADD CONSTRAINT `ea_appointments_ibfk_2` FOREIGN KEY (`id_customer`) REFERENCES `signup` (`id`),
  ADD CONSTRAINT `ea_appointments_ibfk_3` FOREIGN KEY (`id_services`) REFERENCES `ea_services` (`id`);
--
-- Ограничения внешнего ключа таблицы `ea_secretaries_providers`
--
ALTER TABLE `ea_secretaries_providers`
  ADD CONSTRAINT `ea_secretaries_providers_ibfk_1` FOREIGN KEY (`id_secretary`) REFERENCES `signup` (`id`),
  ADD CONSTRAINT `ea_secretaries_providers_ibfk_2` FOREIGN KEY (`id_provider`) REFERENCES `signup` (`id`);
--
-- Ограничения внешнего ключа таблицы `ea_services`
--
ALTER TABLE `ea_services`
  ADD CONSTRAINT `ea_services_ibfk_1` FOREIGN KEY (`id_service_categories`) REFERENCES `ea_reg_type` (`id`);
--
-- Ограничения внешнего ключа таблицы `ea_services_providers`
--
ALTER TABLE `ea_services_providers`
  ADD CONSTRAINT `ea_services_providers_ibfk_1` FOREIGN KEY (`id`) REFERENCES `signup` (`id`),
  ADD CONSTRAINT `ea_services_providers_ibfk_2` FOREIGN KEY (`id_services`) REFERENCES `ea_services` (`id`);
