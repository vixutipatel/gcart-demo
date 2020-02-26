-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Sep 30, 2019 at 05:34 AM
-- Server version: 5.7.19
-- PHP Version: 7.1.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `nisl_ci_demo`
--

-- --------------------------------------------------------

--
-- Table structure for table `activity_logs`
--

DROP TABLE IF EXISTS `activity_logs`;
CREATE TABLE IF NOT EXISTS `activity_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` mediumtext NOT NULL,
  `date` datetime NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `ip_address` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(256) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_deleted` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `user_id`, `created`, `updated`, `is_active`, `is_deleted`) VALUES
(1, 'Web Designing', 5, '2019-09-17 04:30:10', '2019-09-21 11:16:30', 1, 0),
(2, 'Web Development', 1, NULL, '2019-09-17 20:50:22', 1, 0),
(3, 'Digital Marketing', 1, NULL, '2019-09-17 20:50:10', 1, 0),
(4, 'SEO', 2, NULL, NULL, 1, 0),
(5, 'Graphics Design', 2, NULL, NULL, 1, 0),
(6, 'Content Writing', 2, NULL, '2019-09-23 12:04:38', 1, 0),
(7, 'Digital Marketing', 2, NULL, '2019-09-23 12:04:46', 1, 0),
(8, 'Accounts', 5, NULL, '2019-09-23 12:16:32', 1, 0),
(9, 'Social Media Management', 5, NULL, NULL, 1, 0),
(10, 'some', 1, NULL, NULL, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `email_templates`
--

DROP TABLE IF EXISTS `email_templates`;
CREATE TABLE IF NOT EXISTS `email_templates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slug` varchar(100) NOT NULL,
  `name` mediumtext NOT NULL,
  `subject` mediumtext NOT NULL,
  `message` text NOT NULL,
  `placeholders` longtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `email_templates`
--

INSERT INTO `email_templates` (`id`, `slug`, `name`, `subject`, `message`, `placeholders`) VALUES
(1, 'forgot-password', 'Forgot Password', 'Reset Password Instructions', '<h2></h2><h3 style=\"text-align: justify; \"><span style=\"font-size: 14pt;\">Hello {firstname} {lastname},</span></h3><p style=\"text-align: justify; \"><span style=\"font-size: 13px; letter-spacing: normal;\">Someone, hopefully, you, has requested to reset the password for your&nbsp;</span>{company_name} account with email <b>{email}</b>.</p><span style=\"font-size: 13px; letter-spacing: normal; color: inherit; font-family: inherit;\"><p style=\"text-align: justify;\"><span style=\"color: inherit; font-family: inherit;\">If you did not perform this request, you can safely ignore this email&nbsp;</span>and your password will remain the same.&nbsp;<span style=\"color: inherit; font-family: inherit;\">Otherwise, click the link below to complete the process.</span></p><p style=\"text-align: justify;\"><a href=\"{reset_password_link}\" target=\"_blank\" style=\"font-family: inherit; background-color: rgb(255, 255, 255);\">Reset Password</a></p><p style=\"text-align: justify;\">Please note that this link is valid for next 1 hour only. You won\'t be able to change the password after the link gets expired.</p></span><p></p><p style=\"text-align: justify; \"><span style=\"font-size: 13px; letter-spacing: normal; color: inherit; font-family: inherit;\">Regards,</span></p><p style=\"text-align: justify; \"><span style=\"color: inherit; font-family: inherit; font-size: 13px; letter-spacing: normal;\">{company_name}</span></p>', 'a:6:{s:11:\"{firstname}\";s:14:\"User Firstname\";s:10:\"{lastname}\";s:13:\"User Lastname\";s:7:\"{email}\";s:10:\"User Email\";s:20:\"{reset_password_url}\";s:18:\"Reset Password URL\";s:17:\"{email_signature}\";s:15:\"Email Signature\";s:14:\"{company_name}\";s:12:\"Company Name\";}'),
(2, 'new-user-signup', 'New User Sign Up', 'Welcome {company_name}', '<p></p><p></p><p></p><h1><b>Dear {firstname} {lastname}</b></h1><br>Thank you for registering on {company_name}.<br><br>We just wanted to say welcome.<br><br>Please contact us if you need any help.<br><br>Click the link below to verify your email<p></p><p><a href=\"{email_verification_url}\" target=\"_blank\">Verify Your Email</a><br><br>Kind Regards, <br>{email_signature}<br><br>(This is an automated email, so please don\\\'t reply to this email address)<br></p><p></p><p></p><p></p>', 'a:5:{s:11:\"{firstname}\";s:14:\"User Firstname\";s:10:\"{lastname}\";s:13:\"User Lastname\";s:24:\"{email_verification_url}\";s:22:\"Email Verification URL\";s:17:\"{email_signature}\";s:15:\"Email Signature\";s:14:\"{company_name}\";s:12:\"Company Name\";}');

-- --------------------------------------------------------

--
-- Table structure for table `projects`
--

DROP TABLE IF EXISTS `projects`;
CREATE TABLE IF NOT EXISTS `projects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` varchar(20) NOT NULL,
  `name` varchar(256) NOT NULL,
  `details` mediumtext CHARACTER SET utf16,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `projects`
--

INSERT INTO `projects` (`id`, `project_id`, `name`, `details`, `created`, `updated`, `is_deleted`) VALUES
(1, 'PROJECT_25', 'Sample Project One', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nisi omnis ut possimus ipsa aliquid aliquam odio saepe neque dolorem itaque!', '2019-09-17 19:29:37', NULL, 0),
(2, 'PROJECT_12', 'Sample Project Two', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nisi omnis ut possimus ipsa aliquid aliquam odio saepe neque dolorem itaque!', '2019-09-17 19:29:37', NULL, 0),
(3, 'PROJECT_11', 'Sample Project Three', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nisi omnis ut possimus ipsa aliquid aliquam odio saepe neque dolorem itaque!', '2019-09-17 19:29:37', NULL, 0),
(4, 'PROJECT_78', 'Sample Project Four', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nisi omnis ut possimus ipsa aliquid aliquam odio saepe neque dolorem itaque!', '2019-09-17 19:29:37', '2019-09-17 19:36:12', 0),
(5, 'PROJECT_29', 'Sample Project Five', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nisi omnis ut possimus ipsa aliquid aliquam odio saepe neque dolorem itaque!', '2019-09-17 19:29:37', NULL, 0),
(6, 'PROJECT_63', 'Sample Project Six', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nisi omnis ut possimus ipsa aliquid aliquam odio saepe neque dolorem itaque!', '2019-09-17 19:29:37', NULL, 0),
(7, 'PROJECT_22', 'Sample Project Seven', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nisi omnis ut possimus ipsa aliquid aliquam odio saepe neque dolorem itaque!', '2019-09-17 19:29:37', NULL, 0),
(8, 'PROJECT_32', 'Sample Project Eight', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nisi omnis ut possimus ipsa aliquid aliquam odio saepe neque dolorem itaque!', '2019-09-17 19:29:37', NULL, 0),
(9, 'PROJECT_63', 'Sample Project Nine', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nisi omnis ut possimus ipsa aliquid aliquam odio saepe neque dolorem itaque!', '2019-09-17 19:29:37', NULL, 0),
(10, 'PROJECT_22', 'Sample Project Ten', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nisi omnis ut possimus ipsa aliquid aliquam odio saepe neque dolorem itaque!', '2019-09-17 19:29:37', NULL, 0),
(11, 'PROJECT_42', 'Sample Project Eleven', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nisi omnis ut possimus ipsa aliquid aliquam odio saepe neque dolorem itaque!', '2019-09-17 19:29:37', NULL, 0),
(12, 'PROJECT_53', 'Sample Project Twelve', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nisi omnis ut possimus ipsa aliquid aliquam odio saepe neque dolorem itaque!', '2019-09-17 19:29:37', NULL, 0),
(13, 'PROJECT_62', 'Sample Project Thirteen', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nisi omnis ut possimus ipsa aliquid aliquam odio saepe neque dolorem itaque!', '2019-09-17 19:29:37', NULL, 0),
(14, 'PROJECT_72', 'Sample Project Fourteen', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nisi omnis ut possimus ipsa aliquid aliquam odio saepe neque dolorem itaque!', '2019-09-17 19:29:37', NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
CREATE TABLE IF NOT EXISTS `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(256) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `permissions` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `permissions`) VALUES
(1, 'Administrator', 'a:6:{s:5:\"users\";a:4:{i:0;s:4:\"view\";i:1;s:6:\"create\";i:2;s:4:\"edit\";i:3;s:6:\"delete\";}s:8:\"projects\";a:4:{i:0;s:4:\"view\";i:1;s:6:\"create\";i:2;s:4:\"edit\";i:3;s:6:\"delete\";}s:10:\"categories\";a:4:{i:0;s:4:\"view\";i:1;s:6:\"create\";i:2;s:4:\"edit\";i:3;s:6:\"delete\";}s:5:\"roles\";a:4:{i:0;s:4:\"view\";i:1;s:6:\"create\";i:2;s:4:\"edit\";i:3;s:6:\"delete\";}s:15:\"email_templates\";a:2:{i:0;s:4:\"view\";i:1;s:4:\"edit\";}s:8:\"settings\";a:2:{i:0;s:4:\"view\";i:1;s:6:\"create\";}}'),
(2, 'Author', 'a:2:{s:8:\"projects\";a:3:{i:0;s:4:\"view\";i:1;s:6:\"create\";i:2;s:4:\"edit\";}s:10:\"categories\";a:3:{i:0;s:4:\"view\";i:1;s:6:\"create\";i:2;s:4:\"edit\";}}'),
(3, 'Editor', 'a:2:{s:8:\"projects\";a:2:{i:0;s:4:\"view\";i:1;s:4:\"edit\";}s:10:\"categories\";a:2:{i:0;s:4:\"view\";i:1;s:4:\"edit\";}}'),
(4, 'Visitor', 'a:4:{s:5:\"users\";a:1:{i:0;s:4:\"view\";}s:8:\"projects\";a:1:{i:0;s:4:\"view\";}s:10:\"categories\";a:1:{i:0;s:4:\"view\";}s:8:\"settings\";a:1:{i:0;s:4:\"view\";}}');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
CREATE TABLE IF NOT EXISTS `settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(256) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `name`, `value`) VALUES
(1, 'company_name', 'NISL CI Demo'),
(2, 'allowed_file_types', 'a:3:{i:0;s:4:\".jpg\";i:1;s:4:\".png\";i:2;s:4:\".gif\";}'),
(3, 'date_format', 'j-m-Y'),
(4, 'time_format', 'h:i A'),
(5, 'facebook_url', 'http://facebook.com'),
(6, 'smtp_host', 'smtp.gmail.com'),
(7, 'smtp_port', '465'),
(8, 'smtp_user', 'test.narolainfotech@gmail.com'),
(9, 'smtp_password', '#N@rol@12'),
(10, 'from_email', 'info@narola.email'),
(11, 'from_name', 'NISL CI Demo'),
(12, 'reply_to_email', 'info@narola.email'),
(13, 'reply_to_name', 'Narola '),
(16, 'log_activity', '0'),
(19, 'company_email', 'info@narola.email'),
(20, 'twitter_url', 'http://twitter.com'),
(21, 'smtp_encryption', 'ssl'),
(22, 'email_signature', 'NISL '),
(23, 'email_header', '<!doctype html>\r\n                            <html>\r\n                            <head>\r\n                              <meta name=\"viewport\" content=\"width=device-width\" />\r\n                              <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\" />\r\n                              <style>\r\n                                body {\r\n                                 background-color: #f6f6f6;\r\n                                 font-family: sans-serif;\r\n                                 -webkit-font-smoothing: antialiased;\r\n                                 font-size: 14px;\r\n                                 line-height: 1.4;\r\n                                 margin: 0;\r\n                                 padding: 0;\r\n                                 -ms-text-size-adjust: 100%;\r\n                                 -webkit-text-size-adjust: 100%;\r\n                               }\r\n                               table {\r\n                                 border-collapse: separate;\r\n                                 mso-table-lspace: 0pt;\r\n                                 mso-table-rspace: 0pt;\r\n                                 width: 100%;\r\n                               }\r\n                               table td {\r\n                                 font-family: sans-serif;\r\n                                 font-size: 14px;\r\n                                 vertical-align: top;\r\n                               }\r\n                                   /* -------------------------------------\r\n                                     BODY & CONTAINER\r\n                                     ------------------------------------- */\r\n                                     .body {\r\n                                       background-color: #f6f6f6;\r\n                                       width: 100%;\r\n                                     }\r\n                                     /* Set a max-width, and make it display as block so it will automatically stretch to that width, but will also shrink down on a phone or something */\r\n\r\n                                     .container {\r\n                                       display: block;\r\n                                       margin: 0 auto !important;\r\n                                       /* makes it centered */\r\n                                       max-width: 680px;\r\n                                       padding: 10px;\r\n                                       width: 680px;\r\n                                     }\r\n                                     /* This should also be a block element, so that it will fill 100% of the .container */\r\n\r\n                                     .content {\r\n                                       box-sizing: border-box;\r\n                                       display: block;\r\n                                       margin: 0 auto;\r\n                                       max-width: 680px;\r\n                                       padding: 10px;\r\n                                     }\r\n                                   /* -------------------------------------\r\n                                     HEADER, FOOTER, MAIN\r\n                                     ------------------------------------- */\r\n\r\n                                     .main {\r\n                                       background: #fff;\r\n                                       border-radius: 3px;\r\n                                       width: 100%;\r\n                                     }\r\n                                     .wrapper {\r\n                                       box-sizing: border-box;\r\n                                       padding: 20px;\r\n                                     }\r\n                                     .footer {\r\n                                       clear: both;\r\n                                       padding-top: 10px;\r\n                                       text-align: center;\r\n                                       width: 100%;\r\n                                     }\r\n                                     .footer td,\r\n                                     .footer p,\r\n                                     .footer span,\r\n                                     .footer a {\r\n                                       color: #999999;\r\n                                       font-size: 12px;\r\n                                       text-align: center;\r\n                                     }\r\n                                     hr {\r\n                                       border: 0;\r\n                                       border-bottom: 1px solid #f6f6f6;\r\n                                       margin: 20px 0;\r\n                                     }\r\n                                   /* -------------------------------------\r\n                                     RESPONSIVE AND MOBILE FRIENDLY STYLES\r\n                                     ------------------------------------- */\r\n\r\n                                     @media only screen and (max-width: 620px) {\r\n                                       table[class=body] .content {\r\n                                         padding: 0 !important;\r\n                                       }\r\n                                       table[class=body] .container {\r\n                                         padding: 0 !important;\r\n                                         width: 100% !important;\r\n                                       }\r\n                                       table[class=body] .main {\r\n                                         border-left-width: 0 !important;\r\n                                         border-radius: 0 !important;\r\n                                         border-right-width: 0 !important;\r\n                                       }\r\n                                     }\r\n                                   </style>\r\n                                 </head>\r\n                                 <body class=\"\">\r\n                                  <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"body\">\r\n                                    <tr>\r\n                                     <td> </td>\r\n                                     <td class=\"container\">\r\n                                      <div class=\"content\">\r\n                                        <!-- START CENTERED WHITE CONTAINER -->\r\n                                        <table class=\"main\">\r\n                                          <!-- START MAIN CONTENT AREA -->\r\n                                          <tr>\r\n                                           <td class=\"wrapper\">\r\n                                            <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\">\r\n                                              <tr>\r\n                                               <td>'),
(24, 'email_footer', '</td>\r\n                             </tr>\r\n                           </table>\r\n                         </td>\r\n                       </tr>\r\n                       <!-- END MAIN CONTENT AREA -->\r\n                     </table>\r\n                     <!-- START FOOTER -->\r\n                     <div class=\"footer\">\r\n                      <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\">\r\n                        <tr>\r\n                          <td class=\"content-block\">\r\n                            <span>You are \r\n receiving this email because of your account on {company_name}</span>\r\n                          </td>\r\n                        </tr>\r\n                      </table>\r\n                    </div>\r\n                    <!-- END FOOTER -->\r\n                    <!-- END CENTERED WHITE CONTAINER -->\r\n                  </div>\r\n                </td>\r\n                <td> </td>\r\n              </tr>\r\n            </table>\r\n            </body>\r\n            </html>');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `signup_key` varchar(32) NOT NULL,
  `is_email_verified` tinyint(1) NOT NULL DEFAULT '0',
  `role` int(11) NOT NULL DEFAULT '0',
  `is_admin` tinyint(1) NOT NULL DEFAULT '0',
  `firstname` varchar(100) NOT NULL,
  `lastname` varchar(100) NOT NULL,
  `email` varchar(256) NOT NULL,
  `mobile_no` bigint(20) NOT NULL,
  `password` varchar(100) NOT NULL,
  `last_ip` varchar(40) NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `last_password_change` datetime DEFAULT NULL,
  `new_pass_key` varchar(32) NOT NULL,
  `new_pass_key_requested` datetime DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `signup_key`, `is_email_verified`, `role`, `is_admin`, `firstname`, `lastname`, `email`, `mobile_no`, `password`, `last_ip`, `last_login`, `last_password_change`, `new_pass_key`, `new_pass_key_requested`, `is_active`, `is_deleted`) VALUES
(1, '', 0, 1, 1, 'Admin', 'Narola', 'admin@narola.email', 9955233665, '21232f297a57a5a743894a0e4a801fc3', '::1', '2019-09-30 11:02:19', '2019-09-17 15:26:31', 'b48c305b40151a764cf47bb8186cd10e', '2019-09-17 19:38:00', 1, 0),
(2, '', 0, 2, 1, 'Author', 'Narola', 'author@narola.email', 8855633256, '02bd92faa38aaa6cc0ea75e59937a1ef', '::1', '2019-09-23 12:05:17', NULL, '1c40d38ac5b01fb2b28fdd63a829fc25', NULL, 1, 0),
(3, '', 0, 3, 1, 'Editor', 'Narola', 'editor@narola.email', 9966322558, '5aee9dbd2a188839105073571bee1b1f', '::1', '2019-09-30 10:50:34', NULL, '3535e8093dacb810dfd9ba3bb42f6b20', '2019-09-24 09:45:14', 1, 0),
(4, '', 0, 4, 1, 'Visitor', 'Narola', 'visitor@narola.email', 7896541236, '127870930d65c57ee65fcc47f2170d38', '::1', '2019-09-17 21:05:03', NULL, 'b51ec3db3a7c63862716eee0b80a5194', NULL, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `user_auto_login`
--

DROP TABLE IF EXISTS `user_auto_login`;
CREATE TABLE IF NOT EXISTS `user_auto_login` (
  `key_id` char(32) NOT NULL,
  `user_id` int(11) NOT NULL,
  `user_agent` varchar(150) NOT NULL,
  `last_ip` varchar(40) NOT NULL,
  `last_login` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `user_permissions`
--

DROP TABLE IF EXISTS `user_permissions`;
CREATE TABLE IF NOT EXISTS `user_permissions` (
  `user_id` bigint(20) NOT NULL,
  `features` varchar(256) NOT NULL,
  `capabilities` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_permissions`
