-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jun 05, 2023 at 01:50 PM
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
(1, 1, 1, 1, 1, '4', '10'),
(2, 1, 1, 2, 1, '1', '1'),
(3, 2, 1, 1, 0, '8', '10');

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
(1, 1, 'Suppose we regress SAT score on parent’s education and parent’s income. If we run the regression again but also include the student’s GPA as an additional regressor:', 'The R 2 for the regression will either stay the same or increase.', ' The adjusted R2 for the regression will either stay the same or increase.', 'Both (a) and (b) are true.', 'Neither (a) nor (b) is true.', 'The R2 for the regression will either stay the same or increase.', 'When adding an additional regressor, our fit should be at least as good as before, so the R2 for the regression should either stay the same or increase. Adjusted R2 may decrease if the additional regressor had little to no explanatory power.'),
(2, 1, 'Suppose we have a sample of the heights of Davis students and want to use the sample mean to get a confidence interval for the mean height in the population. Which of the following would increase the width of this confidence interval?', ' Switching from a 95% confidence interval to a 90% confidence interval.', 'Increasing the sample size used to calculate the sample mean.', 'Switching from a 95% confidence interval to a 99% confidence interval.', 'All of the above.', 'Switching from a 95% confidence interval to a 99% confidence interval.', 'The smaller we make α, the wider our confidence interval will get. A larger sample size would make the confidence interval narrower.'),
(3, 1, ' Suppose we can reject the null hypothesis that β2 ≥ 0 at a 5% significance level where β2 is the slope coefficient from a bivariate regression. Which of the following is definitely true?', ' Our test statistic was negative.', 'We can reject the null hypothesis that β2 = 0 at a 5% significance level.', 'We can reject the null hypothesis that β2 ≥ 0 at a 2.5% significance level.', 'We can reject the null hypothesis that β2 < 0 at a 5% significance level.', 'Our test statistic was negative.', 'The critical value for a lower one-tailed hypothesis test will be negative and we will reject the null when the test statistic is more negative than the critical value.'),
(4, 1, 'Suppose we regress y on x2. Which of the following would lead to a biased coefficient for x2 ?', 'There is a variable x3 that is correlated with y but not with x2', 'There is a variable x3 that is correlated with x2 but not with y.', 'y is measured with some random error.', 'x is measured with some random error.', 'x is measured with some random error.', 'An omitted variable will bias the coefficient on x2 only if it is correlated with both x2 and with y. Measurement error in x2 will bias the coefficient on x2 since it will lead to errors that are negatively correlated with x2 . Measurement error in y will decrease the precision of the estimated slope coefficient but will not bias the coefficient.'),
(5, 1, 'When testing the significance of a subset of regressors, the R2 of the unrestricted model will always be:', 'Greater than or equal to the R2 of the restricted model.', 'Less than or equal to the R2 of the restricted model.', 'Equal to the R2 of the restricted model.', 'It could be greater than, less than or equal to the R2 of the restricted model.', 'Greater than or equal to the R2 of the restricted model.', 'The unrestricted model contains all of the regressors in the restricted model plus additional regressors. The unrestricted model can achieve the same fit as the restricted model by simply having the coefficients on the additional regressors set to zero. More likely is that these coefficients will be nonzero and the fit will improve.'),
(6, 1, 'Suppose that the true population model of the relationship between weight (W ) and hours of exercise per day (H) is: W = 200 − 10H + ε where ε meets all of our assumptions. If hours of exercise is measured with some random, mean zero error, which of the following statements about the estimated slope coefficient  b  ̃ 2 is true?', ' E(b  ̃ 2) = −10.', 'E(b  ̃ 2) = 10.', 'E(b  ̃ 2) > −10.', 'E(b  ̃ 2) < −10.', 'E(b  ̃ 2) > −10.', 'The slope coefficient will be biased toward zero due to the measurement error. In this case, that means that the expected value of b  ̃ 2 will be between -10 and 0.'),
(7, 1, 'Doubling the value of the largest observation in a sample of incomes will:', 'Increase the median.', 'Increase the mode.', 'Increase the mean.', 'All of the above.', 'Increase the mean.', 'Doubling the largest observation will increase the average value of the variable but will not change the position or value of the 50th percentile of the distribution of values.'),
(8, 1, 'Suppose that the risk of catching the flu is high for young children and the elderly but low for teenagers and younger adults. Which of the following equations would be the best choice for modeling the relationship between flu risk (R) and age (A)?', 'R = β1 + β2A + ε.', 'ln(R) = β1 + β2 ln(A) + ε.', 'R = β1 + β2A + β2 A2 + ε.', 'R = β1 + β2ln(A) + ε.', 'R = β1 + β2A + β2 A2 + ε.', 'Based on the description, flu risk is first decreasing with age and then increasing with age. We need a polynomial to fit this type of parabolic curve.'),
(9, 1, 'Suppose that snow depth measured in feet is included as a regressor in a multivariate regression and the magnitude of the estimated coefficient for snowdepth is 5. If we rerun the regression using snow depth measured in inches, the new estimated coefficient on snowfall will be:', 'Larger than 5.', 'Smaller than 5.', 'Still equal to 5.', 'Not enough information.', 'Smaller than 5.', 'The coefficient is giving us the change in y with a change in snowdepth of one 1 foot. The change in y with a change in snowdepth of one inch will be 1/12 of this value.'),
(10, 1, 'When regressing annual work hours on income, a researcher finds that the variance of the residuals increases as work hours increases. This will affect:', 'The expected value of the slope coefficient for income.', 'The magnitude of the standard error for the slope coefficient for income.', 'Both (a) and (b).', 'Neither (a) nor (b).', 'The magnitude of the standard error for the slope coefficient for income.', 'This is a case of heteroskedasticity. Heteroskedasticity will change the standard errors of our estimates but will not bias the coefficients.'),
(11, 1, 'The histogram for hours of study per week based on a sample of 400 Davis students is symmetric and centered at 15 hours. Which of the following statements is true?', 'The sample median is 15 hours.', 'The sample mean is 15 hours.', 'The skewness for the sample is zero.', 'All of the above.', 'All of the above.', 'Because the distribution is symmetric, 50 percent of the observations will be to the right of 15 hours and 50 percent will be to the left of 15 hours, making 15 hours the median. The symmetry will also lead to the mean being equal to the 15 hours (for every observation that is larger than 15, there is a corresponding obser- vation that is smaller than 15 by the same amount). For a symmetric distribution, skewness is zero.'),
(12, 1, 'When running a bivariate regression, which of the following is not possible?', 'The error sum of squares is larger than the total sum of squares.', 'The error sum of squares is equal to the total sum of squares.', 'The error sum of squares is zero.', 'The error sum of squares is positive.', 'The error sum of squares is larger than the total sum of squares.', 'The largest the error sum of squares can ever be is the magnitude of the total sum of squares. If it were larger you could achieve a better fit by simply setting all of your slope coefficients to zero.'),
(13, 1, 'Which of the following would definitely not lead to the error term being correlated with a regressor x?', 'Random measurement error in x.', 'An omitted variable correlated with x.', 'Choosing an incorrect functional form for the regression equation.', 'Random measurement error in y.', 'Random measurement error in y.', 'If the measurement error in y is truly random, then it will be independent of the value of x. So adding this measurement error into the error term will leave the error term uncorrelated with x.'),
(14, 1, 'Adding an irrelevant variable to a regression will:', 'Have no effect on the regression results.', 'Tend to bias the coefficients for the other regressors.', 'Lower the R2 .', 'None of the above.', 'None of the above.', 'Including an irrelevant variable may increase our standard errors. It will also lower the adjusted R2 for the regression.'),
(15, 1, 'Suppose we run a regression with GPA as the dependent variable and SAT score as the independent variable. Which of the following statements is definitely true?', 'The sign of the estimated slope coefficient will be the same as the sign of the correlation between GPA and SAT score.', 'The sign of the estimated slope coefficient could be different than the sign of the corre- lation between GPA and SAT score if there are omitted variables.', 'The magnitude of the slope coefficient will be equal to the magnitude of the correlation between GPA and SAT score.', 'The slope coefficient will be statistically significant.', 'The sign of the estimated slope coefficient will be the same as the sign of the correlation between GPA and SAT score.', 'The slope coefficient is a function of the correlation between GPA and SAT score. The signs will be the same. Even if the sign of the true relationship is the opposite of the estimated coefficient due to omitted variable bias, the sign of the correlation will match up with the sign of the estimated coefficient (the correlation does not control for the omitted variable either).'),
(16, 1, 'Which of the following is not a measure of central tendency?', 'The mean.', 'The mode.', 'The sample range.', 'The median.', 'The sample range.', 'The sample range is a measure of dispersion. If the entire sample distribution was shifted, the center of the distribution would certainly shift but the sample range would stay exactly the same.'),
(17, 1, 'Suppose we use an F test after running a multivariate regression to test the null hypothesis that β3 = β4 = 0 and get an F statistic that is larger than the critical value for a 5% significance level. We would conclude that:', 'β3 6= β4.', 'β3 > 0 or β4 > 0.', 'β3 6= 0 and β4 6= 0.', 'None of the above.', 'None of the above.', 'We would reject the null hypothesis that β3 = β4 = 0 in favor of the alternative hypothesis that at least one of the coefficients is different from zero. We cannot say anything about whether both are different than zero or whether they are different from each other.'),
(18, 1, 'Which of the following would make you more likely to reject the hypothesis that an individual slope coefficient is equal to zero?', 'A larger standard error for that slope coefficient.', 'A smaller t statistic for that slope coefficient.', 'A smaller F statistic for the regression.', 'A larger value for the ratio of the coefficient to its standard error.', 'A larger value for the ratio of the coefficient to its standard error.', 'When testing whether a slope coefficient is different than zero, the test statistic is simply the ratio of the coefficient to the standard error. We are more likely to reject the null hypothesis that the coefficient is equal to zero when this test statistic is larger in magnitude.'),
(19, 1, 'Suppose that we include a dummy variable for male and a dummy variable for female in a regression. This will create a:', 'Omitted variable bias problem.', 'Heteroskedasticity problem.', 'Multicollinearity problem.', 'Homoskedasticity problem.', 'Multicollinearity problem.', 'The dummy variables will be perfectly collinear (the value of one always tells us exactly what the value of the other one is).'),
(20, 1, 'The distribution of the sample mean will:', 'Be centered at zero.', 'Have a smaller variance for smaller sample sizes.', 'Centered at the population mean.', '(1) and (2)', 'Centered at the population mean.', 'The sample mean is normally distributed with a mean equal to the population mean and a variance that decreases as sample size increases.'),
(21, 2, 'Suppose we regress SAT score on parent’s education and parent’s income. If we run the regression again but also include the student’s GPA as an additional regressor:', 'The R 2 for the regression will either stay the same or increase.', ' The adjusted R2 for the regression will either stay the same or increase.', 'Both (a) and (b) are true.', 'Neither (a) nor (b) is true.', 'The R2 for the regression will either stay the same or increase.', 'When adding an additional regressor, our fit should be at least as good as before, so the R2 for the regression should either stay the same or increase. Adjusted R2 may decrease if the additional regressor had little to no explanatory power.'),
(22, 2, 'Suppose we have a sample of the heights of Davis students and want to use the sample mean to get a confidence interval for the mean height in the population. Which of the following would increase the width of this confidence interval?', ' Switching from a 95% confidence interval to a 90% confidence interval.', 'Increasing the sample size used to calculate the sample mean.', 'Switching from a 95% confidence interval to a 99% confidence interval.', 'All of the above.', 'Switching from a 95% confidence interval to a 99% confidence interval.', 'The smaller we make α, the wider our confidence interval will get. A larger sample size would make the confidence interval narrower.'),
(23, 2, ' Suppose we can reject the null hypothesis that β2 ≥ 0 at a 5% significance level where β2 is the slope coefficient from a bivariate regression. Which of the following is definitely true?', ' Our test statistic was negative.', 'We can reject the null hypothesis that β2 = 0 at a 5% significance level.', 'We can reject the null hypothesis that β2 ≥ 0 at a 2.5% significance level.', 'We can reject the null hypothesis that β2 < 0 at a 5% significance level.', 'Our test statistic was negative.', 'The critical value for a lower one-tailed hypothesis test will be negative and we will reject the null when the test statistic is more negative than the critical value.'),
(24, 2, 'Suppose we regress y on x2. Which of the following would lead to a biased coefficient for x2 ?', 'There is a variable x3 that is correlated with y but not with x2', 'There is a variable x3 that is correlated with x2 but not with y.', 'y is measured with some random error.', 'x is measured with some random error.', 'x is measured with some random error.', 'An omitted variable will bias the coefficient on x2 only if it is correlated with both x2 and with y. Measurement error in x2 will bias the coefficient on x2 since it will lead to errors that are negatively correlated with x2 . Measurement error in y will decrease the precision of the estimated slope coefficient but will not bias the coefficient.'),
(25, 2, 'When testing the significance of a subset of regressors, the R2 of the unrestricted model will always be:', 'Greater than or equal to the R2 of the restricted model.', 'Less than or equal to the R2 of the restricted model.', 'Equal to the R2 of the restricted model.', 'It could be greater than, less than or equal to the R2 of the restricted model.', 'Greater than or equal to the R2 of the restricted model.', 'The unrestricted model contains all of the regressors in the restricted model plus additional regressors. The unrestricted model can achieve the same fit as the restricted model by simply having the coefficients on the additional regressors set to zero. More likely is that these coefficients will be nonzero and the fit will improve.'),
(26, 2, 'Suppose that the true population model of the relationship between weight (W ) and hours of exercise per day (H) is: W = 200 − 10H + ε where ε meets all of our assumptions. If hours of exercise is measured with some random, mean zero error, which of the following statements about the estimated slope coefficient  b  ̃ 2 is true?', ' E(b  ̃ 2) = −10.', 'E(b  ̃ 2) = 10.', 'E(b  ̃ 2) > −10.', 'E(b  ̃ 2) < −10.', 'E(b  ̃ 2) > −10.', 'The slope coefficient will be biased toward zero due to the measurement error. In this case, that means that the expected value of b  ̃ 2 will be between -10 and 0.'),
(27, 2, 'Doubling the value of the largest observation in a sample of incomes will:', 'Increase the median.', 'Increase the mode.', 'Increase the mean.', 'All of the above.', 'Increase the mean.', 'Doubling the largest observation will increase the average value of the variable but will not change the position or value of the 50th percentile of the distribution of values.'),
(28, 2, 'Suppose that the risk of catching the flu is high for young children and the elderly but low for teenagers and younger adults. Which of the following equations would be the best choice for modeling the relationship between flu risk (R) and age (A)?', 'R = β1 + β2A + ε.', 'ln(R) = β1 + β2 ln(A) + ε.', 'R = β1 + β2A + β2 A2 + ε.', 'R = β1 + β2ln(A) + ε.', 'R = β1 + β2A + β2 A2 + ε.', 'Based on the description, flu risk is first decreasing with age and then increasing with age. We need a polynomial to fit this type of parabolic curve.'),
(29, 2, 'Suppose that snow depth measured in feet is included as a regressor in a multivariate regression and the magnitude of the estimated coefficient for snowdepth is 5. If we rerun the regression using snow depth measured in inches, the new estimated coefficient on snowfall will be:', 'Larger than 5.', 'Smaller than 5.', 'Still equal to 5.', 'Not enough information.', 'Smaller than 5.', 'The coefficient is giving us the change in y with a change in snowdepth of one 1 foot. The change in y with a change in snowdepth of one inch will be 1/12 of this value.'),
(30, 2, 'When regressing annual work hours on income, a researcher finds that the variance of the residuals increases as work hours increases. This will affect:', 'The expected value of the slope coefficient for income.', 'The magnitude of the standard error for the slope coefficient for income.', 'Both (a) and (b).', 'Neither (a) nor (b).', 'The magnitude of the standard error for the slope coefficient for income.', 'This is a case of heteroskedasticity. Heteroskedasticity will change the standard errors of our estimates but will not bias the coefficients.'),
(31, 2, 'The histogram for hours of study per week based on a sample of 400 Davis students is symmetric and centered at 15 hours. Which of the following statements is true?', 'The sample median is 15 hours.', 'The sample mean is 15 hours.', 'The skewness for the sample is zero.', 'All of the above.', 'All of the above.', 'Because the distribution is symmetric, 50 percent of the observations will be to the right of 15 hours and 50 percent will be to the left of 15 hours, making 15 hours the median. The symmetry will also lead to the mean being equal to the 15 hours (for every observation that is larger than 15, there is a corresponding obser- vation that is smaller than 15 by the same amount). For a symmetric distribution, skewness is zero.'),
(32, 2, 'When running a bivariate regression, which of the following is not possible?', 'The error sum of squares is larger than the total sum of squares.', 'The error sum of squares is equal to the total sum of squares.', 'The error sum of squares is zero.', 'The error sum of squares is positive.', 'The error sum of squares is larger than the total sum of squares.', 'The largest the error sum of squares can ever be is the magnitude of the total sum of squares. If it were larger you could achieve a better fit by simply setting all of your slope coefficients to zero.'),
(33, 2, 'Which of the following would definitely not lead to the error term being correlated with a regressor x?', 'Random measurement error in x.', 'An omitted variable correlated with x.', 'Choosing an incorrect functional form for the regression equation.', 'Random measurement error in y.', 'Random measurement error in y.', 'If the measurement error in y is truly random, then it will be independent of the value of x. So adding this measurement error into the error term will leave the error term uncorrelated with x.'),
(34, 2, 'Adding an irrelevant variable to a regression will:', 'Have no effect on the regression results.', 'Tend to bias the coefficients for the other regressors.', 'Lower the R2 .', 'None of the above.', 'None of the above.', 'Including an irrelevant variable may increase our standard errors. It will also lower the adjusted R2 for the regression.'),
(35, 2, 'Suppose we run a regression with GPA as the dependent variable and SAT score as the independent variable. Which of the following statements is definitely true?', 'The sign of the estimated slope coefficient will be the same as the sign of the correlation between GPA and SAT score.', 'The sign of the estimated slope coefficient could be different than the sign of the corre- lation between GPA and SAT score if there are omitted variables.', 'The magnitude of the slope coefficient will be equal to the magnitude of the correlation between GPA and SAT score.', 'The slope coefficient will be statistically significant.', 'The sign of the estimated slope coefficient will be the same as the sign of the correlation between GPA and SAT score.', 'The slope coefficient is a function of the correlation between GPA and SAT score. The signs will be the same. Even if the sign of the true relationship is the opposite of the estimated coefficient due to omitted variable bias, the sign of the correlation will match up with the sign of the estimated coefficient (the correlation does not control for the omitted variable either).'),
(36, 2, 'Which of the following is not a measure of central tendency?', 'The mean.', 'The mode.', 'The sample range.', 'The median.', 'The sample range.', 'The sample range is a measure of dispersion. If the entire sample distribution was shifted, the center of the distribution would certainly shift but the sample range would stay exactly the same.'),
(37, 2, 'Suppose we use an F test after running a multivariate regression to test the null hypothesis that β3 = β4 = 0 and get an F statistic that is larger than the critical value for a 5% significance level. We would conclude that:', 'β3 6= β4.', 'β3 > 0 or β4 > 0.', 'β3 6= 0 and β4 6= 0.', 'None of the above.', 'None of the above.', 'We would reject the null hypothesis that β3 = β4 = 0 in favor of the alternative hypothesis that at least one of the coefficients is different from zero. We cannot say anything about whether both are different than zero or whether they are different from each other.'),
(38, 2, 'Which of the following would make you more likely to reject the hypothesis that an individual slope coefficient is equal to zero?', 'A larger standard error for that slope coefficient.', 'A smaller t statistic for that slope coefficient.', 'A smaller F statistic for the regression.', 'A larger value for the ratio of the coefficient to its standard error.', 'A larger value for the ratio of the coefficient to its standard error.', 'When testing whether a slope coefficient is different than zero, the test statistic is simply the ratio of the coefficient to the standard error. We are more likely to reject the null hypothesis that the coefficient is equal to zero when this test statistic is larger in magnitude.'),
(39, 2, 'Suppose that we include a dummy variable for male and a dummy variable for female in a regression. This will create a:', 'Omitted variable bias problem.', 'Heteroskedasticity problem.', 'Multicollinearity problem.', 'Homoskedasticity problem.', 'Multicollinearity problem.', 'The dummy variables will be perfectly collinear (the value of one always tells us exactly what the value of the other one is).'),
(40, 2, 'The distribution of the sample mean will:', 'Be centered at zero.', 'Have a smaller variance for smaller sample sizes.', 'Centered at the population mean.', '(1) and (2)', 'Centered at the population mean.', 'The sample mean is normally distributed with a mean equal to the population mean and a variance that decreases as sample size increases.'),
(41, 3, 'Suppose we regress SAT score on parent’s education and parent’s income. If we run the regression again but also include the student’s GPA as an additional regressor:', 'The R 2 for the regression will either stay the same or increase.', ' The adjusted R2 for the regression will either stay the same or increase.', 'Both (a) and (b) are true.', 'Neither (a) nor (b) is true.', 'The R2 for the regression will either stay the same or increase.', 'When adding an additional regressor, our fit should be at least as good as before, so the R2 for the regression should either stay the same or increase. Adjusted R2 may decrease if the additional regressor had little to no explanatory power.'),
(42, 3, 'Suppose we have a sample of the heights of Davis students and want to use the sample mean to get a confidence interval for the mean height in the population. Which of the following would increase the width of this confidence interval?', ' Switching from a 95% confidence interval to a 90% confidence interval.', 'Increasing the sample size used to calculate the sample mean.', 'Switching from a 95% confidence interval to a 99% confidence interval.', 'All of the above.', 'Switching from a 95% confidence interval to a 99% confidence interval.', 'The smaller we make α, the wider our confidence interval will get. A larger sample size would make the confidence interval narrower.'),
(43, 3, ' Suppose we can reject the null hypothesis that β2 ≥ 0 at a 5% significance level where β2 is the slope coefficient from a bivariate regression. Which of the following is definitely true?', ' Our test statistic was negative.', 'We can reject the null hypothesis that β2 = 0 at a 5% significance level.', 'We can reject the null hypothesis that β2 ≥ 0 at a 2.5% significance level.', 'We can reject the null hypothesis that β2 < 0 at a 5% significance level.', 'Our test statistic was negative.', 'The critical value for a lower one-tailed hypothesis test will be negative and we will reject the null when the test statistic is more negative than the critical value.'),
(44, 3, 'Suppose we regress y on x2. Which of the following would lead to a biased coefficient for x2 ?', 'There is a variable x3 that is correlated with y but not with x2', 'There is a variable x3 that is correlated with x2 but not with y.', 'y is measured with some random error.', 'x is measured with some random error.', 'x is measured with some random error.', 'An omitted variable will bias the coefficient on x2 only if it is correlated with both x2 and with y. Measurement error in x2 will bias the coefficient on x2 since it will lead to errors that are negatively correlated with x2 . Measurement error in y will decrease the precision of the estimated slope coefficient but will not bias the coefficient.'),
(45, 3, 'When testing the significance of a subset of regressors, the R2 of the unrestricted model will always be:', 'Greater than or equal to the R2 of the restricted model.', 'Less than or equal to the R2 of the restricted model.', 'Equal to the R2 of the restricted model.', 'It could be greater than, less than or equal to the R2 of the restricted model.', 'Greater than or equal to the R2 of the restricted model.', 'The unrestricted model contains all of the regressors in the restricted model plus additional regressors. The unrestricted model can achieve the same fit as the restricted model by simply having the coefficients on the additional regressors set to zero. More likely is that these coefficients will be nonzero and the fit will improve.'),
(46, 3, 'Suppose that the true population model of the relationship between weight (W ) and hours of exercise per day (H) is: W = 200 − 10H + ε where ε meets all of our assumptions. If hours of exercise is measured with some random, mean zero error, which of the following statements about the estimated slope coefficient  b  ̃ 2 is true?', ' E(b  ̃ 2) = −10.', 'E(b  ̃ 2) = 10.', 'E(b  ̃ 2) > −10.', 'E(b  ̃ 2) < −10.', 'E(b  ̃ 2) > −10.', 'The slope coefficient will be biased toward zero due to the measurement error. In this case, that means that the expected value of b  ̃ 2 will be between -10 and 0.'),
(47, 3, 'Doubling the value of the largest observation in a sample of incomes will:', 'Increase the median.', 'Increase the mode.', 'Increase the mean.', 'All of the above.', 'Increase the mean.', 'Doubling the largest observation will increase the average value of the variable but will not change the position or value of the 50th percentile of the distribution of values.'),
(48, 3, 'Suppose that the risk of catching the flu is high for young children and the elderly but low for teenagers and younger adults. Which of the following equations would be the best choice for modeling the relationship between flu risk (R) and age (A)?', 'R = β1 + β2A + ε.', 'ln(R) = β1 + β2 ln(A) + ε.', 'R = β1 + β2A + β2 A2 + ε.', 'R = β1 + β2ln(A) + ε.', 'R = β1 + β2A + β2 A2 + ε.', 'Based on the description, flu risk is first decreasing with age and then increasing with age. We need a polynomial to fit this type of parabolic curve.'),
(49, 3, 'Suppose that snow depth measured in feet is included as a regressor in a multivariate regression and the magnitude of the estimated coefficient for snowdepth is 5. If we rerun the regression using snow depth measured in inches, the new estimated coefficient on snowfall will be:', 'Larger than 5.', 'Smaller than 5.', 'Still equal to 5.', 'Not enough information.', 'Smaller than 5.', 'The coefficient is giving us the change in y with a change in snowdepth of one 1 foot. The change in y with a change in snowdepth of one inch will be 1/12 of this value.'),
(50, 3, 'When regressing annual work hours on income, a researcher finds that the variance of the residuals increases as work hours increases. This will affect:', 'The expected value of the slope coefficient for income.', 'The magnitude of the standard error for the slope coefficient for income.', 'Both (a) and (b).', 'Neither (a) nor (b).', 'The magnitude of the standard error for the slope coefficient for income.', 'This is a case of heteroskedasticity. Heteroskedasticity will change the standard errors of our estimates but will not bias the coefficients.'),
(51, 3, 'The histogram for hours of study per week based on a sample of 400 Davis students is symmetric and centered at 15 hours. Which of the following statements is true?', 'The sample median is 15 hours.', 'The sample mean is 15 hours.', 'The skewness for the sample is zero.', 'All of the above.', 'All of the above.', 'Because the distribution is symmetric, 50 percent of the observations will be to the right of 15 hours and 50 percent will be to the left of 15 hours, making 15 hours the median. The symmetry will also lead to the mean being equal to the 15 hours (for every observation that is larger than 15, there is a corresponding obser- vation that is smaller than 15 by the same amount). For a symmetric distribution, skewness is zero.'),
(52, 3, 'When running a bivariate regression, which of the following is not possible?', 'The error sum of squares is larger than the total sum of squares.', 'The error sum of squares is equal to the total sum of squares.', 'The error sum of squares is zero.', 'The error sum of squares is positive.', 'The error sum of squares is larger than the total sum of squares.', 'The largest the error sum of squares can ever be is the magnitude of the total sum of squares. If it were larger you could achieve a better fit by simply setting all of your slope coefficients to zero.'),
(53, 3, 'Which of the following would definitely not lead to the error term being correlated with a regressor x?', 'Random measurement error in x.', 'An omitted variable correlated with x.', 'Choosing an incorrect functional form for the regression equation.', 'Random measurement error in y.', 'Random measurement error in y.', 'If the measurement error in y is truly random, then it will be independent of the value of x. So adding this measurement error into the error term will leave the error term uncorrelated with x.'),
(54, 3, 'Adding an irrelevant variable to a regression will:', 'Have no effect on the regression results.', 'Tend to bias the coefficients for the other regressors.', 'Lower the R2 .', 'None of the above.', 'None of the above.', 'Including an irrelevant variable may increase our standard errors. It will also lower the adjusted R2 for the regression.'),
(55, 3, 'Suppose we run a regression with GPA as the dependent variable and SAT score as the independent variable. Which of the following statements is definitely true?', 'The sign of the estimated slope coefficient will be the same as the sign of the correlation between GPA and SAT score.', 'The sign of the estimated slope coefficient could be different than the sign of the corre- lation between GPA and SAT score if there are omitted variables.', 'The magnitude of the slope coefficient will be equal to the magnitude of the correlation between GPA and SAT score.', 'The slope coefficient will be statistically significant.', 'The sign of the estimated slope coefficient will be the same as the sign of the correlation between GPA and SAT score.', 'The slope coefficient is a function of the correlation between GPA and SAT score. The signs will be the same. Even if the sign of the true relationship is the opposite of the estimated coefficient due to omitted variable bias, the sign of the correlation will match up with the sign of the estimated coefficient (the correlation does not control for the omitted variable either).'),
(56, 3, 'Which of the following is not a measure of central tendency?', 'The mean.', 'The mode.', 'The sample range.', 'The median.', 'The sample range.', 'The sample range is a measure of dispersion. If the entire sample distribution was shifted, the center of the distribution would certainly shift but the sample range would stay exactly the same.'),
(57, 3, 'Suppose we use an F test after running a multivariate regression to test the null hypothesis that β3 = β4 = 0 and get an F statistic that is larger than the critical value for a 5% significance level. We would conclude that:', 'β3 6= β4.', 'β3 > 0 or β4 > 0.', 'β3 6= 0 and β4 6= 0.', 'None of the above.', 'None of the above.', 'We would reject the null hypothesis that β3 = β4 = 0 in favor of the alternative hypothesis that at least one of the coefficients is different from zero. We cannot say anything about whether both are different than zero or whether they are different from each other.'),
(58, 3, 'Which of the following would make you more likely to reject the hypothesis that an individual slope coefficient is equal to zero?', 'A larger standard error for that slope coefficient.', 'A smaller t statistic for that slope coefficient.', 'A smaller F statistic for the regression.', 'A larger value for the ratio of the coefficient to its standard error.', 'A larger value for the ratio of the coefficient to its standard error.', 'When testing whether a slope coefficient is different than zero, the test statistic is simply the ratio of the coefficient to the standard error. We are more likely to reject the null hypothesis that the coefficient is equal to zero when this test statistic is larger in magnitude.'),
(59, 3, 'Suppose that we include a dummy variable for male and a dummy variable for female in a regression. This will create a:', 'Omitted variable bias problem.', 'Heteroskedasticity problem.', 'Multicollinearity problem.', 'Homoskedasticity problem.', 'Multicollinearity problem.', 'The dummy variables will be perfectly collinear (the value of one always tells us exactly what the value of the other one is).'),
(60, 3, 'The distribution of the sample mean will:', 'Be centered at zero.', 'Have a smaller variance for smaller sample sizes.', 'Centered at the population mean.', '(1) and (2)', 'Centered at the population mean.', 'The sample mean is normally distributed with a mean equal to the population mean and a variance that decreases as sample size increases.'),
(61, 4, 'Suppose we regress SAT score on parent’s education and parent’s income. If we run the regression again but also include the student’s GPA as an additional regressor:', 'The R 2 for the regression will either stay the same or increase.', ' The adjusted R2 for the regression will either stay the same or increase.', 'Both (a) and (b) are true.', 'Neither (a) nor (b) is true.', 'The R2 for the regression will either stay the same or increase.', 'When adding an additional regressor, our fit should be at least as good as before, so the R2 for the regression should either stay the same or increase. Adjusted R2 may decrease if the additional regressor had little to no explanatory power.'),
(62, 4, 'Suppose we have a sample of the heights of Davis students and want to use the sample mean to get a confidence interval for the mean height in the population. Which of the following would increase the width of this confidence interval?', ' Switching from a 95% confidence interval to a 90% confidence interval.', 'Increasing the sample size used to calculate the sample mean.', 'Switching from a 95% confidence interval to a 99% confidence interval.', 'All of the above.', 'Switching from a 95% confidence interval to a 99% confidence interval.', 'The smaller we make α, the wider our confidence interval will get. A larger sample size would make the confidence interval narrower.'),
(63, 4, ' Suppose we can reject the null hypothesis that β2 ≥ 0 at a 5% significance level where β2 is the slope coefficient from a bivariate regression. Which of the following is definitely true?', ' Our test statistic was negative.', 'We can reject the null hypothesis that β2 = 0 at a 5% significance level.', 'We can reject the null hypothesis that β2 ≥ 0 at a 2.5% significance level.', 'We can reject the null hypothesis that β2 < 0 at a 5% significance level.', 'Our test statistic was negative.', 'The critical value for a lower one-tailed hypothesis test will be negative and we will reject the null when the test statistic is more negative than the critical value.'),
(64, 4, 'Suppose we regress y on x2. Which of the following would lead to a biased coefficient for x2 ?', 'There is a variable x3 that is correlated with y but not with x2', 'There is a variable x3 that is correlated with x2 but not with y.', 'y is measured with some random error.', 'x is measured with some random error.', 'x is measured with some random error.', 'An omitted variable will bias the coefficient on x2 only if it is correlated with both x2 and with y. Measurement error in x2 will bias the coefficient on x2 since it will lead to errors that are negatively correlated with x2 . Measurement error in y will decrease the precision of the estimated slope coefficient but will not bias the coefficient.'),
(65, 4, 'When testing the significance of a subset of regressors, the R2 of the unrestricted model will always be:', 'Greater than or equal to the R2 of the restricted model.', 'Less than or equal to the R2 of the restricted model.', 'Equal to the R2 of the restricted model.', 'It could be greater than, less than or equal to the R2 of the restricted model.', 'Greater than or equal to the R2 of the restricted model.', 'The unrestricted model contains all of the regressors in the restricted model plus additional regressors. The unrestricted model can achieve the same fit as the restricted model by simply having the coefficients on the additional regressors set to zero. More likely is that these coefficients will be nonzero and the fit will improve.'),
(66, 4, 'Suppose that the true population model of the relationship between weight (W ) and hours of exercise per day (H) is: W = 200 − 10H + ε where ε meets all of our assumptions. If hours of exercise is measured with some random, mean zero error, which of the following statements about the estimated slope coefficient  b  ̃ 2 is true?', ' E(b  ̃ 2) = −10.', 'E(b  ̃ 2) = 10.', 'E(b  ̃ 2) > −10.', 'E(b  ̃ 2) < −10.', 'E(b  ̃ 2) > −10.', 'The slope coefficient will be biased toward zero due to the measurement error. In this case, that means that the expected value of b  ̃ 2 will be between -10 and 0.'),
(67, 4, 'Doubling the value of the largest observation in a sample of incomes will:', 'Increase the median.', 'Increase the mode.', 'Increase the mean.', 'All of the above.', 'Increase the mean.', 'Doubling the largest observation will increase the average value of the variable but will not change the position or value of the 50th percentile of the distribution of values.'),
(68, 4, 'Suppose that the risk of catching the flu is high for young children and the elderly but low for teenagers and younger adults. Which of the following equations would be the best choice for modeling the relationship between flu risk (R) and age (A)?', 'R = β1 + β2A + ε.', 'ln(R) = β1 + β2 ln(A) + ε.', 'R = β1 + β2A + β2 A2 + ε.', 'R = β1 + β2ln(A) + ε.', 'R = β1 + β2A + β2 A2 + ε.', 'Based on the description, flu risk is first decreasing with age and then increasing with age. We need a polynomial to fit this type of parabolic curve.'),
(69, 4, 'Suppose that snow depth measured in feet is included as a regressor in a multivariate regression and the magnitude of the estimated coefficient for snowdepth is 5. If we rerun the regression using snow depth measured in inches, the new estimated coefficient on snowfall will be:', 'Larger than 5.', 'Smaller than 5.', 'Still equal to 5.', 'Not enough information.', 'Smaller than 5.', 'The coefficient is giving us the change in y with a change in snowdepth of one 1 foot. The change in y with a change in snowdepth of one inch will be 1/12 of this value.'),
(70, 4, 'When regressing annual work hours on income, a researcher finds that the variance of the residuals increases as work hours increases. This will affect:', 'The expected value of the slope coefficient for income.', 'The magnitude of the standard error for the slope coefficient for income.', 'Both (a) and (b).', 'Neither (a) nor (b).', 'The magnitude of the standard error for the slope coefficient for income.', 'This is a case of heteroskedasticity. Heteroskedasticity will change the standard errors of our estimates but will not bias the coefficients.'),
(71, 4, 'The histogram for hours of study per week based on a sample of 400 Davis students is symmetric and centered at 15 hours. Which of the following statements is true?', 'The sample median is 15 hours.', 'The sample mean is 15 hours.', 'The skewness for the sample is zero.', 'All of the above.', 'All of the above.', 'Because the distribution is symmetric, 50 percent of the observations will be to the right of 15 hours and 50 percent will be to the left of 15 hours, making 15 hours the median. The symmetry will also lead to the mean being equal to the 15 hours (for every observation that is larger than 15, there is a corresponding obser- vation that is smaller than 15 by the same amount). For a symmetric distribution, skewness is zero.'),
(72, 4, 'When running a bivariate regression, which of the following is not possible?', 'The error sum of squares is larger than the total sum of squares.', 'The error sum of squares is equal to the total sum of squares.', 'The error sum of squares is zero.', 'The error sum of squares is positive.', 'The error sum of squares is larger than the total sum of squares.', 'The largest the error sum of squares can ever be is the magnitude of the total sum of squares. If it were larger you could achieve a better fit by simply setting all of your slope coefficients to zero.'),
(73, 4, 'Which of the following would definitely not lead to the error term being correlated with a regressor x?', 'Random measurement error in x.', 'An omitted variable correlated with x.', 'Choosing an incorrect functional form for the regression equation.', 'Random measurement error in y.', 'Random measurement error in y.', 'If the measurement error in y is truly random, then it will be independent of the value of x. So adding this measurement error into the error term will leave the error term uncorrelated with x.'),
(74, 4, 'Adding an irrelevant variable to a regression will:', 'Have no effect on the regression results.', 'Tend to bias the coefficients for the other regressors.', 'Lower the R2 .', 'None of the above.', 'None of the above.', 'Including an irrelevant variable may increase our standard errors. It will also lower the adjusted R2 for the regression.'),
(75, 4, 'Suppose we run a regression with GPA as the dependent variable and SAT score as the independent variable. Which of the following statements is definitely true?', 'The sign of the estimated slope coefficient will be the same as the sign of the correlation between GPA and SAT score.', 'The sign of the estimated slope coefficient could be different than the sign of the corre- lation between GPA and SAT score if there are omitted variables.', 'The magnitude of the slope coefficient will be equal to the magnitude of the correlation between GPA and SAT score.', 'The slope coefficient will be statistically significant.', 'The sign of the estimated slope coefficient will be the same as the sign of the correlation between GPA and SAT score.', 'The slope coefficient is a function of the correlation between GPA and SAT score. The signs will be the same. Even if the sign of the true relationship is the opposite of the estimated coefficient due to omitted variable bias, the sign of the correlation will match up with the sign of the estimated coefficient (the correlation does not control for the omitted variable either).'),
(76, 4, 'Which of the following is not a measure of central tendency?', 'The mean.', 'The mode.', 'The sample range.', 'The median.', 'The sample range.', 'The sample range is a measure of dispersion. If the entire sample distribution was shifted, the center of the distribution would certainly shift but the sample range would stay exactly the same.'),
(77, 4, 'Suppose we use an F test after running a multivariate regression to test the null hypothesis that β3 = β4 = 0 and get an F statistic that is larger than the critical value for a 5% significance level. We would conclude that:', 'β3 6= β4.', 'β3 > 0 or β4 > 0.', 'β3 6= 0 and β4 6= 0.', 'None of the above.', 'None of the above.', 'We would reject the null hypothesis that β3 = β4 = 0 in favor of the alternative hypothesis that at least one of the coefficients is different from zero. We cannot say anything about whether both are different than zero or whether they are different from each other.'),
(78, 4, 'Which of the following would make you more likely to reject the hypothesis that an individual slope coefficient is equal to zero?', 'A larger standard error for that slope coefficient.', 'A smaller t statistic for that slope coefficient.', 'A smaller F statistic for the regression.', 'A larger value for the ratio of the coefficient to its standard error.', 'A larger value for the ratio of the coefficient to its standard error.', 'When testing whether a slope coefficient is different than zero, the test statistic is simply the ratio of the coefficient to the standard error. We are more likely to reject the null hypothesis that the coefficient is equal to zero when this test statistic is larger in magnitude.'),
(79, 4, 'Suppose that we include a dummy variable for male and a dummy variable for female in a regression. This will create a:', 'Omitted variable bias problem.', 'Heteroskedasticity problem.', 'Multicollinearity problem.', 'Homoskedasticity problem.', 'Multicollinearity problem.', 'The dummy variables will be perfectly collinear (the value of one always tells us exactly what the value of the other one is).'),
(80, 4, 'The distribution of the sample mean will:', 'Be centered at zero.', 'Have a smaller variance for smaller sample sizes.', 'Centered at the population mean.', '(1) and (2)', 'Centered at the population mean.', 'The sample mean is normally distributed with a mean equal to the population mean and a variance that decreases as sample size increases.');

-- --------------------------------------------------------

--
-- Table structure for table `test_report`
--

CREATE TABLE `test_report` (
  `testr_ID` int(11) NOT NULL,
  `testr_StudAns` text NOT NULL COMMENT 'answer chosen by the student',
  `testr_Status` int(11) NOT NULL COMMENT '1=right answer 2=wrong answer',
  `testr_TimeQuest` varchar(255) NOT NULL COMMENT 'time spent per question',
  `testr_Type` int(11) NOT NULL COMMENT '1=practice exam 2=summative\r\n3=finals',
  `testq_id` int(11) NOT NULL,
  `accnt_id` int(11) NOT NULL,
  `th_ID` int(11) NOT NULL,
  `score_id` int(11) NOT NULL
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
  MODIFY `subj_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `test_history`
--
ALTER TABLE `test_history`
  MODIFY `th_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `test_quest`
--
ALTER TABLE `test_quest`
  MODIFY `testq_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT for table `test_report`
--
ALTER TABLE `test_report`
  MODIFY `testr_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `views`
--
ALTER TABLE `views`
  MODIFY `views_id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
