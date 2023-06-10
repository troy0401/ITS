-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jun 10, 2023 at 04:47 AM
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
(1, 'new_stud@yahoo.com', '$2y$10$VjQ5jENEqlDW60ww3lBJ4OLffR2M50py4whgymZm6Mmg8yJyqFH2G', 'New Student', 2, 'avatar.png'),
(2, 'prof@yahoo.com', '$2y$10$lqMGbxUnkXIqMrkFOY1WF.WMfpi61bXQJC8.DY.9bgXO824u//Sou', 'Professor', 1, 'img.png'),
(3, 'new_stud2@yahoo.com', '$2y$10$nGcw0xOt/cNBnpzd0LQVHOZhY7kvvIz037J5AKwdl0hUxr1FWfbnm', 'New Student 2', 2, 'avatar.png'),
(4, 'admin@yahoo.com', '$2y$10$EhweeFiasnPTQJY58BS.J.R3xWeafw6OHurFdqaGbyJX62hEIfr/2', 'admin', 3, 'Screenshot_from_2023-04-18_13-06-26.png'),
(5, 'newstudent3@yahoo.com', '$2y$10$xcQmzp3Ov1ZDJgQhKolY/Oy4vNIi/bQ6m9yN3HHEDY5DziCHlU3ry', 'New Student 3', 2, 'avatar.png');

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
(1, 1, 1, 1, 1, '9', '10'),
(2, 1, 1, 2, 1, '6', '1'),
(3, 1, 1, 2, 1, '0', '1'),
(4, 2, 1, 1, 0, '40', '80');

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
(2, 2, 1200, 30, 1),
(3, 1, 600, 10, 2),
(4, 2, 1200, 30, 2),
(5, 1, 600, 10, 3),
(6, 2, 1200, 30, 3),
(7, 1, 600, 10, 4),
(8, 2, 1200, 30, 4);

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
  `fr_testStat` text NOT NULL COMMENT '1=right answer 2=wrong answer',
  `fr_TimeQuest` text NOT NULL COMMENT 'time per quest',
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

--
-- Dumping data for table `lesson_status`
--

INSERT INTO `lesson_status` (`ls_id`, `subj_id`, `accnt_id`, `ls_status`) VALUES
(1, 1, 1, 1),
(2, 1, 1, 1),
(3, 2, 1, 0);

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
(1, 1, 1, 10, 6, 1),
(2, 1, 1, 10, 7, 1),
(3, 1, 1, 0, 0, 1),
(4, 1, 1, 10, 4, 1),
(5, 1, 1, 10, 6, 1),
(6, 1, 1, 10, 5, 1),
(7, 1, 1, 10, 8, 1),
(8, 1, 1, 0, 0, 1),
(9, 1, 1, 10, 10, 1),
(10, 1, 1, 0, 0, 2),
(11, 1, 1, 0, 0, 2),
(12, 1, 1, 0, 0, 2),
(13, 1, 1, 0, 0, 2),
(14, 1, 1, 0, 0, 2),
(15, 1, 1, 30, 7, 2),
(16, 2, 1, 10, 3, 1),
(17, 2, 1, 0, 0, 1),
(18, 2, 1, 10, 2, 1),
(19, 2, 1, 0, 0, 1),
(20, 2, 1, 10, 3, 1),
(21, 2, 1, 10, 3, 1),
(22, 2, 1, 0, 0, 1),
(23, 2, 1, 10, 5, 1),
(24, 2, 1, 0, 0, 1),
(25, 2, 1, 10, 5, 1),
(26, 2, 1, 0, 0, 1),
(27, 2, 1, 10, 4, 1),
(28, 2, 1, 0, 0, 1),
(29, 2, 1, 10, 4, 1),
(30, 2, 1, 0, 0, 1),
(31, 2, 1, 10, 4, 1),
(32, 2, 1, 0, 0, 1),
(33, 2, 1, 10, 3, 1),
(34, 2, 1, 10, 1, 1),
(35, 2, 1, 10, 5, 1),
(36, 2, 1, 10, 1, 1),
(37, 2, 1, 10, 4, 1),
(38, 2, 1, 0, 0, 1),
(39, 2, 1, 10, 3, 1),
(40, 2, 1, 10, 5, 1),
(41, 2, 1, 10, 3, 1),
(42, 2, 1, 0, 0, 1),
(43, 2, 1, 0, 0, 1),
(44, 2, 1, 0, 0, 1),
(45, 2, 1, 10, 2, 1),
(46, 2, 1, 10, 6, 1),
(47, 2, 1, 10, 5, 1),
(48, 2, 1, 10, 5, 1),
(49, 2, 1, 0, 0, 1),
(50, 2, 1, 10, 4, 1),
(51, 2, 1, 10, 3, 1),
(52, 2, 1, 10, 3, 1),
(53, 2, 1, 10, 1, 1),
(54, 2, 1, 10, 2, 1),
(55, 2, 1, 10, 8, 1);

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
(3, 'dhgfhgfg', 'rhtfhf', 'ygjjjhk'),
(4, 'Subtopic 4', 'Description 4', 'https://www.youtube.com/watch?v=8hly31xKli0');

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
(1, 1, 1, 1),
(2, 1, 1, 1),
(3, 1, 1, 1),
(4, 1, 1, 1),
(5, 1, 1, 1),
(6, 1, 1, 1),
(7, 1, 1, 1),
(8, 1, 1, 1),
(9, 1, 1, 1),
(10, 2, 1, 1),
(11, 2, 1, 1),
(12, 2, 1, 1),
(13, 2, 1, 1),
(14, 2, 1, 1),
(15, 2, 1, 1),
(16, 1, 2, 1),
(17, 1, 2, 1),
(18, 1, 2, 1),
(19, 1, 2, 1),
(20, 1, 2, 1),
(21, 1, 2, 1),
(22, 1, 2, 1),
(23, 1, 2, 1),
(24, 1, 2, 1),
(25, 1, 2, 1),
(26, 1, 2, 1),
(27, 1, 2, 1),
(28, 1, 2, 1),
(29, 1, 2, 1),
(30, 1, 2, 1),
(31, 1, 2, 1),
(32, 1, 2, 1),
(33, 1, 2, 1),
(34, 1, 2, 1),
(35, 1, 2, 1),
(36, 1, 2, 1),
(37, 1, 2, 1),
(38, 1, 2, 1),
(39, 1, 2, 1),
(40, 1, 2, 1),
(41, 1, 2, 1),
(42, 1, 2, 1),
(43, 1, 2, 1),
(44, 1, 2, 1),
(45, 1, 2, 1),
(46, 1, 2, 1),
(47, 1, 2, 1),
(48, 1, 2, 1),
(49, 1, 2, 1),
(50, 1, 2, 1),
(51, 1, 2, 1),
(52, 1, 2, 1),
(53, 1, 2, 1),
(54, 1, 2, 1),
(55, 1, 2, 1);

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
  `testq_type` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `test_quest`
--