--

INSERT INTO `user_permissions` (`user_id`, `features`, `capabilities`) VALUES
(2, 'projects', 'view'),
(2, 'projects', 'create'),
(2, 'projects', 'edit'),
(2, 'categories', 'view'),
(2, 'categories', 'create'),
(2, 'categories', 'edit'),
(3, 'projects', 'view'),
(3, 'projects', 'edit'),
(3, 'categories', 'view'),
(3, 'categories', 'edit'),
(4, 'users', 'view'),
(4, 'projects', 'view'),
(4, 'categories', 'view'),
(4, 'settings', 'view'),
(1, 'users', 'view'),
(1, 'users', 'create'),
(1, 'users', 'edit'),
(1, 'users', 'delete'),
(1, 'projects', 'view'),
(1, 'projects', 'create'),
(1, 'projects', 'edit'),
(1, 'projects', 'delete'),
(1, 'categories', 'view'),
(1, 'categories', 'create'),
(1, 'categories', 'edit'),
(1, 'categories', 'delete'),
(1, 'roles', 'view'),
(1, 'roles', 'create'),
(1, 'roles', 'edit'),
(1, 'roles', 'delete'),
(1, 'email_templates', 'view'),
(1, 'email_templates', 'edit'),
(1, 'settings', 'view'),
(1, 'settings', 'create');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
