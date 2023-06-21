-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: sql107.infinityfree.com
-- Generation Time: Jun 21, 2023 at 01:13 AM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 7.2.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `if0_34401250_its`
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
  `accnt_type` int(11) NOT NULL COMMENT '1=prof, 2=student',
  `accnt_img` text NOT NULL COMMENT 'account profile'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `account`
--

INSERT INTO `account` (`accnt_id`, `accnt_user`, `accnt_pass`, `accnt_name`, `accnt_type`, `accnt_img`) VALUES
(2, 'prof@gmail.com', '$2y$10$Fik76pO.IvKhxoq0f6HMv.C5fSrptLD9I9Ubv7pv9kBYKlFDAtMCC', 'Professor', 1, 'Screenshot_from_2023-04-18_13-06-21.png'),
(4, 'admin@yahoo.com', '$2y$10$EhweeFiasnPTQJY58BS.J.R3xWeafw6OHurFdqaGbyJX62hEIfr/2', 'admin', 3, 'Screenshot_from_2023-04-18_13-06-26.png'),
(8, '202011087@fit.edu.ph', '$2y$10$G7HDGldf6iMq.nHsBkWAN.i5t0JvLMLME83cbnQ9VVuyz2Kj5jBIu', 'Francis Niño Santos', 2, 'avatar.png'),
(9, 'john@yahoo.com', '$2y$10$mXOy57pkuTRUjqubR6btGO7KFDZNqimKd5hcbKgjd1PmrnxIj41Ni', 'John Florenz Reyes', 2, 'images_(5).jpg'),
(10, 'kir24vin@gmail.com', '$2y$10$TVmTKCVIw6wExCXIIpAvO.P6G4HQgugljcltl5XFIl3mrtcTR/yTi', 'Marvin Malig', 2, '339146515_931518308047079_24194902104718305_n.jpg'),
(11, 'abelgomez01530@gmail.com', '$2y$10$COnDrA.V4g/eIQzhYSRGT.1zreT9/o7C6HuJakgC0EYtERX0pT/Va', 'Abel Gomez', 2, 'avatar.png'),
(12, 'kavapo7057@rockdian.com', '$2y$10$CV9HokJ84MJ7UKGV1ZXJCOrEtxhB0R.mnVcy79FAxI/I2IDOgj.s.', 'Johnny', 2, 'avatar.png'),
(13, 'dioshuadalugdugan@gmail.com', '$2y$10$YcI2x7DSTcRzmKpUmh.WfucAIhxT1WjCnjSdRYU9hj3TVhG.9LmPe', 'Dioshua', 2, 'avatar.png'),
(14, 'miguelohara@gmail.com', '$2y$10$BQZsjvxrxvIEW4s1eyDm6O5MsuRHxL.0Jk5cqbyikFyCEUfG1aICq', 'Art Bautista ', 2, 'avatar.png'),
(15, 'rikexis338@pyadu.com', '$2y$10$JIfzKdX7kqlclxYamqajMeaLHwHUqU6VfwnSJbPe6VXL8j9ft25Jy', 'John Dominic S. Contreras', 2, 'avatar.png'),
(16, 'markbantayao3@gmail.com', '$2y$10$HZ1uONJr.ziYAbYM9NM04uslWEY01mFb.9l2ncDv1MRrF6uEem4cG', 'Mark yohann bantayao', 2, 'avatar.png'),
(17, 'deannesantos69@gmail.com', '$2y$10$ezIDfG5eaNtW9rZ0wVVUKO6/AXHAA2AwOcqcwwfneeINy1Drl66/y', 'Deanne Santos', 2, 'avatar.png'),
(18, 'Pedro@gmail.com', '$2y$10$eF26wjaJNd3uR696zDZmBeoByGAUy6EhJ7FM5Voov0BIix4E5QE.C', 'Pedro Pinagpala', 2, 'avatar.png'),
(19, 'cleaffordqwe@gmail.com', '$2y$10$RSC6xeueDFyiY6wHQVCBgeE4h9ZvO1oj/awIVAak4A.UgZWazlRaq', 'Nino Rocamora', 2, 'avatar.png'),
(20, 'cangcoshane@gmail.com', '$2y$10$gtXv2kHQcBqqOVyQQUNwrunNA1bPjf/9uv5qS/DLs37wqB8en/wUy', 'Francez Shane Cangco', 2, 'avatar.png'),
(21, 'allan@gmail.com', '$2y$10$Z.no7MdpfbtZVWM2NTA/ve0ukYJSqYSHkgZI52u9ySRpqR9RrbvBa', 'Allan Magtibay', 2, 'akaseakari_official_342579606_247658800975361_758492408096546103_n.jpg'),
(22, '202010306@fit.edu.ph', '$2y$10$aYviu4tvP9ocvNuu2//ItOtgnwrRlufzW7gsZ/fQcVcaaz5rmd3lu', 'Noriel Joy Embudo', 2, 'avatar.png'),
(23, '202010039@fit.edu.ph', '$2y$10$JcAQa1M4rziBmPUoPw3Gg.mDoK2omM96ECsqqkWa1Xot.Bg5E4KE6', 'Kenneth Lim', 2, 'avatar.png'),
(24, 'Test1@gmail.com', '$2y$10$3k5ST19xVVj6NNI/yTiVfeMI/pz.DY3QRNvnWBbwhb7gtrjYPLIRy', 'Professor Name', 1, 'avatar.png'),
(25, 'prof2@gmail.com', '$2y$10$s2agKD47JAj1AO6sOyS1LehQC3Ad2HHM6lgreP27KEvFaeAXdfHg.', 'prof2', 1, 'avatar.png'),
(26, 'new_stud3@gmail.com', '$2y$10$HSbriStv83nytgIHcTy/N.FxV9kVUxr2udUvr9txHBXzyNBbSpt0i', 'new_stud3', 3, 'avatar.png'),
(28, 'john1@yahoo.com', '$2y$10$t9YvyLloZwOt6XjKSgOfdO/38jC0Ag4xsKON7FHh.O7KSccjmWiLu', 'john', 2, 'avatar.png'),
(29, 'jd@user.com', '$2y$10$.uGHhXE9kWdGUOkHHHu7Cem34hlWugX/zYx5M16LILdXuubMV16wW', 'John Doe', 2, 'avatar.png'),
(30, 'jd@user.com', '$2y$10$7F4m4lL6tIWxZtiTB5Sa3eGJbhatkysQbWk2tQ1q1z4jaBWEfFUVO', 'John Doe', 2, 'avatar.png'),
(31, 'NEW@gmail.com', '$2y$10$xMQ3O5yYsKiMI6Z.qngxiOuqpERfA9dRPWpS.RI1lLXqgJOMVZ/8m', 'NEW USER', 2, 'avatar.png'),
(32, 'teststudent@gmail.com', '$2y$10$gLTPG82e6q5L1fgYNdPc0ednoZ5OPppiSD0Ty08RNNvc7dEpal7ii', 'Test Student1', 2, 'avatar.png'),
(33, 'malasagaelisa@gmail.com', '$2y$10$1Wtz.C764X7broGqYwi34ulz7u.yY7ddZeGpceogZTdfuoSP9jNwm', 'ELISA MALASAGA', 2, 'avatar.png'),
(34, 'test_student3@gmail.com', '$2y$10$Fg.hffNmKDyXKNn0tn1FxOzYAcrBO4rp.YSnGzdzrlpWhfY2JbmK6', 'Test Student 3', 2, 'avatar.png'),
(35, 'fekofin205@anomgo.com', '$2y$10$GSbXBJ1vfht05716RE6m4uVappbFVp5WUdW1zf87YugQsiGOcwBIi', 'Cristian', 2, 'avatar.png'),
(36, 'johnwick@gmail.com', '$2y$10$WWhC3CcJmz3KCmbK8RxaQuLDN.8RGrdd3M1wEXazIJpxWBrSjlLSS', 'john wick ll', 2, 'avatar.png');

-- --------------------------------------------------------

--
-- Table structure for table `constraints`
--