INSERT INTO `test_quest` (`testq_id`, `subj_id`, `testq_0`, `testq_1`, `testq_2`, `testq_3`, `testq_4`, `testq_ans`, `testq_hint`, `testq_type`) VALUES
(1, 1, 'Suppose we regress SAT score on parent’s education and parent’s income. If we run the regression again but also include the student’s GPA as an additional regressor:', 'The R2 for the regression will either stay the same or increase.', ' The adjusted R2 for the regression will either stay the same or increase.', 'Both (a) and (b) are true.', 'Neither (a) nor (b) is true.', 'The R2 for the regression will either stay the same or increase.', 'When adding an additional regressor, our fit should be at least as good as before, so the R2 for the regression should either stay the same or increase. Adjusted R2 may decrease if the additional regressor had little to no explanatory power.', 1),
(2, 1, 'Suppose we have a sample of the heights of Davis students and want to use the sample mean to get a confidence interval for the mean height in the population. Which of the following would increase the width of this confidence interval?', ' Switching from a 95% confidence interval to a 90% confidence interval.', 'Increasing the sample size used to calculate the sample mean.', 'Switching from a 95% confidence interval to a 99% confidence interval.', 'All of the above.', 'Switching from a 95% confidence interval to a 99% confidence interval.', 'The smaller we make α, the wider our confidence interval will get. A larger sample size would make the confidence interval narrower.', 1),
(3, 1, ' Suppose we can reject the null hypothesis that β2 ≥ 0 at a 5% significance level where β2 is the slope coefficient from a bivariate regression. Which of the following is definitely true?', 'Our test statistic was negative.', 'We can reject the null hypothesis that β2 = 0 at a 5% significance level.', 'We can reject the null hypothesis that β2 ≥ 0 at a 2.5% significance level.', 'We can reject the null hypothesis that β2 < 0 at a 5% significance level.', 'Our test statistic was negative.', 'The critical value for a lower one-tailed hypothesis test will be negative and we will reject the null when the test statistic is more negative than the critical value.', 1),
(4, 1, 'Suppose we regress y on x2. Which of the following would lead to a biased coefficient for x2 ?', 'There is a variable x3 that is correlated with y but not with x2', 'There is a variable x3 that is correlated with x2 but not with y.', 'y is measured with some random error.', 'x is measured with some random error.', 'x is measured with some random error.', 'An omitted variable will bias the coefficient on x2 only if it is correlated with both x2 and with y. Measurement error in x2 will bias the coefficient on x2 since it will lead to errors that are negatively correlated with x2 . Measurement error in y will decrease the precision of the estimated slope coefficient but will not bias the coefficient.', 1),
(5, 1, 'When testing the significance of a subset of regressors, the R2 of the unrestricted model will always be:', 'Greater than or equal to the R2 of the restricted model.', 'Less than or equal to the R2 of the restricted model.', 'Equal to the R2 of the restricted model.', 'It could be greater than, less than or equal to the R2 of the restricted model.', 'Greater than or equal to the R2 of the restricted model.', 'The unrestricted model contains all of the regressors in the restricted model plus additional regressors. The unrestricted model can achieve the same fit as the restricted model by simply having the coefficients on the additional regressors set to zero. More likely is that these coefficients will be nonzero and the fit will improve.', 1),
(6, 1, 'Suppose that the true population model of the relationship between weight (W ) and hours of exercise per day (H) is: W = 200 − 10H + ε where ε meets all of our assumptions. If hours of exercise is measured with some random, mean zero error, which of the following statements about the estimated slope coefficient  b  ̃ 2 is true?', ' E(b  ̃ 2) = −10.', 'E(b  ̃ 2) = 10.', 'E(b  ̃ 2) > −10.', 'E(b  ̃ 2) < −10.', 'E(b  ̃ 2) > −10.', 'The slope coefficient will be biased toward zero due to the measurement error. In this case, that means that the expected value of b  ̃ 2 will be between -10 and 0.', 1),
(7, 1, 'Doubling the value of the largest observation in a sample of incomes will:', 'Increase the median.', 'Increase the mode.', 'Increase the mean.', 'All of the above.', 'Increase the mean.', 'Doubling the largest observation will increase the average value of the variable but will not change the position or value of the 50th percentile of the distribution of values.', 1),
(8, 1, 'Suppose that the risk of catching the flu is high for young children and the elderly but low for teenagers and younger adults. Which of the following equations would be the best choice for modeling the relationship between flu risk (R) and age (A)?', 'R = β1 + β2A + ε.', 'ln(R) = β1 + β2 ln(A) + ε.', 'R = β1 + β2A + β2 A2 + ε.', 'R = β1 + β2ln(A) + ε.', 'R = β1 + β2A + β2 A2 + ε.', 'Based on the description, flu risk is first decreasing with age and then increasing with age. We need a polynomial to fit this type of parabolic curve.', 1),
(9, 1, 'Suppose that snow depth measured in feet is included as a regressor in a multivariate regression and the magnitude of the estimated coefficient for snowdepth is 5. If we rerun the regression using snow depth measured in inches, the new estimated coefficient on snowfall will be:', 'Larger than 5.', 'Smaller than 5.', 'Still equal to 5.', 'Not enough information.', 'Smaller than 5.', 'The coefficient is giving us the change in y with a change in snowdepth of one 1 foot. The change in y with a change in snowdepth of one inch will be 1/12 of this value.', 1),
(10, 1, 'When regressing annual work hours on income, a researcher finds that the variance of the residuals increases as work hours increases. This will affect:  ', 'The expected value of the slope coefficient for income.', 'The magnitude of the standard error for the slope coefficient for income.', 'Both (a) and (b).', 'Neither (a) nor (b).', 'The magnitude of the standard error for the slope coefficient for income.', 'This is a case of heteroskedasticity. Heteroskedasticity will change the standard errors of our estimates but will not bias the coefficients.', 1),
(11, 1, 'The histogram for hours of study per week based on a sample of 400 Davis students is symmetric and centered at 15 hours. Which of the following statements is true?', 'The sample median is 15 hours.', 'The sample mean is 15 hours.', 'The skewness for the sample is zero.', 'All of the above.', 'All of the above.', 'Because the distribution is symmetric, 50 percent of the observations will be to the right of 15 hours and 50 percent will be to the left of 15 hours, making 15 hours the median. The symmetry will also lead to the mean being equal to the 15 hours (for every observation that is larger than 15, there is a corresponding obser- vation that is smaller than 15 by the same amount). For a symmetric distribution, skewness is zero.', 1),
(12, 1, 'When running a bivariate regression, which of the following is not possible?', 'The error sum of squares is larger than the total sum of squares.', 'The error sum of squares is equal to the total sum of squares.', 'The error sum of squares is zero.', 'The error sum of squares is positive.', 'The error sum of squares is larger than the total sum of squares.', 'The largest the error sum of squares can ever be is the magnitude of the total sum of squares. If it were larger you could achieve a better fit by simply setting all of your slope coefficients to zero.', 1),
(13, 1, 'Which of the following would definitely not lead to the error term being correlated with a regressor x?', 'Random measurement error in x.', 'An omitted variable correlated with x.', 'Choosing an incorrect functional form for the regression equation.', 'Random measurement error in y.', 'Random measurement error in y.', 'If the measurement error in y is truly random, then it will be independent of the value of x. So adding this measurement error into the error term will leave the error term uncorrelated with x.', 1),
(14, 1, 'Adding an irrelevant variable to a regression will:', 'Have no effect on the regression results.', 'Tend to bias the coefficients for the other regressors.', 'Lower the R2 .', 'None of the above.', 'None of the above.', 'Including an irrelevant variable may increase our standard errors. It will also lower the adjusted R2 for the regression.', 1),
(15, 1, 'Suppose we run a regression with GPA as the dependent variable and SAT score as the independent variable. Which of the following statements is definitely true?', 'The sign of the estimated slope coefficient will be the same as the sign of the correlation between GPA and SAT score.', 'The sign of the estimated slope coefficient could be different than the sign of the corre- lation between GPA and SAT score if there are omitted variables.', 'The magnitude of the slope coefficient will be equal to the magnitude of the correlation between GPA and SAT score.', 'The slope coefficient will be statistically significant.', 'The sign of the estimated slope coefficient will be the same as the sign of the correlation between GPA and SAT score.', 'The slope coefficient is a function of the correlation between GPA and SAT score. The signs will be the same. Even if the sign of the true relationship is the opposite of the estimated coefficient due to omitted variable bias, the sign of the correlation will match up with the sign of the estimated coefficient (the correlation does not control for the omitted variable either).', 1),
(16, 1, 'Which of the following is not a measure of central tendency?', 'The mean.', 'The mode.', 'The sample range.', 'The median.', 'The sample range.', 'The sample range is a measure of dispersion. If the entire sample distribution was shifted, the center of the distribution would certainly shift but the sample range would stay exactly the same.', 1),
(17, 1, 'Suppose we use an F test after running a multivariate regression to test the null hypothesis that β3 = β4 = 0 and get an F statistic that is larger than the critical value for a 5% significance level. We would conclude that:', 'β3 6= β4.', 'β3 > 0 or β4 > 0.', 'β3 6= 0 and β4 6= 0.', 'None of the above.', 'None of the above.', 'We would reject the null hypothesis that β3 = β4 = 0 in favor of the alternative hypothesis that at least one of the coefficients is different from zero. We cannot say anything about whether both are different than zero or whether they are different from each other.', 1),
(18, 1, 'Which of the following would make you more likely to reject the hypothesis that an individual slope coefficient is equal to zero?', 'A larger standard error for that slope coefficient.', 'A smaller t statistic for that slope coefficient.', 'A smaller F statistic for the regression.', 'A larger value for the ratio of the coefficient to its standard error.', 'A larger value for the ratio of the coefficient to its standard error.', 'When testing whether a slope coefficient is different than zero, the test statistic is simply the ratio of the coefficient to the standard error. We are more likely to reject the null hypothesis that the coefficient is equal to zero when this test statistic is larger in magnitude.', 1),
(19, 1, 'Suppose that we include a dummy variable for male and a dummy variable for female in a regression. This will create a:', 'Omitted variable bias problem.', 'Heteroskedasticity problem.', 'Multicollinearity problem.', 'Homoskedasticity problem.', 'Multicollinearity problem.', 'The dummy variables will be perfectly collinear (the value of one always tells us exactly what the value of the other one is).', 1),
(20, 1, 'The distribution of the sample mean will:', 'Be centered at zero.', 'Have a smaller variance for smaller sample sizes.', 'Centered at the population mean.', '(1) and (2)', 'Centered at the population mean.', 'The sample mean is normally distributed with a mean equal to the population mean and a variance that decreases as sample size increases.', 1),
(21, 2, 'Suppose we regress SAT score on parent’s education and parent’s income. If we run the regression again but also include the student’s GPA as an additional regressor:', 'The R 2 for the regression will either stay the same or increase.', ' The adjusted R2 for the regression will either stay the same or increase.', 'Both (a) and (b) are true.', 'Neither (a) nor (b) is true.', 'The R2 for the regression will either stay the same or increase.', 'When adding an additional regressor, our fit should be at least as good as before, so the R2 for the regression should either stay the same or increase. Adjusted R2 may decrease if the additional regressor had little to no explanatory power.', 1),
(22, 2, 'Suppose we have a sample of the heights of Davis students and want to use the sample mean to get a confidence interval for the mean height in the population. Which of the following would increase the width of this confidence interval?', ' Switching from a 95% confidence interval to a 90% confidence interval.', 'Increasing the sample size used to calculate the sample mean.', 'Switching from a 95% confidence interval to a 99% confidence interval.', 'All of the above.', 'Switching from a 95% confidence interval to a 99% confidence interval.', 'The smaller we make α, the wider our confidence interval will get. A larger sample size would make the confidence interval narrower.', 1),
(23, 2, ' Suppose we can reject the null hypothesis that β2 ≥ 0 at a 5% significance level where β2 is the slope coefficient from a bivariate regression. Which of the following is definitely true?', ' Our test statistic was negative.', 'We can reject the null hypothesis that β2 = 0 at a 5% significance level.', 'We can reject the null hypothesis that β2 ≥ 0 at a 2.5% significance level.', 'We can reject the null hypothesis that β2 < 0 at a 5% significance level.', 'Our test statistic was negative.', 'The critical value for a lower one-tailed hypothesis test will be negative and we will reject the null when the test statistic is more negative than the critical value.', 1),
(24, 2, 'Suppose we regress y on x2. Which of the following would lead to a biased coefficient for x2 ?', 'There is a variable x3 that is correlated with y but not with x2', 'There is a variable x3 that is correlated with x2 but not with y.', 'There is a variable x3 that is correlated with x2 but not with y.', 'x is measured with some random error.', 'x is measured with some random error.', 'An omitted variable will bias the coefficient on x2 only if it is correlated with both x2 and with y. Measurement error in x2 will bias the coefficient on x2 since it will lead to errors that are negatively correlated with x2 . Measurement error in y will decrease the precision of the estimated slope coefficient but will not bias the coefficient.', 1),
(25, 2, 'When testing the significance of a subset of regressors, the R2 of the unrestricted model will always be:', 'Greater than or equal to the R2 of the restricted model.', 'Less than or equal to the R2 of the restricted model.', 'Equal to the R2 of the restricted model.', 'It could be greater than, less than or equal to the R2 of the restricted model.', 'Greater than or equal to the R2 of the restricted model.', 'The unrestricted model contains all of the regressors in the restricted model plus additional regressors. The unrestricted model can achieve the same fit as the restricted model by simply having the coefficients on the additional regressors set to zero. More likely is that these coefficients will be nonzero and the fit will improve.', 1),
(26, 2, 'Suppose that the true population model of the relationship between weight (W ) and hours of exercise per day (H) is: W = 200 − 10H + ε where ε meets all of our assumptions. If hours of exercise is measured with some random, mean zero error, which of the following statements about the estimated slope coefficient  b  ̃ 2 is true?', ' E(b  ̃ 2) = −10.', 'E(b  ̃ 2) = 10.', 'E(b  ̃ 2) > −10.', 'E(b  ̃ 2) < −10.', 'E(b  ̃ 2) > −10.', 'The slope coefficient will be biased toward zero due to the measurement error. In this case, that means that the expected value of b  ̃ 2 will be between -10 and 0.', 1),
(27, 2, 'Doubling the value of the largest observation in a sample of incomes will:', 'Increase the median.', 'Increase the mode.', 'Increase the mean.', 'All of the above.', 'Increase the mean.', 'Doubling the largest observation will increase the average value of the variable but will not change the position or value of the 50th percentile of the distribution of values.', 1),
(28, 2, 'Suppose that the risk of catching the flu is high for young children and the elderly but low for teenagers and younger adults. Which of the following equations would be the best choice for modeling the relationship between flu risk (R) and age (A)?', 'R = β1 + β2A + ε.', 'ln(R) = β1 + β2 ln(A) + ε.', 'R = β1 + β2A + β2 A2 + ε.', 'R = β1 + β2ln(A) + ε.', 'R = β1 + β2A + β2 A2 + ε.', 'Based on the description, flu risk is first decreasing with age and then increasing with age. We need a polynomial to fit this type of parabolic curve.', 1),
(29, 2, 'Suppose that snow depth measured in feet is included as a regressor in a multivariate regression and the magnitude of the estimated coefficient for snowdepth is 5. If we rerun the regression using snow depth measured in inches, the new estimated coefficient on snowfall will be:', 'Larger than 5.', 'Smaller than 5.', 'Still equal to 5.', 'Not enough information.', 'Smaller than 5.', 'The coefficient is giving us the change in y with a change in snowdepth of one 1 foot. The change in y with a change in snowdepth of one inch will be 1/12 of this value.', 1),
(30, 2, 'When regressing annual work hours on income, a researcher finds that the variance of the residuals increases as work hours increases. This will affect:', 'The expected value of the slope coefficient for income.', 'The magnitude of the standard error for the slope coefficient for income.', 'Both (a) and (b).', 'Neither (a) nor (b).', 'The magnitude of the standard error for the slope coefficient for income.', 'This is a case of heteroskedasticity. Heteroskedasticity will change the standard errors of our estimates but will not bias the coefficients.', 1),
(31, 2, 'The histogram for hours of study per week based on a sample of 400 Davis students is symmetric and centered at 15 hours. Which of the following statements is true?', 'The sample median is 15 hours.', 'The sample mean is 15 hours.', 'The skewness for the sample is zero.', 'All of the above.', 'All of the above.', 'Because the distribution is symmetric, 50 percent of the observations will be to the right of 15 hours and 50 percent will be to the left of 15 hours, making 15 hours the median. The symmetry will also lead to the mean being equal to the 15 hours (for every observation that is larger than 15, there is a corresponding obser- vation that is smaller than 15 by the same amount). For a symmetric distribution, skewness is zero.', 1),
(32, 2, 'When running a bivariate regression, which of the following is not possible?', 'The error sum of squares is larger than the total sum of squares.', 'The error sum of squares is equal to the total sum of squares.', 'The error sum of squares is zero.', 'The error sum of squares is positive.', 'The error sum of squares is larger than the total sum of squares.', 'The largest the error sum of squares can ever be is the magnitude of the total sum of squares. If it were larger you could achieve a better fit by simply setting all of your slope coefficients to zero.', 1),
(33, 2, 'Which of the following would definitely not lead to the error term being correlated with a regressor x?', 'Random measurement error in x.', 'An omitted variable correlated with x.', 'Choosing an incorrect functional form for the regression equation.', 'Random measurement error in y.', 'Random measurement error in y.', 'If the measurement error in y is truly random, then it will be independent of the value of x. So adding this measurement error into the error term will leave the error term uncorrelated with x.', 1),
(34, 2, 'Adding an irrelevant variable to a regression will:', 'Have no effect on the regression results.', 'Tend to bias the coefficients for the other regressors.', 'Lower the R2 .', 'None of the above.', 'None of the above.', 'Including an irrelevant variable may increase our standard errors. It will also lower the adjusted R2 for the regression.', 1),
(35, 2, 'Suppose we run a regression with GPA as the dependent variable and SAT score as the independent variable. Which of the following statements is definitely true?', 'The sign of the estimated slope coefficient will be the same as the sign of the correlation between GPA and SAT score.', 'The sign of the estimated slope coefficient could be different than the sign of the corre- lation between GPA and SAT score if there are omitted variables.', 'The magnitude of the slope coefficient will be equal to the magnitude of the correlation between GPA and SAT score.', 'The slope coefficient will be statistically significant.', 'The sign of the estimated slope coefficient will be the same as the sign of the correlation between GPA and SAT score.', 'The slope coefficient is a function of the correlation between GPA and SAT score. The signs will be the same. Even if the sign of the true relationship is the opposite of the estimated coefficient due to omitted variable bias, the sign of the correlation will match up with the sign of the estimated coefficient (the correlation does not control for the omitted variable either).', 1),
(36, 2, 'Which of the following is not a measure of central tendency?', 'The mean.', 'The mode.', 'The sample range.', 'The median.', 'The sample range.', 'The sample range is a measure of dispersion. If the entire sample distribution was shifted, the center of the distribution would certainly shift but the sample range would stay exactly the same.', 1),
(37, 2, 'Suppose we use an F test after running a multivariate regression to test the null hypothesis that β3 = β4 = 0 and get an F statistic that is larger than the critical value for a 5% significance level. We would conclude that:', 'β3 6= β4.', 'β3 > 0 or β4 > 0.', 'β3 6= 0 and β4 6= 0.', 'None of the above.', 'None of the above.', 'We would reject the null hypothesis that β3 = β4 = 0 in favor of the alternative hypothesis that at least one of the coefficients is different from zero. We cannot say anything about whether both are different than zero or whether they are different from each other.', 1),
(38, 2, 'Which of the following would make you more likely to reject the hypothesis that an individual slope coefficient is equal to zero?', 'A larger standard error for that slope coefficient.', 'A smaller t statistic for that slope coefficient.', 'A smaller F statistic for the regression.', 'A larger value for the ratio of the coefficient to its standard error.', 'A larger value for the ratio of the coefficient to its standard error.', 'When testing whether a slope coefficient is different than zero, the test statistic is simply the ratio of the coefficient to the standard error. We are more likely to reject the null hypothesis that the coefficient is equal to zero when this test statistic is larger in magnitude.', 1),
(39, 2, 'Suppose that we include a dummy variable for male and a dummy variable for female in a regression. This will create a:', 'Omitted variable bias problem.', 'Heteroskedasticity problem.', 'Multicollinearity problem.', 'Homoskedasticity problem.', 'Multicollinearity problem.', 'The dummy variables will be perfectly collinear (the value of one always tells us exactly what the value of the other one is).', 1),
(40, 2, 'The distribution of the sample mean will:', 'Be centered at zero.', 'Have a smaller variance for smaller sample sizes.', 'Centered at the population mean.', '(1) and (2)', 'Centered at the population mean.', 'The sample mean is normally distributed with a mean equal to the population mean and a variance that decreases as sample size increases.', 1),
(41, 3, 'Suppose we regress SAT score on parent’s education and parent’s income. If we run the regression again but also include the student’s GPA as an additional regressor:', 'The R 2 for the regression will either stay the same or increase.', ' The adjusted R2 for the regression will either stay the same or increase.', 'Both (a) and (b) are true.', 'Neither (a) nor (b) is true.', 'The R2 for the regression will either stay the same or increase.', 'When adding an additional regressor, our fit should be at least as good as before, so the R2 for the regression should either stay the same or increase. Adjusted R2 may decrease if the additional regressor had little to no explanatory power.', 1),
(42, 3, 'Suppose we have a sample of the heights of Davis students and want to use the sample mean to get a confidence interval for the mean height in the population. Which of the following would increase the width of this confidence interval?', ' Switching from a 95% confidence interval to a 90% confidence interval.', 'Increasing the sample size used to calculate the sample mean.', 'Switching from a 95% confidence interval to a 99% confidence interval.', 'All of the above.', 'Switching from a 95% confidence interval to a 99% confidence interval.', 'The smaller we make α, the wider our confidence interval will get. A larger sample size would make the confidence interval narrower.', 1),
(43, 3, ' Suppose we can reject the null hypothesis that β2 ≥ 0 at a 5% significance level where β2 is the slope coefficient from a bivariate regression. Which of the following is definitely true?', ' Our test statistic was negative.', 'We can reject the null hypothesis that β2 = 0 at a 5% significance level.', 'We can reject the null hypothesis that β2 ≥ 0 at a 2.5% significance level.', 'We can reject the null hypothesis that β2 < 0 at a 5% significance level.', 'Our test statistic was negative.', 'The critical value for a lower one-tailed hypothesis test will be negative and we will reject the null when the test statistic is more negative than the critical value.', 1),
(44, 3, 'Suppose we regress y on x2. Which of the following would lead to a biased coefficient for x2 ?', 'There is a variable x3 that is correlated with y but not with x2', 'There is a variable x3 that is correlated with x2 but not with y.', 'y is measured with some random error.', 'x is measured with some random error.', 'x is measured with some random error.', 'An omitted variable will bias the coefficient on x2 only if it is correlated with both x2 and with y. Measurement error in x2 will bias the coefficient on x2 since it will lead to errors that are negatively correlated with x2 . Measurement error in y will decrease the precision of the estimated slope coefficient but will not bias the coefficient.', 1),
(45, 3, 'When testing the significance of a subset of regressors, the R2 of the unrestricted model will always be:', 'Greater than or equal to the R2 of the restricted model.', 'Less than or equal to the R2 of the restricted model.', 'Equal to the R2 of the restricted model.', 'It could be greater than, less than or equal to the R2 of the restricted model.', 'Greater than or equal to the R2 of the restricted model.', 'The unrestricted model contains all of the regressors in the restricted model plus additional regressors. The unrestricted model can achieve the same fit as the restricted model by simply having the coefficients on the additional regressors set to zero. More likely is that these coefficients will be nonzero and the fit will improve.', 1),
(46, 3, 'Suppose that the true population model of the relationship between weight (W ) and hours of exercise per day (H) is: W = 200 − 10H + ε where ε meets all of our assumptions. If hours of exercise is measured with some random, mean zero error, which of the following statements about the estimated slope coefficient  b  ̃ 2 is true?', ' E(b  ̃ 2) = −10.', 'E(b  ̃ 2) = 10.', 'E(b  ̃ 2) > −10.', 'E(b  ̃ 2) < −10.', 'E(b  ̃ 2) > −10.', 'The slope coefficient will be biased toward zero due to the measurement error. In this case, that means that the expected value of b  ̃ 2 will be between -10 and 0.', 1),
(47, 3, 'Doubling the value of the largest observation in a sample of incomes will:', 'Increase the median.', 'Increase the mode.', 'Increase the mean.', 'All of the above.', 'Increase the mean.', 'Doubling the largest observation will increase the average value of the variable but will not change the position or value of the 50th percentile of the distribution of values.', 1),
(48, 3, 'Suppose that the risk of catching the flu is high for young children and the elderly but low for teenagers and younger adults. Which of the following equations would be the best choice for modeling the relationship between flu risk (R) and age (A)?', 'R = β1 + β2A + ε.', 'ln(R) = β1 + β2 ln(A) + ε.', 'R = β1 + β2A + β2 A2 + ε.', 'R = β1 + β2ln(A) + ε.', 'R = β1 + β2A + β2 A2 + ε.', 'Based on the description, flu risk is first decreasing with age and then increasing with age. We need a polynomial to fit this type of parabolic curve.', 1),
(49, 3, 'Suppose that snow depth measured in feet is included as a regressor in a multivariate regression and the magnitude of the estimated coefficient for snowdepth is 5. If we rerun the regression using snow depth measured in inches, the new estimated coefficient on snowfall will be:', 'Larger than 5.', 'Smaller than 5.', '', 'Not enough information.', 'Smaller than 5.', 'The coefficient is giving us the change in y with a change in snowdepth of one 1 foot. The change in y with a change in snowdepth of one inch will be 1/12 of this value.', 1),
(50, 3, 'When regressing annual work hours on income, a researcher finds that the variance of the residuals increases as work hours increases. This will affect:', 'The expected value of the slope coefficient for income.', 'The magnitude of the standard error for the slope coefficient for income.', 'Both (a) and (b).', 'Neither (a) nor (b).', 'The magnitude of the standard error for the slope coefficient for income.', 'This is a case of heteroskedasticity. Heteroskedasticity will change the standard errors of our estimates but will not bias the coefficients.', 1),
(51, 3, 'The histogram for hours of study per week based on a sample of 400 Davis students is symmetric and centered at 15 hours. Which of the following statements is true?', 'The sample median is 15 hours.', 'The sample mean is 15 hours.', 'The skewness for the sample is zero.', 'All of the above.', 'All of the above.', 'Because the distribution is symmetric, 50 percent of the observations will be to the right of 15 hours and 50 percent will be to the left of 15 hours, making 15 hours the median. The symmetry will also lead to the mean being equal to the 15 hours (for every observation that is larger than 15, there is a corresponding obser- vation that is smaller than 15 by the same amount). For a symmetric distribution, skewness is zero.', 1),
(52, 3, 'When running a bivariate regression, which of the following is not possible?', 'The error sum of squares is larger than the total sum of squares.', 'The error sum of squares is equal to the total sum of squares.', 'The error sum of squares is zero.', 'The error sum of squares is positive.', 'The error sum of squares is larger than the total sum of squares.', 'The largest the error sum of squares can ever be is the magnitude of the total sum of squares. If it were larger you could achieve a better fit by simply setting all of your slope coefficients to zero.', 1),
(53, 3, 'Which of the following would definitely not lead to the error term being correlated with a regressor x?', 'Random measurement error in x.', 'An omitted variable correlated with x.', 'Choosing an incorrect functional form for the regression equation.', 'Random measurement error in y.', 'Random measurement error in y.', 'If the measurement error in y is truly random, then it will be independent of the value of x. So adding this measurement error into the error term will leave the error term uncorrelated with x.', 1),
(54, 3, 'Adding an irrelevant variable to a regression will:', 'Have no effect on the regression results.', 'Tend to bias the coefficients for the other regressors.', 'Lower the R2 .', 'None of the above.', 'None of the above.', 'Including an irrelevant variable may increase our standard errors. It will also lower the adjusted R2 for the regression.', 1),
(55, 3, 'Suppose we run a regression with GPA as the dependent variable and SAT score as the independent variable. Which of the following statements is definitely true?', 'The sign of the estimated slope coefficient will be the same as the sign of the correlation between GPA and SAT score.', 'The sign of the estimated slope coefficient could be different than the sign of the corre- lation between GPA and SAT score if there are omitted variables.', 'The magnitude of the slope coefficient will be equal to the magnitude of the correlation between GPA and SAT score.', 'The slope coefficient will be statistically significant.', 'The sign of the estimated slope coefficient will be the same as the sign of the correlation between GPA and SAT score.', 'The slope coefficient is a function of the correlation between GPA and SAT score. The signs will be the same. Even if the sign of the true relationship is the opposite of the estimated coefficient due to omitted variable bias, the sign of the correlation will match up with the sign of the estimated coefficient (the correlation does not control for the omitted variable either).', 1),
(56, 3, 'Which of the following is not a measure of central tendency?', 'The mean.', 'The mode.', 'The sample range.', 'The median.', 'The sample range.', 'The sample range is a measure of dispersion. If the entire sample distribution was shifted, the center of the distribution would certainly shift but the sample range would stay exactly the same.', 1),
(57, 3, 'Suppose we use an F test after running a multivariate regression to test the null hypothesis that β3 = β4 = 0 and get an F statistic that is larger than the critical value for a 5% significance level. We would conclude that:', 'β3 6= β4.', 'β3 > 0 or β4 > 0.', 'β3 6= 0 and β4 6= 0.', 'None of the above.', 'None of the above.', 'We would reject the null hypothesis that β3 = β4 = 0 in favor of the alternative hypothesis that at least one of the coefficients is different from zero. We cannot say anything about whether both are different than zero or whether they are different from each other.', 1),
(58, 3, 'Which of the following would make you more likely to reject the hypothesis that an individual slope coefficient is equal to zero?', 'A larger standard error for that slope coefficient.', 'A smaller t statistic for that slope coefficient.', 'A smaller F statistic for the regression.', 'A larger value for the ratio of the coefficient to its standard error.', 'A larger value for the ratio of the coefficient to its standard error.', 'When testing whether a slope coefficient is different than zero, the test statistic is simply the ratio of the coefficient to the standard error. We are more likely to reject the null hypothesis that the coefficient is equal to zero when this test statistic is larger in magnitude.', 1),
(59, 3, 'Suppose that we include a dummy variable for male and a dummy variable for female in a regression. This will create a:', 'Omitted variable bias problem.', 'Heteroskedasticity problem.', 'Multicollinearity problem.', 'Homoskedasticity problem.', 'Multicollinearity problem.', 'The dummy variables will be perfectly collinear (the value of one always tells us exactly what the value of the other one is).', 1),
(60, 3, 'The distribution of the sample mean will:', 'Be centered at zero.', 'Have a smaller variance for smaller sample sizes.', 'Centered at the population mean.', '(1) and (2)', 'Centered at the population mean.', 'The sample mean is normally distributed with a mean equal to the population mean and a variance that decreases as sample size increases.', 1),
(61, 4, 'Suppose we regress SAT score on parent’s education and parent’s income. If we run the regression again but also include the student’s GPA as an additional regressor:', 'The R 2 for the regression will either stay the same or increase.', ' The adjusted R2 for the regression will either stay the same or increase.', 'Both (a) and (b) are true.', 'Neither (a) nor (b) is true.', 'The R2 for the regression will either stay the same or increase.', 'When adding an additional regressor, our fit should be at least as good as before, so the R2 for the regression should either stay the same or increase. Adjusted R2 may decrease if the additional regressor had little to no explanatory power.', 1),
(62, 4, 'Suppose we have a sample of the heights of Davis students and want to use the sample mean to get a confidence interval for the mean height in the population. Which of the following would increase the width of this confidence interval?', ' Switching from a 95% confidence interval to a 90% confidence interval.', 'Increasing the sample size used to calculate the sample mean.', 'Switching from a 95% confidence interval to a 99% confidence interval.', 'All of the above.', 'Switching from a 95% confidence interval to a 99% confidence interval.', 'The smaller we make α, the wider our confidence interval will get. A larger sample size would make the confidence interval narrower.', 1),
(63, 4, ' Suppose we can reject the null hypothesis that β2 ≥ 0 at a 5% significance level where β2 is the slope coefficient from a bivariate regression. Which of the following is definitely true?', ' Our test statistic was negative.', 'We can reject the null hypothesis that β2 = 0 at a 5% significance level.', 'We can reject the null hypothesis that β2 ≥ 0 at a 2.5% significance level.', 'We can reject the null hypothesis that β2 < 0 at a 5% significance level.', 'Our test statistic was negative.', 'The critical value for a lower one-tailed hypothesis test will be negative and we will reject the null when the test statistic is more negative than the critical value.', 1),
(64, 4, 'Suppose we regress y on x2. Which of the following would lead to a biased coefficient for x2 ?', 'There is a variable x3 that is correlated with y but not with x2', 'There is a variable x3 that is correlated with x2 but not with y.', 'y is measured with some random error.', 'x is measured with some random error.', 'x is measured with some random error.', 'An omitted variable will bias the coefficient on x2 only if it is correlated with both x2 and with y. Measurement error in x2 will bias the coefficient on x2 since it will lead to errors that are negatively correlated with x2 . Measurement error in y will decrease the precision of the estimated slope coefficient but will not bias the coefficient.', 1),
(65, 4, 'When testing the significance of a subset of regressors, the R2 of the unrestricted model will always be:', 'Greater than or equal to the R2 of the restricted model.', 'Less than or equal to the R2 of the restricted model.', 'Equal to the R2 of the restricted model.', 'It could be greater than, less than or equal to the R2 of the restricted model.', 'Greater than or equal to the R2 of the restricted model.', 'The unrestricted model contains all of the regressors in the restricted model plus additional regressors. The unrestricted model can achieve the same fit as the restricted model by simply having the coefficients on the additional regressors set to zero. More likely is that these coefficients will be nonzero and the fit will improve.', 1),
(66, 4, 'Suppose that the true population model of the relationship between weight (W ) and hours of exercise per day (H) is: W = 200 − 10H + ε where ε meets all of our assumptions. If hours of exercise is measured with some random, mean zero error, which of the following statements about the estimated slope coefficient  b  ̃ 2 is true?', ' E(b  ̃ 2) = −10.', 'E(b  ̃ 2) = 10.', 'E(b  ̃ 2) > −10.', 'E(b  ̃ 2) < −10.', 'E(b  ̃ 2) > −10.', 'The slope coefficient will be biased toward zero due to the measurement error. In this case, that means that the expected value of b  ̃ 2 will be between -10 and 0.', 1),
(67, 4, 'Doubling the value of the largest observation in a sample of incomes will:', 'Increase the median.', 'Increase the mode.', 'Increase the mean.', 'All of the above.', 'Increase the mean.', 'Doubling the largest observation will increase the average value of the variable but will not change the position or value of the 50th percentile of the distribution of values.', 1),
(68, 4, 'Suppose that the risk of catching the flu is high for young children and the elderly but low for teenagers and younger adults. Which of the following equations would be the best choice for modeling the relationship between flu risk (R) and age (A)?', 'R = β1 + β2A + ε.', 'ln(R) = β1 + β2 ln(A) + ε.', 'R = β1 + β2A + β2 A2 + ε.', 'R = β1 + β2ln(A) + ε.', 'R = β1 + β2A + β2 A2 + ε.', 'Based on the description, flu risk is first decreasing with age and then increasing with age. We need a polynomial to fit this type of parabolic curve.', 1),
(69, 4, 'Suppose that snow depth measured in feet is included as a regressor in a multivariate regression and the magnitude of the estimated coefficient for snowdepth is 5. If we rerun the regression using snow depth measured in inches, the new estimated coefficient on snowfall will be:', 'Larger than 5.', 'Smaller than 5.', 'Still equal to 5.', 'Not enough information.', 'Smaller than 5.', 'The coefficient is giving us the change in y with a change in snowdepth of one 1 foot. The change in y with a change in snowdepth of one inch will be 1/12 of this value.', 1),
(70, 4, 'When regressing annual work hours on income, a researcher finds that the variance of the residuals increases as work hours increases. This will affect:', 'The expected value of the slope coefficient for income.', 'The magnitude of the standard error for the slope coefficient for income.', 'Both (a) and (b).', 'Neither (a) nor (b).', 'The magnitude of the standard error for the slope coefficient for income.', 'This is a case of heteroskedasticity. Heteroskedasticity will change the standard errors of our estimates but will not bias the coefficients.', 1),
(71, 4, 'The histogram for hours of study per week based on a sample of 400 Davis students is symmetric and centered at 15 hours. Which of the following statements is true?', 'The sample median is 15 hours.', 'The sample mean is 15 hours.', 'The skewness for the sample is zero.', 'All of the above.', 'All of the above.', 'Because the distribution is symmetric, 50 percent of the observations will be to the right of 15 hours and 50 percent will be to the left of 15 hours, making 15 hours the median. The symmetry will also lead to the mean being equal to the 15 hours (for every observation that is larger than 15, there is a corresponding obser- vation that is smaller than 15 by the same amount). For a symmetric distribution, skewness is zero.', 1),
(72, 4, 'When running a bivariate regression, which of the following is not possible?', 'The error sum of squares is larger than the total sum of squares.', 'The error sum of squares is equal to the total sum of squares.', 'The error sum of squares is zero.', 'The error sum of squares is positive.', 'The error sum of squares is larger than the total sum of squares.', 'The largest the error sum of squares can ever be is the magnitude of the total sum of squares. If it were larger you could achieve a better fit by simply setting all of your slope coefficients to zero.', 1),
(73, 4, 'Which of the following would definitely not lead to the error term being correlated with a regressor x?', 'Random measurement error in x.', 'An omitted variable correlated with x.', 'Choosing an incorrect functional form for the regression equation.', 'Random measurement error in y.', 'Random measurement error in y.', 'If the measurement error in y is truly random, then it will be independent of the value of x. So adding this measurement error into the error term will leave the error term uncorrelated with x.', 1),
(74, 4, 'Adding an irrelevant variable to a regression will:', 'Have no effect on the regression results.', 'Tend to bias the coefficients for the other regressors.', 'Lower the R2 .', 'None of the above.', 'None of the above.', 'Including an irrelevant variable may increase our standard errors. It will also lower the adjusted R2 for the regression.', 1),
(75, 4, 'Suppose we run a regression with GPA as the dependent variable and SAT score as the independent variable. Which of the following statements is definitely true?', 'The sign of the estimated slope coefficient will be the same as the sign of the correlation between GPA and SAT score.', 'The sign of the estimated slope coefficient could be different than the sign of the corre- lation between GPA and SAT score if there are omitted variables.', 'The magnitude of the slope coefficient will be equal to the magnitude of the correlation between GPA and SAT score.', 'The slope coefficient will be statistically significant.', 'The sign of the estimated slope coefficient will be the same as the sign of the correlation between GPA and SAT score.', 'The slope coefficient is a function of the correlation between GPA and SAT score. The signs will be the same. Even if the sign of the true relationship is the opposite of the estimated coefficient due to omitted variable bias, the sign of the correlation will match up with the sign of the estimated coefficient (the correlation does not control for the omitted variable either).', 1),
(76, 4, 'Which of the following is not a measure of central tendency?', 'The mean.', 'The mode.', 'The sample range.', 'The median.', 'The sample range.', 'The sample range is a measure of dispersion. If the entire sample distribution was shifted, the center of the distribution would certainly shift but the sample range would stay exactly the same.', 1),
(77, 4, 'Suppose we use an F test after running a multivariate regression to test the null hypothesis that β3 = β4 = 0 and get an F statistic that is larger than the critical value for a 5% significance level. We would conclude that:', 'β3 6= β4.', 'β3 > 0 or β4 > 0.', 'β3 6= 0 and β4 6= 0.', 'None of the above.', 'None of the above.', 'We would reject the null hypothesis that β3 = β4 = 0 in favor of the alternative hypothesis that at least one of the coefficients is different from zero. We cannot say anything about whether both are different than zero or whether they are different from each other.', 1),
(78, 4, 'Which of the following would make you more likely to reject the hypothesis that an individual slope coefficient is equal to zero?', 'A larger standard error for that slope coefficient.', 'A smaller t statistic for that slope coefficient.', 'A smaller F statistic for the regression.', 'A larger value for the ratio of the coefficient to its standard error.', 'A larger value for the ratio of the coefficient to its standard error.', 'When testing whether a slope coefficient is different than zero, the test statistic is simply the ratio of the coefficient to the standard error. We are more likely to reject the null hypothesis that the coefficient is equal to zero when this test statistic is larger in magnitude.', 1),
(79, 4, 'Suppose that we include a dummy variable for male and a dummy variable for female in a regression. This will create a:', 'Omitted variable bias problem.', 'Heteroskedasticity problem.', 'Multicollinearity problem.', 'Homoskedasticity problem.', 'Multicollinearity problem.', 'The dummy variables will be perfectly collinear (the value of one always tells us exactly what the value of the other one is).', 1),
(80, 4, 'The distribution of the sample mean will:', 'Be centered at zero.', 'Have a smaller variance for smaller sample sizes.', 'Centered at the population mean.', '(1) and (2)', 'Centered at the population mean.', 'The sample mean is normally distributed with a mean equal to the population mean and a variance that decreases as sample size increases.', 1),
(81, 1, '\'<html><head></head></html>\'', 'none', 'none', 'none', 'none', '1234', '1234', 2),
(82, 1, '\'<head>\n    <script src=\"https://code.jquery.com/jquery-1.11.3.min.js\"></script>\n\n    <link href=\"https://nightly.datatables.net/css/jquery.dataTables.css\" rel=\"stylesheet\" type=\"text/css\" />\n    <script src=\"https://nightly.datatables.net/js/jquery.dataTables.js\"></script>\n\n    <meta charset=utf-8 />\n    <title>DataTables - JS Bin</title>\n  </head>\'', 'none', 'none', 'none', 'none', 'test', 'test', 2),
(83, 1, 'Suppose we have a sample of the heights of Davis students and want to use the sample mean to get a confidence interval for the mean height in the population. Which of the following would increase the width of this confidence interval?', 'none', 'none', 'none', 'none', 'Switching from a 95% confidence interval to a 99% confidence interval.', 'The smaller we make α, the wider our confidence interval will get. A larger sample size would make the confidence interval narrower.', 2),
(84, 1, ' Suppose we can reject the null hypothesis that β2 ≥ 0 at a 5% significance level where β2 is the slope coefficient from a bivariate regression. Which of the following is definitely true?', 'none', 'none', 'none', 'none', 'Our test statistic was negative.', 'The critical value for a lower one-tailed hypothesis test will be negative and we will reject the null when the test statistic is more negative than the critical value.', 2);
INSERT INTO `test_quest` (`testq_id`, `subj_id`, `testq_0`, `testq_1`, `testq_2`, `testq_3`, `testq_4`, `testq_ans`, `testq_hint`, `testq_type`) VALUES
(85, 1, 'Suppose we regress y on x2. Which of the following would lead to a biased coefficient for x2 ?', 'none', 'none', 'none', 'none', 'x is measured with some random error.', 'An omitted variable will bias the coefficient on x2 only if it is correlated with both x2 and with y. Measurement error in x2 will bias the coefficient on x2 since it will lead to errors that are negatively correlated with x2 . Measurement error in y will decrease the precision of the estimated slope coefficient but will not bias the coefficient.', 2),
(86, 1, 'When testing the significance of a subset of regressors, the R2 of the unrestricted model will always be:', 'none', 'none', 'none', 'none', 'Greater than or equal to the R2 of the restricted model.', 'The unrestricted model contains all of the regressors in the restricted model plus additional regressors. The unrestricted model can achieve the same fit as the restricted model by simply having the coefficients on the additional regressors set to zero. More likely is that these coefficients will be nonzero and the fit will improve.', 2),
(87, 1, 'Suppose that the true population model of the relationship between weight (W ) and hours of exercise per day (H) is: W = 200 − 10H + ε where ε meets all of our assumptions. If hours of exercise is measured with some random, mean zero error, which of the following statements about the estimated slope coefficient  b  ̃ 2 is true?', 'none', 'none', 'none', 'none', 'E(b  ̃ 2) > −10.', 'The slope coefficient will be biased toward zero due to the measurement error. In this case, that means that the expected value of b  ̃ 2 will be between -10 and 0.', 2),
(88, 1, 'Doubling the value of the largest observation in a sample of incomes will:', 'none', 'none', 'none', 'none', 'Increase the mean.', 'Doubling the largest observation will increase the average value of the variable but will not change the position or value of the 50th percentile of the distribution of values.', 2),
(89, 1, 'Suppose that the risk of catching the flu is high for young children and the elderly but low for teenagers and younger adults. Which of the following equations would be the best choice for modeling the relationship between flu risk (R) and age (A)?', 'none', 'none', 'none', 'none', 'R = β1 + β2A + β2 A2 + ε.', 'Based on the description, flu risk is first decreasing with age and then increasing with age. We need a polynomial to fit this type of parabolic curve.', 2),
(90, 1, 'Suppose that snow depth measured in feet is included as a regressor in a multivariate regression and the magnitude of the estimated coefficient for snowdepth is 5. If we rerun the regression using snow depth measured in inches, the new estimated coefficient on snowfall will be:', 'none', 'none', 'none', 'none', 'Smaller than 5.', 'The coefficient is giving us the change in y with a change in snowdepth of one 1 foot. The change in y with a change in snowdepth of one inch will be 1/12 of this value.', 2),
(91, 1, 'When regressing annual work hours on income, a researcher finds that the variance of the residuals increases as work hours increases. This will affect:', 'none', 'none', 'none', 'none', 'The magnitude of the standard error for the slope coefficient for income.', 'This is a case of heteroskedasticity. Heteroskedasticity will change the standard errors of our estimates but will not bias the coefficients.', 2),
(92, 1, 'The histogram for hours of study per week based on a sample of 400 Davis students is symmetric and centered at 15 hours. Which of the following statements is true?', 'none', 'none', 'none', 'none', 'All of the above.', 'Because the distribution is symmetric, 50 percent of the observations will be to the right of 15 hours and 50 percent will be to the left of 15 hours, making 15 hours the median. The symmetry will also lead to the mean being equal to the 15 hours (for every observation that is larger than 15, there is a corresponding obser- vation that is smaller than 15 by the same amount). For a symmetric distribution, skewness is zero.', 2),
(93, 1, 'When running a bivariate regression, which of the following is not possible?', 'none', 'none', 'none', 'none', 'The error sum of squares is larger than the total sum of squares.', 'The largest the error sum of squares can ever be is the magnitude of the total sum of squares. If it were larger you could achieve a better fit by simply setting all of your slope coefficients to zero.', 2),
(94, 1, 'Which of the following would definitely not lead to the error term being correlated with a regressor x?', 'none', 'none', 'none', 'none', 'Random measurement error in y.', 'If the measurement error in y is truly random, then it will be independent of the value of x. So adding this measurement error into the error term will leave the error term uncorrelated with x.', 2),
(95, 1, 'Adding an irrelevant variable to a regression will:', 'none', 'none', 'none', 'none', 'None of the above.', 'Including an irrelevant variable may increase our standard errors. It will also lower the adjusted R2 for the regression.', 2),
(96, 1, 'Suppose we run a regression with GPA as the dependent variable and SAT score as the independent variable. Which of the following statements is definitely true?', 'none', 'none', 'none', 'none', 'The sign of the estimated slope coefficient will be the same as the sign of the correlation between GPA and SAT score.', 'The slope coefficient is a function of the correlation between GPA and SAT score. The signs will be the same. Even if the sign of the true relationship is the opposite of the estimated coefficient due to omitted variable bias, the sign of the correlation will match up with the sign of the estimated coefficient (the correlation does not control for the omitted variable either).', 2),
(97, 1, 'Which of the following is not a measure of central tendency?', 'none', 'none', 'none', 'none', 'The sample range.', 'The sample range is a measure of dispersion. If the entire sample distribution was shifted, the center of the distribution would certainly shift but the sample range would stay exactly the same.', 2),
(98, 1, 'Suppose we use an F test after running a multivariate regression to test the null hypothesis that β3 = β4 = 0 and get an F statistic that is larger than the critical value for a 5% significance level. We would conclude that:', 'none', 'none', 'none', 'none', 'None of the above.', 'We would reject the null hypothesis that β3 = β4 = 0 in favor of the alternative hypothesis that at least one of the coefficients is different from zero. We cannot say anything about whether both are different than zero or whether they are different from each other.', 2),
(99, 1, 'Which of the following would make you more likely to reject the hypothesis that an individual slope coefficient is equal to zero?', 'none', 'none', 'none', 'none', 'A larger value for the ratio of the coefficient to its standard error.', 'When testing whether a slope coefficient is different than zero, the test statistic is simply the ratio of the coefficient to the standard error. We are more likely to reject the null hypothesis that the coefficient is equal to zero when this test statistic is larger in magnitude.', 2),
(100, 1, 'Suppose that we include a dummy variable for male and a dummy variable for female in a regression. This will create a:', 'none', 'none', 'none', 'none', 'Multicollinearity problem.', 'The dummy variables will be perfectly collinear (the value of one always tells us exactly what the value of the other one is).', 2),
(101, 1, 'The distribution of the sample mean will:', 'none', 'none', 'none', 'none', 'Centered at the population mean.', 'The sample mean is normally distributed with a mean equal to the population mean and a variance that decreases as sample size increases.', 2),
(102, 2, 'Suppose we regress SAT score on parent’s education and parent’s income. If we run the regression again but also include the student’s GPA as an additional regressor:', 'none', 'none', 'none', 'none', 'The R2 for the regression will either stay the same or increase.', 'When adding an additional regressor, our fit should be at least as good as before, so the R2 for the regression should either stay the same or increase. Adjusted R2 may decrease if the additional regressor had little to no explanatory power.', 2),
(103, 2, 'Suppose we have a sample of the heights of Davis students and want to use the sample mean to get a confidence interval for the mean height in the population. Which of the following would increase the width of this confidence interval?', 'none', 'none', 'none', 'none', 'Switching from a 95% confidence interval to a 99% confidence interval.', 'The smaller we make α, the wider our confidence interval will get. A larger sample size would make the confidence interval narrower.', 2),
(104, 2, ' Suppose we can reject the null hypothesis that β2 ≥ 0 at a 5% significance level where β2 is the slope coefficient from a bivariate regression. Which of the following is definitely true?', 'none', 'none', 'none', 'none', 'Our test statistic was negative.', 'The critical value for a lower one-tailed hypothesis test will be negative and we will reject the null when the test statistic is more negative than the critical value.', 2),
(105, 2, 'Suppose we regress y on x2. Which of the following would lead to a biased coefficient for x2 ?', 'none', 'none', 'none', 'none', 'x is measured with some random error.', 'An omitted variable will bias the coefficient on x2 only if it is correlated with both x2 and with y. Measurement error in x2 will bias the coefficient on x2 since it will lead to errors that are negatively correlated with x2 . Measurement error in y will decrease the precision of the estimated slope coefficient but will not bias the coefficient.', 2),
(106, 2, 'When testing the significance of a subset of regressors, the R2 of the unrestricted model will always be:', 'none', 'none', 'none', 'none', 'Greater than or equal to the R2 of the restricted model.', 'The unrestricted model contains all of the regressors in the restricted model plus additional regressors. The unrestricted model can achieve the same fit as the restricted model by simply having the coefficients on the additional regressors set to zero. More likely is that these coefficients will be nonzero and the fit will improve.', 2),
(107, 2, 'Suppose that the true population model of the relationship between weight (W ) and hours of exercise per day (H) is: W = 200 − 10H + ε where ε meets all of our assumptions. If hours of exercise is measured with some random, mean zero error, which of the following statements about the estimated slope coefficient  b  ̃ 2 is true?', 'none', 'none', 'none', 'none', 'E(b  ̃ 2) > −10.', 'The slope coefficient will be biased toward zero due to the measurement error. In this case, that means that the expected value of b  ̃ 2 will be between -10 and 0.', 2),
(108, 2, 'Doubling the value of the largest observation in a sample of incomes will:', 'none', 'none', 'none', 'none', 'Increase the mean.', 'Doubling the largest observation will increase the average value of the variable but will not change the position or value of the 50th percentile of the distribution of values.', 2),
(109, 2, 'Suppose that the risk of catching the flu is high for young children and the elderly but low for teenagers and younger adults. Which of the following equations would be the best choice for modeling the relationship between flu risk (R) and age (A)?', 'none', 'none', 'none', 'none', 'R = β1 + β2A + β2 A2 + ε.', 'Based on the description, flu risk is first decreasing with age and then increasing with age. We need a polynomial to fit this type of parabolic curve.', 2),
(110, 2, 'Suppose that snow depth measured in feet is included as a regressor in a multivariate regression and the magnitude of the estimated coefficient for snowdepth is 5. If we rerun the regression using snow depth measured in inches, the new estimated coefficient on snowfall will be:', 'none', 'none', 'none', 'none', 'Smaller than 5.', 'The coefficient is giving us the change in y with a change in snowdepth of one 1 foot. The change in y with a change in snowdepth of one inch will be 1/12 of this value.', 2),
(111, 2, 'When regressing annual work hours on income, a researcher finds that the variance of the residuals increases as work hours increases. This will affect:', 'none', 'none', 'none', 'none', 'The magnitude of the standard error for the slope coefficient for income.', 'This is a case of heteroskedasticity. Heteroskedasticity will change the standard errors of our estimates but will not bias the coefficients.', 2),
(112, 2, 'The histogram for hours of study per week based on a sample of 400 Davis students is symmetric and centered at 15 hours. Which of the following statements is true?', 'none', 'none', 'none', 'none', 'All of the above.', 'Because the distribution is symmetric, 50 percent of the observations will be to the right of 15 hours and 50 percent will be to the left of 15 hours, making 15 hours the median. The symmetry will also lead to the mean being equal to the 15 hours (for every observation that is larger than 15, there is a corresponding obser- vation that is smaller than 15 by the same amount). For a symmetric distribution, skewness is zero.', 2),
(113, 2, 'When running a bivariate regression, which of the following is not possible?', 'none', 'none', 'none', 'none', 'The error sum of squares is larger than the total sum of squares.', 'The largest the error sum of squares can ever be is the magnitude of the total sum of squares. If it were larger you could achieve a better fit by simply setting all of your slope coefficients to zero.', 2),
(114, 2, 'Which of the following would definitely not lead to the error term being correlated with a regressor x?', 'none', 'none', 'none', 'none', 'Random measurement error in y.', 'If the measurement error in y is truly random, then it will be independent of the value of x. So adding this measurement error into the error term will leave the error term uncorrelated with x.', 2),
(115, 2, 'Adding an irrelevant variable to a regression will:', 'none', 'none', 'none', 'none', 'None of the above.', 'Including an irrelevant variable may increase our standard errors. It will also lower the adjusted R2 for the regression.', 2),
(116, 2, 'Suppose we run a regression with GPA as the dependent variable and SAT score as the independent variable. Which of the following statements is definitely true?', 'none', 'none', 'none', 'none', 'The sign of the estimated slope coefficient will be the same as the sign of the correlation between GPA and SAT score.', 'The slope coefficient is a function of the correlation between GPA and SAT score. The signs will be the same. Even if the sign of the true relationship is the opposite of the estimated coefficient due to omitted variable bias, the sign of the correlation will match up with the sign of the estimated coefficient (the correlation does not control for the omitted variable either).', 2),
(117, 2, 'Which of the following is not a measure of central tendency?', 'none', 'none', 'none', 'none', 'The sample range.', 'The sample range is a measure of dispersion. If the entire sample distribution was shifted, the center of the distribution would certainly shift but the sample range would stay exactly the same.', 2),
(118, 2, 'Suppose we use an F test after running a multivariate regression to test the null hypothesis that β3 = β4 = 0 and get an F statistic that is larger than the critical value for a 5% significance level. We would conclude that:', 'none', 'none', 'none', 'none', 'None of the above.', 'We would reject the null hypothesis that β3 = β4 = 0 in favor of the alternative hypothesis that at least one of the coefficients is different from zero. We cannot say anything about whether both are different than zero or whether they are different from each other.', 2),
(119, 2, 'Which of the following would make you more likely to reject the hypothesis that an individual slope coefficient is equal to zero?', 'none', 'none', 'none', 'none', 'A larger value for the ratio of the coefficient to its standard error.', 'When testing whether a slope coefficient is different than zero, the test statistic is simply the ratio of the coefficient to the standard error. We are more likely to reject the null hypothesis that the coefficient is equal to zero when this test statistic is larger in magnitude.', 2),
(120, 2, 'Suppose that we include a dummy variable for male and a dummy variable for female in a regression. This will create a:', 'none', 'none', 'none', 'none', 'Multicollinearity problem.', 'The dummy variables will be perfectly collinear (the value of one always tells us exactly what the value of the other one is).', 2),
(121, 2, 'The distribution of the sample mean will:', 'none', 'none', 'none', 'none', 'Centered at the population mean.', 'The sample mean is normally distributed with a mean equal to the population mean and a variance that decreases as sample size increases.', 2),
(122, 3, 'Suppose we regress SAT score on parent’s education and parent’s income. If we run the regression again but also include the student’s GPA as an additional regressor:', 'none', 'none', 'none', 'none', 'The R2 for the regression will either stay the same or increase.', 'When adding an additional regressor, our fit should be at least as good as before, so the R2 for the regression should either stay the same or increase. Adjusted R2 may decrease if the additional regressor had little to no explanatory power.', 2),
(123, 3, 'Suppose we have a sample of the heights of Davis students and want to use the sample mean to get a confidence interval for the mean height in the population. Which of the following would increase the width of this confidence interval?', 'none', 'none', 'none', 'none', 'Switching from a 95% confidence interval to a 99% confidence interval.', 'The smaller we make α, the wider our confidence interval will get. A larger sample size would make the confidence interval narrower.', 2),
(124, 3, ' Suppose we can reject the null hypothesis that β2 ≥ 0 at a 5% significance level where β2 is the slope coefficient from a bivariate regression. Which of the following is definitely true?', 'none', 'none', 'none', 'none', 'Our test statistic was negative.', 'The critical value for a lower one-tailed hypothesis test will be negative and we will reject the null when the test statistic is more negative than the critical value.', 2),
(125, 3, 'Suppose we regress y on x2. Which of the following would lead to a biased coefficient for x2 ?', 'none', 'none', 'none', 'none', 'x is measured with some random error.', 'An omitted variable will bias the coefficient on x2 only if it is correlated with both x2 and with y. Measurement error in x2 will bias the coefficient on x2 since it will lead to errors that are negatively correlated with x2 . Measurement error in y will decrease the precision of the estimated slope coefficient but will not bias the coefficient.', 2),
(126, 3, 'When testing the significance of a subset of regressors, the R2 of the unrestricted model will always be:', 'none', 'none', 'none', 'none', 'Greater than or equal to the R2 of the restricted model.', 'The unrestricted model contains all of the regressors in the restricted model plus additional regressors. The unrestricted model can achieve the same fit as the restricted model by simply having the coefficients on the additional regressors set to zero. More likely is that these coefficients will be nonzero and the fit will improve.', 2),
(127, 3, 'Suppose that the true population model of the relationship between weight (W ) and hours of exercise per day (H) is: W = 200 − 10H + ε where ε meets all of our assumptions. If hours of exercise is measured with some random, mean zero error, which of the following statements about the estimated slope coefficient  b  ̃ 2 is true?', 'none', 'none', 'none', 'none', 'E(b  ̃ 2) > −10.', 'The slope coefficient will be biased toward zero due to the measurement error. In this case, that means that the expected value of b  ̃ 2 will be between -10 and 0.', 2),
(128, 3, 'Doubling the value of the largest observation in a sample of incomes will:', 'none', 'none', 'none', 'none', 'Increase the mean.', 'Doubling the largest observation will increase the average value of the variable but will not change the position or value of the 50th percentile of the distribution of values.', 2),
(129, 3, 'Suppose that the risk of catching the flu is high for young children and the elderly but low for teenagers and younger adults. Which of the following equations would be the best choice for modeling the relationship between flu risk (R) and age (A)?', 'none', 'none', 'none', 'none', 'R = β1 + β2A + β2 A2 + ε.', 'Based on the description, flu risk is first decreasing with age and then increasing with age. We need a polynomial to fit this type of parabolic curve.', 2),
(130, 3, 'Suppose that snow depth measured in feet is included as a regressor in a multivariate regression and the magnitude of the estimated coefficient for snowdepth is 5. If we rerun the regression using snow depth measured in inches, the new estimated coefficient on snowfall will be:', 'none', 'none', 'none', 'none', 'Smaller than 5.', 'The coefficient is giving us the change in y with a change in snowdepth of one 1 foot. The change in y with a change in snowdepth of one inch will be 1/12 of this value.', 2),
(131, 3, 'When regressing annual work hours on income, a researcher finds that the variance of the residuals increases as work hours increases. This will affect:', 'none', 'none', 'none', 'none', 'The magnitude of the standard error for the slope coefficient for income.', 'This is a case of heteroskedasticity. Heteroskedasticity will change the standard errors of our estimates but will not bias the coefficients.', 2),
(132, 3, 'The histogram for hours of study per week based on a sample of 400 Davis students is symmetric and centered at 15 hours. Which of the following statements is true?', 'none', 'none', 'none', 'none', 'All of the above.', 'Because the distribution is symmetric, 50 percent of the observations will be to the right of 15 hours and 50 percent will be to the left of 15 hours, making 15 hours the median. The symmetry will also lead to the mean being equal to the 15 hours (for every observation that is larger than 15, there is a corresponding obser- vation that is smaller than 15 by the same amount). For a symmetric distribution, skewness is zero.', 2),
(133, 3, 'When running a bivariate regression, which of the following is not possible?', 'none', 'none', 'none', 'none', 'The error sum of squares is larger than the total sum of squares.', 'The largest the error sum of squares can ever be is the magnitude of the total sum of squares. If it were larger you could achieve a better fit by simply setting all of your slope coefficients to zero.', 2),
(134, 3, 'Which of the following would definitely not lead to the error term being correlated with a regressor x?', 'none', 'none', 'none', 'none', 'Random measurement error in y.', 'If the measurement error in y is truly random, then it will be independent of the value of x. So adding this measurement error into the error term will leave the error term uncorrelated with x.', 2),
(135, 3, 'Adding an irrelevant variable to a regression will:', 'none', 'none', 'none', 'none', 'None of the above.', 'Including an irrelevant variable may increase our standard errors. It will also lower the adjusted R2 for the regression.', 2),
(136, 3, 'Suppose we run a regression with GPA as the dependent variable and SAT score as the independent variable. Which of the following statements is definitely true?', 'none', 'none', 'none', 'none', 'The sign of the estimated slope coefficient will be the same as the sign of the correlation between GPA and SAT score.', 'The slope coefficient is a function of the correlation between GPA and SAT score. The signs will be the same. Even if the sign of the true relationship is the opposite of the estimated coefficient due to omitted variable bias, the sign of the correlation will match up with the sign of the estimated coefficient (the correlation does not control for the omitted variable either).', 2),
(137, 3, 'Which of the following is not a measure of central tendency?', 'none', 'none', 'none', 'none', 'The sample range.', 'The sample range is a measure of dispersion. If the entire sample distribution was shifted, the center of the distribution would certainly shift but the sample range would stay exactly the same.', 2),
(138, 3, 'Suppose we use an F test after running a multivariate regression to test the null hypothesis that β3 = β4 = 0 and get an F statistic that is larger than the critical value for a 5% significance level. We would conclude that:', 'none', 'none', 'none', 'none', 'None of the above.', 'We would reject the null hypothesis that β3 = β4 = 0 in favor of the alternative hypothesis that at least one of the coefficients is different from zero. We cannot say anything about whether both are different than zero or whether they are different from each other.', 2),
(139, 3, 'Which of the following would make you more likely to reject the hypothesis that an individual slope coefficient is equal to zero?', 'none', 'none', 'none', 'none', 'A larger value for the ratio of the coefficient to its standard error.', 'When testing whether a slope coefficient is different than zero, the test statistic is simply the ratio of the coefficient to the standard error. We are more likely to reject the null hypothesis that the coefficient is equal to zero when this test statistic is larger in magnitude.', 2),
(140, 3, 'Suppose that we include a dummy variable for male and a dummy variable for female in a regression. This will create a:', 'none', 'none', 'none', 'none', 'Multicollinearity problem.', 'The dummy variables will be perfectly collinear (the value of one always tells us exactly what the value of the other one is).', 2),
(141, 3, 'The distribution of the sample mean will:', 'none', 'none', 'none', 'none', 'Centered at the population mean', 'The sample mean is normally distributed with a mean equal to the population mean and a variance that decreases as sample size increases.', 2),
(142, 4, 'Suppose we regress SAT score on parent’s education and parent’s income. If we run the regression again but also include the student’s GPA as an additional regressor:', 'none', 'none', 'none', 'none', 'The R2 for the regression will either stay the same or increase.', 'When adding an additional regressor, our fit should be at least as good as before, so the R2 for the regression should either stay the same or increase. Adjusted R2 may decrease if the additional regressor had little to no explanatory power.', 2),
(143, 4, 'Suppose we have a sample of the heights of Davis students and want to use the sample mean to get a confidence interval for the mean height in the population. Which of the following would increase the width of this confidence interval?', 'none', 'none', 'none', 'none', 'Switching from a 95% confidence interval to a 99% confidence interval.', 'The smaller we make α, the wider our confidence interval will get. A larger sample size would make the confidence interval narrower.', 2),
(144, 4, ' Suppose we can reject the null hypothesis that β2 ≥ 0 at a 5% significance level where β2 is the slope coefficient from a bivariate regression. Which of the following is definitely true?', 'none', 'none', 'none', 'none', 'Our test statistic was negative.', 'The critical value for a lower one-tailed hypothesis test will be negative and we will reject the null when the test statistic is more negative than the critical value.', 2),
(145, 4, 'Suppose we regress y on x2. Which of the following would lead to a biased coefficient for x2 ?', 'none', 'none', 'none', 'none', 'x is measured with some random error.', 'An omitted variable will bias the coefficient on x2 only if it is correlated with both x2 and with y. Measurement error in x2 will bias the coefficient on x2 since it will lead to errors that are negatively correlated with x2 . Measurement error in y will decrease the precision of the estimated slope coefficient but will not bias the coefficient.', 2),
(146, 4, 'When testing the significance of a subset of regressors, the R2 of the unrestricted model will always be:', 'none', 'none', 'none', 'none', 'Greater than or equal to the R2 of the restricted model.', 'The unrestricted model contains all of the regressors in the restricted model plus additional regressors. The unrestricted model can achieve the same fit as the restricted model by simply having the coefficients on the additional regressors set to zero. More likely is that these coefficients will be nonzero and the fit will improve.', 2),
(147, 4, 'Suppose that the true population model of the relationship between weight (W ) and hours of exercise per day (H) is: W = 200 − 10H + ε where ε meets all of our assumptions. If hours of exercise is measured with some random, mean zero error, which of the following statements about the estimated slope coefficient  b  ̃ 2 is true?', 'none', 'none', 'none', 'none', 'E(b  ̃ 2) > −10.', 'The slope coefficient will be biased toward zero due to the measurement error. In this case, that means that the expected value of b  ̃ 2 will be between -10 and 0.', 2),
(148, 4, 'Doubling the value of the largest observation in a sample of incomes will:', 'none', 'none', 'none', 'none', 'Increase the mean.', 'Doubling the largest observation will increase the average value of the variable but will not change the position or value of the 50th percentile of the distribution of values.', 2),
(149, 4, 'Suppose that the risk of catching the flu is high for young children and the elderly but low for teenagers and younger adults. Which of the following equations would be the best choice for modeling the relationship between flu risk (R) and age (A)?', 'none', 'none', 'none', 'none', 'R = β1 + β2A + β2 A2 + ε.', 'Based on the description, flu risk is first decreasing with age and then increasing with age. We need a polynomial to fit this type of parabolic curve.', 2),
(150, 4, 'Suppose that snow depth measured in feet is included as a regressor in a multivariate regression and the magnitude of the estimated coefficient for snowdepth is 5. If we rerun the regression using snow depth measured in inches, the new estimated coefficient on snowfall will be:', 'none', 'none', 'none', 'none', 'Smaller than 5.', 'The coefficient is giving us the change in y with a change in snowdepth of one 1 foot. The change in y with a change in snowdepth of one inch will be 1/12 of this value.', 2),
(151, 4, 'When regressing annual work hours on income, a researcher finds that the variance of the residuals increases as work hours increases. This will affect:', 'none', 'none', 'none', 'none', 'The magnitude of the standard error for the slope coefficient for income.', 'This is a case of heteroskedasticity. Heteroskedasticity will change the standard errors of our estimates but will not bias the coefficients.', 2),
(152, 4, 'The histogram for hours of study per week based on a sample of 400 Davis students is symmetric and centered at 15 hours. Which of the following statements is true?', 'none', 'none', 'none', 'none', 'All of the above.', 'Because the distribution is symmetric, 50 percent of the observations will be to the right of 15 hours and 50 percent will be to the left of 15 hours, making 15 hours the median. The symmetry will also lead to the mean being equal to the 15 hours (for every observation that is larger than 15, there is a corresponding obser- vation that is smaller than 15 by the same amount). For a symmetric distribution, skewness is zero.', 2),
(153, 4, 'When running a bivariate regression, which of the following is not possible?', 'none', 'none', 'none', 'none', 'The error sum of squares is larger than the total sum of squares.', 'The largest the error sum of squares can ever be is the magnitude of the total sum of squares. If it were larger you could achieve a better fit by simply setting all of your slope coefficients to zero.', 2),
(154, 4, 'Which of the following would definitely not lead to the error term being correlated with a regressor x?', 'none', 'none', 'none', 'none', 'Random measurement error in y.', 'If the measurement error in y is truly random, then it will be independent of the value of x. So adding this measurement error into the error term will leave the error term uncorrelated with x.', 2),
(155, 4, 'Adding an irrelevant variable to a regression will:', 'none', 'none', 'none', 'none', 'None of the above.', 'Including an irrelevant variable may increase our standard errors. It will also lower the adjusted R2 for the regression.', 2),
(156, 4, 'Adding an irrelevant variable to a regression will:', 'none', 'none', 'none', 'none', 'None of the above.', 'Including an irrelevant variable may increase our standard errors. It will also lower the adjusted R2 for the regression.', 2);

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
  `testr_Cert` float NOT NULL,
  `testq_id` int(11) NOT NULL,
  `accnt_id` int(11) NOT NULL,
  `th_ID` int(11) NOT NULL,
  `score_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `test_report`
--

INSERT INTO `test_report` (`testr_ID`, `testr_StudAns`, `testr_Status`, `testr_TimeQuest`, `testr_Type`, `testr_Attempt`, `testr_Cert`, `testq_id`, `accnt_id`, `th_ID`, `score_id`) VALUES
(1, 'test', 0, '', 1, 10, 0, 94, 1, 1, 1),
(2, 'All of the above.', 1, '', 1, 2, 0, 11, 1, 1, 1),
(3, 'The sign of the estimated slope coefficient will be the same as the sign of the correlation between GPA and SAT score.', 1, '', 1, 1, 0, 15, 1, 1, 1),
(4, 'A larger value for the ratio of the coefficient to its standard error.', 1, '', 1, 4, 0, 18, 1, 1, 1),
(5, 'test', 0, '', 1, 10, 0, 96, 1, 1, 1),
(6, 'R = β1 + β2A + β2 A2 + ε.', 1, '', 1, 3, 0, 8, 1, 1, 1),
(7, 'Greater than or equal to the R2 of the restricted model.', 1, '', 1, 2, 0, 5, 1, 1, 1),
(8, '1234', 1, '', 1, 2, 0, 81, 1, 1, 1),
(9, 'test', 0, '', 1, 10, 0, 91, 1, 1, 1),
(10, 'none', 0, '', 1, 10, 0, 87, 1, 1, 1),
(11, 'None of the above.', 1, '', 1, 1, 0, 17, 1, 2, 2),
(12, 'A larger value for the ratio of the coefficient to its standard error.', 1, '00:00:02', 1, 4, 0, 18, 1, 2, 2),
(13, 'Increase the mean.', 1, '00:00:01', 1, 3, 0, 7, 1, 2, 2),
(14, 'All of the above.', 1, '00:00:01', 1, 4, 0, 11, 1, 2, 2),
(15, 'test', 0, '00:00:05', 1, 10, 0, 96, 1, 2, 2),
(16, 'Multicollinearity problem.', 1, '00:00:03', 1, 1, 0, 19, 1, 2, 2),
(17, 'none', 0, '00:00:05', 1, 10, 0, 97, 1, 2, 2),
(18, 'none', 0, '00:00:05', 1, 10, 0, 95, 1, 2, 2),
(19, 'Switching from a 95% confidence interval to a 99% confidence interval.', 1, '00:00:03', 1, 1, 0, 2, 1, 2, 2),
(20, 'Smaller than 5.', 1, '00:00:02', 1, 2, 0, 9, 1, 2, 2),
(21, 'The magnitude of the standard error for the slope coefficient for income.', 1, '', 1, 1, 0, 10, 1, 4, 4),
(22, 'test', 0, '00:00:05', 1, 10, 0, 90, 1, 4, 4),
(23, 'none', 0, '00:00:06', 1, 10, 0, 84, 1, 4, 4),
(24, 'None of the above.', 1, '00:00:02', 1, 3, 0, 14, 1, 4, 4),
(25, 'none', 0, '00:00:05', 1, 10, 0, 95, 1, 4, 4),
(26, 'none', 0, '00:00:13', 1, 10, 0, 96, 1, 4, 4),
(27, 'test', 1, '00:00:09', 1, 2, 0, 82, 1, 4, 4),
(28, 'E(b  ̃ 2) > −10.', 1, '00:00:02', 1, 1, 0, 6, 1, 4, 4),
(29, 'none', 0, '00:00:05', 1, 10, 0, 94, 1, 4, 4),
(30, 'nint', 0, '00:00:05', 1, 1, 0, 87, 1, 4, 4),
(31, 'The error sum of squares is zero.', 0, '', 1, 2, 0, 12, 1, 5, 5),
(32, 'The R2 for the regression will either stay the same or increase.', 1, '00:00:06', 1, 1, 0, 1, 1, 5, 5),
(33, 'erert', 0, '00:00:06', 1, 2, 0, 91, 1, 5, 5),
(34, 'The sample range.', 1, '00:00:09', 1, 1, 0, 16, 1, 5, 5),
(35, 'ert', 0, '00:00:07', 1, 2, 0, 87, 1, 5, 5),
(36, 'The sign of the estimated slope coefficient will be the same as the sign of the correlation between GPA and SAT score.', 1, '00:00:02', 1, 4, 0, 15, 1, 5, 5),
(37, 'None of the above.', 1, '00:00:02', 1, 2, 0, 17, 1, 5, 5),
(38, 'Switching from a 95% confidence interval to a 99% confidence interval.', 1, '00:00:02', 1, 4, 0, 2, 1, 5, 5),
(39, 'E(b  ̃ 2) > −10.', 1, '00:00:01', 1, 1, 0, 6, 1, 5, 5),
(40, 'ert', 0, '00:00:03', 1, 1, 0, 97, 1, 5, 5),
(41, 'ergerg', 0, '', 1, 10, 0, 85, 1, 6, 6),
(42, 'Both (a) and (b) are true.', 0, '00:00:02', 1, 10, 0, 1, 1, 6, 6),
(43, 'Greater than or equal to the R2 of the restricted model.', 1, '00:00:01', 1, 3, 0, 5, 1, 6, 6),
(44, 'Our test statistic was negative.', 1, '00:00:02', 1, 1, 0, 3, 1, 6, 6),
(45, 'test', 0, '00:00:04', 1, 10, 0, 92, 1, 6, 6),
(46, 'All of the above.', 1, '00:00:01', 1, 2, 0, 11, 1, 6, 6),
(47, 'A larger value for the ratio of the coefficient to its standard error.', 1, '00:00:02', 1, 4, 0, 18, 1, 6, 6),
(48, 'none', 0, '00:00:05', 1, 10, 0, 84, 1, 6, 6),
(49, 'test', 0, '00:00:04', 1, 10, 0, 100, 1, 6, 6),
(50, 'R = β1 + β2A + β2 A2 + ε.', 1, '00:00:02', 1, 1, 0, 8, 1, 6, 6),
(51, 'E(b  ̃ 2) > −10.', 1, '', 1, 1, 0, 6, 1, 7, 7),
(52, 'Greater than or equal to the R2 of the restricted model.', 1, '00:00:02', 1, 2, 0, 5, 1, 7, 7),
(53, 'Our test statistic was negative.', 1, '00:00:02', 1, 2, 0, 3, 1, 7, 7),
(54, 'test', 0, '00:00:05', 1, 2, 0, 90, 1, 7, 7),
(55, 'The sign of the estimated slope coefficient will be the same as the sign of the correlation between GPA and SAT score.', 1, '00:00:02', 1, 2, 0, 15, 1, 7, 7),
(56, 'none', 0, '00:00:06', 1, 2, 0, 99, 1, 7, 7),
(57, 'test', 1, '00:00:04', 1, 1, 0, 82, 1, 7, 7),
(58, 'None of the above.', 1, '00:00:02', 1, 1, 0, 17, 1, 7, 7),
(59, 'A larger value for the ratio of the coefficient to its standard error.', 1, '00:00:01', 1, 2, 0, 18, 1, 7, 7),
(60, 'R = β1 + β2A + β2 A2 + ε.', 1, '00:00:02', 1, 1, 0, 8, 1, 7, 7),
(61, 'Increase the mean.', 1, '', 1, 3, 0, 88, 1, 9, 9),
(62, 'All of the above.', 1, '00:00:08', 1, 1, 0, 11, 1, 9, 9),
(63, 'The magnitude of the standard error for the slope coefficient for income.', 1, '00:00:03', 1, 2, 0, 10, 1, 9, 9),
(64, 'Smaller than 5.', 1, '00:00:04', 1, 2, 0, 9, 1, 9, 9),
(65, 'R = β1 + β2A + β2 A2 + ε.', 1, '00:00:19', 1, 1, 0, 89, 1, 9, 9),
(66, 'The error sum of squares is larger than the total sum of squares.', 1, '00:00:02', 1, 1, 0, 12, 1, 9, 9),
(67, 'The error sum of squares is larger than the total sum of squares.', 1, '00:00:19', 1, 2, 0, 93, 1, 9, 9),
(68, 'None of the above.', 1, '00:00:03', 1, 1, 0, 17, 1, 9, 9),
(69, 'The sign of the estimated slope coefficient will be the same as the sign of the correlation between GPA and SAT score.', 1, '00:00:03', 1, 4, 0, 15, 1, 9, 9),
(70, 'Centered at the population mean.', 1, '00:00:03', 1, 1, 0, 20, 1, 9, 9),
(71, 'β3 6= 0 and β4 6= 0.', 0, '00:00:03', 2, 1, 0, 17, 1, 15, 15),
(72, 'Choosing an incorrect functional form for the regression equation.', 0, '00:00:02', 2, 1, 0, 13, 1, 15, 15),
(73, 'Still equal to 5.', 0, '00:00:04', 2, 1, 0, 9, 1, 15, 15),
(74, 'test', 0, '00:00:04', 2, 1, 0, 97, 1, 15, 15),
(75, 'Centered at the population mean.', 1, '00:00:03', 2, 1, 0, 20, 1, 15, 15),
(76, 'test', 0, '00:00:03', 2, 1, 0, 89, 1, 15, 15),
(77, 'E(b  ̃ 2) > −10.', 1, '00:00:02', 2, 1, 0, 6, 1, 15, 15),
(78, 'Switching from a 95% confidence interval to a 99% confidence interval.', 1, '00:00:03', 2, 1, 0, 2, 1, 15, 15),
(79, 'R = β1 + β2A + β2 A2 + ε.', 1, '00:00:01', 2, 1, 0, 8, 1, 15, 15),
(80, 'werwer', 0, '00:00:02', 2, 1, 0, 96, 1, 15, 15),
(81, 'The magnitude of the slope coefficient will be equal to the magnitude of the correlation between GPA and SAT score.', 0, '00:00:02', 2, 1, 0, 15, 1, 15, 15),
(82, 'wer', 0, '00:00:01', 2, 1, 0, 85, 1, 15, 15),
(83, 'y is measured with some random error.', 0, '00:00:01', 2, 1, 0, 4, 1, 15, 15),
(84, 'sdfsdf', 0, '00:00:02', 2, 1, 0, 101, 1, 15, 15),
(85, 'sdfsdf', 0, '00:00:02', 2, 1, 0, 82, 1, 15, 15),
(86, 'sdf', 0, '00:00:01', 2, 1, 0, 95, 1, 15, 15),
(87, 'sdfsdf', 0, '00:00:01', 2, 1, 0, 84, 1, 15, 15),
(88, 'were', 0, '00:00:01', 2, 1, 0, 88, 1, 15, 15),
(89, 'ewrw', 0, '00:00:05', 2, 1, 0, 98, 1, 15, 15),
(90, 'Equal to the R2 of the restricted model.', 0, '00:00:02', 2, 1, 0, 5, 1, 15, 15),
(91, 'werwer', 0, '00:00:01', 2, 1, 0, 94, 1, 15, 15),
(92, ' The adjusted R2 for the regression will either stay the same or increase.', 0, '00:00:01', 2, 1, 0, 1, 1, 15, 15),
(93, 'The magnitude of the standard error for the slope coefficient for income.', 1, '00:00:01', 2, 1, 0, 10, 1, 15, 15),
(94, 'Increase the mean.', 1, '00:00:01', 2, 1, 0, 7, 1, 15, 15),
(95, 'werwer', 0, '00:00:01', 2, 1, 0, 81, 1, 15, 15),
(96, 'werwer', 0, '00:00:01', 2, 1, 0, 83, 1, 15, 15),
(97, 'werwer', 0, '00:00:01', 2, 1, 0, 99, 1, 15, 15),
(98, 'The error sum of squares is zero.', 0, '00:00:02', 2, 1, 0, 12, 1, 15, 15),
(99, 'The sample range.', 1, '00:00:01', 2, 1, 0, 16, 1, 15, 15),
(100, 'A smaller F statistic for the regression.', 0, '00:00:01', 2, 1, 0, 18, 1, 15, 15),
(101, 'test', 0, '00:00:04', 1, 2, 0, 106, 1, 16, 16),
(102, 'test', 0, '00:00:03', 1, 2, 0, 110, 1, 16, 16),
(103, 'Centered at the population mean.', 1, '00:00:02', 1, 1, 0, 40, 1, 16, 16),
(104, 'A larger value for the ratio of the coefficient to its standard error.', 1, '00:00:01', 1, 2, 0, 38, 1, 16, 16),
(105, 'wert', 0, '00:00:03', 1, 2, 0, 105, 1, 16, 16),
(106, 'werwer', 0, '00:00:02', 1, 2, 0, 112, 1, 16, 16),
(107, 'sdfdsf', 0, '00:00:02', 1, 2, 0, 115, 1, 16, 16),
(108, 'None of the above.', 1, '00:00:02', 1, 3, 0, 37, 1, 16, 16),
(109, 'The R 2 for the regression will either stay the same or increase.', 0, '00:00:01', 1, 7, 0, 21, 1, 16, 16),
(110, 'sdfsdf', 0, '00:00:02', 1, 1, 0, 118, 1, 16, 16),
(111, 'Smaller than 5.', 1, '00:00:04', 1, 3, 0, 29, 1, 18, 18),
(112, 'test', 0, '00:00:03', 1, 2, 0, 105, 1, 18, 18),
(113, 'test', 0, '00:00:02', 1, 2, 0, 115, 1, 18, 18),
(114, 'The R 2 for the regression will either stay the same or increase.', 0, '00:00:02', 1, 2, 0, 21, 1, 18, 18),
(115, 'test', 0, '00:00:02', 1, 2, 0, 111, 1, 18, 18),
(116, 'werwer', 0, '00:00:02', 1, 2, 0, 118, 1, 18, 18),
(117, 'werwer', 0, '00:00:02', 1, 2, 0, 103, 1, 18, 18),
(118, 'Increase the mean.', 1, '00:00:02', 1, 1, 0, 27, 1, 18, 18),
(119, 'wer', 0, '00:00:01', 1, 2, 0, 112, 1, 18, 18),
(120, '', 0, '00:00:45', 1, 1, 0, 24, 1, 18, 18),
(121, 'We can reject the null hypothesis that β2 < 0 at a 5% significance level.', 0, '00:00:56', 1, 10, 0, 23, 1, 20, 20),
(122, 'Switching from a 95% confidence interval to a 99% confidence interval.', 1, '00:00:06', 1, 1, 0, 22, 1, 20, 20),
(123, 'E(b  ̃ 2) > −10.', 1, '00:00:02', 1, 1, 0, 26, 1, 20, 20),
(124, 'test', 0, '00:00:03', 1, 2, 0, 105, 1, 20, 20),
(125, 'wer', 0, '00:00:02', 1, 3, 0, 119, 1, 20, 20),
(126, 'wer', 0, '00:00:07', 1, 2, 0, 117, 1, 20, 20),
(127, 'werwer', 0, '00:00:01', 1, 2, 0, 113, 1, 20, 20),
(128, 'x is measured with some random error.', 1, '00:00:03', 1, 1, 0, 24, 1, 20, 20),
(129, 'wer', 0, '00:00:01', 1, 2, 0, 112, 1, 20, 20),
(130, 'wer', 0, '00:00:01', 1, 1, 0, 114, 1, 20, 20),
(131, 'test', 0, '00:00:09', 1, 2, 0, 106, 1, 21, 21),
(132, 'test', 0, '00:00:05', 1, 2, 0, 105, 1, 21, 21),
(133, 'Multicollinearity problem.', 1, '00:00:04', 1, 1, 0, 39, 1, 21, 21),
(134, 'test', 0, '00:00:04', 1, 2, 0, 116, 1, 21, 21),
(135, 'None of the above.', 1, '00:00:02', 1, 2, 0, 34, 1, 21, 21),
(136, 'test', 0, '00:03:12', 1, 2, 0, 104, 1, 21, 21),
(137, 'test', 0, '00:00:03', 1, 2, 0, 117, 1, 21, 21),
(138, 'x is measured with some random error.', 1, '00:00:06', 1, 1, 0, 24, 1, 21, 21),
(139, 'test', 0, '00:00:03', 1, 2, 0, 119, 1, 21, 21),
(140, 'test', 0, '00:00:03', 1, 1, 0, 121, 1, 21, 21),
(141, 'test', 0, '00:00:05', 1, 2, 0, 114, 1, 23, 23),
(142, 'x is measured with some random error.', 1, '00:00:24', 1, 1, 0, 24, 1, 23, 23),
(143, 'Greater than or equal to the R2 of the restricted model.', 1, '00:00:02', 1, 1, 0, 25, 1, 23, 23),
(144, 'test', 0, '00:00:02', 1, 2, 0, 118, 1, 23, 23),
(145, 'Multicollinearity problem.', 1, '00:00:02', 1, 1, 0, 39, 1, 23, 23),
(146, 'test', 0, '00:00:02', 1, 2, 0, 104, 1, 23, 23),
(147, 'E(b  ̃ 2) > −10.', 1, '00:00:10', 1, 1, 0, 26, 1, 23, 23),
(148, 'test', 0, '00:01:08', 1, 2, 0, 103, 1, 23, 23),
(149, 'The sign of the estimated slope coefficient will be the same as the sign of the correlation between GPA and SAT score.', 1, '00:00:04', 1, 1, 0, 35, 1, 23, 23),
(150, 'Random measurement error in x.', 0, '00:00:03', 1, 1, 0, 33, 1, 23, 23),
(151, 'A larger value for the ratio of the coefficient to its standard error.', 1, '00:00:04', 1, 2, 0, 38, 1, 25, 25),
(152, 'test', 0, '00:00:03', 1, 2, 0, 107, 1, 25, 25),
(153, 'The magnitude of the standard error for the slope coefficient for income.', 1, '00:00:01', 1, 3, 0, 30, 1, 25, 25),
(154, 'R = β1 + β2A + β2 A2 + ε.', 1, '00:00:02', 1, 1, 0, 28, 1, 25, 25),
(155, 'test', 0, '00:00:03', 1, 2, 0, 120, 1, 25, 25),
(156, 'Centered at the population mean.', 1, '00:00:02', 1, 1, 0, 40, 1, 25, 25),
(157, 'test', 0, '00:00:03', 1, 2, 0, 113, 1, 25, 25),
(158, 'test', 0, '00:00:02', 1, 2, 0, 109, 1, 25, 25),
(159, 'test', 0, '00:00:02', 1, 2, 0, 119, 1, 25, 25),
(160, 'x is measured with some random error.', 1, '00:00:02', 1, 1, 0, 24, 1, 25, 25),
(161, 'test', 0, '00:00:04', 1, 2, 0, 119, 1, 27, 27),
(162, 'test', 0, '00:00:03', 1, 2, 0, 106, 1, 27, 27),
(163, 'test', 0, '00:00:02', 1, 2, 0, 102, 1, 27, 27),
(164, 'All of the above.', 1, '00:00:12', 1, 1, 0, 31, 1, 27, 27),
(165, 'The magnitude of the standard error for the slope coefficient for income.', 1, '00:00:10', 1, 2, 0, 30, 1, 27, 27),
(166, 'We can reject the null hypothesis that β2 < 0 at a 5% significance level.', 0, '00:00:02', 1, 5, 0, 23, 1, 27, 27),
(167, 'test', 0, '00:00:02', 1, 2, 0, 114, 1, 27, 27),
(168, 'Smaller than 5.', 1, '00:00:02', 1, 3, 0, 29, 1, 27, 27),
(169, 'Centered at the population mean.', 1, '00:00:03', 1, 2, 0, 40, 1, 27, 27),
(170, 'test', 0, '00:00:03', 1, 1, 0, 108, 1, 27, 27),
(171, 'r', 0, '00:00:05', 1, 2, 0, 118, 1, 29, 29),
(172, 'The magnitude of the standard error for the slope coefficient for income.', 1, '00:00:12', 1, 1, 0, 30, 1, 29, 29),
(173, 'asd', 0, '00:00:03', 1, 2, 0, 119, 1, 29, 29),
(174, 'asd', 0, '00:00:01', 1, 2, 0, 109, 1, 29, 29),
(175, 'None of the above.', 1, '00:00:02', 1, 3, 0, 34, 1, 29, 29),
(176, 'E(b  ̃ 2) > −10.', 1, '00:00:02', 1, 1, 0, 26, 1, 29, 29),
(177, 'test', 0, '00:00:03', 1, 2, 0, 120, 1, 29, 29),
(178, 'test', 0, '00:00:02', 1, 2, 0, 112, 1, 29, 29),
(179, 'test', 0, '00:00:02', 1, 2, 0, 111, 1, 29, 29),
(180, 'None of the above.', 1, '00:00:02', 1, 1, 0, 37, 1, 29, 29),
(181, 'test', 0, '00:00:22', 1, 2, 0, 113, 1, 31, 31),
(182, 'None of the above.', 1, '00:00:02', 1, 1, 0, 37, 1, 31, 31),
(183, 'R = β1 + β2A + β2 A2 + ε.', 1, '00:00:02', 1, 1, 0, 28, 1, 31, 31),
(184, 'The magnitude of the standard error for the slope coefficient for income.', 1, '00:00:04', 1, 2, 0, 30, 1, 31, 31),
(185, 'test', 0, '00:00:03', 1, 2, 0, 108, 1, 31, 31),
(186, 'test', 0, '00:00:03', 1, 2, 0, 112, 1, 31, 31),
(187, 'test', 0, '00:00:05', 1, 2, 0, 106, 1, 31, 31),
(188, 'test', 0, '00:03:36', 1, 2, 0, 119, 1, 31, 31),
(189, 'test', 0, '00:00:06', 1, 2, 0, 103, 1, 31, 31),
(190, 'E(b  ̃ 2) > −10.', 1, '00:02:17', 1, 1, 0, 26, 1, 31, 31),
(191, 'R = β1 + β2A + β2 A2 + ε.', 1, '00:00:02', 1, 1, 0, 28, 1, 33, 33),
(192, 'The magnitude of the slope coefficient will be equal to the magnitude of the correlation between GPA and SAT score.', 0, '00:00:01', 1, 2, 0, 35, 1, 33, 33),
(193, 'test', 0, '00:00:03', 1, 2, 0, 120, 1, 33, 33),
(194, 'All of the above.', 1, '00:00:03', 1, 1, 0, 31, 1, 33, 33),
(195, 'Multicollinearity problem.', 1, '00:00:02', 1, 1, 0, 39, 1, 33, 33),
(196, 'test', 0, '00:00:05', 1, 2, 0, 119, 1, 33, 33),
(197, 'test', 0, '00:00:05', 1, 1, 0, 109, 1, 33, 33),
(198, 'E(b  ̃ 2) > −10.', 1, '00:00:02', 1, 1, 0, 26, 1, 34, 34),
(199, 'test', 0, '00:00:42', 1, 2, 0, 104, 1, 34, 34),
(200, 'test', 0, '00:00:05', 1, 2, 0, 116, 1, 35, 35),
(201, 'The magnitude of the standard error for the slope coefficient for income.', 1, '00:00:03', 1, 1, 0, 30, 1, 35, 35),
(202, 'The error sum of squares is larger than the total sum of squares.', 1, '00:00:02', 1, 3, 0, 32, 1, 35, 35),
(203, 'Increase the mean.', 1, '00:00:02', 1, 4, 0, 27, 1, 35, 35),
(204, 'test', 0, '00:00:03', 1, 2, 0, 110, 1, 35, 35),
(205, 'Smaller than 5.', 1, '00:00:02', 1, 2, 0, 29, 1, 35, 35),
(206, 'test', 0, '00:00:03', 1, 2, 0, 113, 1, 35, 35),
(207, 'test', 0, '00:00:03', 1, 2, 0, 117, 1, 35, 35),
(208, 'The sign of the estimated slope coefficient will be the same as the sign of the correlation between GPA and SAT score.', 1, '00:00:02', 1, 1, 0, 35, 1, 35, 35),
(209, 'test', 0, '00:00:02', 1, 1, 0, 115, 1, 35, 35),
(210, 'Multicollinearity problem.', 1, '00:00:03', 1, 1, 0, 39, 1, 36, 36),
(211, 'test', 0, '00:00:03', 1, 1, 0, 103, 1, 36, 36),
(212, 'None of the above.', 1, '00:00:02', 1, 1, 0, 37, 1, 37, 37),
(213, 'test', 0, '00:00:09', 1, 2, 0, 103, 1, 37, 37),
(214, 'Greater than or equal to the R2 of the restricted model.', 1, '00:00:02', 1, 2, 0, 25, 1, 37, 37),
(215, 'test', 0, '00:00:02', 1, 2, 0, 115, 1, 37, 37),
(216, 'Switching from a 95% confidence interval to a 99% confidence interval.', 1, '00:00:02', 1, 3, 0, 22, 1, 37, 37),
(217, 'test', 0, '00:00:03', 1, 2, 0, 102, 1, 37, 37),
(218, 'The magnitude of the standard error for the slope coefficient for income.', 1, '00:00:04', 1, 2, 0, 30, 1, 37, 37),
(219, 'test', 0, '00:00:03', 1, 2, 0, 111, 1, 37, 37),
(220, 'test', 0, '00:00:02', 1, 2, 0, 120, 1, 37, 37),
(221, 'test', 0, '00:00:03', 1, 1, 0, 112, 1, 37, 37),
(222, 'test', 0, '00:00:05', 1, 2, 0, 115, 1, 39, 39),
(223, 'None of the above.', 1, '00:00:01', 1, 2, 0, 37, 1, 39, 39),
(224, 'test', 0, '00:00:03', 1, 2, 0, 121, 1, 39, 39),
(225, 'E(b  ̃ 2) > −10.', 1, '00:00:02', 1, 1, 0, 26, 1, 39, 39),
(226, 'All of the above.', 1, '00:00:02', 1, 1, 0, 31, 1, 39, 39),
(227, 'test', 0, '00:00:03', 1, 2, 0, 110, 1, 39, 39),
(228, ' Our test statistic was negative.', 0, '00:00:03', 1, 2, 0, 23, 1, 39, 39),
(229, 'test', 0, '00:00:04', 1, 2, 0, 117, 1, 39, 39),
(230, 'test', 0, '00:00:03', 1, 2, 0, 106, 1, 39, 39),
(231, 'test', 0, '00:00:03', 1, 1, 0, 104, 1, 39, 39),
(232, 'E(b  ̃ 2) > −10.', 1, '00:00:04', 1, 1, 0, 26, 1, 40, 40),
(233, 'A larger value for the ratio of the coefficient to its standard error.', 1, '00:00:20', 1, 3, 0, 38, 1, 40, 40),
(234, 'test', 0, '00:00:03', 1, 2, 0, 109, 1, 40, 40),
(235, 'test', 0, '00:00:02', 1, 2, 0, 113, 1, 40, 40),
(236, 'test', 0, '00:00:02', 1, 2, 0, 102, 1, 40, 40),
(237, 'test', 0, '00:00:13', 1, 2, 0, 117, 1, 40, 40),
(238, 'test', 0, '00:00:03', 1, 2, 0, 110, 1, 40, 40),
(239, 'The sample range.', 1, '00:00:02', 1, 1, 0, 36, 1, 40, 40),
(240, 'R = β1 + β2A + β2 A2 + ε.', 1, '00:00:01', 1, 1, 0, 28, 1, 40, 40),
(241, 'Switching from a 95% confidence interval to a 99% confidence interval.', 1, '00:00:02', 1, 1, 0, 22, 1, 40, 40),
(242, 'Increase the mean.', 1, '00:00:05', 1, 3, 0, 27, 1, 41, 41),
(243, 'test', 0, '00:00:29', 1, 2, 0, 121, 1, 41, 41),
(244, 'test', 0, '00:00:14', 1, 2, 0, 114, 1, 41, 41),
(245, 'Smaller than 5.', 1, '00:00:06', 1, 3, 0, 29, 1, 41, 41),
(246, 'test', 0, '00:00:03', 1, 2, 0, 104, 1, 41, 41),
(247, 'test', 0, '00:00:03', 1, 2, 0, 115, 1, 41, 41),
(248, 'The magnitude of the standard error for the slope coefficient for income.', 1, '00:00:02', 1, 3, 0, 30, 1, 41, 41),
(249, 'test', 0, '00:00:03', 1, 2, 0, 102, 1, 41, 41),
(250, 'test', 0, '00:00:03', 1, 2, 0, 109, 1, 41, 41),
(251, 'test', 0, '00:00:03', 1, 1, 0, 106, 1, 41, 41),
(252, 'test', 0, '00:00:03', 1, 2, 0, 104, 1, 43, 43),
(253, 'test', 0, '00:00:07', 1, 2, 0, 118, 1, 43, 43),
(254, 'test', 0, '00:00:04', 1, 1, 0, 113, 1, 44, 44),
(255, 'The error sum of squares is larger than the total sum of squares.', 1, '00:00:02', 1, 2, 0, 32, 1, 45, 45),
(256, 'None of the above.', 1, '00:00:07', 1, 1, 0, 37, 1, 45, 45),
(257, 'test', 0, '00:00:05', 1, 3, 0, 121, 1, 45, 45),
(258, 'test', 0, '00:00:01', 1, 2, 0, 105, 1, 45, 45),
(259, '', 0, '00:00:04', 1, 1, 0, 104, 1, 45, 45),
(260, 'test', 0, '00:01:28', 1, 2, 0, 105, 1, 46, 46),
(261, 'The sample range.', 1, '00:00:03', 1, 1, 0, 36, 1, 46, 46),
(262, 'Smaller than 5.', 1, '00:00:02', 1, 3, 0, 29, 1, 46, 46),
(263, 'test', 0, '00:00:03', 1, 2, 0, 109, 1, 46, 46),
(264, 'None of the above.', 1, '00:00:02', 1, 3, 0, 34, 1, 46, 46),
(265, 'test', 0, '00:00:02', 1, 2, 0, 116, 1, 46, 46),
(266, 'E(b  ̃ 2) > −10.', 1, '00:00:03', 1, 1, 0, 26, 1, 46, 46),
(267, 'R = β1 + β2A + β2 A2 + ε.', 1, '00:00:03', 1, 1, 0, 28, 1, 46, 46),
(268, 'test', 0, '00:00:01', 1, 3, 0, 102, 1, 46, 46),
(269, 'All of the above.', 1, '00:00:03', 1, 1, 0, 31, 1, 46, 46),
(270, 'test', 0, '00:00:33', 1, 2, 0, 115, 1, 47, 47),
(271, 'Greater than or equal to the R2 of the restricted model.', 1, '00:00:05', 1, 2, 0, 25, 1, 47, 47),
(272, 'test', 0, '00:00:05', 1, 2, 0, 116, 1, 47, 47),
(273, 'The sample range.', 1, '00:00:02', 1, 1, 0, 36, 1, 47, 47),
(274, 'The magnitude of the standard error for the slope coefficient for income.', 1, '00:00:03', 1, 1, 0, 30, 1, 47, 47),
(275, 'A larger value for the ratio of the coefficient to its standard error.', 1, '00:00:02', 1, 4, 0, 38, 1, 47, 47),
(276, 'test', 0, '00:00:02', 1, 2, 0, 117, 1, 47, 47),
(277, 'Centered at the population mean.', 1, '00:00:02', 1, 1, 0, 40, 1, 47, 47),
(278, 'test', 0, '00:00:02', 1, 2, 0, 120, 1, 47, 47),
(279, 'Not enough information.', 0, '00:00:04', 1, 1, 0, 29, 1, 47, 47),
(280, 'test', 0, '00:00:05', 1, 2, 0, 104, 1, 48, 48),
(281, 'test', 0, '00:00:05', 1, 2, 0, 112, 1, 48, 48),
(282, 'We can reject the null hypothesis that β2 = 0 at a 5% significance level.', 0, '00:00:04', 1, 3, 0, 23, 1, 48, 48),
(283, 'E(b  ̃ 2) > −10.', 1, '00:00:02', 1, 1, 0, 26, 1, 48, 48),
(284, 'x is measured with some random error.', 1, '00:00:03', 1, 1, 0, 24, 1, 48, 48),
(285, 'Smaller than 5.', 1, '00:00:04', 1, 4, 0, 29, 1, 48, 48),
(286, 'None of the above.', 1, '00:00:02', 1, 1, 0, 34, 1, 48, 48),
(287, 'test', 0, '00:00:06', 1, 2, 0, 116, 1, 48, 48),
(288, 'It could be greater than, less than or equal to the R2 of the restricted model.', 0, '00:00:02', 1, 2, 0, 25, 1, 48, 48),
(289, 'Multicollinearity problem.', 1, '00:00:02', 1, 1, 0, 39, 1, 48, 48),
(290, 'test', 0, '00:00:07', 1, 2, 0, 102, 1, 50, 50),
(291, 'test', 0, '00:00:03', 1, 2, 0, 111, 1, 50, 50),
(292, 'test', 0, '00:00:03', 1, 2, 0, 110, 1, 50, 50),
(293, 'test', 0, '00:00:04', 1, 2, 0, 118, 1, 50, 50),
(294, 'A larger value for the ratio of the coefficient to its standard error.', 1, '00:00:02', 1, 3, 0, 38, 1, 50, 50),
(295, 'All of the above.', 1, '00:00:37', 1, 1, 0, 31, 1, 50, 50),
(296, 'It could be greater than, less than or equal to the R2 of the restricted model.', 0, '00:00:03', 1, 2, 0, 25, 1, 50, 50),
(297, 'test', 0, '00:00:02', 1, 2, 0, 109, 1, 50, 50),
(298, 'Multicollinearity problem.', 1, '00:00:03', 1, 1, 0, 39, 1, 50, 50),
(299, 'E(b  ̃ 2) > −10.', 1, '00:00:01', 1, 1, 0, 26, 1, 50, 50),
(300, 'Increase the mean.', 1, '00:00:05', 1, 4, 0, 27, 1, 51, 51),
(301, 'test', 0, '00:01:04', 1, 2, 0, 112, 1, 51, 51),
(302, 'test', 0, '00:00:02', 1, 2, 0, 103, 1, 51, 51),
(303, 'test', 0, '00:00:03', 1, 2, 0, 117, 1, 51, 51),
(304, 'E(b  ̃ 2) > −10.', 1, '00:00:01', 1, 1, 0, 26, 1, 51, 51),
(305, 'test', 0, '00:00:02', 1, 2, 0, 106, 1, 51, 51),
(306, 'Multicollinearity problem.', 1, '00:00:02', 1, 1, 0, 39, 1, 51, 51),
(307, 'test', 0, '00:00:02', 1, 2, 0, 121, 1, 51, 51),
(308, 'test', 0, '00:00:04', 1, 2, 0, 102, 1, 51, 51),
(309, 'test', 0, '00:00:04', 1, 1, 0, 104, 1, 51, 51),
(310, 'Increase the mean.', 1, '00:00:03', 1, 4, 0, 27, 1, 52, 52),
(311, 'test', 0, '00:00:03', 1, 2, 0, 121, 1, 52, 52),
(312, 'The magnitude of the standard error for the slope coefficient for income.', 1, '00:00:01', 1, 1, 0, 30, 1, 52, 52),
(313, 'test', 0, '00:00:02', 1, 2, 0, 104, 1, 52, 52),
(314, 'test', 0, '00:00:13', 1, 2, 0, 110, 1, 52, 52),
(315, 'test', 0, '00:00:03', 1, 2, 0, 118, 1, 52, 52),
(316, 'x is measured with some random error.', 1, '00:00:02', 1, 1, 0, 24, 1, 52, 52),
(317, 'test', 0, '00:00:02', 1, 2, 0, 109, 1, 52, 52),
(318, 'test', 0, '00:00:02', 1, 2, 0, 105, 1, 52, 52),
(319, 'The R 2 for the regression will either stay the same or increase.', 0, '00:02:13', 1, 1, 0, 21, 1, 52, 52),
(320, ' Our test statistic was negative.', 0, '00:00:04', 1, 3, 0, 23, 1, 53, 53),
(321, 'Greater than or equal to the R2 of the restricted model.', 1, '00:00:03', 1, 1, 0, 25, 1, 53, 53),
(322, 'test', 0, '00:00:29', 1, 2, 0, 112, 1, 53, 53),
(323, 'test', 0, '00:00:04', 1, 1, 0, 113, 1, 53, 53),
(324, 'test', 0, '00:00:05', 1, 2, 0, 102, 1, 54, 54),
(325, 'The error sum of squares is larger than the total sum of squares.', 1, '00:00:04', 1, 2, 0, 32, 1, 54, 54),
(326, 'The expected value of the slope coefficient for income.', 0, '00:03:53', 1, 2, 0, 30, 1, 54, 54),
(327, ' Our test statistic was negative.', 0, '00:00:05', 1, 7, 0, 23, 1, 54, 54),
(328, 'Increase the mode.', 0, '00:00:08', 1, 3, 0, 27, 1, 54, 54),
(329, 'test', 0, '00:00:05', 1, 2, 0, 103, 1, 55, 55),
(330, 'A larger value for the ratio of the coefficient to its standard error.', 1, '00:00:13', 1, 7, 0, 38, 1, 55, 55),
(331, 'The magnitude of the standard error for the slope coefficient for income.', 1, '00:00:06', 1, 3, 0, 30, 1, 55, 55),
(332, 'test', 0, '00:00:07', 1, 2, 0, 107, 1, 55, 55),
(333, 'The sign of the estimated slope coefficient will be the same as the sign of the correlation between GPA and SAT score.', 1, '00:00:22', 1, 2, 0, 35, 1, 55, 55),
(334, 'test', 0, '00:04:40', 1, 2, 0, 116, 1, 55, 55),
(335, 'Smaller than 5.', 1, '00:00:03', 1, 3, 0, 29, 1, 55, 55),
(336, 'test', 0, '00:12:47', 1, 2, 0, 109, 1, 55, 55),
(337, 'test', 0, '00:00:03', 1, 1, 0, 115, 1, 55, 55);

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
  MODIFY `accnt_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `exam`
--
ALTER TABLE `exam`
  MODIFY `exam_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `exam_settings`
--
ALTER TABLE `exam_settings`
  MODIFY `exam_set_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

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
  MODIFY `ls_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `requests`
--
ALTER TABLE `requests`
  MODIFY `req_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `scores`
--
ALTER TABLE `scores`
  MODIFY `score_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT for table `subject`
--
ALTER TABLE `subject`
  MODIFY `subj_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `test_history`
--
ALTER TABLE `test_history`
  MODIFY `th_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT for table `test_quest`
--
ALTER TABLE `test_quest`
  MODIFY `testq_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=157;

--
-- AUTO_INCREMENT for table `test_report`
--
ALTER TABLE `test_report`
  MODIFY `testr_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=338;

--
-- AUTO_INCREMENT for table `views`
--
ALTER TABLE `views`
  MODIFY `views_id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
