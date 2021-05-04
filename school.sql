-- phpMyAdmin SQL Dump
-- version 4.6.6deb4+deb9u2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: May 04, 2021 at 12:42 AM
-- Server version: 10.3.27-MariaDB-0+deb10u1
-- PHP Version: 7.3.27-1~deb10u1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `escuela`
--
CREATE DATABASE IF NOT EXISTS `escuela` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `escuela`;

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `student_id` bigint(20) UNSIGNED NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `homeroom_number` int(11) DEFAULT NULL,
  `phone` varchar(255) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `grad_year` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`student_id`, `first_name`, `last_name`, `homeroom_number`, `phone`, `email`, `grad_year`) VALUES
(1, 'Mark', 'Watney', 5, '777-555-1234', NULL, 2035);

-- --------------------------------------------------------

--
-- Table structure for table `teachers`
--

CREATE TABLE `teachers` (
  `teacher_id` bigint(20) UNSIGNED NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `homeroom_number` int(11) DEFAULT NULL,
  `department` varchar(50) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `teachers`
--

INSERT INTO `teachers` (`teacher_id`, `first_name`, `last_name`, `homeroom_number`, `department`, `phone`, `email`) VALUES
(1, 'Jonas', 'Salk', 5, 'Biology', '777-555-4321', 'jsalk@school.org');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`student_id`),
  ADD UNIQUE KEY `phone` (`phone`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `teachers`
--
ALTER TABLE `teachers`
  ADD PRIMARY KEY (`teacher_id`),
  ADD UNIQUE KEY `phone` (`phone`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `student_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `teachers`
--
ALTER TABLE `teachers`
  MODIFY `teacher_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;--
-- Database: `kardex`
--
CREATE DATABASE IF NOT EXISTS `kardex` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `kardex`;

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

CREATE TABLE `address` (
  `address_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `address_line` varchar(100) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `zip_postcode` varchar(45) DEFAULT NULL,
  `state` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `address`
--

INSERT INTO `address` (`address_id`, `student_id`, `address_line`, `city`, `zip_postcode`, `state`) VALUES
(1, 180864, 'SALVADOR NAVA NRO 8', 'SLP', '78110', 'SLP');

-- --------------------------------------------------------

--
-- Table structure for table `email`
--

CREATE TABLE `email` (
  `email` varchar(100) NOT NULL,
  `student_id` int(11) NOT NULL,
  `email_type` enum('personal','laboral') DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL,
  `created_on` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `email`
--

INSERT INTO `email` (`email`, `student_id`, `email_type`, `updated_on`, `created_on`) VALUES
('JCARLOS0284@GMAIL.COM', 180864, 'personal', '2021-04-29 00:00:00', '2021-04-22 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `phone`
--

CREATE TABLE `phone` (
  `phone_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `phone` varchar(30) NOT NULL,
  `phone_type` enum('personal','casa','trabajo') NOT NULL,
  `country_code` varchar(5) DEFAULT NULL,
  `area_code` varchar(5) DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `phone`
--

INSERT INTO `phone` (`phone_id`, `student_id`, `phone`, `phone_type`, `country_code`, `area_code`, `created_on`, `updated_on`) VALUES
(1, 180864, '4443374128', 'personal', '52', '444', '2021-04-29 00:00:00', '2021-04-29 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `student_id` int(11) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `middle_name` varchar(45) DEFAULT NULL,
  `first_name` varchar(45) DEFAULT NULL,
  `gender` enum('masculino','femenino') NOT NULL,
  `created_on` date DEFAULT NULL,
  `updated_on` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`student_id`, `last_name`, `middle_name`, `first_name`, `gender`, `created_on`, `updated_on`) VALUES
(180864, 'GONZALEZ', 'CARLOS', 'JUAN', 'masculino', '2021-04-29', '2021-04-29'),
(180865, 'LOPEZ', 'MARIO', 'JOSE', 'masculino', '2021-04-29', '2021-04-29'),
(180866, 'RUIZ', 'ANGELES', 'MARIA', 'femenino', '2021-04-29', '2021-04-29'),
(180867, 'FUENTES', 'LUZ', 'NANCY', 'femenino', '2021-04-29', '2021-04-29'),
(180869, 'NAVARRO', 'LAURA', 'MARIA', 'masculino', '2021-04-20', '2021-04-28'),
(180871, 'RESENDIZ', 'CANTU', 'LUIS', 'masculino', '2021-04-01', '2021-04-30');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`address_id`),
  ADD KEY `student_id` (`student_id`),
  ADD KEY `student_id_2` (`student_id`),
  ADD KEY `address_id` (`address_id`);

--
-- Indexes for table `email`
--
ALTER TABLE `email`
  ADD PRIMARY KEY (`email`),
  ADD KEY `student_id` (`student_id`),
  ADD KEY `student_id_2` (`student_id`);

--
-- Indexes for table `phone`
--
ALTER TABLE `phone`
  ADD PRIMARY KEY (`phone_id`),
  ADD KEY `student_id` (`student_id`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`student_id`),
  ADD KEY `student_id` (`student_id`,`last_name`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `address`
--
ALTER TABLE `address`
  ADD CONSTRAINT `address_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `address_ibfk_2` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`);

--
-- Constraints for table `email`
--
ALTER TABLE `email`
  ADD CONSTRAINT `email_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `email_ibfk_2` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`);

--
-- Constraints for table `phone`
--
ALTER TABLE `phone`
  ADD CONSTRAINT `phone_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `phone_ibfk_2` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`);
--
-- Database: `mydb`
--
CREATE DATABASE IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `mydb`;
--
-- Database: `phpmyadmin`
--
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `phpmyadmin`;

-- --------------------------------------------------------

--
-- Table structure for table `pma__bookmark`
--

