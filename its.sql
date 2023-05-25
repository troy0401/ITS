-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: May 25, 2023 at 06:57 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 7.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `its`
--

-- --------------------------------------------------------

--
-- Table structure for table `account`
--

CREATE TABLE `account` (
  `accnt_id` int(11) NOT NULL,
  `accnt_user` varchar(255) NOT NULL,
  `accnt_pass` varchar(255) NOT NULL,
  `accnt_name` varchar(45) NOT NULL,
  `accnt_type` int(11) NOT NULL COMMENT '1=prof, 2=student'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `account`
--

INSERT INTO `account` (`accnt_id`, `accnt_user`, `accnt_pass`, `accnt_name`, `accnt_type`) VALUES
(1, 'new_stud@yahoo.com', '$2y$10$VjQ5jENEqlDW60ww3lBJ4OLffR2M50py4whgymZm6Mmg8yJyqFH2G', 'New Student', 2),
(2, 'prof@yahoo.com', '$2y$10$lqMGbxUnkXIqMrkFOY1WF.WMfpi61bXQJC8.DY.9bgXO824u//Sou', 'Professor', 1),
(3, 'new_stud2@yahoo.com', '$2y$10$nGcw0xOt/cNBnpzd0LQVHOZhY7kvvIz037J5AKwdl0hUxr1FWfbnm', 'New Student 2', 2);

-- --------------------------------------------------------

--
-- Table structure for table `exam`
--

CREATE TABLE `exam` (
  `exam_id` int(11) NOT NULL,
  `subj_id` int(11) NOT NULL,
  `accnt_id` int(11) NOT NULL,
  `exam_type` int(11) NOT NULL COMMENT '1=summative exam (5 attempts 10 items [7/10 passing score]), 2=subtopic exam (1 attempt [20 items]),\r\n3=final summative exam(if 5 subtopics have been taken, passed or failed.) ',
  `exam_status` int(11) NOT NULL COMMENT '0=unlocked 1=locked',
  `exam_trial` int(11) NOT NULL COMMENT 'number of attempts',
  `exam_set_trial` int(11) NOT NULL COMMENT 'number of allowable attempts'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `exam`
--

INSERT INTO `exam` (`exam_id`, `subj_id`, `accnt_id`, `exam_type`, `exam_status`, `exam_trial`, `exam_set_trial`) VALUES
(1, 1, 1, 1, 0, 5, 10);

-- --------------------------------------------------------

--
-- Table structure for table `exam_settings`
--

CREATE TABLE `exam_settings` (
  `exam_set_ID` int(11) NOT NULL,
  `exam_set_Type` varchar(11) NOT NULL COMMENT '1=practice 2=summative',
  `exam_set_Time` int(11) NOT NULL COMMENT 'duration (minutes)',
  `exam_set_Items` int(11) NOT NULL COMMENT 'number of items',
  `subj_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `exam_settings`
--

INSERT INTO `exam_settings` (`exam_set_ID`, `exam_set_Type`, `exam_set_Time`, `exam_set_Items`, `subj_id`) VALUES
(1, 'Practice', 600, 10, 1),
(2, 'Summative', 1200, 30, 1),
(3, 'Practice', 600, 10, 2),
(4, 'Summative', 1200, 30, 2),
(5, 'Practice', 600, 10, 3),
(6, 'Summative', 1200, 30, 3);

-- --------------------------------------------------------

--
-- Table structure for table `lesson_status`
--

CREATE TABLE `lesson_status` (
  `ls_id` int(11) NOT NULL,
  `subj_id` int(11) NOT NULL,
  `accnt_id` int(11) NOT NULL,
  `ls_status` int(11) NOT NULL COMMENT '1=subtopic is finished'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `lesson_status`
--

INSERT INTO `lesson_status` (`ls_id`, `subj_id`, `accnt_id`, `ls_status`) VALUES
(1, 1, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `scores`
--

CREATE TABLE `scores` (
  `score_id` int(11) NOT NULL,
  `subj_id` int(11) NOT NULL,
  `accnt_id` int(11) NOT NULL,
  `num_of_items` int(11) NOT NULL COMMENT 'number of items per quiz',
  `score` int(11) NOT NULL COMMENT 'total correct answer'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `subject`
--

CREATE TABLE `subject` (
  `subj_id` int(11) NOT NULL,
  `subj_name` varchar(255) NOT NULL,
  `subj_desc` text NOT NULL,
  `subj_file` text NOT NULL COMMENT 'link of learning resources'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `subject`
--

INSERT INTO `subject` (`subj_id`, `subj_name`, `subj_desc`, `subj_file`) VALUES
(1, 'Subtopic 1', 'Description1', 'https://www.youtube.com/watch?v=cvhyJT9c0ac'),
(2, 'Subtopic 2', 'Description 2', 'https://www.youtube.com/watch?v=SwaVN0epc0w'),
(3, 'dhgfhgfg', 'rhtfhf', 'ygjjjhk');

-- --------------------------------------------------------

--
-- Table structure for table `test_quest`
--

CREATE TABLE `test_quest` (
  `testq_id` int(11) NOT NULL,
  `subj_id` int(11) NOT NULL,
  `testq_0` text NOT NULL COMMENT 'Question',
  `testq_1` text NOT NULL,
  `testq_2` text NOT NULL,
  `testq_3` text NOT NULL,
  `testq_4` text NOT NULL,
  `testq_ans` text NOT NULL COMMENT 'right answer',
  `testq_hint` text NOT NULL COMMENT 'hint for every wrong answer'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `test_quest`
--

INSERT INTO `test_quest` (`testq_id`, `subj_id`, `testq_0`, `testq_1`, `testq_2`, `testq_3`, `testq_4`, `testq_ans`, `testq_hint`) VALUES
(1, 1, 'Suppose we have a sample of the heights of Davis students and want to use the sample mean to get a confidence interval for the mean height in the population. Which of the following would increase the width of this confidence interval?', 'Switching from a 95% confidence interval to a 90% confidence interval.', ' Increasing the sample size used to calculate the sample mean.', ' Switching from a 95% confidence interval to a 99% confidence interval.', 'All of the above.', 'The R2 for the regression will either stay the same or increase.', 'The smaller we make α, the wider our confidence interval will get. A larger sample size would make the confidence interval narrower.'),
(2, 1, 'Suppose we have a sample of the heights of Davis students and want to use the sample mean to get a confidence interval for the mean height in the population. Which of the following would increase the width of this confidence interval?', ' Switching from a 95% confidence interval to a 90% confidence interval.', 'Increasing the sample size used to calculate the sample mean.', 'Switching from a 95% confidence interval to a 99% confidence interval.', 'All of the above.', 'Switching from a 95% confidence interval to a 99% confidence interval.', 'The smaller we make α, the wider our confidence interval will get. A larger sample size would make the confidence interval narrower.');

-- --------------------------------------------------------

--
-- Table structure for table `test_report`
--

CREATE TABLE `test_report` (
  `testR_id` int(11) NOT NULL,
  `testR_status` int(11) NOT NULL COMMENT '1=right answer 2=wrong answer',
  `testR_time_quest` varchar(255) NOT NULL COMMENT 'time spent per question',
  `testq_id` int(11) NOT NULL,
  `accnt_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `views`
--

CREATE TABLE `views` (
  `views_id` int(11) NOT NULL,
  `subj_id` int(11) NOT NULL,
  `accnt_id` int(11) NOT NULL,
  `view_stat` int(11) NOT NULL COMMENT '0=not seen 1=viewed'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`accnt_id`);

--
-- Indexes for table `exam`
--
ALTER TABLE `exam`
  ADD PRIMARY KEY (`exam_id`),
  ADD KEY `subj_id` (`subj_id`),
  ADD KEY `accnt_id` (`accnt_id`);

--
-- Indexes for table `exam_settings`
--
ALTER TABLE `exam_settings`
  ADD PRIMARY KEY (`exam_set_ID`),
  ADD KEY `subj_id` (`subj_id`);

--
-- Indexes for table `lesson_status`
--
ALTER TABLE `lesson_status`
  ADD PRIMARY KEY (`ls_id`),
  ADD KEY `subj_id` (`subj_id`),
  ADD KEY `accnt_id` (`accnt_id`);

--
-- Indexes for table `scores`
--
ALTER TABLE `scores`
  ADD PRIMARY KEY (`score_id`),
  ADD KEY `subj_id` (`subj_id`),
  ADD KEY `accnt_id` (`accnt_id`);

--
-- Indexes for table `subject`
--
ALTER TABLE `subject`
  ADD PRIMARY KEY (`subj_id`);

--
-- Indexes for table `test_quest`
--
ALTER TABLE `test_quest`
  ADD PRIMARY KEY (`testq_id`),
  ADD KEY `subj_id` (`subj_id`);

--
-- Indexes for table `test_report`
--
ALTER TABLE `test_report`
  ADD PRIMARY KEY (`testR_id`),
  ADD KEY `testq_id` (`testq_id`),
  ADD KEY `accnt_id` (`accnt_id`);

--
-- Indexes for table `views`
--
ALTER TABLE `views`
  ADD PRIMARY KEY (`views_id`),
  ADD KEY `subj_id` (`subj_id`),
  ADD KEY `accnt_id` (`accnt_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `account`
--
ALTER TABLE `account`
  MODIFY `accnt_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `exam`
--
ALTER TABLE `exam`
  MODIFY `exam_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `exam_settings`
--
ALTER TABLE `exam_settings`
  MODIFY `exam_set_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `lesson_status`
--
ALTER TABLE `lesson_status`
  MODIFY `ls_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `scores`
--
ALTER TABLE `scores`
  MODIFY `score_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subject`
--
ALTER TABLE `subject`
  MODIFY `subj_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `test_quest`
--
ALTER TABLE `test_quest`
  MODIFY `testq_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `test_report`
--
ALTER TABLE `test_report`
  MODIFY `testR_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `views`
--
ALTER TABLE `views`
  MODIFY `views_id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
