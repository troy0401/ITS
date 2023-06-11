-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jun 11, 2023 at 07:52 AM
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
(2, 'prof@gmail.com', '$2y$10$Fik76pO.IvKhxoq0f6HMv.C5fSrptLD9I9Ubv7pv9kBYKlFDAtMCC', 'Professor', 1, 'Screenshot_from_2023-04-18_13-06-21.png'),
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
(1, 1, 1, 1, 1, '14', '30'),
(2, 1, 1, 2, 1, '1', '1'),
(3, 2, 1, 1, 0, '0', '10');

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

--
-- Dumping data for table `finals`
--

INSERT INTO `finals` (`finals_ID`, `accnt_id`) VALUES
(1, 1);

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
(1, '1', '1', '001', 30, 5, 1, 1);

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
(2, 2, 1, 0);

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
(1, 1, 1, 10, 3, 1),
(2, 1, 1, 10, 4, 1),
(3, 1, 1, 0, 0, 1),
(4, 1, 1, 10, 1, 1),
(5, 1, 1, 0, 0, 1),
(6, 1, 1, 0, 0, 1),
(7, 1, 1, 10, 6, 1),
(8, 1, 1, 10, 4, 1),
(9, 1, 1, 10, 1, 1),
(10, 1, 1, 10, 3, 1),
(11, 1, 1, 10, 3, 1),
(12, 1, 1, 10, 5, 1),
(13, 1, 1, 10, 5, 1),
(14, 1, 1, 10, 8, 1),
(15, 1, 1, 30, 5, 2);

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
(1, 'Subtopic 1', 'Description1', 'https://www.youtube.com/watch?v=cvhyJT9c0ac', 'https://www.techtarget.com/searchenterpriseai/definition/machine-learning-ML'),
(2, 'Subtopic 2', 'Description 2', 'https://www.youtube.com/watch?v=SwaVN0epc0w', ''),
(3, 'dhgfhgfg', 'rhtfhf', 'ygjjjhk', ''),
(4, 'Subtopic 4', 'Description 4', 'https://www.youtube.com/watch?v=8hly31xKli0', '');

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
(10, 1, 1, 1),
(11, 1, 1, 1),
(12, 1, 1, 1),
(13, 1, 1, 1),
(14, 1, 1, 1),
(15, 2, 1, 1);

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
(1, 'x is measured with some random error.', 127, '00:00:03', 1, 1, '127', 4, 1, 1, 1),
(2, 'test', 127, '00:00:02', 1, 2, '127', 91, 1, 1, 1),
(3, 'test', 127, '00:00:14', 1, 1, '127', 82, 1, 1, 1),
(4, 'None of the above.', 127, '00:00:03', 1, 1, '127', 14, 1, 1, 1),
(5, 'All of the above.', 127, '00:00:02', 1, 2, '127', 2, 1, 1, 1),
(6, 'test', 0, '00:00:03', 1, 2, '0', 97, 1, 2, 2),
(7, 'tres', 0, '00:00:03', 1, 2, '0', 94, 1, 2, 2),
(8, 'test', 127, '00:00:03', 1, 1, '127', 82, 1, 2, 2),
(9, 'None of the above.', 1, '00:00:02', 1, 2, '1', 14, 1, 2, 2),
(10, 'Random measurement error in y.', 127, '00:00:02', 1, 1, '127', 13, 1, 2, 2),
(11, 'Multicollinearity problem.', 127, '00:00:02', 1, 1, '127', 19, 1, 2, 2),
(12, 'The slope coefficient will be statistically significant.', 0, '00:00:01', 1, 2, '0', 15, 1, 2, 2),
(13, 'The error sum of squares is positive.', 0, '00:00:02', 1, 2, '0', 12, 1, 2, 2),
(14, 'test', 0, '00:00:02', 1, 2, '0', 98, 1, 2, 2),
(15, 'test', 127, '00:00:02', 1, 1, '127', 93, 1, 2, 2),
(16, 'Increase the mean.', 127, '00:00:04', 1, 1, '127', 7, 1, 4, 4),
(17, 'test', 127, '00:00:08', 1, 1, '127', 93, 1, 4, 4),
(18, 'All of the above.', 127, '00:00:09', 1, 1, '127', 11, 1, 7, 7),
(19, 'x is measured with some random error.', 1, '00:00:04', 1, 2, '1', 4, 1, 7, 7),
(20, 'test', 0, '00:00:07', 1, 2, '0', 93, 1, 7, 7),
(21, '1234', 1, '00:00:48', 1, 2, '1', 81, 1, 7, 7),
(22, 'test', 0, '00:00:06', 1, 2, '0', 92, 1, 7, 7),
(23, 'E(b  ̃ 2) > −10.', 127, '00:00:05', 1, 1, '127', 6, 1, 7, 7),
(24, 'The magnitude of the standard error for the slope coefficient for income.', 127, '00:00:04', 1, 1, '127', 10, 1, 7, 7),
(25, 'test', 0, '00:00:04', 1, 2, '0', 88, 1, 7, 7),
(26, 'Our test statistic was negative.', 127, '00:00:05', 1, 1, '127', 3, 1, 7, 7),
(27, 'test', 127, '00:01:00', 1, 1, '127', 100, 1, 7, 7),
(28, 'The magnitude of the standard error for the slope coefficient for income.', 1, '00:00:02', 1, 2, '1', 10, 1, 8, 8),
(29, 'test', 0, '00:00:04', 1, 2, '0', 88, 1, 8, 8),
(30, 'test', 0, '00:00:03', 1, 2, '0', 95, 1, 8, 8),
(31, 'A larger standard error for that slope coefficient.', 0, '00:00:02', 1, 2, '0', 18, 1, 8, 8),
(32, 'R = β1 + β2A + β2 A2 + ε.', 127, '00:00:01', 1, 1, '127', 8, 1, 8, 8),
(33, 'The sample range.', 127, '00:00:04', 1, 1, '127', 16, 1, 8, 8),
(34, 'test', 0, '00:00:04', 1, 2, '0', 97, 1, 8, 8),
(35, 'test', 127, '00:00:24', 1, 1, '127', 82, 1, 8, 8),
(36, 'test', 0, '00:00:08', 1, 2, '0', 94, 1, 8, 8),
(37, 'test', 127, '00:00:05', 1, 1, '127', 101, 1, 8, 8),
(38, 'test', 0, '00:00:09', 1, 2, '0', 87, 1, 9, 9),
(39, 'test', 0, '00:00:02', 1, 2, '0', 84, 1, 9, 9),
(40, 'None of the above.', 1, '00:00:07', 1, 2, '1', 17, 1, 9, 9),
(41, 'test', 0, '00:00:03', 1, 2, '0', 91, 1, 10, 10),
(42, 'test', 0, '00:00:02', 1, 2, '0', 88, 1, 10, 10),
(43, 'tet', 0, '00:00:03', 1, 2, '0', 101, 1, 10, 10),
(44, 'test', 0, '00:00:20', 1, 2, '0', 90, 1, 10, 10),
(45, 'The magnitude of the standard error for the slope coefficient for income.', 127, '00:00:03', 1, 1, '127', 10, 1, 10, 10),
(46, 'None of the above.', 127, '00:00:03', 1, 1, '127', 17, 1, 10, 10),
(47, 'test', 0, '00:00:04', 1, 2, '0', 97, 1, 10, 10),
(48, 'test', 0, '00:00:04', 1, 2, '0', 96, 1, 10, 10),
(49, 'test', 0, '00:00:03', 1, 2, '0', 84, 1, 10, 10),
(50, 'test', 127, '00:00:03', 1, 1, '127', 82, 1, 10, 10),
(51, 'test', 0, '00:00:17', 1, 2, '0', 96, 1, 11, 11),
(52, 'test', 0, '00:00:02', 1, 2, '0', 99, 1, 11, 11),
(53, 'test', 0, '00:00:02', 1, 2, '0', 90, 1, 11, 11),
(54, 'R = β1 + β2A + β2 A2 + ε.', 127, '00:00:01', 1, 1, '127', 8, 1, 11, 11),
(55, 'test', 0, '00:00:03', 1, 2, '0', 88, 1, 11, 11),
(56, 'test', 0, '00:00:02', 1, 2, '0', 86, 1, 11, 11),
(57, 'test', 0, '00:00:02', 1, 2, '0', 98, 1, 11, 11),
(58, 'test', 0, '00:00:02', 1, 2, '0', 85, 1, 11, 11),
(59, 'The R2 for the regression will either stay the same or increase.', 127, '00:00:02', 1, 1, '127', 1, 1, 11, 11),
(60, 'None of the above.', 127, '00:00:14', 1, 1, '127', 17, 1, 11, 11),
(61, 'The magnitude of the standard error for the slope coefficient for income.', 127, '00:00:04', 1, 1, '127', 10, 1, 12, 12),
(62, 'A larger standard error for that slope coefficient.', 0, '00:00:06', 1, 2, '0', 18, 1, 12, 12),
(63, 'test', 0, '00:00:03', 1, 2, '0', 81, 1, 12, 12),
(64, 'All of the above.', 0, '00:00:02', 1, 2, '0', 2, 1, 12, 12),
(65, 'Our test statistic was negative.', 127, '00:00:02', 1, 1, '127', 3, 1, 12, 12),
(66, 'test', 0, '00:00:03', 1, 2, '0', 83, 1, 12, 12),
(67, 'E(b  ̃ 2) > −10.', 127, '00:00:01', 1, 1, '127', 6, 1, 12, 12),
(68, 'x is measured with some random error.', 127, '00:00:04', 1, 1, '127', 4, 1, 12, 12),
(69, 'The sample range.', 127, '00:00:03', 1, 1, '127', 16, 1, 12, 12),
(70, 'werwer', 0, '00:00:03', 1, 3, '0', 82, 1, 12, 12),
(71, 'test', 0, '00:00:03', 1, 2, '0', 85, 1, 13, 13),
(72, 'All of the above.', 127, '00:00:02', 1, 1, '127', 11, 1, 13, 13),
(73, 'The magnitude of the standard error for the slope coefficient for income.', 127, '00:00:03', 1, 1, '127', 10, 1, 13, 13),
(74, 'test', 0, '00:00:04', 1, 2, '0', 89, 1, 13, 13),
(75, 'None of the above.', 1, '00:00:02', 1, 2, '1', 14, 1, 13, 13),
(76, 'Increase the mean.', 1, '00:00:03', 1, 2, '1', 7, 1, 13, 13),
(77, 'test', 0, '00:00:04', 1, 2, '0', 101, 1, 13, 13),
(78, 'test', 0, '00:00:02', 1, 2, '0', 99, 1, 13, 13),
(79, 'test', 0, '00:00:02', 1, 2, '0', 92, 1, 13, 13),
(80, 'test', 127, '00:02:19', 1, 1, '127', 82, 1, 13, 13),
(81, 'Centered at the population mean.', 127, '00:00:02', 1, 1, '127', 20, 1, 14, 14),
(82, 'test', 0, '00:00:02', 1, 2, '0', 84, 1, 14, 14),
(83, 'All of the above.', 127, '00:00:03', 1, 1, '127', 11, 1, 14, 14),
(84, 'Random measurement error in y.', 1, '00:00:03', 1, 2, '1', 94, 1, 14, 14),
(85, 'x is measured with some random error.', 127, '00:00:02', 1, 1, '127', 4, 1, 14, 14),
(86, 'Switching from a 95% confidence interval to a 99% confidence interval.', 127, '00:00:17', 1, 1, '127', 83, 1, 14, 14),
(87, 'E(b  ̃ 2) > −10.', 127, '00:00:02', 1, 1, '127', 6, 1, 14, 14),
(88, 'test', 0, '00:00:02', 1, 2, '0', 95, 1, 14, 14),
(89, 'Multicollinearity problem.', 127, '00:00:23', 1, 1, '127', 100, 1, 14, 14),
(90, 'None of the above.', 1, '00:00:02', 1, 2, '1', 14, 1, 14, 14),
(91, 'test', 2, '00:00:04', 2, 1, '', 90, 1, 15, 15),
(92, 'test', 2, '00:00:03', 2, 1, '', 97, 1, 15, 15),
(93, 'test', 2, '00:00:02', 2, 1, '', 89, 1, 15, 15),
(94, 'The sample range.', 1, '00:00:02', 2, 1, '', 16, 1, 15, 15),
(95, 'test', 2, '00:00:02', 2, 1, '', 88, 1, 15, 15),
(96, 'test', 2, '00:00:02', 2, 1, '', 100, 1, 15, 15),
(97, 'test', 2, '00:00:04', 2, 1, '', 98, 1, 15, 15),
(98, 'The R2 for the regression will either stay the same or increase.', 1, '00:00:02', 2, 1, '', 1, 1, 15, 15),
(99, 'Not enough information.', 2, '00:00:01', 2, 1, '', 9, 1, 15, 15),
(100, 'A smaller F statistic for the regression.', 2, '00:00:01', 2, 1, '', 18, 1, 15, 15),
(101, 'Switching from a 95% confidence interval to a 99% confidence interval.', 1, '00:00:01', 2, 1, '', 2, 1, 15, 15),
(102, 'The magnitude of the slope coefficient will be equal to the magnitude of the correlation between GPA and SAT score.', 2, '00:00:01', 2, 1, '', 15, 1, 15, 15),
(103, 'y is measured with some random error.', 2, '00:00:01', 2, 1, '', 4, 1, 15, 15),
(104, 'The skewness for the sample is zero.', 2, '00:00:01', 2, 1, '', 11, 1, 15, 15),
(105, 'Equal to the R2 of the restricted model.', 2, '00:00:01', 2, 1, '', 5, 1, 15, 15),
(106, 'test', 2, '00:00:03', 2, 1, '', 99, 1, 15, 15),
(107, 'test', 2, '00:00:03', 2, 1, '', 93, 1, 15, 15),
(108, 'test', 2, '00:00:04', 2, 1, '', 85, 1, 15, 15),
(109, 'test', 2, '00:00:02', 2, 1, '', 84, 1, 15, 15),
(110, 'test', 2, '00:00:02', 2, 1, '', 96, 1, 15, 15),
(111, 'The error sum of squares is zero.', 2, '00:00:02', 2, 1, '', 12, 1, 15, 15),
(112, 'test', 2, '00:00:02', 2, 1, '', 87, 1, 15, 15),
(113, 'test', 2, '00:00:02', 2, 1, '', 83, 1, 15, 15),
(114, 'The expected value of the slope coefficient for income.', 2, '00:00:02', 2, 1, '', 10, 1, 15, 15),
(115, 'Centered at the population mean.', 1, '00:00:01', 2, 1, '', 20, 1, 15, 15),
(116, 'Our test statistic was negative.', 1, '00:00:03', 2, 1, '', 3, 1, 15, 15),
(117, 'Choosing an incorrect functional form for the regression equation.', 2, '00:00:01', 2, 1, '', 13, 1, 15, 15),
(118, 'Lower the R2 .', 2, '00:00:01', 2, 1, '', 14, 1, 15, 15),
(119, 'test', 2, '00:00:02', 2, 1, '', 101, 1, 15, 15),
(120, 'test', 2, '00:00:02', 2, 1, '', 95, 1, 15, 15);

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
  MODIFY `exam_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `exam_settings`
--
ALTER TABLE `exam_settings`
  MODIFY `exam_set_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `finals`
--
ALTER TABLE `finals`
  MODIFY `finals_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `finals_report`
--
ALTER TABLE `finals_report`
  MODIFY `fr_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `lesson_status`
--
ALTER TABLE `lesson_status`
  MODIFY `ls_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `requests`
--
ALTER TABLE `requests`
  MODIFY `req_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `scores`
--
ALTER TABLE `scores`
  MODIFY `score_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `subject`
--
ALTER TABLE `subject`
  MODIFY `subj_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `test_history`
--
ALTER TABLE `test_history`
  MODIFY `th_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `test_quest`
--
ALTER TABLE `test_quest`
  MODIFY `testq_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=157;

--
-- AUTO_INCREMENT for table `test_report`
--
ALTER TABLE `test_report`
  MODIFY `testr_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=121;

--
-- AUTO_INCREMENT for table `views`
--
ALTER TABLE `views`
  MODIFY `views_id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
