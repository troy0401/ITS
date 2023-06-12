-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jun 12, 2023 at 04:13 PM
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
  `accnt_type` int(11) NOT NULL COMMENT '1=prof, 2=student',
  `accnt_img` text NOT NULL COMMENT 'account profile'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `account`
--

INSERT INTO `account` (`accnt_id`, `accnt_user`, `accnt_pass`, `accnt_name`, `accnt_type`, `accnt_img`) VALUES
(2, 'prof@yahoo.com', '$2y$10$NsT0JmmLBGHCzaFmU6.QI.no.L68AhUylOCQ67SA02qcFbLaeiJRG', 'Professor', 1, 'Screenshot_from_2023-04-18_12-53-441.png'),
(4, 'admin@yahoo.com', '$2y$10$EhweeFiasnPTQJY58BS.J.R3xWeafw6OHurFdqaGbyJX62hEIfr/2', 'admin', 3, 'Screenshot_from_2023-04-18_13-06-26.png'),
(8, '202011087@fit.edu.ph', '$2y$10$G7HDGldf6iMq.nHsBkWAN.i5t0JvLMLME83cbnQ9VVuyz2Kj5jBIu', 'Francis Niño Santos', 2, 'avatar.png'),
(9, 'john@gmail.com', '$2y$10$A97PCgiIcGaLwxuaC4JIHuXwGYLxRM1/hEtrCV4tRVqQ2HZv2yX3G', 'John Florenz Reyes', 2, 'avatar.png'),
(10, 'kir24vin@gmail.com', '$2y$10$TVmTKCVIw6wExCXIIpAvO.P6G4HQgugljcltl5XFIl3mrtcTR/yTi', 'Marv', 2, '339146515_931518308047079_24194902104718305_n.jpg'),
(11, 'abelgomez01530@gmail.com', '$2y$10$COnDrA.V4g/eIQzhYSRGT.1zreT9/o7C6HuJakgC0EYtERX0pT/Va', 'Abel Gomez', 2, 'avatar.png'),
(12, 'kavapo7057@rockdian.com', '$2y$10$CV9HokJ84MJ7UKGV1ZXJCOrEtxhB0R.mnVcy79FAxI/I2IDOgj.s.', 'JohnnyYespapa', 2, 'avatar.png'),
(13, 'dioshuadalugdugan@gmail.com', '$2y$10$GSzgHO1QwVKO7l/zAfcTDe.4pKshWrDwHYPwZtO56LMla9XKmFOTe', 'Dioshua', 2, 'avatar.png');

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
(1, 'Java Concurrency and Multithreading', 'Description 1', 'https://www.youtube.com/watch?v=mTGdtC9f4EU&list=PLL8woMHwr36EDxjUoCzboZjedsnhLP1j4&index=2&t=37s', 'https://jenkov.com/tutorials/java-concurrency/index.html'),
(2, 'Creating, starting and stopping threads in Java', 'Description 2', 'https://www.youtube.com/watch?v=eQk5AWcTS8w', 'https://jenkov.com/tutorials/java-concurrency/creating-and-starting-threads.html'),
(3, 'Race Conditions in Java Multithreading', 'Description 3', 'https://www.youtube.com/watch?v=RMR75VzYoos&list=PLL8woMHwr36EDxjUoCzboZjedsnhLP1j4&index=9', 'https://jenkov.com/tutorials/java-concurrency/race-conditions-and-critical-sections.html'),
(4, 'Java Virtual Threads', 'Description 4', 'https://www.youtube.com/watch?v=kirhhcFAGB4&list=PLL8woMHwr36EDxjUoCzboZjedsnhLP1j4&index=3', 'https://jenkov.com/tutorials/java-concurrency/java-virtual-threads.html'),
(5, 'The Java Memory Model', 'Description 5', 'https://www.youtube.com/watch?v=LCSqZyjBwWA&list=PLL8woMHwr36EDxjUoCzboZjedsnhLP1j4&index=4', 'https://jenkov.com/tutorials/java-concurrency/java-memory-model.html');

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
(1, 1, 'Which of the following best describes multithreading?', 'Executing multiple programs simultaneously', 'Utilizing multiple CPUs or CPU cores', 'Sharing resources among users', 'Allowing multiple threads of execution within an application', 'Allowing multiple threads of execution within an application', 'It involves simultaneous execution of different parts of the code.', 1, 'img.png'),
(2, 1, 'What is the primary reason for using multithreading in an application?', 'Better resource utilization', 'Enhanced user experience', 'Fairness in resource sharing', 'Improved responsiveness', 'Better resource utilization', 'It ensures efficient utilization of system resources.', 1, 'img.png'),
(3, 1, 'Which concurrency model avoids many concurrent access problems by not sharing objects or data among threads?', 'Shared state concurrency model', 'Separate state concurrency model', 'Multitasking model', 'Distributed systems model', 'Separate state concurrency model', 'Threads do not share any objects or data in this model.', 1, 'img.png'),
(4, 1, 'What is a common benefit of using multithreading in an application?', 'Better utilization of a single CPU', 'Increased fairness in resource sharing', 'Improved user experience in terms of responsiveness', 'Enhanced user experience in terms of multitasking', 'Separate state concurrency model', 'It allows the application to respond promptly to user interactions.', 1, 'img.png'),
(5, 1, 'In a shared state concurrency model, threads:', 'Share objects and data', 'Execute on separate CPUs', 'Avoid concurrency problems', 'Execute sequentially', 'Share objects and data', 'This model involves sharing objects and data among threads.', 1, 'img.png'),
(6, 1, 'What is a potential challenge in multithreading?', 'Efficient resource utilization', 'Sequential execution of threads', 'Avoiding concurrent access errors', 'Utilizing multiple CPUs or cores', 'Avoiding concurrent access errors', 'It relates to errors caused by simultaneous memory access.', 1, 'img.png'),
(7, 1, 'Which Java framework supports functional programming parallelism?', 'Netty', 'Vert.x', 'Play / Akka', 'Fork/Join', 'Fork/Join', 'It was introduced in Java 7 and facilitates parallelism.', 1, 'img.png'),
(8, 1, 'What is the key difference between multitasking and multithreading?', 'Number of CPUs used', 'Simultaneous program execution', 'Resource sharing among threads', 'Efficiency in resource utilization', 'Simultaneous program execution', 'Multithreading involves multiple threads executing within the same program.', 1, 'img.png'),
(9, 1, 'Which type of concurrency model is often associated with shared access problems?', 'Multitasking model', 'Shared nothing model', 'Shared state model', 'Separate state model', 'Shared state model', 'It involves sharing objects and data among threads.', 1, 'img.png'),
(10, 1, 'What is the purpose of multithreading in terms of fairness?', 'Better resource utilization', 'Improved user experience', 'Avoiding concurrency problems', 'Sharing resources among users', 'Sharing resources among users', 'It ensures fair distribution of resources among users.', 1, 'img.png'),
(11, 1, 'Multithreading allows for simultaneous execution of different parts of the code within the same ___________.', 'none', 'none', 'none', 'none', 'program', 'It refers to the execution environment of an application.', 2, 'img.png'),
(12, 1, 'One of the reasons to use multithreading is to better utilize the resources in the ___________.', 'none', 'none', 'none', 'none', 'computer', 'It refers to the computing device where the application runs.', 2, 'img.png'),
(13, 1, 'Multithreading can help in better utilization of multiple CPUs or CPU _________.', 'none', 'none', 'none', 'none', 'cores', 'It refers to the processing units within a computer.', 2, 'img.png'),
(14, 1, 'In multithreading, a thread can be thought of as a separate ________ executing the program.', 'none', 'none', 'none', 'none', 'CPU', 'It refers to a unit of execution.', 2, 'img.png'),
(15, 1, 'Multithreading can provide a better user experience in terms of ____________ by utilizing background threads.\n', 'none', 'none', 'none', 'none', 'responsiveness', 'It refers to how quickly the system responds to user actions.', 2, 'img.png'),
(16, 1, 'The shared state concurrency model in Java involves ___________ objects or data among threads.', 'none', 'none', 'none', 'none', 'sharing', 'It refers to threads accessing the same resources.', 2, 'img.png'),
(17, 1, 'Multithreading is even more challenging than multitasking as threads in a program read and write the same ___________ simultaneously.', 'none', 'none', 'none', 'none', 'memory', 'It refers to threads working independently.', 2, 'img.png'),
(18, 1, 'Multithreading in Java was available from the very __________ of the language.', 'none', 'none', 'none', 'none', 'beginning', 'It refers to the starting point or beginning.', 2, 'img.png'),
(19, 1, 'Multitasking involves executing multiple programs simultaneously, whereas multithreading involves multiple threads executing within the same ___________.', 'none', 'none', 'none', 'none', 'program', 'It refers to the environment where code is executed.', 2, 'img.png'),
(20, 1, ' Multithreading helps in providing a better user experience in terms of ___________ resource sharing among users.', 'none', 'none', 'none', 'none', 'fairness', 'It refers to the fair distribution of resources.', 2, 'Screenshot_from_2023-04-18_12-53-441.png'),
(21, 2, 'What is the correct way to create and start a Java thread?', '`Thread thread = new Thread(); thread.start();', '`Thread thread = new Thread(); thread.run();', '`Thread thread = new Thread(); thread.execute();', '`Thread thread = new Thread(); thread.initialize();`', '`Thread thread = new Thread(); thread.start();', 'The method used to start a thread begins with the letter \'s\'.', 1, 'img.png'),
(22, 2, ' Which method should you override in a subclass of Thread to specify the code to be executed by the thread?', '`execute()`', '`process()`', '`run()`', '`perform()`', '`run()`', 'This method is responsible for defining the thread\'s behavior.', 1, 'img.png'),
(23, 2, 'How can you create an anonymous subclass of Thread that specifies the code to be executed?', '`Thread thread = new Thread() { ... };`', '`Thread thread = new Thread().run() { ... };`', '`Thread thread = new Thread().execute() { ... };`', '`Thread thread = new Thread().process() { ... };`', '`Thread thread = new Thread() { ... };`', 'Curly braces are used to define the anonymous subclass.', 1, 'img.png'),
(24, 2, 'Which interface should you implement to specify the code to be executed by a thread?', '`Runnable`', '`Threadable`', '`ExecRunnable`', '`CodeExecutor`', '`Runnable`', 'This interface contains the `run()` method.', 1, 'img.png'),
(25, 2, 'How can you start a thread with a class that implements the `Runnable` interface?', '`Thread thread = new Thread(MyRunnable()); thread.start();`', '`Thread thread = new Thread(MyRunnable); thread.start();`', '`Thread thread = new Thread(new MyRunnable()); thread.run();`', '`Thread thread = new Thread(new MyRunnable()); thread.start();`', '`Thread thread = new Thread(new MyRunnable()); thread.start();`', 'The method used to start the thread begins with the letter \'s\'.', 1, 'img.png'),
(26, 2, 'Which method is used to pause a thread for a specified number of milliseconds?', '`Thread.suspend()`', '`Thread.stop()`', '`Thread.pause()`', '`Thread.sleep()`', '`Thread.sleep()`', 'This method is used to introduce a delay in thread execution.', 1, 'img.png'),
(27, 2, 'Which method can be used to obtain the currently executing thread?', '`Thread.currentThread()`', '`Thread.getCurrentThread()`', '`Thread.getExecutingThread()`', '`Thread.getThread()`', '`Thread.currentThread()`', 'This method returns a reference to the current thread.', 1, 'img.png'),
(28, 2, 'Which method is used to check if a thread is still alive?', '`isAlive()`', '`isRunning()`', '`isExecuting()`', '`isThreadAlive()`', '`isAlive()`', 'This method returns a boolean value.', 1, 'img.png'),
(29, 2, 'What is the recommended way to specify the code that a Java thread should execute?', 'By creating a subclass of Thread and overriding the run() method.', 'By calling the start() method directly on the Thread object.', 'By implementing the Runnable interface and providing the code in the run() method.', 'By creating a Lambda expression that implements the Runnable interface.', 'By implementing the Runnable interface and providing the code in the run() method.', 'This approach allows for better code organization and separation of concerns.', 1, 'img.png'),
(30, 2, 'Which method should be called to start the execution of a Java thread?', 'start()', 'run()', 'execute()', 'begin()', 'start()', 'This method initiates the execution of the thread and allows it to run in parallel with other threads.', 1, 'img.png'),
(31, 2, 'Creating a Java Thread is done by instantiating the ________ class.', 'none', 'none', 'none', 'none', 'Thread', 'It is a class that represents a thread in Java.', 2, 'img.png'),
(32, 2, 'To start a Java Thread, the method ________ is called.', 'none', 'none', 'none', 'none', 'start()', 'This method initiates the execution of the thread.', 2, 'img.png'),
(33, 2, 'The run() method in a Thread subclass or a Runnable implementation contains the ________ code that will be executed by the thread.', 'none', 'none', 'none', 'none', 'executable', 'It specifies what actions the thread should perform.', 2, 'img.png'),
(34, 2, 'The Java Thread class is part of the ________ package.', 'none', 'none', 'none', 'none', 'java.lang', 'It is a built-in Java package that provides fundamental classes and interfaces.', 2, 'img.png'),
(35, 2, 'To create a thread using the Runnable interface, you need to implement the ________ method.', 'none', 'none', 'none', 'none', 'run()', 'This method defines the actions the thread will perform.', 2, 'img.png'),
(36, 2, 'The Java interface that contains the run() method is called ________.', 'none', 'none', 'none', 'none', 'Runnable', 'It is a standard Java interface used for defining threads.', 2, 'img.png'),
(37, 2, 'To pass code to a Java thread, you can use an ________ class that implements the Runnable interface', 'none', 'none', 'none', 'none', 'anonymous', 'It is a class without a specific name, used for one-time implementation of an interface.', 2, 'img.png'),
(38, 2, 'Another way to pass code to a Java thread is by using a ________ expression that implements the Runnable interface.', 'none', 'none', 'none', 'none', 'lambda', 'It is a concise way to define a functional interface implementation.', 2, 'img.png'),
(39, 2, 'It is possible to create multiple threads by instantiating multiple objects of the ________ class.', 'none', 'none', 'none', 'none', 'Thread', 'It is the base class for all threads in Java.', 2, 'img.png'),
(40, 2, 'The stop() method of the Thread class is deprecated because it can leave shared objects in an ________ state.', 'none', 'none', 'none', 'none', 'unknown', 'Think about the potential risks of abruptly stopping a thread.', 2, 'img.png'),
(41, 2, 'The sleep() method in the Thread class pauses the execution of the thread for a specified ________ of milliseconds.', 'none', 'none', 'none', 'none', 'number', 'It temporarily suspends the execution of the thread.', 2, 'img.png'),
(42, 3, 'What is a race condition?', 'A section of code that executes concurrently', 'A condition that occurs when two or more threads access shared data', 'A critical section that prevents data corruption', 'A condition that occurs when threads are synchronized', 'A condition that occurs when two or more threads access shared data', 'A race condition occurs when multiple threads access shared data simultaneously.', 1, 'img.png'),
(43, 3, 'Which of the following patterns can lead to a race condition?', 'Write-modify-read', 'Read-write-check', 'Check-modify-write', 'Read-modify-write', 'Read-modify-write', 'The pattern involves reading a value, modifying it, and writing it back.', 1, 'img.png'),
(44, 3, 'In a read-modify-write critical section, the problem arises when:', 'Threads read different values from memory', 'Threads modify the value before reading it', 'Threads read the value concurrently but write sequentially', 'Threads read and write the value without synchronization', 'Threads read and write the value without synchronization', 'The problem occurs due to interleaved execution of threads.', 1, 'img.png'),
(45, 3, 'Which critical section pattern may result in one thread overwriting the changes made by another thread?', 'Read-modify-write', 'Check-then-act', 'Act-then-check', 'Write-then-read', 'Check-then-act', 'The pattern involves checking a condition and then performing an action based on it.', 1, 'img.png'),
(46, 3, 'How can race conditions be prevented?', 'By executing the critical section atomically', 'By using synchronized blocks or locks', 'By relying on thread interleaving', 'By increasing the number of threads', 'By using synchronized blocks or locks', 'It involves ensuring exclusive access to the critical section.', 1, 'img.png'),
(47, 3, 'What is the purpose of a critical section?', 'To execute code concurrently', 'To prevent race conditions', 'To modify shared data simultaneously', 'To increase thread synchronization', 'To prevent race conditions', 'It ensures that only one thread can access shared resources at a time.', 1, 'img.png'),
(48, 3, 'Which type of critical section may benefit from breaking it into smaller sections?', 'Read-then-write', 'Check-then-act', 'Read-modify-write', 'Write-then-read', 'Read-modify-write', 'Breaking the critical section can reduce contention and increase throughput.', 1, 'img.png'),
(49, 3, 'In a check-then-act critical section, race conditions can occur when:', 'Two threads concurrently act on the condition', 'The condition is evaluated before any action is taken', 'The action changes the condition', 'The condition is false for all threads', 'Two threads concurrently act on the condition', 'Multiple threads may check the condition simultaneously.', 1, 'img.png'),
(50, 3, 'What is the recommended way to achieve thread synchronization in Java?', 'Using synchronized blocks', 'Using atomic variables', 'Increasing the thread priority', 'Using multiple threads', 'Using synchronized blocks', 'It ensures that only one thread can execute the critical section.', 1, 'img.png'),
(51, 3, 'What happens if a race condition occurs in a critical section?', 'The program terminates abruptly', 'The critical section is skipped', 'The program output becomes unpredictable', 'The threads are synchronized automatically', 'The program output becomes unpredictable', 'The outcome of the program depends on the interleaving of thread', 1, 'img.png'),
(52, 3, 'A race condition occurs when two or more threads access the same ________.', 'none', 'none', 'none', 'none', 'variable', 'It refers to the data or resource that multiple threads share.', 2, 'img.png'),
(53, 3, 'In the read-modify-write pattern, threads first read a value, then modify it, and finally ________ it back.', 'none', 'none', 'none', 'none', 'write', 'It involves updating the value in its original location.', 2, 'img.png'),
(54, 3, 'Race conditions can occur in a check-then-act critical section when multiple threads simultaneously ________ the condition.', 'none', 'none', 'none', 'none', 'check', 'It refers to verifying a specific condition before performing an action.', 2, 'img.png'),
(55, 3, 'To prevent race conditions, it is necessary to execute the critical section as an ________ instruction.', 'none', 'none', 'none', 'none', 'atomic', 'It refers to an indivisible and uninterrupted operation.', 2, 'img.png'),
(56, 3, 'Synchronization in critical sections can be achieved using ________ blocks or locks.', 'none', 'none', 'none', 'none', 'synchronized', 'It refers to the constructs that allow exclusive access to the critical section.', 2, 'img.png'),
(57, 3, 'Breaking a large critical section into smaller sections can reduce ________ on shared resources.', 'none', 'none', 'none', 'none', 'contention', 'It refers to the competition or conflict between threads.', 2, 'img.png'),
(58, 3, 'A race condition may occur inside a ____________ section.', 'none', 'none', 'none', 'none', 'critical', 'This section of code is executed by multiple threads.', 2, 'img.png'),
(59, 3, 'When multiple threads try to remove the same key from a Map concurrently, only one thread succeeds, and others receive a ________ value.', 'none', 'none', 'none', 'none', 'null', 'This happens when the key-value pair is already removed by another thread', 2, 'img.png'),
(60, 3, 'Synchronized blocks provide ________ access to shared resources and prevent race conditions.', 'none', 'none', 'none', 'none', 'exclusive', 'It refers to the capability of a single thread accessing a resource.', 2, 'img.png'),
(61, 3, 'In a check-then-act critical section, race conditions may occur when multiple threads simultaneously ________ the condition and perform the action.', 'none', 'none', 'none', 'none', 'act', 'It refers to the simultaneous execution of the action.', 2, 'img.png'),
(62, 4, 'What method is used to create a new virtual thread in Java?\nThread vThread = ___________________.ofVirtual().start(runnable);', 'none', 'none', 'none', 'none', 'Thread', 'The method starts with \'Thread.ofVirtual()\'', 2, 'img.png'),
(63, 4, 'How do virtual threads differ from platform threads in terms of resource consumption?', 'Virtual threads consume more resources.', 'Virtual threads consume fewer resources.', 'Virtual threads and platform threads consume the same amount of resources.', 'Resource consumption is unrelated to the type of thread.', 'Virtual threads consume fewer resources.', 'Virtual threads are more lightweight.', 1, 'img.png'),
(64, 4, 'What advantage do virtual threads offer when performing blocking IO operations?', 'They can execute more platform threads simultaneously.', 'They can handle more network calls.', 'They require fewer database connections.', 'They can handle more parallel operations.', 'They can handle more parallel operations.', 'Virtual threads allow for more parallelism in IO operations.', 1, 'img.png'),
(65, 4, 'What happens when a virtual thread makes a blocking network call?', 'It is switched to a different platform thread.', 'It remains executed by the same platform thread.', 'It is suspended until the network call completes.', 'It terminates and releases the platform thread.', 'It is switched to a different platform thread.', 'The virtual thread is \"unmounted\" during the blocking call.', 1, 'img.png'),
(66, 4, 'Which situation does NOT unmount a virtual thread from a platform thread?', ' Making a blocking network call', 'Making a blocking file system call', 'Entering a synchronized block', 'Blocking operation on a BlockingQueue', 'Making a blocking file system call', 'Focus on the scenario that does not cause unmounting.', 1, 'img.png'),
(67, 4, 'How can a Java virtual thread be created?', 'Using the `new VirtualThread()` constructor', 'Using the `Thread.ofVirtual()` factory method', 'Using the `Runnable.startVirtualThread()` method', 'Java virtual threads cannot be created explicitly', 'Using the `Thread.ofVirtual()` factory method', 'Look for the correct factory method', 1, 'img.png'),
(68, 4, 'Which interface should be implemented when creating a virtual thread in Java?', '`Runnable`', '`Thread`', '`Callable`', '`Executor`', '`Runnable`', 'The interface represents the task to be executed by the virtual thread.', 1, 'img.png'),
(69, 4, 'How can you start an unstarted virtual thread?', 'Call the `run()` method on the virtual thread instance.', 'Call the `start()` method on the virtual thread instance.', 'Call the `execute()` method on the virtual thread instance.', 'Unstarted virtual threads cannot be started.', 'Call the `start()` method on the virtual thread instance.', 'Look for the correct method to initiate execution.', 1, 'img.png'),
(70, 4, 'Look for the correct method to initiate execution.', '`sleep()`', '`await()`', '`wait()`', '`join()`', '`join()`', 'Look for the method that allows synchronization with the virtual thread.', 1, 'img.png'),
(71, 4, 'Which of the following statements is true regarding the use of synchronized blocks with virtual threads?', 'Virtual threads cannot enter synchronized blocks.', 'Synchronized blocks can only be used with platform threads.', 'Virtual threads can enter synchronized blocks but may cause thread pinning.', 'Synchronized blocks have no impact on virtual thread execution.', 'Virtual threads can enter synchronized blocks but may cause thread pinning.', 'Consider the behavior of virtual threads inside synchronized blocks.', 1, 'img.png'),
(72, 4, 'The ________ method is used to retrieve the current executing virtual thread.', 'none', 'none', 'none', 'none', 'currentThread()', 'The method returns the reference to the currently executing thread.', 2, 'img.png'),
(73, 4, ' You can make the calling thread wait for a virtual thread to finish by using the ________ method.', 'none', 'none', 'none', 'none', 'join()', 'Synchronization method to wait for the completion of a thread.', 2, 'img.png'),
(74, 4, 'To create an unstarted virtual thread, you can use the ________ method.', 'none', 'none', 'none', 'none', 'unstarted()', 'The alternative method to create a virtual thread without starting it.', 2, 'img.png'),
(75, 4, 'A virtual thread can be started immediately using the ________ method.', 'none', 'none', 'none', 'none', 'start()', 'Initiates the execution of the virtual thread.', 2, 'img.png'),
(76, 4, 'To create a virtual thread, you use the new Thread.ofVirtual() ________ method', 'none', 'none', 'none', 'none', 'factory', 'The method used to obtain a virtual thread instance.', 2, 'img.png'),
(77, 4, 'Entering a ________ block can also pin a virtual thread to a platform thread.', 'none', 'none', 'none', 'none', 'synchronized', 'A mechanism used for thread synchronization.', 2, 'img.png'),
(78, 4, 'The Java virtual thread system may compensate for file system calls by starting up another ________ thread.', 'none', 'none', 'none', 'none', 'platform', 'Another thread is created to handle virtual threads.', 2, 'img.png'),
(79, 4, ' When a virtual thread makes a blocking network call, it is ________ from the platform thread.', 'none', 'none', 'none', 'none', 'unmounted', 'Virtual threads are temporarily detached during certain operations.', 2, 'img.png'),
(80, 4, 'Java virtual threads are currently a ________ feature in Java 19.', 'none', 'none', 'none', 'none', 'preview', 'It means their implementation and API may still change.', 2, 'img.png'),
(81, 4, 'During a blocking file system call, a virtual thread remains ________ to the platform thread.', 'none', 'none', 'none', 'none', 'pinned', 'The virtual thread is attached and cannot be switched.', 2, 'img.png');

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
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `account`
--
ALTER TABLE `account`
  MODIFY `accnt_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `constraints`
--
ALTER TABLE `constraints`
  MODIFY `const_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `exam`
--
ALTER TABLE `exam`
  MODIFY `exam_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `exam_settings`
--
ALTER TABLE `exam_settings`
  MODIFY `exam_set_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `finals`
--
ALTER TABLE `finals`
  MODIFY `finals_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `finals_report`
--
ALTER TABLE `finals_report`
  MODIFY `fr_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lesson_status`
--
ALTER TABLE `lesson_status`
  MODIFY `ls_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `requests`
--
ALTER TABLE `requests`
  MODIFY `req_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `scores`
--
ALTER TABLE `scores`
  MODIFY `score_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subject`
--
ALTER TABLE `subject`
  MODIFY `subj_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `test_history`
--
ALTER TABLE `test_history`
  MODIFY `th_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `test_quest`
--
ALTER TABLE `test_quest`
  MODIFY `testq_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;

--
-- AUTO_INCREMENT for table `test_report`
--
ALTER TABLE `test_report`
  MODIFY `testr_ID` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