CREATE TABLE `constraints` (
  `const_ID` int(11) NOT NULL,
  `testq_id` int(11) NOT NULL,
  `subj_id` int(11) NOT NULL,
  `const` text NOT NULL,
  `feed` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `exam`
--

CREATE TABLE `exam` (
  `exam_id` int(11) NOT NULL,
  `subj_id` int(11) NOT NULL,
  `accnt_id` int(11) NOT NULL,
  `exam_type` int(11) NOT NULL COMMENT '1=practice exam (5 attempts 10 items [7/10 passing score]), 2=subtopic exam (1 attempt [20 items]),\r\n3=final summative exam(if 5 subtopics have been taken, passed or failed.) ',
  `exam_status` int(11) NOT NULL COMMENT '0=unlocked 1=locked',
  `exam_trial` varchar(11) NOT NULL COMMENT 'number of attempts',
  `exam_set_trial` varchar(11) NOT NULL COMMENT 'number of allowable attempts'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `exam`
--

INSERT INTO `exam` (`exam_id`, `subj_id`, `accnt_id`, `exam_type`, `exam_status`, `exam_trial`, `exam_set_trial`) VALUES
(1, 1, 13, 1, 1, '1', '10'),
(2, 1, 8, 1, 0, '1', '10'),
(3, 1, 13, 2, 1, '1', '1'),
(4, 2, 13, 1, 1, '1', '10'),
(5, 2, 13, 2, 1, '1', '1'),
(6, 3, 13, 1, 1, '1', '10'),
(7, 3, 13, 2, 1, '1', '1'),
(8, 4, 13, 1, 1, '1', '10'),
(9, 4, 13, 2, 1, '1', '1'),
(10, 5, 13, 1, 1, '3', '10'),
(11, 5, 13, 2, 1, '1', '1'),
(12, 1, 9, 0, 0, '0', '10'),
(13, 1, 34, 0, 0, '0', '10'),
(14, 1, 35, 1, 0, '1', '10'),
(15, 1, 36, 1, 1, '3', '10'),
(16, 1, 36, 2, 1, '1', '1'),
(17, 2, 36, 1, 1, '1', '10'),
(18, 2, 36, 2, 1, '1', '1'),
(19, 3, 36, 1, 1, '1', '10'),
(20, 3, 36, 2, 1, '1', '1'),
(21, 4, 36, 1, 1, '1', '10'),
(22, 4, 36, 2, 1, '1', '1'),
(23, 5, 36, 1, 1, '2', '10'),
(24, 5, 36, 2, 1, '1', '1');

-- --------------------------------------------------------

--
-- Table structure for table `exam_settings`
--

CREATE TABLE `exam_settings` (
  `exam_set_ID` int(11) NOT NULL,
  `exam_set_Type` int(11) NOT NULL COMMENT '1=practice 2=summative',
  `exam_set_Time` int(11) NOT NULL COMMENT 'duration (minutes)',
  `exam_set_Items` int(11) NOT NULL COMMENT 'number of items',
  `subj_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `exam_settings`
--

INSERT INTO `exam_settings` (`exam_set_ID`, `exam_set_Type`, `exam_set_Time`, `exam_set_Items`, `subj_id`) VALUES
(1, 1, 600, 10, 1),
(2, 2, 1200, 20, 1),
(3, 1, 600, 10, 2),
(4, 2, 1200, 20, 2),
(5, 1, 600, 10, 3),
(6, 2, 1200, 20, 3),
(7, 1, 600, 10, 4),
(8, 2, 1200, 20, 4),
(9, 1, 600, 10, 5),
(10, 2, 1200, 20, 5);

-- --------------------------------------------------------

--
-- Table structure for table `finals`
--

CREATE TABLE `finals` (
  `finals_ID` int(11) NOT NULL,
  `accnt_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `finals`
--

INSERT INTO `finals` (`finals_ID`, `accnt_id`) VALUES
(1, 13),
(2, 36);

-- --------------------------------------------------------

--
-- Table structure for table `finals_report`
--

CREATE TABLE `finals_report` (
  `fr_ID` int(11) NOT NULL,
  `fr_studAns` text NOT NULL COMMENT 'answer',
  `fr_testStat` text NOT NULL COMMENT '1=right answer 0=wrong answer',
  `fr_TimeQuest` text NOT NULL COMMENT 'time per quest',
  `finals_Items` int(11) NOT NULL,
  `testq_id` int(11) NOT NULL,
  `accnt_id` int(11) NOT NULL,
  `finals_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `finals_report`
--

INSERT INTO `finals_report` (`fr_ID`, `fr_studAns`, `fr_testStat`, `fr_TimeQuest`, `finals_Items`, `testq_id`, `accnt_id`, `finals_ID`) VALUES
(1, 'fdsafdsafdafdaf', '2', '00:00:11', 50, 18, 13, 1),
(2, 'fdafdsaf', '2', '00:00:48', 50, 13, 13, 1),
(3, 'fdsafdsafdsa', '2', '00:00:01', 50, 14, 13, 1),
(4, 'Avoiding concurrency problems', '2', '00:00:02', 50, 10, 13, 1),
(5, 'Allowing multiple threads of execution within an application', '1', '00:00:01', 50, 1, 13, 1),
(6, 'fdsafdsafdsa', '2', '00:00:01', 50, 15, 13, 1),
(7, 'fdsafdsafdsa', '2', '00:00:01', 50, 17, 13, 1),
(8, 'fdsafdsafdsa', '2', '00:00:01', 50, 20, 13, 1),
(9, 'fdsafdasfdsa', '2', '00:00:01', 50, 11, 13, 1),
(10, 'Play / Akka', '2', '00:00:01', 50, 7, 13, 1),
(11, 'fdsafdsafdsaf', '2', '00:00:25', 50, 39, 13, 1),
(12, 'fdsafdsafdsafdsa', '2', '00:00:01', 50, 36, 13, 1),
(13, 'By implementing the Runnable interface and providing the code in the run() method.', '1', '00:00:01', 50, 29, 13, 1),
(14, '`Thread thread = new Thread().execute() { ... };`', '2', '00:00:01', 50, 23, 13, 1),
(15, '`CodeExecutor`', '2', '00:00:01', 50, 24, 13, 1),
(16, '`Thread thread = new Thread(); thread.initialize();`', '2', '00:00:01', 50, 21, 13, 1),
(17, 'execute()', '2', '00:00:01', 50, 30, 13, 1),
(18, 'fdsafdsafdsa', '2', '00:00:01', 50, 38, 13, 1),
(19, 'fdsafdsafdsaf', '2', '00:00:01', 50, 40, 13, 1),
(20, '`Thread thread = new Thread(MyRunnable); thread.start();`', '2', '00:00:01', 50, 25, 13, 1),
(21, 'fdsafdsafdsaf', '2', '00:00:01', 50, 52, 13, 1),
(22, 'fdsafdsafdsaf', '2', '00:00:01', 50, 61, 13, 1),
(23, 'A critical section that prevents data corruption', '2', '00:00:01', 50, 42, 13, 1),
(24, 'fdsafdsafdsa', '2', '00:00:01', 50, 55, 13, 1),
(25, 'fdsafdsafdsafdas', '2', '00:00:01', 50, 56, 13, 1),
(26, 'The program output becomes unpredictable', '1', '00:00:01', 50, 51, 13, 1),
(27, 'fdsafdsafdasfdas', '2', '00:00:01', 50, 59, 13, 1),
(28, 'By increasing the number of threads', '2', '00:00:01', 50, 46, 13, 1),
(29, 'fdsafdsafdasfdas', '2', '00:00:01', 50, 53, 13, 1),
(30, 'The action changes the condition', '2', '00:00:01', 50, 49, 13, 1),
(31, 'fdsafdsafdsafdsa', '2', '00:00:01', 50, 77, 13, 1),
(32, 'It is suspended until the network call completes.', '2', '00:00:01', 50, 65, 13, 1),
(33, 'fdsafdsafdsafds', '2', '00:00:01', 50, 73, 13, 1),
(34, 'Synchronized blocks can only be used with platform threads.', '2', '00:00:01', 50, 71, 13, 1),
(35, 'Using the `Runnable.startVirtualThread()` method', '2', '00:00:01', 50, 67, 13, 1),
(36, 'Resource consumption is unrelated to the type of thread.', '2', '00:00:01', 50, 63, 13, 1),
(37, 'fdsafdsafdsafs', '2', '00:00:01', 50, 81, 13, 1),
(38, 'fdsafdsafdsa', '2', '00:00:01', 50, 72, 13, 1),
(39, 'fdsafdsafdsafa', '2', '00:00:01', 50, 78, 13, 1),
(40, 'fdafdsafdfsdaf', '2', '00:00:01', 50, 80, 13, 1),
(41, 'signal()', '2', '00:00:02', 50, 85, 13, 1),
(42, 'fdsafdsafsdafdsa', '2', '00:00:01', 50, 99, 13, 1),
(43, 'fdsafdsafdsaf', '2', '00:00:01', 50, 97, 13, 1),
(44, 'fdsafdsafdsa', '2', '00:00:01', 50, 93, 13, 1),
(45, 'fdsafdsafdsafdsa', '2', '00:00:01', 50, 91, 13, 1),
(46, 'fdsafdsafdsafdsa', '2', '00:00:01', 50, 94, 13, 1),
(47, 'fdsafdsafdsafdsa', '2', '00:00:01', 50, 101, 13, 1),
(48, 'fdsafdsafdsafdsa', '2', '00:00:01', 50, 92, 13, 1),
(49, 'fdsafdsafdsafdsa', '2', '00:00:01', 50, 89, 13, 1),
(50, 'fdsafdsafdsafdsa', '2', '00:00:01', 50, 100, 13, 1),
(51, 'Increased fairness in resource sharing', '2', '00:00:05', 50, 4, 36, 2),
(52, 'Execute on separate CPUs', '2', '00:00:01', 50, 5, 36, 2),
(53, 'sadasdas', '2', '00:00:02', 50, 20, 36, 2),
(54, 'asdasdsa', '2', '00:00:01', 50, 12, 36, 2),
(55, 'Resource sharing among threads', '2', '00:00:01', 50, 8, 36, 2),
(56, 'sadadas', '2', '00:00:01', 50, 14, 36, 2),
(57, 'Avoiding concurrent access errors', '1', '00:00:01', 50, 6, 36, 2),
(58, 'asdasdsa', '2', '00:00:01', 50, 15, 36, 2),
(59, 'asdasdda', '2', '00:00:01', 50, 11, 36, 2),
(60, 'Separate state concurrency model', '1', '00:00:01', 50, 3, 36, 2),
(61, '`process()`', '2', '00:00:01', 50, 22, 36, 2),
(62, '`Thread thread = new Thread(); thread.initialize();`', '2', '00:00:01', 50, 21, 36, 2),
(63, 'By calling the start() method directly on the Thread object.', '2', '', 50, 29, 36, 2),
(64, 'run()', '2', '00:00:01', 50, 30, 36, 2),
(65, '`Thread thread = new Thread(MyRunnable()); thread.start();`', '2', '00:00:01', 50, 25, 36, 2),
(66, '`Thread.stop()`', '2', '00:00:01', 50, 26, 36, 2),
(67, 'asdadas', '2', '00:00:01', 50, 31, 36, 2),
(68, 'asdadas', '2', '00:00:01', 50, 41, 36, 2),
(69, 'asdasdasd', '2', '00:00:01', 50, 34, 36, 2),
(70, '`isExecuting()`', '2', '', 50, 28, 36, 2),
(71, 'asdasda', '2', '00:00:01', 50, 61, 36, 2),
(72, 'asdad', '2', '00:00:01', 50, 60, 36, 2),
(73, 'asdasdsa', '2', '00:00:01', 50, 58, 36, 2),
(74, 'Using atomic variables', '2', '00:00:02', 50, 50, 36, 2),
(75, 'Read-write-check', '2', '00:00:06', 50, 43, 36, 2),
(76, 'The condition is evaluated before any action is taken', '2', '00:00:04', 50, 49, 36, 2),
(77, 'asdfaf', '2', '00:00:07', 50, 56, 36, 2),
(78, 'Act-then-check', '2', '00:00:01', 50, 45, 36, 2),
(79, 'To modify shared data simultaneously', '2', '00:00:01', 50, 47, 36, 2),
(80, 'sdf', '2', '00:00:04', 50, 57, 36, 2),
(81, 'Virtual threads can enter synchronized blocks but may cause thread pinning.', '1', '00:00:01', 50, 71, 36, 2),
(82, 'Using the `Thread.ofVirtual()` factory method', '1', '00:00:02', 50, 67, 36, 2),
(83, 'same', '2', '00:00:07', 50, 81, 36, 2),
(84, 'while', '2', '00:00:04', 50, 73, 36, 2),
(85, '`Runnable`', '1', '00:00:02', 50, 68, 36, 2),
(86, 'class', '2', '00:00:05', 50, 76, 36, 2),
(87, 'thread', '2', '00:00:04', 50, 72, 36, 2),
(88, 'java.lang', '2', '00:00:05', 50, 80, 36, 2),
(89, 'part', '2', '00:00:05', 50, 78, 36, 2),
(90, 'It is suspended until the network call completes.', '2', '00:00:01', 50, 65, 36, 2),
(91, 'asdasd', '2', '00:00:01', 50, 95, 36, 2),
(92, 'asdasd', '2', '', 50, 94, 36, 2),
(93, 'It increases the performance of the wait() method.', '2', '', 50, 84, 36, 2),
(94, 'asda', '2', '00:00:01', 50, 97, 36, 2),
(95, 'asdasd', '2', '', 50, 88, 36, 2),
(96, 'notifyAll()', '1', '00:00:01', 50, 85, 36, 2),
(97, 'asdasd', '2', '00:00:01', 50, 91, 36, 2),
(98, 'asdasd', '2', '00:00:01', 50, 99, 36, 2),
(99, 'asdasd', '2', '00:00:01', 50, 98, 36, 2),
(100, 'asdasdas', '2', '00:00:01', 50, 89, 36, 2);

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
(1, 1, 13, 1),
(2, 1, 8, 0),
(3, 2, 13, 1),
(4, 3, 13, 1),
(5, 4, 13, 1),
(6, 5, 13, 1),
(7, 1, 9, 0),
(8, 1, 34, 0),
(9, 1, 35, 0),
(10, 1, 36, 1),
(11, 2, 36, 1),
(12, 3, 36, 1),
(13, 4, 36, 1),
(14, 5, 36, 1);

-- --------------------------------------------------------

--
-- Table structure for table `requests`
--

CREATE TABLE `requests` (
  `req_ID` int(11) NOT NULL,
  `exam_id` int(11) NOT NULL,
  `req_message` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `scores`
--

CREATE TABLE `scores` (
  `score_id` int(11) NOT NULL,
  `subj_id` int(11) NOT NULL,
  `accnt_id` int(11) NOT NULL,
  `num_of_items` int(11) NOT NULL COMMENT 'number of items per quiz',
  `score` int(11) NOT NULL COMMENT 'total correct answer',
  `score_type` int(11) NOT NULL COMMENT '1=practice exam; 2=summative;\r\n3=final'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `scores`
--

INSERT INTO `scores` (`score_id`, `subj_id`, `accnt_id`, `num_of_items`, `score`, `score_type`) VALUES
(1, 1, 13, 10, 7, 1),
(2, 1, 13, 20, 3, 2),
(3, 2, 13, 10, 10, 1),
(4, 2, 13, 20, 13, 2),
(5, 3, 13, 10, 9, 1),
(6, 3, 13, 20, 13, 2),
(7, 4, 13, 10, 9, 1),
(8, 4, 13, 20, 3, 2),
(9, 5, 13, 10, 5, 1),
(10, 5, 13, 0, 0, 1),
(11, 1, 8, 10, 1, 1),
(12, 5, 13, 10, 7, 1),
(13, 5, 13, 20, 1, 2),
(14, 1, 35, 10, 4, 1),
(15, 1, 36, 0, 0, 1),
(16, 1, 36, 10, 10, 1),
(17, 1, 36, 20, 8, 2),
(18, 2, 36, 10, 10, 1),
(19, 2, 36, 20, 1, 2),
(20, 3, 36, 10, 10, 1),
(21, 3, 36, 20, 1, 2),
(22, 4, 36, 10, 7, 1),
(23, 4, 36, 20, 1, 2),
(24, 5, 36, 10, 1, 1),
(25, 5, 36, 10, 8, 1),
(26, 5, 36, 20, 3, 2),
(27, 1, 36, 10, 6, 1);

-- --------------------------------------------------------

--
-- Table structure for table `subject`
--

CREATE TABLE `subject` (
  `subj_id` int(11) NOT NULL,
  `subj_name` varchar(255) NOT NULL,
  `subj_desc` text NOT NULL,
  `subj_file` text NOT NULL COMMENT 'link of learning resources',
  `subj_file2` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `subject`
--

INSERT INTO `subject` (`subj_id`, `subj_name`, `subj_desc`, `subj_file`, `subj_file2`) VALUES
(1, 'Java Concurrency and Multithreading', 'Subtopic 1', 'https://www.youtube.com/watch?v=mTGdtC9f4EU&list=PLL8woMHwr36EDxjUoCzboZjedsnhLP1j4&index=2&t=37s', 'https://jenkov.com/tutorials/java-concurrency/index.html'),
(2, 'Creating, starting and stopping threads in Java', 'Subtopic 2', 'https://www.youtube.com/watch?v=eQk5AWcTS8w', 'https://jenkov.com/tutorials/java-concurrency/creating-and-starting-threads.html'),
(3, 'Race Conditions in Java Multithreading', 'Subtopic 3', 'https://www.youtube.com/watch?v=RMR75VzYoos&list=PLL8woMHwr36EDxjUoCzboZjedsnhLP1j4&index=9', 'https://jenkov.com/tutorials/java-concurrency/race-conditions-and-critical-sections.html'),
(4, 'Java Virtual Threads', 'Subtopic 4', 'https://www.youtube.com/watch?v=kirhhcFAGB4&list=PLL8woMHwr36EDxjUoCzboZjedsnhLP1j4&index=3', 'https://jenkov.com/tutorials/java-concurrency/java-virtual-threads.html'),
(5, 'Thread Signaling in Java', 'Subtopic 5', 'https://www.youtube.com/watch?v=EgOjklzlnFw&list=PLL8woMHwr36EDxjUoCzboZjedsnhLP1j4&index=24', 'https://jenkov.com/tutorials/java-concurrency/thread-signaling.html');

-- --------------------------------------------------------

--
-- Table structure for table `test_history`
--

CREATE TABLE `test_history` (
  `th_ID` int(11) NOT NULL,
  `th_Type` int(11) NOT NULL COMMENT '1=practice exam 2=summative exam; 3=final exam',
  `subj_id` int(11) NOT NULL,
  `accnt_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `test_history`
--

INSERT INTO `test_history` (`th_ID`, `th_Type`, `subj_id`, `accnt_id`) VALUES
(1, 1, 1, 13),
(2, 2, 1, 13),
(3, 1, 2, 13),
(4, 2, 2, 13),
(5, 1, 3, 13),
(6, 2, 3, 13),
(7, 1, 4, 13),
(8, 2, 4, 13),
(9, 1, 5, 13),
(10, 1, 5, 13),
(11, 1, 1, 8),
(12, 1, 5, 13),
(13, 2, 5, 13),
(14, 1, 1, 35),
(15, 1, 1, 36),
(16, 1, 1, 36),
(17, 2, 1, 36),
(18, 1, 2, 36),
(19, 2, 2, 36),
(20, 1, 3, 36),
(21, 2, 3, 36),
(22, 1, 4, 36),
(23, 2, 4, 36),
(24, 1, 5, 36),
(25, 1, 5, 36),
(26, 2, 5, 36),
(27, 1, 1, 36);

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
  `testq_hint` text NOT NULL COMMENT 'hint for every wrong answer',
  `testq_type` int(11) NOT NULL,
  `testq_img` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `test_quest`
--

INSERT INTO `test_quest` (`testq_id`, `subj_id`, `testq_0`, `testq_1`, `testq_2`, `testq_3`, `testq_4`, `testq_ans`, `testq_hint`, `testq_type`, `testq_img`) VALUES
(1, 1, 'Which of the following best describes multithreading?', 'Executing multiple programs simultaneously', 'Utilizing multiple CPUs or CPU cores', 'Sharing resources among users', 'Allowing multiple threads of execution within an application', 'Allowing multiple threads of execution within an application', 'It involves simultaneous execution of different parts of the code.', 1, ''),
(2, 1, 'What is the primary reason for using multithreading in an application?', 'Better resource utilization', 'Enhanced user experience', 'Fairness in resource sharing', 'Improved responsiveness', 'Better resource utilization', 'It ensures efficient utilization of system resources.', 1, ''),
(3, 1, 'Which concurrency model avoids many concurrent access problems by not sharing objects or data among threads?', 'Shared state concurrency model', 'Separate state concurrency model', 'Multitasking model', 'Distributed systems model', 'Separate state concurrency model', 'Threads do not share any objects or data in this model.', 1, ''),
(4, 1, 'What is a common benefit of using multithreading in an application?', 'Better utilization of a single CPU', 'Increased fairness in resource sharing', 'Improved user experience in terms of responsiveness', 'Enhanced user experience in terms of multitasking', 'Separate state concurrency model', 'It allows the application to respond promptly to user interactions.', 1, ''),
(5, 1, 'In a shared state concurrency model, threads:', 'Share objects and data', 'Execute on separate CPUs', 'Avoid concurrency problems', 'Execute sequentially', 'Share objects and data', 'This model involves sharing objects and data among threads.', 1, ''),
(6, 1, 'What is a potential challenge in multithreading?', 'Efficient resource utilization', 'Sequential execution of threads', 'Avoiding concurrent access errors', 'Utilizing multiple CPUs or cores', 'Avoiding concurrent access errors', 'It relates to errors caused by simultaneous memory access.', 1, ''),
(7, 1, 'Which Java framework supports functional programming parallelism?', 'Netty', 'Vert.x', 'Play / Akka', 'Fork/Join', 'Fork/Join', 'It was introduced in Java 7 and facilitates parallelism.', 1, ''),
(8, 1, 'What is the key difference between multitasking and multithreading?', 'Number of CPUs used', 'Simultaneous program execution', 'Resource sharing among threads', 'Efficiency in resource utilization', 'Simultaneous program execution', 'Multithreading involves multiple threads executing within the same program.', 1, ''),
(9, 1, 'Which type of concurrency model is often associated with shared access problems?', 'Multitasking model', 'Shared nothing model', 'Shared state model', 'Separate state model', 'Shared state model', 'It involves sharing objects and data among threads.', 1, ''),
(10, 1, 'What is the purpose of multithreading in terms of fairness?', 'Better resource utilization', 'Improved user experience', 'Avoiding concurrency problems', 'Sharing resources among users', 'Sharing resources among users', 'It ensures fair distribution of resources among users.', 1, ''),
(11, 1, 'Multithreading allows for simultaneous execution of different parts of the code within the same ___________.', 'none', 'none', 'none', 'none', 'program', 'It refers to the execution environment of an application.', 2, ''),
(12, 1, 'One of the reasons to use multithreading is to better utilize the resources in the ___________.', 'none', 'none', 'none', 'none', 'computer', 'It refers to the computing device where the application runs.', 2, ''),
(13, 1, 'Multithreading can help in better utilization of multiple CPUs or CPU _________.', 'none', 'none', 'none', 'none', 'cores', 'It refers to the processing units within a computer.', 2, ''),
(14, 1, 'In multithreading, a thread can be thought of as a separate ________ executing the program.', 'none', 'none', 'none', 'none', 'CPU', 'It refers to a unit of execution.', 2, ''),
(15, 1, 'Multithreading can provide a better user experience in terms of ____________ by utilizing background threads.\n', 'none', 'none', 'none', 'none', 'responsiveness', 'It refers to how quickly the system responds to user actions.', 2, ''),
(16, 1, 'The shared state concurrency model in Java involves ___________ objects or data among threads.', 'none', 'none', 'none', 'none', 'sharing', 'It refers to threads accessing the same resources.', 2, ''),
(17, 1, 'Multithreading is even more challenging than multitasking as threads in a program read and write the same ___________ simultaneously.', 'none', 'none', 'none', 'none', 'memory', 'It refers to threads working independently.', 2, ''),
(18, 1, 'Multithreading in Java was available from the very __________ of the language.', 'none', 'none', 'none', 'none', 'beginning', 'It refers to the starting point or beginning.', 2, ''),
(19, 1, 'Multitasking involves executing multiple programs simultaneously, whereas multithreading involves multiple threads executing within the same ___________.', 'none', 'none', 'none', 'none', 'program', 'It refers to the environment where code is executed.', 2, ''),
(20, 1, ' Multithreading helps in providing a better user experience in terms of ___________ resource sharing among users.', 'none', 'none', 'none', 'none', 'fairness', 'It refers to the fair distribution of resources.', 2, ''),
(21, 2, 'What is the correct way to create and start a Java thread?', '`Thread thread = new Thread(); thread.start();', '`Thread thread = new Thread(); thread.run();', '`Thread thread = new Thread(); thread.execute();', '`Thread thread = new Thread(); thread.initialize();`', '`Thread thread = new Thread(); thread.start();', 'The method used to start a thread begins with the letter \'s\'.', 1, ''),
(22, 2, ' Which method should you override in a subclass of Thread to specify the code to be executed by the thread?', '`execute()`', '`process()`', '`run()`', '`perform()`', '`run()`', 'This method is responsible for defining the thread\'s behavior.', 1, ''),
(23, 2, 'How can you create an anonymous subclass of Thread that specifies the code to be executed?', '`Thread thread = new Thread() { ... };`', '`Thread thread = new Thread().run() { ... };`', '`Thread thread = new Thread().execute() { ... };`', '`Thread thread = new Thread().process() { ... };`', '`Thread thread = new Thread() { ... };`', 'Curly braces are used to define the anonymous subclass.', 1, ''),
(24, 2, 'Which interface should you implement to specify the code to be executed by a thread?', '`Runnable`', '`Threadable`', '`ExecRunnable`', '`CodeExecutor`', '`Runnable`', 'This interface contains the `run()` method.', 1, ''),
(25, 2, 'How can you start a thread with a class that implements the `Runnable` interface?', '`Thread thread = new Thread(MyRunnable()); thread.start();`', '`Thread thread = new Thread(MyRunnable); thread.start();`', '`Thread thread = new Thread(new MyRunnable()); thread.run();`', '`Thread thread = new Thread(new MyRunnable()); thread.start();`', '`Thread thread = new Thread(new MyRunnable()); thread.start();`', 'The method used to start the thread begins with the letter \'s\'.', 1, ''),
(26, 2, 'Which method is used to pause a thread for a specified number of milliseconds?', '`Thread.suspend()`', '`Thread.stop()`', '`Thread.pause()`', '`Thread.sleep()`', '`Thread.sleep()`', 'This method is used to introduce a delay in thread execution.', 1, ''),
(27, 2, 'Which method can be used to obtain the currently executing thread?', '`Thread.currentThread()`', '`Thread.getCurrentThread()`', '`Thread.getExecutingThread()`', '`Thread.getThread()`', '`Thread.currentThread()`', 'This method returns a reference to the current thread.', 1, ''),
(28, 2, 'Which method is used to check if a thread is still alive?', '`isAlive()`', '`isRunning()`', '`isExecuting()`', '`isThreadAlive()`', '`isAlive()`', 'This method returns a boolean value.', 1, ''),
(29, 2, 'What is the recommended way to specify the code that a Java thread should execute?', 'By creating a subclass of Thread and overriding the run() method.', 'By calling the start() method directly on the Thread object.', 'By implementing the Runnable interface and providing the code in the run() method.', 'By creating a Lambda expression that implements the Runnable interface.', 'By implementing the Runnable interface and providing the code in the run() method.', 'This approach allows for better code organization and separation of concerns.', 1, ''),
(30, 2, 'Which method should be called to start the execution of a Java thread?', 'start()', 'run()', 'execute()', 'begin()', 'start()', 'This method initiates the execution of the thread and allows it to run in parallel with other threads.', 1, ''),
(31, 2, 'Creating a Java Thread is done by instantiating the ________ class.', 'none', 'none', 'none', 'none', 'Thread', 'It is a class that represents a thread in Java.', 2, ''),
(32, 2, 'To start a Java Thread, the method ________ is called.', 'none', 'none', 'none', 'none', 'start()', 'This method initiates the execution of the thread.', 2, ''),
(33, 2, 'The run() method in a Thread subclass or a Runnable implementation contains the ________ code that will be executed by the thread.', 'none', 'none', 'none', 'none', 'executable', 'It specifies what actions the thread should perform.', 2, ''),
(34, 2, 'The Java Thread class is part of the ________ package.', 'none', 'none', 'none', 'none', 'java.lang', 'It is a built-in Java package that provides fundamental classes and interfaces.', 2, ''),
(35, 2, 'To create a thread using the Runnable interface, you need to implement the ________ method.', 'none', 'none', 'none', 'none', 'run()', 'This method defines the actions the thread will perform.', 2, ''),
(36, 2, 'The Java interface that contains the run() method is called ________.', 'none', 'none', 'none', 'none', 'Runnable', 'It is a standard Java interface used for defining threads.', 2, ''),
(37, 2, 'To pass code to a Java thread, you can use an ________ class that implements the Runnable interface', 'none', 'none', 'none', 'none', 'anonymous', 'It is a class without a specific name, used for one-time implementation of an interface.', 2, ''),
(38, 2, 'Another way to pass code to a Java thread is by using a ________ expression that implements the Runnable interface.', 'none', 'none', 'none', 'none', 'lambda', 'It is a concise way to define a functional interface implementation.', 2, ''),
(39, 2, 'It is possible to create multiple threads by instantiating multiple objects of the ________ class.', 'none', 'none', 'none', 'none', 'Thread', 'It is the base class for all threads in Java.', 2, ''),
(40, 2, 'The stop() method of the Thread class is deprecated because it can leave shared objects in an ________ state.', 'none', 'none', 'none', 'none', 'unknown', 'Think about the potential risks of abruptly stopping a thread.', 2, ''),
(41, 2, 'The sleep() method in the Thread class pauses the execution of the thread for a specified ________ of milliseconds.', 'none', 'none', 'none', 'none', 'number', 'It temporarily suspends the execution of the thread.', 2, ''),
(42, 3, 'What is a race condition?', 'A section of code that executes concurrently', 'A condition that occurs when two or more threads access shared data', 'A critical section that prevents data corruption', 'A condition that occurs when threads are synchronized', 'A condition that occurs when two or more threads access shared data', 'A race condition occurs when multiple threads access shared data simultaneously.', 1, ''),
(43, 3, 'Which of the following patterns can lead to a race condition?', 'Write-modify-read', 'Read-write-check', 'Check-modify-write', 'Read-modify-write', 'Read-modify-write', 'The pattern involves reading a value, modifying it, and writing it back.', 1, ''),
(44, 3, 'In a read-modify-write critical section, the problem arises when:', 'Threads read different values from memory', 'Threads modify the value before reading it', 'Threads read the value concurrently but write sequentially', 'Threads read and write the value without synchronization', 'Threads read and write the value without synchronization', 'The problem occurs due to interleaved execution of threads.', 1, ''),
(45, 3, 'Which critical section pattern may result in one thread overwriting the changes made by another thread?', 'Read-modify-write', 'Check-then-act', 'Act-then-check', 'Write-then-read', 'Check-then-act', 'The pattern involves checking a condition and then performing an action based on it.', 1, ''),
(46, 3, 'How can race conditions be prevented?', 'By executing the critical section atomically', 'By using synchronized blocks or locks', 'By relying on thread interleaving', 'By increasing the number of threads', 'By using synchronized blocks or locks', 'It involves ensuring exclusive access to the critical section.', 1, ''),
(47, 3, 'What is the purpose of a critical section?', 'To execute code concurrently', 'To prevent race conditions', 'To modify shared data simultaneously', 'To increase thread synchronization', 'To prevent race conditions', 'It ensures that only one thread can access shared resources at a time.', 1, ''),
(48, 3, 'Which type of critical section may benefit from breaking it into smaller sections?', 'Read-then-write', 'Check-then-act', 'Read-modify-write', 'Write-then-read', 'Read-modify-write', 'Breaking the critical section can reduce contention and increase throughput.', 1, ''),
(49, 3, 'In a check-then-act critical section, race conditions can occur when:', 'Two threads concurrently act on the condition', 'The condition is evaluated before any action is taken', 'The action changes the condition', 'The condition is false for all threads', 'Two threads concurrently act on the condition', 'Multiple threads may check the condition simultaneously.', 1, ''),
(50, 3, 'What is the recommended way to achieve thread synchronization in Java?', 'Using synchronized blocks', 'Using atomic variables', 'Increasing the thread priority', 'Using multiple threads', 'Using synchronized blocks', 'It ensures that only one thread can execute the critical section.', 1, ''),
(51, 3, 'What happens if a race condition occurs in a critical section?', 'The program terminates abruptly', 'The critical section is skipped', 'The program output becomes unpredictable', 'The threads are synchronized automatically', 'The program output becomes unpredictable', 'The outcome of the program depends on the interleaving of thread', 1, ''),
(52, 3, 'A race condition occurs when two or more threads access the same ________.', 'none', 'none', 'none', 'none', 'variable', 'It refers to the data or resource that multiple threads share.', 2, ''),
(53, 3, 'In the read-modify-write pattern, threads first read a value, then modify it, and finally ________ it back.', 'none', 'none', 'none', 'none', 'write', 'It involves updating the value in its original location.', 2, ''),
(54, 3, 'Race conditions can occur in a check-then-act critical section when multiple threads simultaneously ________ the condition.', 'none', 'none', 'none', 'none', 'check', 'It refers to verifying a specific condition before performing an action.', 2, ''),
(55, 3, 'To prevent race conditions, it is necessary to execute the critical section as an ________ instruction.', 'none', 'none', 'none', 'none', 'atomic', 'It refers to an indivisible and uninterrupted operation.', 2, ''),
(56, 3, 'Synchronization in critical sections can be achieved using ________ blocks or locks.', 'none', 'none', 'none', 'none', 'synchronized', 'It refers to the constructs that allow exclusive access to the critical section.', 2, ''),
(57, 3, 'Breaking a large critical section into smaller sections can reduce ________ on shared resources.', 'none', 'none', 'none', 'none', 'contention', 'It refers to the competition or conflict between threads.', 2, ''),
(58, 3, 'A race condition may occur inside a ____________ section.', 'none', 'none', 'none', 'none', 'critical', 'This section of code is executed by multiple threads.', 2, ''),
(59, 3, 'When multiple threads try to remove the same key from a Map concurrently, only one thread succeeds, and others receive a ________ value.', 'none', 'none', 'none', 'none', 'null', 'This happens when the key-value pair is already removed by another thread', 2, ''),
(60, 3, 'Synchronized blocks provide ________ access to shared resources and prevent race conditions.', 'none', 'none', 'none', 'none', 'exclusive', 'It refers to the capability of a single thread accessing a resource.', 2, ''),
(61, 3, 'In a check-then-act critical section, race conditions may occur when multiple threads simultaneously ________ the condition and perform the action.', 'none', 'none', 'none', 'none', 'act', 'It refers to the simultaneous execution of the action.', 2, ''),
(62, 4, 'What method is used to create a new virtual thread in Java?\nThread vThread = ___________________.ofVirtual().start(runnable);', 'none', 'none', 'none', 'none', 'Thread', 'The method starts with \'Thread.ofVirtual()\'', 2, ''),
(63, 4, 'How do virtual threads differ from platform threads in terms of resource consumption?', 'Virtual threads consume more resources.', 'Virtual threads consume fewer resources.', 'Virtual threads and platform threads consume the same amount of resources.', 'Resource consumption is unrelated to the type of thread.', 'Virtual threads consume fewer resources.', 'Virtual threads are more lightweight.', 1, ''),
(64, 4, 'What advantage do virtual threads offer when performing blocking IO operations?', 'They can execute more platform threads simultaneously.', 'They can handle more network calls.', 'They require fewer database connections.', 'They can handle more parallel operations.', 'They can handle more parallel operations.', 'Virtual threads allow for more parallelism in IO operations.', 1, ''),
(65, 4, 'What happens when a virtual thread makes a blocking network call?', 'It is switched to a different platform thread.', 'It remains executed by the same platform thread.', 'It is suspended until the network call completes.', 'It terminates and releases the platform thread.', 'It is switched to a different platform thread.', 'The virtual thread is \"unmounted\" during the blocking call.', 1, ''),
(66, 4, 'Which situation does NOT unmount a virtual thread from a platform thread?', ' Making a blocking network call', 'Making a blocking file system call', 'Entering a synchronized block', 'Blocking operation on a BlockingQueue', 'Making a blocking file system call', 'Focus on the scenario that does not cause unmounting.', 1, ''),
(67, 4, 'How can a Java virtual thread be created?', 'Using the `new VirtualThread()` constructor', 'Using the `Thread.ofVirtual()` factory method', 'Using the `Runnable.startVirtualThread()` method', 'Java virtual threads cannot be created explicitly', 'Using the `Thread.ofVirtual()` factory method', 'Look for the correct factory method', 1, ''),
(68, 4, 'Which interface should be implemented when creating a virtual thread in Java?', '`Runnable`', '`Thread`', '`Callable`', '`Executor`', '`Runnable`', 'The interface represents the task to be executed by the virtual thread.', 1, ''),
(69, 4, 'How can you start an unstarted virtual thread?', 'Call the `run()` method on the virtual thread instance.', 'Call the `start()` method on the virtual thread instance.', 'Call the `execute()` method on the virtual thread instance.', 'Unstarted virtual threads cannot be started.', 'Call the `start()` method on the virtual thread instance.', 'Look for the correct method to initiate execution.', 1, ''),
(70, 4, 'Look for the correct method to initiate execution.', '`sleep()`', '`await()`', '`wait()`', '`join()`', '`join()`', 'Look for the method that allows synchronization with the virtual thread.', 1, ''),
(71, 4, 'Which of the following statements is true regarding the use of synchronized blocks with virtual threads?', 'Virtual threads cannot enter synchronized blocks.', 'Synchronized blocks can only be used with platform threads.', 'Virtual threads can enter synchronized blocks but may cause thread pinning.', 'Synchronized blocks have no impact on virtual thread execution.', 'Virtual threads can enter synchronized blocks but may cause thread pinning.', 'Consider the behavior of virtual threads inside synchronized blocks.', 1, ''),
(72, 4, 'The ________ method is used to retrieve the current executing virtual thread.', 'none', 'none', 'none', 'none', 'currentThread()', 'The method returns the reference to the currently executing thread.', 2, ''),
(73, 4, ' You can make the calling thread wait for a virtual thread to finish by using the ________ method.', 'none', 'none', 'none', 'none', 'join()', 'Synchronization method to wait for the completion of a thread.', 2, ''),
(74, 4, 'To create an unstarted virtual thread, you can use the ________ method.', 'none', 'none', 'none', 'none', 'unstarted()', 'The alternative method to create a virtual thread without starting it.', 2, ''),
(75, 4, 'A virtual thread can be started immediately using the ________ method.', 'none', 'none', 'none', 'none', 'start()', 'Initiates the execution of the virtual thread.', 2, ''),
(76, 4, 'To create a virtual thread, you use the new Thread.ofVirtual() ________ method', 'none', 'none', 'none', 'none', 'factory', 'The method used to obtain a virtual thread instance.', 2, ''),
(77, 4, 'Entering a ________ block can also pin a virtual thread to a platform thread.', 'none', 'none', 'none', 'none', 'synchronized', 'A mechanism used for thread synchronization.', 2, ''),
(78, 4, 'The Java virtual thread system may compensate for file system calls by starting up another ________ thread.', 'none', 'none', 'none', 'none', 'platform', 'Another thread is created to handle virtual threads.', 2, ''),
(79, 4, ' When a virtual thread makes a blocking network call, it is ________ from the platform thread.', 'none', 'none', 'none', 'none', 'unmounted', 'Virtual threads are temporarily detached during certain operations.', 2, ''),
(80, 4, 'Java virtual threads are currently a ________ feature in Java 19.', 'none', 'none', 'none', 'none', 'preview', 'It means their implementation and API may still change.', 2, ''),
(81, 4, 'During a blocking file system call, a virtual thread remains ________ to the platform thread.', 'none', 'none', 'none', 'none', 'pinned', 'The virtual thread is attached and cannot be switched.', 2, ''),
(82, 5, 'Which method is used to make a thread inactive and wait for a signal from another thread?', 'suspend()', 'sleep()', 'wait()', 'stop()', 'To ensure only one thread can execute the code within the block at a time.', 'The synchronized block ensures exclusive access to the code within it.', 1, ''),
(83, 5, 'Which method is used to wake up one of the threads waiting on the same object?', 'notify()', 'notifyAll()', 'resume()', 'wakeup()', 'synchronized', 'This method should be called within a synchronized block on the same object.', 1, ''),
(84, 5, 'What is the purpose of using a while loop when waiting for a signal?', 'It prevents the thread from waiting indefinitely.', 'It increases the performance of the wait() method.', 'It ensures that the signal is properly received before continuing.', 'It allows multiple threads to wake up simultaneously.', 'No, synchronized blocks are only applicable to code blocks.', 'The while loop helps to guard against spurious wakeups.', 1, ''),
(85, 5, 'Which method should be called if multiple threads are waiting and all of them should proceed?', 'notify()', 'notifyAll()', 'signal()', 'wakeAll()', 'notifyAll()', 'This method wakes up all the waiting threads.', 1, ''),
(86, 5, 'What exception is thrown when a thread calls wait(), notify(), or notifyAll() without holding the synchronization lock?', 'InterruptedException', 'IllegalThreadStateException', 'IllegalMonitorStateException', 'SynchronizationException', 'IllegalMonitorStateException', 'This exception indicates an invalid state of the monitor object.', 1, ''),
(87, 5, 'he wait(), notify(), and notifyAll() methods should always be called within a ________ block to ensure proper synchronization.', 'none', 'none', 'none', 'none', 'synchronized', 'This block ensures that only one thread can access the monitor object at a time.', 2, ''),
(88, 5, ' Multiple threads can call wait() on the same monitor object, and calling ________ will awaken all waiting threads.', 'none', 'none', 'none', 'none', 'notifyAll', 'This method is used to wake up all waiting threads at once.', 2, ''),
(89, 5, 'If a thread calls notify() before the waiting thread calls ________, the signal can be missed.', 'none', 'none', 'none', 'none', 'wait', 'The waiting thread must call this method to wake up and respond to the signal.', 2, ''),
(90, 5, 'The doWait() method checks the signal state using an ________ loop instead of an if-statement to handle spurious wakeups.', 'none', 'none', 'none', 'none', 'while', 'The loop ensures that the thread waits until a valid signal is received.', 2, ''),
(91, 5, 'he class that encapsulates the wait() and notify() methods should have a ________ member variable to store the signal state.', 'none', 'none', 'none', 'none', 'boolean', 'This variable keeps track of whether a signal has been received.', 2, ''),
(92, 5, 'The doWait() method in the modified MyWaitNotify3 class checks the _________ variable in a while loop to guard against spurious wakeups.', 'none', 'none', 'none', 'none', 'wasSignalled', 'This loop ensures that the waiting thread only proceeds when the signal condition is true.', 2, ''),
(93, 5, 'The doWait() method in the example code catches the _________ exception.', 'none', 'none', 'none', 'none', 'InterruptedException', 'This exception can occur when a thread is interrupted while waiting.', 2, ''),
(94, 5, 'The wait() method should be called within a _________ block that is synchronized on the monitor object.', 'none', 'none', 'none', 'none', 'synchronized', 'This block ensures that only one thread can execute it at a time.', 2, ''),
(95, 5, 'The doWait() method in the example code calls the _________ method to make the thread wait.\n', 'none', 'none', 'none', 'none', 'wait()', 'This method is called on the monitor object within a synchronized block.', 2, ''),
(96, 5, 'The doNotify() method in the example code calls the _________ method to wake up a waiting thread.', 'none', 'none', 'none', 'none', 'notify()', 'This method wakes up one of the threads waiting on the same object.', 2, ''),
(97, 5, 'If multiple threads are waiting for the same signal and only one of them should proceed, a _________ loop can be used to check the signal condition.', 'none', 'none', 'none', 'none', 'while', 'This loop ensures that only the correct thread continues.', 2, ''),
(98, 5, 'The flag or variable that stores the signal state should be checked in a _________ loop to guard against spurious wakeups.', 'none', 'none', 'none', 'none', 'while', 'This loop keeps checking the condition until it becomes true.', 2, ''),
(99, 5, 'Spurious wakeups can occur, where a thread wakes up without receiving a proper _________.', 'none', 'none', 'none', 'none', 'signal', 'This method is called to wake up a waiting thread.', 2, ''),
(100, 5, 'If a thread calls notify() before the waiting thread calls _________, the signal can be missed', 'none', 'none', 'none', 'none', 'wait()', 'This method is used to make a thread wait for a signal.', 2, ''),
(101, 5, ' In order to call wait(), notify(), or notifyAll(), the calling thread must obtain the _________ on the object.', 'none', 'none', 'none', 'none', 'lock', 'It is a lock that ensures exclusive access to the object.', 2, '');

-- --------------------------------------------------------

--
-- Table structure for table `test_report`
--

CREATE TABLE `test_report` (
  `testr_ID` int(11) NOT NULL,
  `testr_StudAns` text NOT NULL COMMENT 'answer chosen by the student',
  `testr_Status` int(11) NOT NULL COMMENT '1=right answer 0=wrong answer',
  `testr_TimeQuest` varchar(255) NOT NULL COMMENT 'time spent per question',
  `testr_Type` int(11) NOT NULL COMMENT '1=practice exam 2=summative\r\n3=finals',
  `testr_Attempt` int(11) NOT NULL,
  `testr_Cert` varchar(45) NOT NULL,
  `testq_id` int(11) NOT NULL,
  `accnt_id` int(11) NOT NULL,
  `th_ID` int(11) NOT NULL,
  `score_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `test_report`
--

INSERT INTO `test_report` (`testr_ID`, `testr_StudAns`, `testr_Status`, `testr_TimeQuest`, `testr_Type`, `testr_Attempt`, `testr_Cert`, `testq_id`, `accnt_id`, `th_ID`, `score_id`) VALUES
(1, 'cores', 1, '00:00:26', 1, 1, '1', 13, 13, 1, 1),
(2, 'Separate state concurrency model', 1, '00:01:29', 1, 1, '1', 3, 13, 1, 1),
(3, 'Allowing multiple threads of execution within an application', 1, '00:00:18', 1, 1, '1', 1, 13, 1, 1),
(4, 'Share objects and data', 1, '00:00:47', 1, 1, '1', 5, 13, 1, 1),
(5, 'PATH OF EXECUTION\n', 2, '00:02:54', 1, 6, '0', 14, 13, 1, 1),
(6, 'SHARED DATA', 2, '00:00:35', 1, 3, '0', 17, 13, 1, 1),
(7, 'program', 1, '00:00:18', 1, 1, '1', 19, 13, 1, 1),
(8, 'responsiveness', 1, '00:00:19', 1, 1, '1', 15, 13, 1, 1),
(9, 'Better resource utilization', 1, '00:00:41', 1, 1, '1', 2, 13, 1, 1),
(10, 'resource sharing', 2, '00:00:13', 1, 5, '0', 20, 13, 1, 1),
(11, 'Netty', 2, '00:00:09', 2, 1, '', 7, 13, 2, 2),
(12, 'dsaDSA', 2, '00:00:05', 2, 1, '', 16, 13, 2, 2),
(13, 'Resource sharing among threads', 2, '00:00:03', 2, 1, '', 8, 13, 2, 2),
(14, 'dsadsadsa', 2, '00:00:01', 2, 1, '', 15, 13, 2, 2),
(15, 'Sharing resources among users', 1, '00:00:01', 2, 1, '', 10, 13, 2, 2),
(16, 'Avoid concurrency problems', 2, '00:00:07', 2, 1, '', 5, 13, 2, 2),
(17, 'Utilizing multiple CPUs or cores', 2, '00:00:01', 2, 1, '', 6, 13, 2, 2),
(18, 'dsadsadsa', 2, '00:00:01', 2, 1, '', 20, 13, 2, 2),
(19, 'dsadsadsa', 2, '00:00:01', 2, 1, '', 11, 13, 2, 2),
(20, 'Distributed systems model', 2, '00:00:01', 2, 1, '', 3, 13, 2, 2),
(21, 'Shared state model', 1, '00:00:01', 2, 1, '', 9, 13, 2, 2),
(22, 'dsadsadsa', 2, '00:00:01', 2, 1, '', 19, 13, 2, 2),
(23, 'dsadsadsa', 2, '00:00:01', 2, 1, '', 14, 13, 2, 2),
(24, 'dsadsadsa', 2, '00:00:01', 2, 1, '', 12, 13, 2, 2),
(25, 'dsadsadsa', 2, '00:00:01', 2, 1, '', 18, 13, 2, 2),
(26, 'dsadsadsadsa', 2, '00:00:01', 2, 1, '', 17, 13, 2, 2),
(27, 'Improved responsiveness', 2, '00:00:01', 2, 1, '', 2, 13, 2, 2),
(28, 'Allowing multiple threads of execution within an application', 1, '00:00:01', 2, 1, '', 1, 13, 2, 2),
(29, 'dsadsadsa', 2, '00:00:01', 2, 1, '', 13, 13, 2, 2),
(30, 'dsadsadsa', 2, '00:00:02', 2, 1, '', 13, 13, 2, 2),
(31, 'run()', 1, '00:00:02', 1, 3, '1', 35, 13, 3, 3),
(32, 'By implementing the Runnable interface and providing the code in the run() method.', 1, '00:01:02', 1, 1, '1', 29, 13, 3, 3),
(33, 'runnable', 1, '00:00:53', 1, 1, '1', 36, 13, 3, 3),
(34, 'number', 1, '00:00:40', 1, 1, '1', 41, 13, 3, 3),
(35, '`Thread thread = new Thread(new MyRunnable()); thread.start();`', 1, '00:01:13', 1, 1, '1', 25, 13, 3, 3),
(36, 'thread', 1, '00:00:31', 1, 1, '1', 31, 13, 3, 3),
(37, 'start()', 1, '00:00:21', 1, 1, '1', 32, 13, 3, 3),
(38, 'lambda', 1, '00:00:24', 1, 1, '1', 38, 13, 3, 3),
(39, 'start()', 1, '00:00:17', 1, 1, '1', 30, 13, 3, 3),
(40, '`isAlive()`', 1, '00:00:35', 1, 1, '1', 28, 13, 3, 3),
(41, 'start()', 1, '00:00:17', 2, 1, '', 30, 13, 4, 4),
(42, 'runnable', 1, '00:00:18', 2, 1, '', 36, 13, 4, 4),
(43, 'runnable', 2, '00:00:25', 2, 1, '', 33, 13, 4, 4),
(44, 'run()\n', 2, '00:00:15', 2, 1, '', 35, 13, 4, 4),
(45, '`run()`', 1, '00:00:56', 2, 1, '', 22, 13, 4, 4),
(46, 'thread', 1, '00:00:19', 2, 1, '', 39, 13, 4, 4),
(47, 'inconsistent', 2, '00:00:19', 2, 1, '', 40, 13, 4, 4),
(48, 'By creating a Lambda expression that implements the Runnable interface.', 2, '00:00:16', 2, 1, '', 29, 13, 4, 4),
(49, '`Thread.currentThread()`', 1, '00:00:14', 2, 1, '', 27, 13, 4, 4),
(50, 'thread', 1, '00:00:10', 2, 1, '', 31, 13, 4, 4),
(51, '`isAlive()`', 1, '00:03:16', 2, 1, '', 28, 13, 4, 4),
(52, 'java.lang', 1, '00:00:12', 2, 1, '', 34, 13, 4, 4),
(53, 'Thread', 2, '00:00:35', 2, 1, '', 41, 13, 4, 4),
(54, 'start()', 1, '00:00:40', 2, 1, '', 32, 13, 4, 4),
(55, '`Thread thread = new Thread() { ... };`', 1, '00:00:15', 2, 1, '', 23, 13, 4, 4),
(56, '`Thread thread = new Thread(); thread.start();', 1, '00:01:00', 2, 1, '', 21, 13, 4, 4),
(57, '`Thread.sleep()`', 1, '00:00:10', 2, 1, '', 26, 13, 4, 4),
(58, '`Runnable`', 1, '00:00:24', 2, 1, '', 24, 13, 4, 4),
(59, 'run()', 2, '00:00:25', 2, 1, '', 38, 13, 4, 4),
(60, 'lambda', 2, '00:00:26', 2, 1, '', 37, 13, 4, 4),
(61, 'critical', 1, '00:00:23', 1, 1, '1', 58, 13, 5, 5),
(62, 'write', 1, '00:01:59', 1, 1, '1', 53, 13, 5, 5),
(63, 'Read-modify-write', 1, '00:00:47', 1, 1, '1', 48, 13, 5, 5),
(64, 'null', 1, '00:00:31', 1, 1, '1', 59, 13, 5, 5),
(65, 'mutual exclusion', 2, '00:01:40', 1, 2, '0', 60, 13, 5, 5),
(66, 'contention', 1, '00:01:22', 1, 1, '1', 57, 13, 5, 5),
(67, 'Read-modify-write', 1, '00:01:21', 1, 1, '1', 43, 13, 5, 5),
(68, 'A condition that occurs when two or more threads access shared data', 1, '00:01:00', 1, 1, '1', 42, 13, 5, 5),
(69, 'atomic', 1, '00:00:34', 1, 1, '1', 55, 13, 5, 5),
(70, 'The program output becomes unpredictable', 1, '00:01:01', 1, 2, '1', 51, 13, 5, 5),
(71, 'critical', 1, '00:00:40', 2, 1, '', 58, 13, 6, 6),
(72, 'shared resource', 2, '00:00:40', 2, 1, '', 52, 13, 6, 6),
(73, 'synchronized', 1, '00:00:15', 2, 1, '', 56, 13, 6, 6),
(74, 'Two threads concurrently act on the condition', 1, '00:00:17', 2, 1, '', 49, 13, 6, 6),
(75, 'To prevent race conditions', 1, '00:00:44', 2, 1, '', 47, 13, 6, 6),
(76, 'null', 1, '00:00:18', 2, 1, '', 59, 13, 6, 6),
(77, 'exclusive', 1, '00:00:11', 2, 1, '', 60, 13, 6, 6),
(78, 'act', 2, '00:00:17', 2, 1, '', 54, 13, 6, 6),
(79, 'act', 2, '00:00:19', 2, 1, '', 54, 13, 6, 6),
(80, 'act', 2, '00:00:15', 2, 1, '', 54, 13, 6, 6),
(81, 'By executing the critical section atomically', 2, '00:00:35', 2, 1, '', 46, 13, 6, 6),
(82, 'contention', 1, '00:00:20', 2, 1, '', 57, 13, 6, 6),
(83, 'atomic', 1, '00:00:13', 2, 1, '', 55, 13, 6, 6),
(84, 'Read-modify-write', 1, '00:00:29', 2, 1, '', 48, 13, 6, 6),
(85, 'Write-then-read', 2, '00:01:02', 2, 1, '', 45, 13, 6, 6),
(86, 'Using synchronized blocks', 1, '00:01:26', 2, 1, '', 50, 13, 6, 6),
(87, 'check', 2, '00:00:15', 2, 1, '', 61, 13, 6, 6),
(88, 'Read-modify-write', 1, '00:12:03', 2, 1, '', 43, 13, 6, 6),
(89, 'Threads read and write the value without synchronization', 1, '00:01:31', 2, 1, '', 44, 13, 6, 6),
(90, 'write', 1, '00:00:40', 2, 1, '', 53, 13, 6, 6),
(91, 'thread', 1, '00:03:22', 1, 1, '1', 62, 13, 7, 7),
(92, 'Virtual threads consume fewer resources.', 1, '00:01:59', 1, 3, '1', 63, 13, 7, 7),
(93, 'Making a blocking file system call', 1, '00:02:15', 1, 1, '1', 66, 13, 7, 7),
(94, 'They can handle more parallel operations.', 1, '00:01:47', 1, 1, '1', 64, 13, 7, 7),
(95, 'unmounted', 1, '00:00:17', 1, 1, '1', 79, 13, 7, 7),
(96, 'synchronized', 1, '00:00:40', 1, 1, '1', 77, 13, 7, 7),
(97, 'currentVirtualThread()', 2, '00:00:37', 1, 4, '0', 72, 13, 7, 7),
(98, 'factory', 1, '00:00:24', 1, 1, '1', 76, 13, 7, 7),
(99, 'Call the `start()` method on the virtual thread instance.', 1, '00:00:22', 1, 3, '1', 69, 13, 7, 7),
(100, 'It is switched to a different platform thread.', 1, '00:00:25', 1, 3, '1', 65, 13, 7, 7),
(101, 'It is switched to a different platform thread.', 1, '00:00:15', 2, 1, '', 65, 13, 8, 8),
(102, 'sdadsa', 2, '00:00:01', 2, 1, '', 62, 13, 8, 8),
(103, 'dsadsad', 2, '00:00:01', 2, 1, '', 78, 13, 8, 8),
(104, 'dsadsadsa', 2, '00:00:01', 2, 1, '', 76, 13, 8, 8),
(105, '`Thread`', 2, '00:00:01', 2, 1, '', 68, 13, 8, 8),
(106, '`join()`', 1, '00:00:02', 2, 1, '', 70, 13, 8, 8),
(107, 'Virtual threads and platform threads consume the same amount of resources.', 2, '00:00:01', 2, 1, '', 63, 13, 8, 8),
(108, 'dsadsadsa', 2, '00:00:05', 2, 1, '', 75, 13, 8, 8),
(109, 'Entering a synchronized block', 2, '00:00:01', 2, 1, '', 66, 13, 8, 8),
(110, 'dsadsadsa', 2, '00:00:01', 2, 1, '', 72, 13, 8, 8),
(111, 'Virtual threads can enter synchronized blocks but may cause thread pinning.', 1, '00:00:01', 2, 1, '', 71, 13, 8, 8),
(112, 'Using the `Runnable.startVirtualThread()` method', 2, '00:00:01', 2, 1, '', 67, 13, 8, 8),
(113, 'dsadsadsadsa', 2, '00:00:01', 2, 1, '', 81, 13, 8, 8),
(114, 'Call the `execute()` method on the virtual thread instance.', 2, '00:00:01', 2, 1, '', 69, 13, 8, 8),
(115, 'dsadsadasda', 2, '00:00:02', 2, 1, '', 80, 13, 8, 8),
(116, 'sdasdadaa', 2, '00:00:01', 2, 1, '', 74, 13, 8, 8),
(117, 'dsadsadsadsa', 2, '00:00:01', 2, 1, '', 79, 13, 8, 8),
(118, 'dsadsadsadsa', 2, '00:00:01', 2, 1, '', 73, 13, 8, 8),
(119, 'dsadsadasdsa', 2, '00:00:01', 2, 1, '', 77, 13, 8, 8),
(120, 'They require fewer database connections.', 2, '00:00:01', 2, 1, '', 64, 13, 8, 8),
(121, 'while', 1, '00:00:23', 1, 1, '1', 90, 13, 9, 9),
(122, 'wait()', 2, '00:00:39', 1, 3, '0', 89, 13, 9, 9),
(123, 'wait\n\n', 2, '00:00:43', 1, 4, '0', 91, 13, 9, 9),
(124, 'IllegalMonitorStateException', 1, '00:00:21', 1, 1, '1', 86, 13, 9, 9),
(125, 'resume()', 2, '00:00:27', 1, 10, '0', 83, 13, 9, 9),
(126, 'notify\n', 2, '00:00:42', 1, 11, '0', 96, 13, 9, 9),
(127, 'wassignalled', 1, '00:00:30', 1, 2, '1', 92, 13, 9, 9),
(128, 'notifyAll()', 1, '00:00:20', 1, 1, '1', 85, 13, 9, 9),
(129, 'notifyall', 1, '00:01:59', 1, 1, '1', 88, 13, 9, 9),
(130, '', 2, '00:01:06', 1, 3, '0', 93, 13, 10, 10),
(131, 'notify()', 2, '00:00:12', 1, 11, '0', 83, 13, 10, 10),
(132, 'monitor lock', 2, '00:00:38', 1, 10, '0', 101, 13, 10, 10),
(133, 'Better utilization of a single CPU', 2, '00:00:01', 1, 2, '0', 4, 8, 11, 11),
(134, 'Avoiding concurrency problems', 2, '00:00:01', 1, 2, '0', 10, 8, 11, 11),
(135, 'Resource sharing among threads', 2, '00:00:01', 1, 2, '0', 8, 8, 11, 11),
(136, 'Execute on separate CPUs', 2, '00:00:01', 1, 2, '0', 5, 8, 11, 11),
(137, 'a', 2, '00:00:03', 1, 2, '0', 17, 8, 11, 11),
(138, 'a', 2, '00:00:01', 1, 2, '0', 11, 8, 11, 11),
(139, 'Enhanced user experience', 2, '00:00:01', 1, 2, '0', 2, 8, 11, 11),
(140, 'a', 2, '00:00:01', 1, 2, '0', 14, 8, 11, 11),
(141, 'a', 2, '', 1, 2, '0', 16, 8, 11, 11),
(142, 'Fork/Join', 1, '00:00:05', 1, 1, '1', 7, 8, 11, 11),
(143, 'notify', 2, '00:00:17', 1, 1, '0', 96, 13, 10, 10),
(144, 'notify()', 2, '00:00:03', 1, 10, '0', 83, 13, 12, 12),
(145, 'notifyAll', 1, '00:00:25', 1, 1, '1', 88, 13, 12, 12),
(146, 'wait()', 2, '00:01:25', 1, 10, '0', 82, 13, 12, 12),
(147, 'while', 1, '00:02:17', 1, 1, '1', 98, 13, 12, 12),
(148, 'synchronized', 1, '00:00:26', 1, 1, '1', 87, 13, 12, 12),
(149, 'notify()', 2, '00:00:24', 1, 10, '0', 89, 13, 12, 12),
(150, 'lock', 1, '00:00:17', 1, 1, '1', 101, 13, 12, 12),
(151, 'IllegalMonitorStateException', 1, '00:00:22', 1, 1, '1', 86, 13, 12, 12),
(152, 'while', 1, '00:00:18', 1, 1, '1', 90, 13, 12, 12),
(153, 'while', 1, '00:00:18', 1, 1, '1', 97, 13, 12, 12),
(154, 'dasfdsafdsa', 2, '00:00:03', 2, 1, '', 94, 13, 13, 13),
(155, 'fdsafdsafdsa', 2, '00:00:01', 2, 1, '', 92, 13, 13, 13),
(156, 'It ensures that the signal is properly received before continuing.', 2, '00:00:03', 2, 1, '', 84, 13, 13, 13),
(157, 'fdsafdsafdsa', 2, '00:00:01', 2, 1, '', 89, 13, 13, 13),
(158, 'IllegalMonitorStateException', 1, '00:00:01', 2, 1, '', 86, 13, 13, 13),
(159, 'fdsafdsaf', 2, '00:00:01', 2, 1, '', 88, 13, 13, 13),
(160, 'fdsafdsafdsa', 2, '00:00:01', 2, 1, '', 101, 13, 13, 13),
(161, 'fdsafdsafdsa', 2, '00:00:01', 2, 1, '', 93, 13, 13, 13),
(162, 'fdsafdsafdsa', 2, '00:00:01', 2, 1, '', 99, 13, 13, 13),
(163, 'fdsafdsafdsa', 2, '00:00:01', 2, 1, '', 100, 13, 13, 13),
(164, 'fdsafdsfdsaf', 2, '00:00:01', 2, 1, '', 97, 13, 13, 13),
(165, 'fdsafdsafdsa', 2, '00:00:01', 2, 1, '', 98, 13, 13, 13),
(166, 'wakeAll()', 2, '00:00:03', 2, 1, '', 85, 13, 13, 13),
(167, 'fdsafdsafdsa', 2, '00:00:01', 2, 1, '', 87, 13, 13, 13),
(168, 'fdsafdsafdsaf', 2, '00:00:01', 2, 1, '', 95, 13, 13, 13),
(169, 'fdsafdsfdasfdsa', 2, '00:00:01', 2, 1, '', 96, 13, 13, 13),
(170, 'suspend()', 2, '00:00:20', 2, 1, '', 82, 13, 13, 13),
(171, 'dfsafdsafdsafdsa', 2, '00:00:01', 2, 1, '', 90, 13, 13, 13),
(172, 'wakeup()', 2, '00:00:02', 2, 1, '', 83, 13, 13, 13),
(173, 'fdsafdsafdas', 2, '00:00:01', 2, 1, '', 91, 13, 13, 13),
(174, 'Allowing multiple threads of execution within an application', 1, '00:00:18', 1, 1, '1', 1, 35, 14, 14),
(175, 'Play / Akka', 2, '00:00:09', 1, 2, '0', 7, 35, 14, 14),
(176, 'Better resource utilization', 1, '00:00:06', 1, 5, '1', 2, 35, 14, 14),
(177, 'aaaa', 2, '00:00:06', 1, 3, '0', 11, 35, 14, 14),
(178, 'Share objects and data', 1, '00:00:01', 1, 2, '1', 5, 35, 14, 14),
(179, 'sas', 2, '00:00:02', 1, 2, '0', 14, 35, 14, 14),
(180, 'dddd', 2, '00:00:02', 1, 2, '0', 20, 35, 14, 14),
(181, 'Separate state concurrency model', 1, '00:00:02', 1, 3, '1', 3, 35, 14, 14),
(182, 'Improved user experience in terms of responsiveness', 2, '00:00:03', 1, 8, '0', 4, 35, 14, 14),
(183, 'asd', 2, '00:00:01', 1, 3, '0', 19, 35, 14, 14),
(184, 'Sharing resources among users', 1, '00:00:35', 1, 1, '1', 10, 36, 16, 16),
(185, 'fairness', 1, '00:00:20', 1, 2, '1', 20, 36, 16, 16),
(186, 'Fork/Join', 1, '00:00:01', 1, 1, '1', 7, 36, 16, 16),
(187, 'memory', 1, '00:00:36', 1, 1, '1', 17, 36, 16, 16),
(188, 'cores', 1, '00:00:03', 1, 1, '1', 13, 36, 16, 16),
(189, 'program', 1, '00:00:16', 1, 1, '1', 11, 36, 16, 16),
(190, 'Avoiding concurrent access errors', 1, '00:00:01', 1, 2, '1', 6, 36, 16, 16),
(191, 'Shared state model', 1, '00:00:01', 1, 1, '1', 9, 36, 16, 16),
(192, 'CPU', 1, '00:00:17', 1, 3, '1', 14, 36, 16, 16),
(193, 'beginning', 1, '00:00:08', 1, 1, '1', 18, 36, 16, 16),
(194, 'CPU', 2, '00:00:06', 2, 1, '0', 13, 36, 17, 17),
(195, 'fairness', 1, '00:00:03', 2, 1, '1', 20, 36, 17, 17),
(196, 'memory', 1, '00:00:05', 2, 1, '1', 17, 36, 17, 17),
(197, 'Better resource utilization', 1, '00:00:10', 2, 1, '1', 2, 36, 17, 17),
(198, 'Utilizing multiple CPUs or CPU cores', 2, '00:00:07', 2, 1, '0', 1, 36, 17, 17),
(199, 'e', 2, '00:00:02', 2, 1, '0', 15, 36, 17, 17),
(200, 'Multitasking model', 2, '00:00:01', 2, 1, '0', 3, 36, 17, 17),
(201, 'program', 1, '00:00:03', 2, 1, '1', 11, 36, 17, 17),
(202, 'threads', 2, '00:00:06', 2, 1, '0', 16, 36, 17, 17),
(203, 'beginning', 1, '00:00:04', 2, 1, '1', 18, 36, 17, 17),
(204, 'Shared state model', 1, '00:00:02', 2, 1, '1', 9, 36, 17, 17),
(205, 'Improved user experience', 2, '', 2, 1, '0', 10, 36, 17, 17),
(206, 'Fork/Join', 1, '00:00:01', 2, 1, '1', 7, 36, 17, 17),
(207, 'Resource sharing among threads', 2, '', 2, 1, '0', 8, 36, 17, 17),
(208, 'Increased fairness in resource sharing', 2, '', 2, 1, '0', 4, 36, 17, 17),
(209, 'Execute sequentially', 2, '00:00:01', 2, 1, '0', 5, 36, 17, 17),
(210, 'Sequential execution of threads', 2, '00:00:01', 2, 1, '0', 6, 36, 17, 17),
(211, 'program', 2, '00:00:04', 2, 1, '0', 12, 36, 17, 17),
(212, 'program', 2, '00:00:06', 2, 1, '0', 14, 36, 17, 17),
(213, 'program', 1, '00:00:03', 2, 1, '1', 19, 36, 17, 17),
(214, 'unknown', 1, '00:00:39', 1, 1, '1', 40, 36, 18, 18),
(215, 'start()', 1, '00:00:01', 1, 4, '1', 30, 36, 18, 18),
(216, '`Thread.currentThread()`', 1, '00:00:01', 1, 4, '1', 27, 36, 18, 18),
(217, 'By implementing the Runnable interface and providing the code in the run() method.', 1, '00:00:01', 1, 2, '1', 29, 36, 18, 18),
(218, 'anonymous', 1, '00:00:14', 1, 3, '1', 37, 36, 18, 18),
(219, '`isAlive()`', 1, '00:00:01', 1, 4, '1', 28, 36, 18, 18),
(220, 'start()', 1, '00:00:14', 1, 3, '1', 32, 36, 18, 18),
(221, 'java.lang', 1, '00:00:12', 1, 1, '1', 34, 36, 18, 18),
(222, '`Thread thread = new Thread(new MyRunnable()); thread.start();`', 1, '00:00:01', 1, 2, '1', 25, 36, 18, 18),
(223, 'number', 1, '00:00:13', 1, 1, '1', 41, 36, 18, 18),
(224, '`Thread thread = new Thread(); thread.start();', 1, '00:00:01', 2, 1, '1', 21, 36, 19, 19),
(225, 'sada', 2, '00:00:02', 2, 1, '0', 40, 36, 19, 19),
(226, 'asdasd', 2, '00:00:01', 2, 1, '0', 33, 36, 19, 19),
(227, '`Thread.pause()`', 2, '00:00:01', 2, 1, '0', 26, 36, 19, 19),
(228, '`process()`', 2, '', 2, 1, '0', 22, 36, 19, 19),
(229, 'asdsad', 2, '00:00:01', 2, 1, '0', 35, 36, 19, 19),
(230, 'asdasd', 2, '00:00:01', 2, 1, '0', 37, 36, 19, 19),
(231, 'execute()', 2, '00:00:01', 2, 1, '0', 30, 36, 19, 19),
(232, '`Thread.getThread()`', 2, '00:00:01', 2, 1, '0', 27, 36, 19, 19),
(233, '`Thread thread = new Thread(new MyRunnable()); thread.run();`', 2, '00:00:01', 2, 1, '0', 25, 36, 19, 19),
(234, 'erer', 2, '00:00:02', 2, 1, '0', 38, 36, 19, 19),
(235, 'qwerqr', 2, '00:00:01', 2, 1, '0', 32, 36, 19, 19),
(236, '`isThreadAlive()`', 2, '00:00:01', 2, 1, '0', 28, 36, 19, 19),
(237, 'By calling the start() method directly on the Thread object.', 2, '00:00:01', 2, 1, '0', 29, 36, 19, 19),
(238, 'qwerqer', 2, '00:00:01', 2, 1, '0', 36, 36, 19, 19),
(239, 'qrqwer', 2, '00:00:01', 2, 1, '0', 41, 36, 19, 19),
(240, '`Threadable`', 2, '00:00:01', 2, 1, '0', 24, 36, 19, 19),
(241, '`Thread thread = new Thread().execute() { ... };`', 2, '00:00:01', 2, 1, '0', 23, 36, 19, 19),
(242, 'qrqewr', 2, '00:00:01', 2, 1, '0', 31, 36, 19, 19),
(243, 'qwerqr', 2, '00:00:01', 2, 1, '0', 34, 36, 19, 19),
(244, 'Using synchronized blocks', 1, '00:00:28', 1, 1, '1', 50, 36, 20, 20),
(245, 'null', 1, '00:00:15', 1, 1, '1', 59, 36, 20, 20),
(246, 'Check-then-act', 1, '00:00:05', 1, 2, '1', 45, 36, 20, 20),
(247, 'synchronized', 1, '00:00:18', 1, 1, '1', 56, 36, 20, 20),
(248, 'check', 1, '00:00:18', 1, 1, '1', 54, 36, 20, 20),
(249, 'The program output becomes unpredictable', 1, '00:00:01', 1, 1, '1', 51, 36, 20, 20),
(250, 'Threads read and write the value without synchronization', 1, '', 1, 1, '1', 44, 36, 20, 20),
(251, 'write', 1, '00:00:12', 1, 1, '1', 53, 36, 20, 20),
(252, 'Read-modify-write', 1, '00:00:01', 1, 3, '1', 43, 36, 20, 20),
(253, 'To prevent race conditions', 1, '00:00:01', 1, 4, '1', 47, 36, 20, 20),
(254, 'dfdafsda', 2, '00:00:04', 2, 1, '0', 56, 36, 21, 21),
(255, 'The threads are synchronized automatically', 2, '00:00:01', 2, 1, '0', 51, 36, 21, 21),
(256, 'dfasfa', 2, '00:00:01', 2, 1, '0', 61, 36, 21, 21),
(257, 'To increase thread synchronization', 2, '', 2, 1, '0', 47, 36, 21, 21),
(258, 'Increasing the thread priority', 2, '', 2, 1, '0', 50, 36, 21, 21),
(259, 'safaf', 2, '00:00:01', 2, 1, '0', 59, 36, 21, 21),
(260, 'adfadf', 2, '00:00:01', 2, 1, '0', 55, 36, 21, 21),
(261, 'asdfasf', 2, '00:00:01', 2, 1, '0', 53, 36, 21, 21),
(262, 'Check-then-act', 1, '00:00:01', 2, 1, '1', 45, 36, 21, 21),
(263, 'adfasdf', 2, '00:00:01', 2, 1, '0', 57, 36, 21, 21),
(264, 'Threads read the value concurrently but write sequentially', 2, '', 2, 1, '0', 44, 36, 21, 21),
(265, 'Read-then-write', 2, '00:00:01', 2, 1, '0', 48, 36, 21, 21),
(266, 'By relying on thread interleaving', 2, '', 2, 1, '0', 46, 36, 21, 21),
(267, 'dfasda', 2, '00:00:01', 2, 1, '0', 54, 36, 21, 21),
(268, 'asdfaf', 2, '00:00:01', 2, 1, '0', 60, 36, 21, 21),
(269, 'The action changes the condition', 2, '00:00:01', 2, 1, '0', 49, 36, 21, 21),
(270, 'asfasf', 2, '00:00:01', 2, 1, '0', 52, 36, 21, 21),
(271, 'A critical section that prevents data corruption', 2, '', 2, 1, '0', 42, 36, 21, 21),
(272, 'asdfafsd', 2, '00:00:01', 2, 1, '0', 58, 36, 21, 21),
(273, 'Check-modify-write', 2, '00:00:01', 2, 1, '0', 43, 36, 21, 21),
(274, 'unstarted()', 1, '00:00:33', 1, 2, '1', 74, 36, 22, 22),
(275, 'Call the `start()` method on the virtual thread instance.', 1, '00:00:15', 1, 1, '1', 69, 36, 22, 22),
(276, 'synchronized', 1, '00:00:13', 1, 1, '1', 77, 36, 22, 22),
(277, 'Using the `Thread.ofVirtual()` factory method', 1, '00:00:01', 1, 2, '1', 67, 36, 22, 22),
(278, 'start()', 1, '00:00:08', 1, 2, '1', 75, 36, 22, 22),
(279, 'join()', 1, '00:00:19', 1, 1, '1', 73, 36, 22, 22),
(280, 'Making a blocking file system call', 1, '00:00:01', 1, 1, '1', 66, 36, 22, 22),
(281, 'They require fewer database connections.', 2, '00:00:01', 1, 2, '0', 64, 36, 22, 22),
(282, '`Thread`', 2, '00:00:01', 1, 2, '0', 68, 36, 22, 22),
(283, 'wae', 2, '00:00:02', 1, 2, '0', 76, 36, 22, 22),
(284, 'Synchronized blocks can only be used with platform threads.', 2, '00:00:01', 2, 1, '0', 71, 36, 23, 23),
(285, 'weqweq', 2, '00:00:01', 2, 1, '0', 79, 36, 23, 23),
(286, '`wait()`', 2, '00:00:01', 2, 1, '0', 70, 36, 23, 23),
(287, 'qeqwe', 2, '00:00:01', 2, 1, '0', 73, 36, 23, 23),
(288, '12', 2, '00:00:01', 2, 1, '0', 81, 36, 23, 23),
(289, '`Thread`', 2, '00:00:02', 2, 1, '0', 68, 36, 23, 23),
(290, 'qeqweq', 2, '00:00:01', 2, 1, '0', 80, 36, 23, 23),
(291, 'It is suspended until the network call completes.', 2, '00:00:01', 2, 1, '0', 65, 36, 23, 23),
(292, 'qweqeqw', 2, '00:00:01', 2, 1, '0', 75, 36, 23, 23),
(293, 'qweqeq', 2, '00:00:01', 2, 1, '0', 74, 36, 23, 23),
(294, 'They require fewer database connections.', 2, '', 2, 1, '0', 64, 36, 23, 23),
(295, 'Entering a synchronized block', 2, '00:00:01', 2, 1, '0', 66, 36, 23, 23),
(296, 'Using the `Runnable.startVirtualThread()` method', 2, '', 2, 1, '0', 67, 36, 23, 23),
(297, 'Call the `execute()` method on the virtual thread instance.', 2, '00:00:01', 2, 1, '0', 69, 36, 23, 23),
(298, 'Virtual threads consume fewer resources.', 1, '', 2, 1, '1', 63, 36, 23, 23),
(299, 'qweqeq', 2, '00:00:01', 2, 1, '0', 77, 36, 23, 23),
(300, 'qweqwe', 2, '00:00:01', 2, 1, '0', 76, 36, 23, 23),
(301, 'qeqweqwe', 2, '00:00:01', 2, 1, '0', 78, 36, 23, 23),
(302, 'qweqewq', 2, '00:00:01', 2, 1, '0', 62, 36, 23, 23),
(303, 'qweqew', 2, '00:00:01', 2, 1, '0', 72, 36, 23, 23),
(304, '1231231231', 2, '00:00:03', 1, 2, '0', 96, 36, 24, 24),
(305, '123131', 2, '00:00:01', 1, 2, '0', 88, 36, 24, 24),
(306, '23131', 2, '00:00:01', 1, 3, '0', 100, 36, 24, 24),
(307, '1231231', 2, '00:00:01', 1, 2, '0', 95, 36, 24, 24),
(308, '1231231', 2, '00:00:01', 1, 2, '0', 89, 36, 24, 24),
(309, '123123', 2, '00:00:01', 1, 2, '0', 92, 36, 24, 24),
(310, 'notifyAll()', 1, '00:00:02', 1, 2, '1', 85, 36, 24, 24),
(311, '213123', 2, '00:00:01', 1, 2, '0', 98, 36, 24, 24),
(312, '12312', 2, '00:00:01', 1, 2, '0', 87, 36, 24, 24),
(313, '123123', 2, '00:00:01', 1, 2, '0', 94, 36, 24, 24),
(314, 'wait()', 1, '00:00:31', 1, 4, '1', 100, 36, 25, 25),
(315, 'notifyAll', 1, '00:00:16', 1, 1, '1', 88, 36, 25, 25),
(316, 'wait()', 1, '00:00:09', 1, 2, '1', 95, 36, 25, 25),
(317, 'synchronized', 1, '00:00:23', 1, 1, '1', 87, 36, 25, 25),
(318, 'while', 1, '00:00:20', 1, 1, '1', 97, 36, 25, 25),
(319, 'lock', 1, '00:00:15', 1, 1, '1', 101, 36, 25, 25),
(320, 'InterruptedException', 1, '00:00:31', 1, 1, '1', 93, 36, 25, 25),
(321, 'sleep()', 2, '00:00:01', 1, 3, '0', 82, 36, 25, 25),
(322, 'boolean', 1, '00:00:18', 1, 1, '1', 91, 36, 25, 25),
(323, 're', 2, '00:00:01', 1, 2, '0', 89, 36, 25, 25),
(324, 'sfadfas', 2, '00:00:02', 2, 1, '0', 96, 36, 26, 26),
(325, 'wakeup()', 2, '00:00:02', 2, 1, '0', 83, 36, 26, 26),
(326, 'sdfsd', 2, '00:00:01', 2, 1, '0', 97, 36, 26, 26),
(327, 'asdfasf', 2, '00:00:00', 2, 1, '0', 87, 36, 26, 26),
(328, 'asdfaf', 2, '00:00:01', 2, 1, '0', 91, 36, 26, 26),
(329, 'rqwe', 2, '00:00:01', 2, 1, '0', 94, 36, 26, 26),
(330, 'asdfasdf', 2, '00:00:01', 2, 1, '0', 98, 36, 26, 26),
(331, 'weqweq', 2, '00:00:01', 2, 1, '0', 100, 36, 26, 26),
(332, 'qweqwe', 2, '00:00:01', 2, 1, '0', 88, 36, 26, 26),
(333, 'qweqweq', 2, '00:00:01', 2, 1, '0', 92, 36, 26, 26),
(334, 'qweqwewqe', 2, '00:00:01', 2, 1, '0', 101, 36, 26, 26),
(335, 'qweqeqw', 2, '00:00:01', 2, 1, '0', 99, 36, 26, 26),
(336, 'wait()', 2, '00:00:12', 2, 1, '0', 82, 36, 26, 26),
(337, 'asdasdf', 2, '00:00:02', 2, 1, '0', 93, 36, 26, 26),
(338, 'asdfasdf', 2, '00:00:01', 2, 1, '0', 89, 36, 26, 26),
(339, 'while', 1, '00:00:28', 2, 1, '1', 90, 36, 26, 26),
(340, 'notifyAll()', 1, '00:00:18', 2, 1, '1', 85, 36, 26, 26),
(341, 'It ensures that the signal is properly received before continuing.', 2, '00:00:19', 2, 1, '0', 84, 36, 26, 26),
(342, 'InterruptedException', 2, '00:00:03', 2, 1, '0', 86, 36, 26, 26),
(343, 'wait()', 1, '00:00:26', 2, 1, '1', 95, 36, 26, 26),
(344, 'Simultaneous program execution', 1, '00:06:11', 1, 5, '1', 8, 36, 27, 27),
(345, 'Fork/Join', 1, '00:00:03', 1, 1, '1', 7, 36, 27, 27),
(346, 'memory', 1, '00:00:05', 1, 1, '1', 17, 36, 27, 27),
(347, 'fairness', 2, '00:00:05', 1, 2, '0', 15, 36, 27, 27),
(348, 'Separate state concurrency model', 1, '00:00:01', 1, 1, '1', 3, 36, 27, 27),
(349, 'Avoiding concurrent access errors', 1, '00:00:01', 1, 3, '1', 6, 36, 27, 27),
(350, 'program', 2, '00:00:18', 1, 2, '0', 14, 36, 27, 27),
(351, 'shared', 2, '00:00:06', 1, 2, '0', 16, 36, 27, 27),
(352, 'Allowing multiple threads of execution within an application', 1, '00:00:01', 1, 4, '1', 1, 36, 27, 27),
(353, 'program', 2, '00:00:05', 1, 2, '0', 12, 36, 27, 27);

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
-- Indexes for table `constraints`
--
ALTER TABLE `constraints`
  ADD PRIMARY KEY (`const_ID`),
  ADD KEY `testq_id` (`testq_id`),
  ADD KEY `subj_id` (`subj_id`);

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
-- Indexes for table `finals`
--
ALTER TABLE `finals`
  ADD PRIMARY KEY (`finals_ID`),
  ADD KEY `accnt_id` (`accnt_id`);

--
-- Indexes for table `finals_report`
--
ALTER TABLE `finals_report`
  ADD PRIMARY KEY (`fr_ID`),
  ADD KEY `testq_id` (`testq_id`),
  ADD KEY `finals_ID` (`finals_ID`),
  ADD KEY `accnt_id` (`accnt_id`);

--
-- Indexes for table `lesson_status`
--
ALTER TABLE `lesson_status`
  ADD PRIMARY KEY (`ls_id`),
  ADD KEY `subj_id` (`subj_id`),
  ADD KEY `accnt_id` (`accnt_id`);

--
-- Indexes for table `requests`
--
ALTER TABLE `requests`
  ADD PRIMARY KEY (`req_ID`),
  ADD KEY `exam_id` (`exam_id`);

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
-- Indexes for table `test_history`
--
ALTER TABLE `test_history`
  ADD PRIMARY KEY (`th_ID`),
  ADD KEY `subj_id` (`subj_id`),
  ADD KEY `accnt_id` (`accnt_id`);

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
  ADD PRIMARY KEY (`testr_ID`),
  ADD KEY `testq_id` (`testq_id`),
  ADD KEY `accnt_id` (`accnt_id`),
  ADD KEY `th_ID` (`th_ID`),
  ADD KEY `score_id` (`score_id`);

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
  MODIFY `accnt_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `constraints`
--
ALTER TABLE `constraints`
  MODIFY `const_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `exam`
--
ALTER TABLE `exam`
  MODIFY `exam_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `exam_settings`
--
ALTER TABLE `exam_settings`
  MODIFY `exam_set_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `finals`
--
ALTER TABLE `finals`
  MODIFY `finals_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `finals_report`
--
ALTER TABLE `finals_report`
  MODIFY `fr_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT for table `lesson_status`
--
ALTER TABLE `lesson_status`
  MODIFY `ls_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `requests`
--
ALTER TABLE `requests`
  MODIFY `req_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `scores`
--
ALTER TABLE `scores`
  MODIFY `score_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `subject`
--
ALTER TABLE `subject`
  MODIFY `subj_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `test_history`
--
ALTER TABLE `test_history`
  MODIFY `th_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `test_quest`
--
ALTER TABLE `test_quest`
  MODIFY `testq_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=102;

--
-- AUTO_INCREMENT for table `test_report`
--
ALTER TABLE `test_report`
  MODIFY `testr_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=354;

--
-- AUTO_INCREMENT for table `views`
--
ALTER TABLE `views`
  MODIFY `views_id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
