-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 04, 2024 at 04:49 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `nbcollege`
--

-- --------------------------------------------------------

--
-- Table structure for table `admission_users`
--

CREATE TABLE `admission_users` (
  `id` int(11) NOT NULL,
  `course` varchar(50) NOT NULL,
  `student_photo` varchar(255) NOT NULL,
  `father_name` varchar(100) NOT NULL,
  `mother_name` varchar(100) NOT NULL,
  `dob` date NOT NULL,
  `nationality` varchar(50) NOT NULL,
  `gender` varchar(20) NOT NULL,
  `citizenship` varchar(55) NOT NULL,
  `citizenship_photo` varchar(255) NOT NULL,
  `temp_address` text DEFAULT NULL,
  `per_address` text NOT NULL,
  `board10` varchar(50) NOT NULL,
  `year10` varchar(10) NOT NULL,
  `percentage10` varchar(10) NOT NULL,
  `stream10` varchar(50) NOT NULL,
  `board12` varchar(50) NOT NULL,
  `year12` varchar(10) NOT NULL,
  `percentage12` varchar(10) NOT NULL,
  `stream12` varchar(50) NOT NULL,
  `marksheet10` varchar(255) NOT NULL,
  `marksheet12` varchar(255) NOT NULL,
  `declaration` varchar(255) NOT NULL,
  `submission_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `first_name` text NOT NULL,
  `last_name` text NOT NULL,
  `user_results_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admission_users`
--

INSERT INTO `admission_users` (`id`, `course`, `student_photo`, `father_name`, `mother_name`, `dob`, `nationality`, `gender`, `citizenship`, `citizenship_photo`, `temp_address`, `per_address`, `board10`, `year10`, `percentage10`, `stream10`, `board12`, `year12`, `percentage12`, `stream12`, `marksheet10`, `marksheet12`, `declaration`, `submission_date`, `first_name`, `last_name`, `user_results_id`, `user_id`) VALUES
(42, 'bca', 'bishesh.png', 'Bishnu Hari Ganesh', 'Amita Devi Baidhya', '2024-01-31', 'Nepali', 'male', '28973274115', 'citizenship.jpg', 'Imadol', 'Dupat', 'NEB', '2075', '90', 'Science', 'NEB', '2078', '95', 'Science', 'Screenshot_2022-01-08-22-39-41-674_com (9).jpg', 'IMG_20220108_224139.jpg', 'BisheshGaneshShrestha', '2024-02-29 15:07:31', 'Bishesh', 'Shrestha', 11, 9),
(43, 'bsccsit', 'nikil.png', 'Ram hari', 'Rampyari nanda', '2024-02-07', 'Nepali', 'male', '25173271236', 'Screenshot 2024-02-26 184847.png', 'Thecho', 'Thecho', 'NEB', '2075', '80', 'Science', 'NEB', '2078', '85', 'Science', '2022-07-30 (1).png', '2022-07-30.png', 'Neekeel', '2024-02-29 15:25:37', 'Nikil', 'Maharjan', 1, 4),
(46, 'bca', 'rakesh.png', 'Rajnikanth Kumar', 'Ramita Shahe', '2024-03-01', 'Nepal', 'others', '21972274216', 'Screenshot_2022-01-08-22-14-13-615_com.f1soft.esewa.jpg', 'Sundhara-05', 'Sindhuli ', 'NEB', '2075', '80', 'mngmt', 'NEB', '2078', '75', 'mgmt', 'IMG_20220107_202156.jpg', '2022-01-07.png', 'Rakesh', '2024-03-13 09:52:21', 'Rakesh', 'Kumar', 13, 12),
(48, 'bca', 'bishesh.png', 'John', 'Rami', '2024-05-27', 'Nepal', 'female', '28973274115', 'bishesh.jpg', 'Imadol', 'Imadol', 'NEB', '2075', '90', 'Science', 'NEB', '2078', '95', 'Science', 'java.jpg', 'admission.png', 'Jack', '2024-05-27 03:06:46', 'Jack', 'abc', 21, 14),
(49, 'bsccsit', 'bishesh.png', 'Bipin Thapa', 'Saraswati Gurung', '2024-12-04', 'Nepal', 'male', '19192837461', 'bishesh.png', 'KTM', 'KTM', 'NEB', '2075', '80', 'Science', 'NEB', '2078', '88', 'Science', '1717061213330.jpg', '1717061213330.jpg', 'Swastik', '2024-12-04 14:49:00', 'Swastik', 'Thapaliya', 23, 15);

-- --------------------------------------------------------

--
-- Table structure for table `admitted_users`
--

CREATE TABLE `admitted_users` (
  `id` int(11) NOT NULL,
  `admission_users_id` int(11) NOT NULL,
  `mode_of_payment` varchar(50) NOT NULL,
  `transaction_date` date NOT NULL,
  `fee_amount` decimal(10,2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admitted_users`
--

INSERT INTO `admitted_users` (`id`, `admission_users_id`, `mode_of_payment`, `transaction_date`, `fee_amount`, `created_at`) VALUES
(22, 43, 'khalti', '2024-03-26', 50000.00, '2024-03-26 15:02:56'),
(26, 48, 'khalti', '2024-05-27', 100000.00, '2024-05-27 03:13:38'),
(27, 42, 'khalti', '2024-06-01', 50000.00, '2024-06-01 17:56:24');

-- --------------------------------------------------------

--
-- Table structure for table `applicants`
--

CREATE TABLE `applicants` (
  `id` int(11) NOT NULL,
  `course` varchar(50) NOT NULL,
  `fullname` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `address` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `applicants`
--

INSERT INTO `applicants` (`id`, `course`, `fullname`, `email`, `phone`, `address`) VALUES
(1, 'bca', 'Bishesh Shrestha', 'unikbisheshshrestha12@gmail.com', '9813938152', 'Imadol'),
(3, 'bca', 'Neha Maharjan', 'neha@gmail.com', '9864424270', 'Gwarko'),
(11, 'csit', 'Niraj Saud', 'nirajsaud1110@gmail.com', '9810202020', 'Imadol');

-- --------------------------------------------------------

--
-- Table structure for table `appstatus`
--

CREATE TABLE `appstatus` (
  `id` int(11) NOT NULL,
  `status` varchar(50) NOT NULL,
  `remark` text NOT NULL,
  `fee` decimal(10,2) NOT NULL,
  `admission_users_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `appstatus`
--

INSERT INTO `appstatus` (`id`, `status`, `remark`, `fee`, `admission_users_id`) VALUES
(22, 'rejected', 'Sorry, you are not selected for admission !', 0.00, 46),
(39, 'selected', 'Congratulations you are selected for admission.', 50000.00, 43),
(43, 'selected', 'Congrats', 100000.00, 48),
(44, 'selected', 'Congrats', 50000.00, 42);

-- --------------------------------------------------------

--
-- Table structure for table `reports`
--

CREATE TABLE `reports` (
  `report_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reports`
--

INSERT INTO `reports` (`report_id`, `name`, `email`, `message`, `created_at`) VALUES
(1, 'Bishesh Shrestha', 'bisheshganeshshrestha.078@kathford.edu.np', 'Admission price?', '2024-03-17 06:50:48'),
(12, 'Neha Maharjan', 'maharjanneha44@gmail.com', 'Where is the college location?', '2024-03-17 18:23:48'),
(14, 'Niraj Saud', 'nirajsaud1110@gmail.com', 'How to get admission?', '2024-03-27 08:41:37');

-- --------------------------------------------------------

--
-- Table structure for table `test_questions`
--

CREATE TABLE `test_questions` (
  `question` text NOT NULL,
  `option1` text NOT NULL,
  `option2` text NOT NULL,
  `option3` text NOT NULL,
  `option4` text NOT NULL,
  `correct_answer` text NOT NULL,
  `ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `test_questions`
--

INSERT INTO `test_questions` (`question`, `option1`, `option2`, `option3`, `option4`, `correct_answer`, `ID`) VALUES
('Which data structure uses FIFO approach?', 'Stack', 'Queue', 'Tree', 'Array', '2', 1),
('What is the binary equivalent of decimal number 15?', '1010', '1100', '1111', '1001', '3', 2),
('Which protocol is used to send emails over the Internet?', 'SMTP', 'HTTP', 'FTP', 'TCP', '1', 3),
('Which of the following is an example of RDMS?', 'MySQL', 'MongoDB', 'Apache', 'Python', '1', 4),
('What does acronym SQL stand for?', 'Structured Query Language', 'Simple Query Language', 'Systematic Query Language', 'Structured Query Logic', '1', 5),
('What is the purpose of firewall in computer networks?', 'To protect against unauthorized access', 'To improve network speed', 'To enhance data storage capacity', 'To enhance user experience', '1', 6),
('Which computer component is responsible for storing data long-term? ', 'Hard disk drive', 'Random Access Memory (RAM)', 'Graphics Processing Unit (GPU)', 'Central Processing Unit (CPU)', '1', 7),
('Which of the following is an example of high level programming language?', 'Assembly Language', 'Machine Language', 'Java', 'Binary code', '3', 8),
('What is the purpose of IP address?', 'To provide internet access', 'To encrypt data transmissions', 'To perform data backups', 'To uniquely identify a device on a network', '4', 9),
('Which protocol is used for secure communication over the Internet?', 'HTTPS', 'FTP', 'SNMP', 'SMTP', '1', 10);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `fullname` varchar(55) NOT NULL,
  `number` varchar(10) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`fullname`, `number`, `email`, `password`, `ID`) VALUES
('Bishesh Ganesh Shrestha', '9813938152', 'unikbisheshshrestha12@gmail.com', '$2y$10$t0RkyMjogetDBkAERQ/aWeCuPfxQUW6eLUJva/T1yWyQ6l07CQC6y', 3),
('Nikil Maharjan', '9865585184', 'nikilmrz2060@gmail.com', '$2y$10$bd.Zcp.8Ii1KBPOcssAR5OSw3QSsgcLd57Faw23aLcZwi0hYCimLm', 4),
('Suwas Sir', '9800000000', 'suwas@gmail.com', '$2y$10$XJxHoax2AXq3GsqdrHtwFOSUwkjg6PW9jesJQoAGN8K9IKoXWIcDS', 5),
('sagar silwal', '9803356153', 'silwalsagars4@gmail.com', '$2y$10$oirs0IEzjTy5AyPFjDc3v.mq71mJjLDB3x.NTpt1se6RxUw5lEd7y', 6),
('Neha Maharjan', '9862434270', 'neha@gmail.com', '$2y$10$zBvnjGPpaCqy7maUnPVFVek8CN1D5vUBxEcNBsnvBL9cpfwnKUpJ6', 7),
('Bishesh Shrestha', '9862213521', 'bishesh@gmail.com', '$2y$10$Xd.xNcmHBENaV9ruIewie.tk.BKbRgjdhrfM7tYIVdZlukPG8R5ua', 9),
('Anu Shrestha', '9818377537', 'anu@gmail.com', '$2y$10$/rjkX9l6iJrNHiy/Teqm8OdDtliVAWQkUlSQ783KtxjIQNbP/DCiy', 10),
('Rakesh Kumar', '9809191731', 'rakesh@gmail.com', '$2y$10$Ehr906Lp9O/XOnHftcC4zOoeCwkKAK3KWJwhaNSz58HBHiKQIsXwW', 12),
('123', '9812000000', 'abc@gmail', '$2y$10$BvYRdkq4m6dr.i1Kitq9c.KzRE.V2HEZsENX3IkJRZ/2t1S3Y2L4i', 13),
('Jack ABC', '9801000000', 'jack@gmail.com', '$2y$10$TrM2siZHcFzpbfsp/ElfZu2AVa4zyjWl7OoxaK06.mNfoiszNDCaa', 14),
('Swastik Thapaliya', '9809090912', 'swastik@gmail.com', '$2y$10$shxMTQ4d1K.3jPt1TBNtZuJ5MEQA55RVONtloxxB/Jb7ciFcBKnbi', 15);

-- --------------------------------------------------------

--
-- Table structure for table `user_results`
--

CREATE TABLE `user_results` (
  `ID` int(11) NOT NULL,
  `email` text DEFAULT NULL,
  `total_marks` int(11) DEFAULT NULL,
  `user_responses` text DEFAULT NULL,
  `username` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_results`
--

INSERT INTO `user_results` (`ID`, `email`, `total_marks`, `user_responses`, `username`) VALUES
(1, 'nikilmrz2060@gmail.com', 9, '{\"1\":\"2\",\"2\":\"3\",\"3\":\"1\",\"4\":\"1\",\"5\":\"1\",\"6\":\"1\",\"7\":\"1\",\"8\":\"3\",\"9\":\"4\",\"10\":\"2\"}', 'nikil'),
(2, 'unikbisheshshrestha12@gmail.com', 3, '{\"1\":\"2\",\"2\":\"3\",\"3\":\"4\",\"4\":\"1\",\"5\":\"4\",\"6\":\"4\",\"7\":\"4\",\"8\":\"3\",\"9\":\"3\",\"10\":\"3\"}', 'bishesh10'),
(11, 'bishesh@gmail.com', 10, '{\"1\":\"1\",\"2\":\"3\",\"3\":\"1\",\"4\":\"1\",\"5\":\"1\",\"6\":\"1\",\"7\":\"1\",\"8\":\"3\",\"9\":\"4\",\"10\":\"1\"}', 'bishesh'),
(13, 'rakesh@gmail.com', 10, '{\"1\":\"2\",\"2\":\"3\",\"3\":\"1\",\"4\":\"1\",\"5\":\"1\",\"6\":\"1\",\"7\":\"1\",\"8\":\"3\",\"9\":\"4\",\"10\":\"1\"}', 'Rakesh'),
(21, 'jack@gmail.com', 9, '{\"1\":\"2\",\"2\":\"3\",\"3\":\"1\",\"4\":\"1\",\"5\":\"1\",\"6\":\"1\",\"7\":\"1\",\"8\":\"3\",\"9\":\"1\",\"10\":\"1\"}', 'jack'),
(22, 'anu@gmail.com', 8, '{\"1\":\"1\",\"2\":\"3\",\"3\":\"1\",\"4\":\"1\",\"5\":\"1\",\"6\":\"1\",\"7\":\"1\",\"8\":\"3\",\"9\":\"1\",\"10\":\"1\"}', 'anu'),
(23, 'swastik@gmail.com', 10, '{\"1\":\"2\",\"2\":\"3\",\"3\":\"1\",\"4\":\"1\",\"5\":\"1\",\"6\":\"1\",\"7\":\"1\",\"8\":\"3\",\"9\":\"4\",\"10\":\"1\"}', 'swastik_thapaliya');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admission_users`
--
ALTER TABLE `admission_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_user_results` (`user_results_id`),
  ADD KEY `fk_admission_users` (`user_id`);

--
-- Indexes for table `admitted_users`
--
ALTER TABLE `admitted_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `admission_users_id` (`admission_users_id`);

--
-- Indexes for table `applicants`
--
ALTER TABLE `applicants`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `appstatus`
--
ALTER TABLE `appstatus`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_admission_users_id` (`admission_users_id`);

--
-- Indexes for table `reports`
--
ALTER TABLE `reports`
  ADD PRIMARY KEY (`report_id`);

--
-- Indexes for table `test_questions`
--
ALTER TABLE `test_questions`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `user_results`
--
ALTER TABLE `user_results`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admission_users`
--
ALTER TABLE `admission_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `admitted_users`
--
ALTER TABLE `admitted_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `applicants`
--
ALTER TABLE `applicants`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `appstatus`
--
ALTER TABLE `appstatus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `reports`
--
ALTER TABLE `reports`
  MODIFY `report_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `test_questions`
--
ALTER TABLE `test_questions`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `user_results`
--
ALTER TABLE `user_results`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `admission_users`
--
ALTER TABLE `admission_users`
  ADD CONSTRAINT `fk_admission_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`ID`),
  ADD CONSTRAINT `fk_user_results` FOREIGN KEY (`user_results_id`) REFERENCES `user_results` (`ID`);

--
-- Constraints for table `admitted_users`
--
ALTER TABLE `admitted_users`
  ADD CONSTRAINT `admitted_users_ibfk_1` FOREIGN KEY (`admission_users_id`) REFERENCES `admission_users` (`id`);

--
-- Constraints for table `appstatus`
--
ALTER TABLE `appstatus`
  ADD CONSTRAINT `FK_admission_users_id` FOREIGN KEY (`admission_users_id`) REFERENCES `admission_users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