CREATE TABLE `pma__bookmark` (
  `id` int(11) NOT NULL,
  `dbase` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `query` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- Table structure for table `pma__central_columns`
--

CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_length` text COLLATE utf8_bin DEFAULT NULL,
  `col_collation` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) COLLATE utf8_bin DEFAULT '',
  `col_default` text COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Central list of columns';

--
-- Dumping data for table `pma__central_columns`
--

INSERT INTO `pma__central_columns` (`db_name`, `col_name`, `col_type`, `col_length`, `col_collation`, `col_isNull`, `col_extra`, `col_default`) VALUES
('test', 'phone_id', 'int', '11', '', 0, ',', '');

-- --------------------------------------------------------

--
-- Table structure for table `pma__column_info`
--

CREATE TABLE `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `column_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__designer_settings`
--

CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `settings_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Settings related to Designer';

--
-- Dumping data for table `pma__designer_settings`
--

INSERT INTO `pma__designer_settings` (`username`, `settings_data`) VALUES
('phpmyadmin', '{\"angular_direct\":\"direct\",\"snap_to_grid\":\"off\",\"relation_lines\":\"true\"}');

-- --------------------------------------------------------

--
-- Table structure for table `pma__export_templates`
--

CREATE TABLE `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `export_type` varchar(10) COLLATE utf8_bin NOT NULL,
  `template_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `template_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved export templates';

--
-- Dumping data for table `pma__export_templates`
--

INSERT INTO `pma__export_templates` (`id`, `username`, `export_type`, `template_name`, `template_data`) VALUES
(1, 'phpmyadmin', 'database', 'kardex', '{\"quick_or_custom\":\"quick\",\"what\":\"sql\",\"structure_or_data_forced\":\"0\",\"table_select[]\":[\"address\",\"email\",\"phone\",\"student\"],\"table_structure[]\":[\"address\",\"email\",\"phone\",\"student\"],\"table_data[]\":[\"address\",\"email\",\"phone\",\"student\"],\"output_format\":\"sendit\",\"filename_template\":\"@DATABASE@\",\"remember_template\":\"on\",\"charset\":\"utf-8\",\"compression\":\"none\",\"maxsize\":\"\",\"texytext_structure_or_data\":\"structure_and_data\",\"texytext_null\":\"NULL\",\"latex_caption\":\"something\",\"latex_structure_or_data\":\"structure_and_data\",\"latex_structure_caption\":\"Estructura de la tabla @TABLE@\",\"latex_structure_continued_caption\":\"Estructura de la tabla @TABLE@ (continúa)\",\"latex_structure_label\":\"tab:@TABLE@-structure\",\"latex_relation\":\"something\",\"latex_comments\":\"something\",\"latex_mime\":\"something\",\"latex_columns\":\"something\",\"latex_data_caption\":\"Contenido de la tabla @TABLE@\",\"latex_data_continued_caption\":\"Contenido de la tabla @TABLE@ (continúa)\",\"latex_data_label\":\"tab:@TABLE@-data\",\"latex_null\":\"\\\\textit{NULL}\",\"yaml_structure_or_data\":\"data\",\"codegen_structure_or_data\":\"data\",\"codegen_format\":\"0\",\"csv_separator\":\",\",\"csv_enclosed\":\"\\\"\",\"csv_escaped\":\"\\\"\",\"csv_terminated\":\"AUTO\",\"csv_null\":\"NULL\",\"csv_structure_or_data\":\"data\",\"phparray_structure_or_data\":\"data\",\"sql_include_comments\":\"something\",\"sql_header_comment\":\"\",\"sql_compatibility\":\"NONE\",\"sql_structure_or_data\":\"structure_and_data\",\"sql_create_table\":\"something\",\"sql_auto_increment\":\"something\",\"sql_create_view\":\"something\",\"sql_procedure_function\":\"something\",\"sql_create_trigger\":\"something\",\"sql_backquotes\":\"something\",\"sql_type\":\"INSERT\",\"sql_insert_syntax\":\"both\",\"sql_max_query_size\":\"50000\",\"sql_hex_for_binary\":\"something\",\"sql_utc_time\":\"something\",\"excel_null\":\"NULL\",\"excel_edition\":\"win\",\"excel_structure_or_data\":\"data\",\"ods_null\":\"NULL\",\"ods_structure_or_data\":\"data\",\"xml_structure_or_data\":\"data\",\"xml_export_events\":\"something\",\"xml_export_functions\":\"something\",\"xml_export_procedures\":\"something\",\"xml_export_tables\":\"something\",\"xml_export_triggers\":\"something\",\"xml_export_views\":\"something\",\"xml_export_contents\":\"something\",\"mediawiki_structure_or_data\":\"structure_and_data\",\"mediawiki_caption\":\"something\",\"mediawiki_headers\":\"something\",\"json_structure_or_data\":\"data\",\"odt_structure_or_data\":\"structure_and_data\",\"odt_relation\":\"something\",\"odt_comments\":\"something\",\"odt_mime\":\"something\",\"odt_columns\":\"something\",\"odt_null\":\"NULL\",\"htmlword_structure_or_data\":\"structure_and_data\",\"htmlword_null\":\"NULL\",\"\":null,\"lock_tables\":null,\"as_separate_files\":null,\"texytext_columns\":null,\"csv_removeCRLF\":null,\"csv_columns\":null,\"sql_dates\":null,\"sql_relation\":null,\"sql_mime\":null,\"sql_use_transaction\":null,\"sql_disable_fk\":null,\"sql_views_as_tables\":null,\"sql_metadata\":null,\"sql_create_database\":null,\"sql_drop_table\":null,\"sql_if_not_exists\":null,\"sql_truncate\":null,\"sql_delayed\":null,\"sql_ignore\":null,\"excel_removeCRLF\":null,\"excel_columns\":null,\"ods_columns\":null,\"json_pretty_print\":null,\"htmlword_columns\":null}'),
(2, 'phpmyadmin', 'table', 'kardex-2', '{\"quick_or_custom\":\"quick\",\"what\":\"sql\",\"allrows\":\"1\",\"output_format\":\"sendit\",\"filename_template\":\"@TABLE@\",\"remember_template\":\"on\",\"charset\":\"utf-8\",\"compression\":\"none\",\"maxsize\":\"\",\"texytext_structure_or_data\":\"structure_and_data\",\"texytext_null\":\"NULL\",\"latex_caption\":\"something\",\"latex_structure_or_data\":\"structure_and_data\",\"latex_structure_caption\":\"Estructura de la tabla @TABLE@\",\"latex_structure_continued_caption\":\"Estructura de la tabla @TABLE@ (continúa)\",\"latex_structure_label\":\"tab:@TABLE@-structure\",\"latex_relation\":\"something\",\"latex_comments\":\"something\",\"latex_mime\":\"something\",\"latex_columns\":\"something\",\"latex_data_caption\":\"Contenido de la tabla @TABLE@\",\"latex_data_continued_caption\":\"Contenido de la tabla @TABLE@ (continúa)\",\"latex_data_label\":\"tab:@TABLE@-data\",\"latex_null\":\"\\\\textit{NULL}\",\"yaml_structure_or_data\":\"data\",\"codegen_structure_or_data\":\"data\",\"codegen_format\":\"0\",\"csv_separator\":\",\",\"csv_enclosed\":\"\\\"\",\"csv_escaped\":\"\\\"\",\"csv_terminated\":\"AUTO\",\"csv_null\":\"NULL\",\"csv_structure_or_data\":\"data\",\"phparray_structure_or_data\":\"data\",\"sql_include_comments\":\"something\",\"sql_header_comment\":\"\",\"sql_compatibility\":\"NONE\",\"sql_structure_or_data\":\"structure_and_data\",\"sql_create_table\":\"something\",\"sql_auto_increment\":\"something\",\"sql_create_view\":\"something\",\"sql_create_trigger\":\"something\",\"sql_backquotes\":\"something\",\"sql_type\":\"INSERT\",\"sql_insert_syntax\":\"both\",\"sql_max_query_size\":\"50000\",\"sql_hex_for_binary\":\"something\",\"sql_utc_time\":\"something\",\"excel_null\":\"NULL\",\"excel_edition\":\"win\",\"excel_structure_or_data\":\"data\",\"ods_null\":\"NULL\",\"ods_structure_or_data\":\"data\",\"xml_structure_or_data\":\"data\",\"xml_export_events\":\"something\",\"xml_export_functions\":\"something\",\"xml_export_procedures\":\"something\",\"xml_export_tables\":\"something\",\"xml_export_triggers\":\"something\",\"xml_export_views\":\"something\",\"xml_export_contents\":\"something\",\"mediawiki_structure_or_data\":\"data\",\"mediawiki_caption\":\"something\",\"mediawiki_headers\":\"something\",\"json_structure_or_data\":\"data\",\"odt_structure_or_data\":\"structure_and_data\",\"odt_relation\":\"something\",\"odt_comments\":\"something\",\"odt_mime\":\"something\",\"odt_columns\":\"something\",\"odt_null\":\"NULL\",\"htmlword_structure_or_data\":\"structure_and_data\",\"htmlword_null\":\"NULL\",\"\":null,\"lock_tables\":null,\"texytext_columns\":null,\"csv_removeCRLF\":null,\"csv_columns\":null,\"sql_dates\":null,\"sql_relation\":null,\"sql_mime\":null,\"sql_use_transaction\":null,\"sql_disable_fk\":null,\"sql_views_as_tables\":null,\"sql_metadata\":null,\"sql_drop_table\":null,\"sql_if_not_exists\":null,\"sql_procedure_function\":null,\"sql_truncate\":null,\"sql_delayed\":null,\"sql_ignore\":null,\"excel_removeCRLF\":null,\"excel_columns\":null,\"ods_columns\":null,\"json_pretty_print\":null,\"htmlword_columns\":null}'),
(3, 'phpmyadmin', 'database', 'kardex-2', '{\"quick_or_custom\":\"quick\",\"what\":\"sql\",\"structure_or_data_forced\":\"0\",\"table_select[]\":[\"adres\",\"email\",\"phone\",\"student\"],\"table_structure[]\":[\"adres\",\"email\",\"phone\",\"student\"],\"table_data[]\":[\"adres\",\"email\",\"phone\",\"student\"],\"output_format\":\"sendit\",\"filename_template\":\"@DATABASE@\",\"remember_template\":\"on\",\"charset\":\"utf-8\",\"compression\":\"none\",\"maxsize\":\"\",\"texytext_structure_or_data\":\"structure_and_data\",\"texytext_null\":\"NULL\",\"latex_caption\":\"something\",\"latex_structure_or_data\":\"structure_and_data\",\"latex_structure_caption\":\"Estructura de la tabla @TABLE@\",\"latex_structure_continued_caption\":\"Estructura de la tabla @TABLE@ (continúa)\",\"latex_structure_label\":\"tab:@TABLE@-structure\",\"latex_relation\":\"something\",\"latex_comments\":\"something\",\"latex_mime\":\"something\",\"latex_columns\":\"something\",\"latex_data_caption\":\"Contenido de la tabla @TABLE@\",\"latex_data_continued_caption\":\"Contenido de la tabla @TABLE@ (continúa)\",\"latex_data_label\":\"tab:@TABLE@-data\",\"latex_null\":\"\\\\textit{NULL}\",\"yaml_structure_or_data\":\"data\",\"codegen_structure_or_data\":\"data\",\"codegen_format\":\"0\",\"csv_separator\":\",\",\"csv_enclosed\":\"\\\"\",\"csv_escaped\":\"\\\"\",\"csv_terminated\":\"AUTO\",\"csv_null\":\"NULL\",\"csv_structure_or_data\":\"data\",\"phparray_structure_or_data\":\"data\",\"sql_include_comments\":\"something\",\"sql_header_comment\":\"\",\"sql_compatibility\":\"NONE\",\"sql_structure_or_data\":\"structure_and_data\",\"sql_create_table\":\"something\",\"sql_auto_increment\":\"something\",\"sql_create_view\":\"something\",\"sql_procedure_function\":\"something\",\"sql_create_trigger\":\"something\",\"sql_backquotes\":\"something\",\"sql_type\":\"INSERT\",\"sql_insert_syntax\":\"both\",\"sql_max_query_size\":\"50000\",\"sql_hex_for_binary\":\"something\",\"sql_utc_time\":\"something\",\"excel_null\":\"NULL\",\"excel_edition\":\"win\",\"excel_structure_or_data\":\"data\",\"ods_null\":\"NULL\",\"ods_structure_or_data\":\"data\",\"xml_structure_or_data\":\"data\",\"xml_export_events\":\"something\",\"xml_export_functions\":\"something\",\"xml_export_procedures\":\"something\",\"xml_export_tables\":\"something\",\"xml_export_triggers\":\"something\",\"xml_export_views\":\"something\",\"xml_export_contents\":\"something\",\"mediawiki_structure_or_data\":\"structure_and_data\",\"mediawiki_caption\":\"something\",\"mediawiki_headers\":\"something\",\"json_structure_or_data\":\"data\",\"odt_structure_or_data\":\"structure_and_data\",\"odt_relation\":\"something\",\"odt_comments\":\"something\",\"odt_mime\":\"something\",\"odt_columns\":\"something\",\"odt_null\":\"NULL\",\"htmlword_structure_or_data\":\"structure_and_data\",\"htmlword_null\":\"NULL\",\"\":null,\"lock_tables\":null,\"as_separate_files\":null,\"texytext_columns\":null,\"csv_removeCRLF\":null,\"csv_columns\":null,\"sql_dates\":null,\"sql_relation\":null,\"sql_mime\":null,\"sql_use_transaction\":null,\"sql_disable_fk\":null,\"sql_views_as_tables\":null,\"sql_metadata\":null,\"sql_create_database\":null,\"sql_drop_table\":null,\"sql_if_not_exists\":null,\"sql_truncate\":null,\"sql_delayed\":null,\"sql_ignore\":null,\"excel_removeCRLF\":null,\"excel_columns\":null,\"ods_columns\":null,\"json_pretty_print\":null,\"htmlword_columns\":null}'),
(4, 'phpmyadmin', 'server', 'school', '{\"quick_or_custom\":\"quick\",\"what\":\"sql\",\"db_select[]\":[\"escuela\",\"kardex\",\"mydb\",\"phpmyadmin\",\"prueba\",\"school\",\"sistema\",\"test\"],\"output_format\":\"sendit\",\"filename_template\":\"@SERVER@\",\"remember_template\":\"on\",\"charset\":\"utf-8\",\"compression\":\"none\",\"maxsize\":\"\",\"texytext_structure_or_data\":\"structure_and_data\",\"texytext_null\":\"NULL\",\"latex_caption\":\"something\",\"latex_structure_or_data\":\"structure_and_data\",\"latex_structure_caption\":\"Structure of table @TABLE@\",\"latex_structure_continued_caption\":\"Structure of table @TABLE@ (continued)\",\"latex_structure_label\":\"tab:@TABLE@-structure\",\"latex_relation\":\"something\",\"latex_comments\":\"something\",\"latex_mime\":\"something\",\"latex_columns\":\"something\",\"latex_data_caption\":\"Content of table @TABLE@\",\"latex_data_continued_caption\":\"Content of table @TABLE@ (continued)\",\"latex_data_label\":\"tab:@TABLE@-data\",\"latex_null\":\"\\\\textit{NULL}\",\"yaml_structure_or_data\":\"data\",\"codegen_structure_or_data\":\"data\",\"codegen_format\":\"0\",\"csv_separator\":\",\",\"csv_enclosed\":\"\\\"\",\"csv_escaped\":\"\\\"\",\"csv_terminated\":\"AUTO\",\"csv_null\":\"NULL\",\"csv_structure_or_data\":\"data\",\"phparray_structure_or_data\":\"data\",\"sql_include_comments\":\"something\",\"sql_header_comment\":\"\",\"sql_compatibility\":\"NONE\",\"sql_structure_or_data\":\"structure_and_data\",\"sql_create_table\":\"something\",\"sql_auto_increment\":\"something\",\"sql_create_view\":\"something\",\"sql_create_trigger\":\"something\",\"sql_backquotes\":\"something\",\"sql_type\":\"INSERT\",\"sql_insert_syntax\":\"both\",\"sql_max_query_size\":\"50000\",\"sql_hex_for_binary\":\"something\",\"sql_utc_time\":\"something\",\"excel_null\":\"NULL\",\"excel_edition\":\"win\",\"excel_structure_or_data\":\"data\",\"ods_null\":\"NULL\",\"ods_structure_or_data\":\"data\",\"mediawiki_structure_or_data\":\"data\",\"mediawiki_caption\":\"something\",\"mediawiki_headers\":\"something\",\"json_structure_or_data\":\"data\",\"odt_structure_or_data\":\"structure_and_data\",\"odt_relation\":\"something\",\"odt_comments\":\"something\",\"odt_mime\":\"something\",\"odt_columns\":\"something\",\"odt_null\":\"NULL\",\"htmlword_structure_or_data\":\"structure_and_data\",\"htmlword_null\":\"NULL\",\"\":null,\"as_separate_files\":null,\"texytext_columns\":null,\"csv_removeCRLF\":null,\"csv_columns\":null,\"sql_dates\":null,\"sql_relation\":null,\"sql_mime\":null,\"sql_use_transaction\":null,\"sql_disable_fk\":null,\"sql_views_as_tables\":null,\"sql_metadata\":null,\"sql_drop_database\":null,\"sql_drop_table\":null,\"sql_if_not_exists\":null,\"sql_procedure_function\":null,\"sql_truncate\":null,\"sql_delayed\":null,\"sql_ignore\":null,\"excel_removeCRLF\":null,\"excel_columns\":null,\"ods_columns\":null,\"json_pretty_print\":null,\"htmlword_columns\":null}');

-- --------------------------------------------------------

--
-- Table structure for table `pma__favorite`
--

CREATE TABLE `pma__favorite` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- Table structure for table `pma__history`
--

CREATE TABLE `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp(),
  `sqlquery` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__navigationhiding`
--

CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

-- --------------------------------------------------------

--
-- Table structure for table `pma__pdf_pages`
--

CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__recent`
--

CREATE TABLE `pma__recent` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

--
-- Dumping data for table `pma__recent`
--

INSERT INTO `pma__recent` (`username`, `tables`) VALUES
('phpmyadmin', '[{\"db\":\"phpmyadmin\",\"table\":\"pma__users\"},{\"db\":\"school\",\"table\":\"student\"},{\"db\":\"school\",\"table\":\"accounts\"},{\"db\":\"sistema\",\"table\":\"accounts\"},{\"db\":\"school\",\"table\":\"email\"},{\"db\":\"school\",\"table\":\"phone\"},{\"db\":\"school\",\"table\":\"addres\"},{\"db\":\"test\",\"table\":\"students\"},{\"db\":\"test\",\"table\":\"student\"},{\"db\":\"test\",\"table\":\"email\"}]');

-- --------------------------------------------------------

--
-- Table structure for table `pma__relation`
--

CREATE TABLE `pma__relation` (
  `master_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Table structure for table `pma__savedsearches`
--

CREATE TABLE `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_coords`
--

CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT 0,
  `x` float UNSIGNED NOT NULL DEFAULT 0,
  `y` float UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_info`
--

CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `display_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

--
-- Dumping data for table `pma__table_info`
--

INSERT INTO `pma__table_info` (`db_name`, `table_name`, `display_field`) VALUES
('kardex', 'student', 'last_name');

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_uiprefs`
--

CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `prefs` text COLLATE utf8_bin NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

-- --------------------------------------------------------

--
-- Table structure for table `pma__tracking`
--

CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text COLLATE utf8_bin NOT NULL,
  `schema_sql` text COLLATE utf8_bin DEFAULT NULL,
  `data_sql` longtext COLLATE utf8_bin DEFAULT NULL,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') COLLATE utf8_bin DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database changes tracking for phpMyAdmin';

--
-- Dumping data for table `pma__tracking`
--

INSERT INTO `pma__tracking` (`db_name`, `table_name`, `version`, `date_created`, `date_updated`, `schema_snapshot`, `schema_sql`, `data_sql`, `tracking`, `tracking_active`) VALUES
('kardex', 'address', 1, '2021-04-29 18:43:09', '2021-04-30 23:41:07', 'a:2:{s:7:\"COLUMNS\";a:6:{i:0;a:8:{s:5:\"Field\";s:10:\"address_id\";s:4:\"Type\";s:7:\"int(11)\";s:9:\"Collation\";N;s:4:\"Null\";s:2:\"NO\";s:3:\"Key\";s:3:\"PRI\";s:7:\"Default\";N;s:5:\"Extra\";s:0:\"\";s:7:\"Comment\";s:0:\"\";}i:1;a:8:{s:5:\"Field\";s:10:\"student_id\";s:4:\"Type\";s:7:\"int(11)\";s:9:\"Collation\";N;s:4:\"Null\";s:2:\"NO\";s:3:\"Key\";s:3:\"PRI\";s:7:\"Default\";N;s:5:\"Extra\";s:0:\"\";s:7:\"Comment\";s:0:\"\";}i:2;a:8:{s:5:\"Field\";s:12:\"address_line\";s:4:\"Type\";s:12:\"varchar(100)\";s:9:\"Collation\";s:15:\"utf8_general_ci\";s:4:\"Null\";s:3:\"YES\";s:3:\"Key\";s:0:\"\";s:7:\"Default\";N;s:5:\"Extra\";s:0:\"\";s:7:\"Comment\";s:0:\"\";}i:3;a:8:{s:5:\"Field\";s:4:\"city\";s:4:\"Type\";s:11:\"varchar(45)\";s:9:\"Collation\";s:15:\"utf8_general_ci\";s:4:\"Null\";s:3:\"YES\";s:3:\"Key\";s:0:\"\";s:7:\"Default\";N;s:5:\"Extra\";s:0:\"\";s:7:\"Comment\";s:0:\"\";}i:4;a:8:{s:5:\"Field\";s:12:\"zip_postcode\";s:4:\"Type\";s:11:\"varchar(45)\";s:9:\"Collation\";s:15:\"utf8_general_ci\";s:4:\"Null\";s:3:\"YES\";s:3:\"Key\";s:0:\"\";s:7:\"Default\";N;s:5:\"Extra\";s:0:\"\";s:7:\"Comment\";s:0:\"\";}i:5;a:8:{s:5:\"Field\";s:5:\"state\";s:4:\"Type\";s:11:\"varchar(45)\";s:9:\"Collation\";s:15:\"utf8_general_ci\";s:4:\"Null\";s:3:\"YES\";s:3:\"Key\";s:0:\"\";s:7:\"Default\";N;s:5:\"Extra\";s:0:\"\";s:7:\"Comment\";s:0:\"\";}}s:7:\"INDEXES\";a:3:{i:0;a:13:{s:5:\"Table\";s:7:\"address\";s:10:\"Non_unique\";s:1:\"0\";s:8:\"Key_name\";s:7:\"PRIMARY\";s:12:\"Seq_in_index\";s:1:\"1\";s:11:\"Column_name\";s:10:\"address_id\";s:9:\"Collation\";s:1:\"A\";s:11:\"Cardinality\";s:1:\"1\";s:8:\"Sub_part\";N;s:6:\"Packed\";N;s:4:\"Null\";s:0:\"\";s:10:\"Index_type\";s:5:\"BTREE\";s:7:\"Comment\";s:0:\"\";s:13:\"Index_comment\";s:0:\"\";}i:1;a:13:{s:5:\"Table\";s:7:\"address\";s:10:\"Non_unique\";s:1:\"0\";s:8:\"Key_name\";s:7:\"PRIMARY\";s:12:\"Seq_in_index\";s:1:\"2\";s:11:\"Column_name\";s:10:\"student_id\";s:9:\"Collation\";s:1:\"A\";s:11:\"Cardinality\";s:1:\"1\";s:8:\"Sub_part\";N;s:6:\"Packed\";N;s:4:\"Null\";s:0:\"\";s:10:\"Index_type\";s:5:\"BTREE\";s:7:\"Comment\";s:0:\"\";s:13:\"Index_comment\";s:0:\"\";}i:2;a:13:{s:5:\"Table\";s:7:\"address\";s:10:\"Non_unique\";s:1:\"1\";s:8:\"Key_name\";s:10:\"student_id\";s:12:\"Seq_in_index\";s:1:\"1\";s:11:\"Column_name\";s:10:\"student_id\";s:9:\"Collation\";s:1:\"A\";s:11:\"Cardinality\";s:1:\"1\";s:8:\"Sub_part\";N;s:6:\"Packed\";N;s:4:\"Null\";s:0:\"\";s:10:\"Index_type\";s:5:\"BTREE\";s:7:\"Comment\";s:0:\"\";s:13:\"Index_comment\";s:0:\"\";}}}', '# log 2021-04-29 18:43:09 phpmyadmin\nDROP TABLE IF EXISTS `address`;\n# log 2021-04-29 18:43:09 phpmyadmin\n\nCREATE TABLE `address` (\n  `address_id` int(11) NOT NULL,\n  `student_id` int(11) NOT NULL,\n  `address_line` varchar(100) DEFAULT NULL,\n  `city` varchar(45) DEFAULT NULL,\n  `zip_postcode` varchar(45) DEFAULT NULL,\n  `state` varchar(45) DEFAULT NULL\n) ENGINE=InnoDB DEFAULT CHARSET=utf8;\n\n# log 2021-04-30 23:40:59 phpmyadmin\nALTER TABLE `address` ADD INDEX(`student_id`);\n# log 2021-04-30 23:41:07 phpmyadmin\nALTER TABLE `address` ADD INDEX(`address_id`);', '\n', 'UPDATE,INSERT,DELETE,TRUNCATE,CREATE TABLE,ALTER TABLE,RENAME TABLE,DROP TABLE,CREATE INDEX,DROP INDEX', 1),
('kardex', 'email', 1, '2021-04-29 18:43:35', '2021-04-29 18:43:35', 'a:2:{s:7:\"COLUMNS\";a:5:{i:0;a:8:{s:5:\"Field\";s:5:\"email\";s:4:\"Type\";s:12:\"varchar(100)\";s:9:\"Collation\";s:15:\"utf8_general_ci\";s:4:\"Null\";s:2:\"NO\";s:3:\"Key\";s:3:\"PRI\";s:7:\"Default\";N;s:5:\"Extra\";s:0:\"\";s:7:\"Comment\";s:0:\"\";}i:1;a:8:{s:5:\"Field\";s:10:\"student_id\";s:4:\"Type\";s:7:\"int(11)\";s:9:\"Collation\";N;s:4:\"Null\";s:2:\"NO\";s:3:\"Key\";s:3:\"PRI\";s:7:\"Default\";N;s:5:\"Extra\";s:0:\"\";s:7:\"Comment\";s:0:\"\";}i:2;a:8:{s:5:\"Field\";s:10:\"email_type\";s:4:\"Type\";s:26:\"enum(\'personal\',\'laboral\')\";s:9:\"Collation\";s:15:\"utf8_general_ci\";s:4:\"Null\";s:3:\"YES\";s:3:\"Key\";s:0:\"\";s:7:\"Default\";N;s:5:\"Extra\";s:0:\"\";s:7:\"Comment\";s:0:\"\";}i:3;a:8:{s:5:\"Field\";s:10:\"updated_on\";s:4:\"Type\";s:8:\"datetime\";s:9:\"Collation\";N;s:4:\"Null\";s:3:\"YES\";s:3:\"Key\";s:0:\"\";s:7:\"Default\";N;s:5:\"Extra\";s:0:\"\";s:7:\"Comment\";s:0:\"\";}i:4;a:8:{s:5:\"Field\";s:10:\"created_on\";s:4:\"Type\";s:8:\"datetime\";s:9:\"Collation\";N;s:4:\"Null\";s:3:\"YES\";s:3:\"Key\";s:0:\"\";s:7:\"Default\";N;s:5:\"Extra\";s:0:\"\";s:7:\"Comment\";s:0:\"\";}}s:7:\"INDEXES\";a:4:{i:0;a:13:{s:5:\"Table\";s:5:\"email\";s:10:\"Non_unique\";s:1:\"0\";s:8:\"Key_name\";s:7:\"PRIMARY\";s:12:\"Seq_in_index\";s:1:\"1\";s:11:\"Column_name\";s:5:\"email\";s:9:\"Collation\";s:1:\"A\";s:11:\"Cardinality\";s:1:\"0\";s:8:\"Sub_part\";N;s:6:\"Packed\";N;s:4:\"Null\";s:0:\"\";s:10:\"Index_type\";s:5:\"BTREE\";s:7:\"Comment\";s:0:\"\";s:13:\"Index_comment\";s:0:\"\";}i:1;a:13:{s:5:\"Table\";s:5:\"email\";s:10:\"Non_unique\";s:1:\"0\";s:8:\"Key_name\";s:7:\"PRIMARY\";s:12:\"Seq_in_index\";s:1:\"2\";s:11:\"Column_name\";s:10:\"student_id\";s:9:\"Collation\";s:1:\"A\";s:11:\"Cardinality\";s:1:\"0\";s:8:\"Sub_part\";N;s:6:\"Packed\";N;s:4:\"Null\";s:0:\"\";s:10:\"Index_type\";s:5:\"BTREE\";s:7:\"Comment\";s:0:\"\";s:13:\"Index_comment\";s:0:\"\";}i:2;a:13:{s:5:\"Table\";s:5:\"email\";s:10:\"Non_unique\";s:1:\"1\";s:8:\"Key_name\";s:10:\"student_id\";s:12:\"Seq_in_index\";s:1:\"1\";s:11:\"Column_name\";s:10:\"student_id\";s:9:\"Collation\";s:1:\"A\";s:11:\"Cardinality\";s:1:\"0\";s:8:\"Sub_part\";N;s:6:\"Packed\";N;s:4:\"Null\";s:0:\"\";s:10:\"Index_type\";s:5:\"BTREE\";s:7:\"Comment\";s:0:\"\";s:13:\"Index_comment\";s:0:\"\";}i:3;a:13:{s:5:\"Table\";s:5:\"email\";s:10:\"Non_unique\";s:1:\"1\";s:8:\"Key_name\";s:12:\"student_id_2\";s:12:\"Seq_in_index\";s:1:\"1\";s:11:\"Column_name\";s:10:\"student_id\";s:9:\"Collation\";s:1:\"A\";s:11:\"Cardinality\";s:1:\"0\";s:8:\"Sub_part\";N;s:6:\"Packed\";N;s:4:\"Null\";s:0:\"\";s:10:\"Index_type\";s:5:\"BTREE\";s:7:\"Comment\";s:0:\"\";s:13:\"Index_comment\";s:0:\"\";}}}', '# log 2021-04-29 18:43:35 phpmyadmin\nDROP TABLE IF EXISTS `email`;\n# log 2021-04-29 18:43:35 phpmyadmin\n\nCREATE TABLE `email` (\n  `email` varchar(100) NOT NULL,\n  `student_id` int(11) NOT NULL,\n  `email_type` enum(\'personal\',\'laboral\') DEFAULT NULL,\n  `updated_on` datetime DEFAULT NULL,\n  `created_on` datetime DEFAULT NULL\n) ENGINE=InnoDB DEFAULT CHARSET=utf8;\n', '\n', 'UPDATE,INSERT,DELETE,TRUNCATE,CREATE TABLE,ALTER TABLE,RENAME TABLE,DROP TABLE,CREATE INDEX,DROP INDEX,CREATE VIEW,ALTER VIEW,DROP VIEW', 1),
('kardex', 'phone', 1, '2021-04-29 18:43:35', '2021-04-29 18:43:35', 'a:2:{s:7:\"COLUMNS\";a:8:{i:0;a:8:{s:5:\"Field\";s:8:\"phone_id\";s:4:\"Type\";s:7:\"int(11)\";s:9:\"Collation\";N;s:4:\"Null\";s:2:\"NO\";s:3:\"Key\";s:3:\"PRI\";s:7:\"Default\";N;s:5:\"Extra\";s:0:\"\";s:7:\"Comment\";s:0:\"\";}i:1;a:8:{s:5:\"Field\";s:10:\"student_id\";s:4:\"Type\";s:7:\"int(11)\";s:9:\"Collation\";N;s:4:\"Null\";s:2:\"NO\";s:3:\"Key\";s:3:\"PRI\";s:7:\"Default\";N;s:5:\"Extra\";s:0:\"\";s:7:\"Comment\";s:0:\"\";}i:2;a:8:{s:5:\"Field\";s:5:\"phone\";s:4:\"Type\";s:11:\"varchar(30)\";s:9:\"Collation\";s:15:\"utf8_general_ci\";s:4:\"Null\";s:2:\"NO\";s:3:\"Key\";s:0:\"\";s:7:\"Default\";N;s:5:\"Extra\";s:0:\"\";s:7:\"Comment\";s:0:\"\";}i:3;a:8:{s:5:\"Field\";s:10:\"phone_type\";s:4:\"Type\";s:33:\"enum(\'personal\',\'casa\',\'trabajo\')\";s:9:\"Collation\";s:15:\"utf8_general_ci\";s:4:\"Null\";s:2:\"NO\";s:3:\"Key\";s:0:\"\";s:7:\"Default\";N;s:5:\"Extra\";s:0:\"\";s:7:\"Comment\";s:0:\"\";}i:4;a:8:{s:5:\"Field\";s:12:\"country_code\";s:4:\"Type\";s:10:\"varchar(5)\";s:9:\"Collation\";s:15:\"utf8_general_ci\";s:4:\"Null\";s:3:\"YES\";s:3:\"Key\";s:0:\"\";s:7:\"Default\";N;s:5:\"Extra\";s:0:\"\";s:7:\"Comment\";s:0:\"\";}i:5;a:8:{s:5:\"Field\";s:9:\"area_code\";s:4:\"Type\";s:10:\"varchar(5)\";s:9:\"Collation\";s:15:\"utf8_general_ci\";s:4:\"Null\";s:3:\"YES\";s:3:\"Key\";s:0:\"\";s:7:\"Default\";N;s:5:\"Extra\";s:0:\"\";s:7:\"Comment\";s:0:\"\";}i:6;a:8:{s:5:\"Field\";s:10:\"created_on\";s:4:\"Type\";s:8:\"datetime\";s:9:\"Collation\";N;s:4:\"Null\";s:3:\"YES\";s:3:\"Key\";s:0:\"\";s:7:\"Default\";N;s:5:\"Extra\";s:0:\"\";s:7:\"Comment\";s:0:\"\";}i:7;a:8:{s:5:\"Field\";s:10:\"updated_on\";s:4:\"Type\";s:8:\"datetime\";s:9:\"Collation\";N;s:4:\"Null\";s:3:\"YES\";s:3:\"Key\";s:0:\"\";s:7:\"Default\";N;s:5:\"Extra\";s:0:\"\";s:7:\"Comment\";s:0:\"\";}}s:7:\"INDEXES\";a:3:{i:0;a:13:{s:5:\"Table\";s:5:\"phone\";s:10:\"Non_unique\";s:1:\"0\";s:8:\"Key_name\";s:7:\"PRIMARY\";s:12:\"Seq_in_index\";s:1:\"1\";s:11:\"Column_name\";s:8:\"phone_id\";s:9:\"Collation\";s:1:\"A\";s:11:\"Cardinality\";s:1:\"0\";s:8:\"Sub_part\";N;s:6:\"Packed\";N;s:4:\"Null\";s:0:\"\";s:10:\"Index_type\";s:5:\"BTREE\";s:7:\"Comment\";s:0:\"\";s:13:\"Index_comment\";s:0:\"\";}i:1;a:13:{s:5:\"Table\";s:5:\"phone\";s:10:\"Non_unique\";s:1:\"0\";s:8:\"Key_name\";s:7:\"PRIMARY\";s:12:\"Seq_in_index\";s:1:\"2\";s:11:\"Column_name\";s:10:\"student_id\";s:9:\"Collation\";s:1:\"A\";s:11:\"Cardinality\";s:1:\"0\";s:8:\"Sub_part\";N;s:6:\"Packed\";N;s:4:\"Null\";s:0:\"\";s:10:\"Index_type\";s:5:\"BTREE\";s:7:\"Comment\";s:0:\"\";s:13:\"Index_comment\";s:0:\"\";}i:2;a:13:{s:5:\"Table\";s:5:\"phone\";s:10:\"Non_unique\";s:1:\"1\";s:8:\"Key_name\";s:10:\"student_id\";s:12:\"Seq_in_index\";s:1:\"1\";s:11:\"Column_name\";s:10:\"student_id\";s:9:\"Collation\";s:1:\"A\";s:11:\"Cardinality\";s:1:\"0\";s:8:\"Sub_part\";N;s:6:\"Packed\";N;s:4:\"Null\";s:0:\"\";s:10:\"Index_type\";s:5:\"BTREE\";s:7:\"Comment\";s:0:\"\";s:13:\"Index_comment\";s:0:\"\";}}}', '# log 2021-04-29 18:43:35 phpmyadmin\nDROP TABLE IF EXISTS `phone`;\n# log 2021-04-29 18:43:35 phpmyadmin\n\nCREATE TABLE `phone` (\n  `phone_id` int(11) NOT NULL,\n  `student_id` int(11) NOT NULL,\n  `phone` varchar(30) NOT NULL,\n  `phone_type` enum(\'personal\',\'casa\',\'trabajo\') NOT NULL,\n  `country_code` varchar(5) DEFAULT NULL,\n  `area_code` varchar(5) DEFAULT NULL,\n  `created_on` datetime DEFAULT NULL,\n  `updated_on` datetime DEFAULT NULL\n) ENGINE=InnoDB DEFAULT CHARSET=utf8;\n', '\n', 'UPDATE,INSERT,DELETE,TRUNCATE,CREATE TABLE,ALTER TABLE,RENAME TABLE,DROP TABLE,CREATE INDEX,DROP INDEX,CREATE VIEW,ALTER VIEW,DROP VIEW', 1),
('kardex', 'student', 1, '2021-04-29 18:43:35', '2021-04-30 17:21:14', 'a:2:{s:7:\"COLUMNS\";a:7:{i:0;a:8:{s:5:\"Field\";s:10:\"student_id\";s:4:\"Type\";s:7:\"int(11)\";s:9:\"Collation\";N;s:4:\"Null\";s:2:\"NO\";s:3:\"Key\";s:3:\"PRI\";s:7:\"Default\";N;s:5:\"Extra\";s:0:\"\";s:7:\"Comment\";s:0:\"\";}i:1;a:8:{s:5:\"Field\";s:9:\"last_name\";s:4:\"Type\";s:11:\"varchar(45)\";s:9:\"Collation\";s:15:\"utf8_general_ci\";s:4:\"Null\";s:2:\"NO\";s:3:\"Key\";s:3:\"PRI\";s:7:\"Default\";N;s:5:\"Extra\";s:0:\"\";s:7:\"Comment\";s:0:\"\";}i:2;a:8:{s:5:\"Field\";s:11:\"middle_name\";s:4:\"Type\";s:11:\"varchar(45)\";s:9:\"Collation\";s:15:\"utf8_general_ci\";s:4:\"Null\";s:3:\"YES\";s:3:\"Key\";s:0:\"\";s:7:\"Default\";N;s:5:\"Extra\";s:0:\"\";s:7:\"Comment\";s:0:\"\";}i:3;a:8:{s:5:\"Field\";s:10:\"first_name\";s:4:\"Type\";s:11:\"varchar(45)\";s:9:\"Collation\";s:15:\"utf8_general_ci\";s:4:\"Null\";s:3:\"YES\";s:3:\"Key\";s:0:\"\";s:7:\"Default\";N;s:5:\"Extra\";s:0:\"\";s:7:\"Comment\";s:0:\"\";}i:4;a:8:{s:5:\"Field\";s:6:\"gender\";s:4:\"Type\";s:28:\"enum(\'masculino\',\'femenino\')\";s:9:\"Collation\";s:15:\"utf8_general_ci\";s:4:\"Null\";s:2:\"NO\";s:3:\"Key\";s:0:\"\";s:7:\"Default\";N;s:5:\"Extra\";s:0:\"\";s:7:\"Comment\";s:0:\"\";}i:5;a:8:{s:5:\"Field\";s:10:\"created_on\";s:4:\"Type\";s:8:\"datetime\";s:9:\"Collation\";N;s:4:\"Null\";s:3:\"YES\";s:3:\"Key\";s:0:\"\";s:7:\"Default\";N;s:5:\"Extra\";s:0:\"\";s:7:\"Comment\";s:0:\"\";}i:6;a:8:{s:5:\"Field\";s:10:\"updated_on\";s:4:\"Type\";s:8:\"datetime\";s:9:\"Collation\";N;s:4:\"Null\";s:3:\"YES\";s:3:\"Key\";s:0:\"\";s:7:\"Default\";N;s:5:\"Extra\";s:0:\"\";s:7:\"Comment\";s:0:\"\";}}s:7:\"INDEXES\";a:4:{i:0;a:13:{s:5:\"Table\";s:7:\"student\";s:10:\"Non_unique\";s:1:\"0\";s:8:\"Key_name\";s:7:\"PRIMARY\";s:12:\"Seq_in_index\";s:1:\"1\";s:11:\"Column_name\";s:10:\"student_id\";s:9:\"Collation\";s:1:\"A\";s:11:\"Cardinality\";s:1:\"1\";s:8:\"Sub_part\";N;s:6:\"Packed\";N;s:4:\"Null\";s:0:\"\";s:10:\"Index_type\";s:5:\"BTREE\";s:7:\"Comment\";s:0:\"\";s:13:\"Index_comment\";s:0:\"\";}i:1;a:13:{s:5:\"Table\";s:7:\"student\";s:10:\"Non_unique\";s:1:\"0\";s:8:\"Key_name\";s:7:\"PRIMARY\";s:12:\"Seq_in_index\";s:1:\"2\";s:11:\"Column_name\";s:9:\"last_name\";s:9:\"Collation\";s:1:\"A\";s:11:\"Cardinality\";s:1:\"1\";s:8:\"Sub_part\";N;s:6:\"Packed\";N;s:4:\"Null\";s:0:\"\";s:10:\"Index_type\";s:5:\"BTREE\";s:7:\"Comment\";s:0:\"\";s:13:\"Index_comment\";s:0:\"\";}i:2;a:13:{s:5:\"Table\";s:7:\"student\";s:10:\"Non_unique\";s:1:\"1\";s:8:\"Key_name\";s:10:\"student_id\";s:12:\"Seq_in_index\";s:1:\"1\";s:11:\"Column_name\";s:10:\"student_id\";s:9:\"Collation\";s:1:\"A\";s:11:\"Cardinality\";s:1:\"1\";s:8:\"Sub_part\";N;s:6:\"Packed\";N;s:4:\"Null\";s:0:\"\";s:10:\"Index_type\";s:5:\"BTREE\";s:7:\"Comment\";s:0:\"\";s:13:\"Index_comment\";s:0:\"\";}i:3;a:13:{s:5:\"Table\";s:7:\"student\";s:10:\"Non_unique\";s:1:\"1\";s:8:\"Key_name\";s:10:\"student_id\";s:12:\"Seq_in_index\";s:1:\"2\";s:11:\"Column_name\";s:9:\"last_name\";s:9:\"Collation\";s:1:\"A\";s:11:\"Cardinality\";s:1:\"1\";s:8:\"Sub_part\";N;s:6:\"Packed\";N;s:4:\"Null\";s:0:\"\";s:10:\"Index_type\";s:5:\"BTREE\";s:7:\"Comment\";s:0:\"\";s:13:\"Index_comment\";s:0:\"\";}}}', '# log 2021-04-29 18:43:35 phpmyadmin\nDROP TABLE IF EXISTS `student`;\n# log 2021-04-29 18:43:35 phpmyadmin\n\nCREATE TABLE `student` (\n  `student_id` int(11) NOT NULL,\n  `last_name` varchar(45) NOT NULL,\n  `middle_name` varchar(45) DEFAULT NULL,\n  `first_name` varchar(45) DEFAULT NULL,\n  `gender` enum(\'masculino\',\'femenino\') NOT NULL,\n  `created_on` datetime DEFAULT NULL,\n  `updated_on` datetime DEFAULT NULL\n) ENGINE=InnoDB DEFAULT CHARSET=utf8;\n\n# log 2021-04-30 17:21:04 phpmyadmin\nALTER TABLE `student` CHANGE `created_on` `created_on` DATE NULL DEFAULT NULL;\n# log 2021-04-30 17:21:14 phpmyadmin\nALTER TABLE `student` CHANGE `updated_on` `updated_on` DATE NULL DEFAULT NULL;', '\n\n# log 2021-04-29 20:26:35 phpmyadmin\nINSERT INTO `student` (`student_id`, `last_name`, `middle_name`, `first_name`, `gender`, `created_on`, `updated_on`) VALUES (\'180865\', \'LOPEZ\', \'MARIO\', \'JOSE\', \'masculino\', \'2021-04-29 19:43:46\', \'2021-04-29 21:55:55\');\n\n# log 2021-04-30 17:16:18 phpmyadmin\nUPDATE `student` SET `student_id` = \'180869\', `last_name` = \'NAVARROS\', `middle_name` = \'LAURAS\', `first_name` = \'MARIAS\', `created_on` = \'2021-04-19 05:20:31\', `updated_on` = \'2021-04-30 13:34:24\' WHERE `student`.`student_id` = 180868 AND `student`.`last_name` = \'NAVARRO\';\n', 'UPDATE,INSERT,DELETE,TRUNCATE,CREATE TABLE,ALTER TABLE,RENAME TABLE,DROP TABLE,CREATE INDEX,DROP INDEX,CREATE VIEW,ALTER VIEW,DROP VIEW', 1);

-- --------------------------------------------------------

--
-- Table structure for table `pma__userconfig`
--

CREATE TABLE `pma__userconfig` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `config_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Dumping data for table `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('phpmyadmin', '2021-05-04 04:42:35', '{\"Server\\/hide_db\":\"\",\"Server\\/only_db\":\"\",\"collation_connection\":\"utf8mb4_unicode_ci\"}');

-- --------------------------------------------------------

--
-- Table structure for table `pma__usergroups`
--

CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL,
  `tab` varchar(64) COLLATE utf8_bin NOT NULL,
  `allowed` enum('Y','N') COLLATE utf8_bin NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Table structure for table `pma__users`
--

CREATE TABLE `pma__users` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';

--
-- Indexes for dumped tables
--

--
-- Indexes for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pma__central_columns`
--
ALTER TABLE `pma__central_columns`
  ADD PRIMARY KEY (`db_name`,`col_name`);

--
-- Indexes for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- Indexes for table `pma__designer_settings`
--
ALTER TABLE `pma__designer_settings`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_user_type_template` (`username`,`export_type`,`template_name`);

--
-- Indexes for table `pma__favorite`
--
ALTER TABLE `pma__favorite`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__history`
--
ALTER TABLE `pma__history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- Indexes for table `pma__navigationhiding`
--
ALTER TABLE `pma__navigationhiding`
  ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- Indexes for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  ADD PRIMARY KEY (`page_nr`),
  ADD KEY `db_name` (`db_name`);

--
-- Indexes for table `pma__recent`
--
ALTER TABLE `pma__recent`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__relation`
--
ALTER TABLE `pma__relation`
  ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- Indexes for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- Indexes for table `pma__table_coords`
--
ALTER TABLE `pma__table_coords`
  ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- Indexes for table `pma__table_info`
--
ALTER TABLE `pma__table_info`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Indexes for table `pma__table_uiprefs`
--
ALTER TABLE `pma__table_uiprefs`
  ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- Indexes for table `pma__tracking`
--
ALTER TABLE `pma__tracking`
  ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- Indexes for table `pma__userconfig`
--
ALTER TABLE `pma__userconfig`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__usergroups`
--
ALTER TABLE `pma__usergroups`
  ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- Indexes for table `pma__users`
--
ALTER TABLE `pma__users`
  ADD PRIMARY KEY (`username`,`usergroup`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `pma__history`
--
ALTER TABLE `pma__history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  MODIFY `page_nr` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;--
-- Database: `prueba`
--
CREATE DATABASE IF NOT EXISTS `prueba` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `prueba`;
--
-- Database: `school`
--
CREATE DATABASE IF NOT EXISTS `school` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `school`;

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE `accounts` (
  `id` int(11) NOT NULL,
  `fullname` varchar(200) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `accounts`
--

INSERT INTO `accounts` (`id`, `fullname`, `username`, `password`, `email`) VALUES
(1100, 'admin', 'admin', 'admin', 'admin@email.com'),
(1101, 'root', 'root', 'root', 'root@email.com');

-- --------------------------------------------------------

--
-- Table structure for table `addres`
--

CREATE TABLE `addres` (
  `student_id` int(11) NOT NULL,
  `address_id` int(11) NOT NULL,
  `address_line` varchar(45) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `zip` varchar(45) DEFAULT NULL,
  `states` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `addres`
--

INSERT INTO `addres` (`student_id`, `address_id`, `address_line`, `city`, `zip`, `states`) VALUES
(180876, 180876, 'salvador nava nro 8', 'slp', '78110', 'slp'),
(180877, 180877, 'salvador nava nro 8', 'slp', '78110', 'slp'),
(180878, 180878, 'salvador nava nro 8', 'slp', '78110', 'slp'),
(180882, 180882, 'SALVADOR NAVA NRO 8', 'SAN LUIS POTOSI', '78110', 'SLP'),
(180883, 180883, 'SALVADOR NAVA NRO 8', 'SAN LUIS POTOSI', '78110', 'SLP');

-- --------------------------------------------------------

--
-- Table structure for table `email`
--

CREATE TABLE `email` (
  `email` varchar(100) NOT NULL,
  `student_id` int(11) NOT NULL,
  `email_type` enum('private','public') NOT NULL,
  `created_on` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_on` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `email`
--

INSERT INTO `email` (`email`, `student_id`, `email_type`, `created_on`, `updated_on`) VALUES
('email@email.com', 180876, 'public', '2021-05-02 04:00:00', '2021-05-02 04:00:00'),
('email@email.com', 180877, 'private', '2021-05-02 04:00:00', '2021-05-02 04:00:00'),
('email@email.com', 180878, 'public', '2021-05-04 00:37:27', '2021-05-04 04:00:00'),
('EMAIL@EMAIL.COM', 180882, 'public', '2021-05-04 04:00:00', '2021-05-04 04:00:00'),
('EMAIL@EMAIL.COM', 180883, 'private', '2021-05-04 04:33:10', '2021-05-05 04:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `phone`
--

CREATE TABLE `phone` (
  `phone_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `phone` varchar(30) NOT NULL,
  `phone_type` enum('private','public') NOT NULL,
  `country_code` varchar(5) DEFAULT NULL,
  `area_code` varchar(5) DEFAULT NULL,
  `created_on` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_on` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `phone`
--

INSERT INTO `phone` (`phone_id`, `student_id`, `phone`, `phone_type`, `country_code`, `area_code`, `created_on`, `updated_on`) VALUES
(180876, 180876, '123456789', 'public', '52', '444', '2021-05-02 04:00:00', '2021-05-02 04:00:00'),
(180877, 180877, '123456789', 'public', '52', '444', '2021-05-02 04:00:00', '2021-05-02 04:00:00'),
(180878, 180878, '123456789', 'public', '52', '444', '2021-05-04 00:37:27', '2021-05-04 04:00:00'),
(180882, 180882, '1234567890', 'public', '52', '444', '2021-05-04 04:00:00', '2021-05-04 04:00:00'),
(180883, 180883, '1234567890', 'private', '52', '444', '2021-05-04 04:33:10', '2021-05-05 04:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `student_id` int(11) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `middle_name` varchar(45) DEFAULT NULL,
  `first_name` varchar(45) DEFAULT NULL,
  `gender` enum('M','F') NOT NULL,
  `created_on` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_on` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`student_id`, `last_name`, `middle_name`, `first_name`, `gender`, `created_on`, `updated_on`) VALUES
(180876, 'NAVARRO', 'LAURA', 'NANCY', 'F', '2021-05-02 04:00:00', '2021-05-02 04:00:00'),
(180877, 'RUIZ', 'LUZ', 'LUIS', 'M', '2021-05-02 04:00:00', '2021-05-02 04:00:00'),
(180878, 'NAVARRO', 'LUZ', 'NANCY', 'F', '2021-05-04 00:37:27', '2021-05-04 04:00:00'),
(180882, 'GONZALEZ', 'CARLOS', 'JUAN', 'M', '2021-05-04 04:00:00', '2021-05-04 04:00:00'),
(180883, 'GONZALEZ', 'CARLOS', 'CARLOS', 'M', '2021-05-04 04:33:10', '2021-05-05 04:00:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `addres`
--
ALTER TABLE `addres`
  ADD PRIMARY KEY (`student_id`,`address_id`),
  ADD KEY `student_id` (`student_id`);

--
-- Indexes for table `email`
--
ALTER TABLE `email`
  ADD PRIMARY KEY (`student_id`,`email`),
  ADD KEY `student_id` (`student_id`),
  ADD KEY `email` (`email`);

--
-- Indexes for table `phone`
--
ALTER TABLE `phone`
  ADD PRIMARY KEY (`student_id`,`phone_id`),
  ADD KEY `student_id` (`student_id`),
  ADD KEY `phone_id` (`phone_id`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`student_id`),
  ADD KEY `student_last_name_idx` (`last_name`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `phone`
--
ALTER TABLE `phone`
  MODIFY `phone_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=180887;
--
-- AUTO_INCREMENT for table `student`
--
ALTER TABLE `student`
  MODIFY `student_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=180887;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `addres`
--
ALTER TABLE `addres`
  ADD CONSTRAINT `addres_fk_1` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`) ON DELETE CASCADE;

--
-- Constraints for table `email`
--
ALTER TABLE `email`
  ADD CONSTRAINT `email_fk_1` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`) ON DELETE CASCADE;

--
-- Constraints for table `phone`
--
ALTER TABLE `phone`
  ADD CONSTRAINT `phone_fk_1` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`) ON DELETE CASCADE;
--
-- Database: `sistema`
--
CREATE DATABASE IF NOT EXISTS `sistema` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `sistema`;

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE `accounts` (
  `id` int(11) NOT NULL,
  `fullname` varchar(200) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `accounts`
--

INSERT INTO `accounts` (`id`, `fullname`, `username`, `password`, `email`) VALUES
(18000, 'carlos gonzalez ibarra', 'carlos', 'carlos', 'email@email.com'),
(18000, 'carlos gonzalez ibarra', 'carlos', 'carlos', 'email@email.com');
--
-- Database: `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `test`;

-- --------------------------------------------------------

--
-- Table structure for table `adres`
--

CREATE TABLE `adres` (
  `address_id` int(11) NOT NULL,
  `student_id` int(11) DEFAULT NULL,
  `address_line` varchar(100) COLLATE utf8_bin NOT NULL,
  `city` varchar(45) COLLATE utf8_bin NOT NULL,
  `zip_postcode` varchar(45) COLLATE utf8_bin NOT NULL,
  `state` varchar(45) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `adres`
--

INSERT INTO `adres` (`address_id`, `student_id`, `address_line`, `city`, `zip_postcode`, `state`) VALUES
(1, 180864, 'salvador nava nro 8', 'SLP', '78110', 'SLP');

-- --------------------------------------------------------

--
-- Table structure for table `email`
--

CREATE TABLE `email` (
  `email` varchar(100) COLLATE utf8_bin NOT NULL,
  `student_id` int(11) NOT NULL,
  `email_type` enum('private','public') COLLATE utf8_bin DEFAULT NULL,
  `updated_on` date NOT NULL,
  `created_on` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `email`
--

INSERT INTO `email` (`email`, `student_id`, `email_type`, `updated_on`, `created_on`) VALUES
('jcarlos0284@upslp.edu.mx', 180864, 'private', '2021-05-21', '2021-05-28');

-- --------------------------------------------------------

--
-- Table structure for table `phone`
--

CREATE TABLE `phone` (
  `phone_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `phone` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `phone_type` enum('private','public') COLLATE utf8_bin DEFAULT NULL,
  `country_code` varchar(5) COLLATE utf8_bin NOT NULL,
  `area_code` varchar(5) COLLATE utf8_bin NOT NULL,
  `created_on` date NOT NULL,
  `updated_on` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `phone`
--

INSERT INTO `phone` (`phone_id`, `student_id`, `phone`, `phone_type`, `country_code`, `area_code`, `created_on`, `updated_on`) VALUES
(1, 180864, '1234567890', 'private', '52', '444', '2021-05-28', '2021-05-31');

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `student_id` int(11) NOT NULL,
  `last_name` varchar(45) COLLATE utf8_bin NOT NULL,
  `middle_name` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `first_name` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `gender` enum('masculino','femenino') COLLATE utf8_bin DEFAULT NULL,
  `created_on` date NOT NULL,
  `updated_on` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`student_id`, `last_name`, `middle_name`, `first_name`, `gender`, `created_on`, `updated_on`) VALUES
(180864, 'GONZALEZ', 'LAURA', 'MARIA', 'masculino', '2021-05-28', '2021-05-29');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `student_id` int(11) NOT NULL,
  `address_id` int(11) NOT NULL,
  `created_on` date NOT NULL,
  `updated_on` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `adres`
--
ALTER TABLE `adres`
  ADD PRIMARY KEY (`address_id`),
  ADD KEY `fk_address` (`student_id`);

--
-- Indexes for table `email`
--
ALTER TABLE `email`
  ADD PRIMARY KEY (`email`),
  ADD KEY `fk_email` (`student_id`);

--
-- Indexes for table `phone`
--
ALTER TABLE `phone`
  ADD PRIMARY KEY (`phone_id`),
  ADD KEY `fk_phone` (`student_id`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`student_id`),
  ADD KEY `created_on` (`created_on`),
  ADD KEY `updated_on` (`updated_on`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`student_id`,`created_on`,`updated_on`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `adres`
--
ALTER TABLE `adres`
  ADD CONSTRAINT `fk_address` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `email`
--
ALTER TABLE `email`
  ADD CONSTRAINT `fk_email` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `phone`
--
ALTER TABLE `phone`
  ADD CONSTRAINT `fk_phone` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
