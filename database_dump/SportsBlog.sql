-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jan 14, 2018 at 06:56 PM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 7.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `SportsBlog`
--

-- --------------------------------------------------------

--
-- Table structure for table `Activity`
--

CREATE TABLE `Activity` (
  `ActivityID` int(11) NOT NULL,
  `ActivityTypeID` int(11) NOT NULL,
  `ActivityOwnerID` int(11) NOT NULL,
  `ActivityTime` datetime NOT NULL,
  `AffectedUserCount` int(11) NOT NULL DEFAULT '0',
  `AffectedMainUserID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='To keep track recent activities of a user.';

-- --------------------------------------------------------

--
-- Table structure for table `ActivityType`
--

CREATE TABLE `ActivityType` (
  `ActivityTypeID` int(11) NOT NULL,
  `ActivityName` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ActivityPriority` int(11) NOT NULL DEFAULT '2'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Define different activities.';

--
-- Dumping data for table `ActivityType`
--

INSERT INTO `ActivityType` (`ActivityTypeID`, `ActivityName`, `ActivityPriority`) VALUES
(1, 'Post Published from scratch. Not from Saved Draft.', 1),
(2, 'Post published from Saved Draft.', 1),
(3, 'Post not published. Saved as Draft.', 2),
(4, 'Commented on a post.', 2),
(5, 'Started following a topic.', 2),
(6, 'Stopped following a topic.', 2),
(7, 'Deleted a live post.', 2),
(8, 'Edited a live post.', 2),
(9, 'Started following somebody.', 2),
(10, 'Stopped following somebody.', 2),
(11, 'Changed status of live post to draft.', 2),
(12, 'Changed profile picture.', 2),
(13, 'Updated profile details.', 2),
(14, 'Upvoted a post.', 2),
(15, 'Downvoted a post.', 2),
(16, 'Deleted a comment.', 2),
(17, 'Edited a comment.', 2);

-- --------------------------------------------------------

--
-- Table structure for table `ChatGroups`
--

CREATE TABLE `ChatGroups` (
  `ChatGroupsTableID` int(11) NOT NULL,
  `ChatGroupID` int(11) NOT NULL,
  `ChatGroupUserID` int(11) NOT NULL,
  `ChatGroupUserPriority` int(11) NOT NULL DEFAULT '2'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ChatGroups`
--

INSERT INTO `ChatGroups` (`ChatGroupsTableID`, `ChatGroupID`, `ChatGroupUserID`, `ChatGroupUserPriority`) VALUES
(1, 5, 10, 1),
(2, 5, 15, 2),
(3, 5, 19, 2),
(4, 5, 20, 2),
(5, 5, 21, 2),
(6, 5, 22, 2),
(7, 5, 23, 2),
(8, 5, 26, 2),
(9, 5, 27, 2),
(10, 5, 28, 2),
(11, 5, 29, 2),
(12, 5, 30, 2),
(13, 5, 31, 2),
(14, 6, 10, 2),
(15, 6, 19, 1),
(16, 6, 31, 2),
(17, 6, 28, 2),
(18, 7, 10, 2),
(19, 7, 30, 2),
(20, 8, 23, 2),
(21, 8, 29, 2),
(22, 8, 21, 1),
(23, 9, 26, 2),
(24, 9, 27, 2),
(25, 10, 22, 2),
(26, 10, 23, 2),
(27, 11, 27, 2),
(28, 11, 28, 2),
(29, 12, 30, 2),
(30, 12, 20, 2),
(31, 10, 29, 2),
(32, 10, 19, 1);

-- --------------------------------------------------------

--
-- Table structure for table `ChatMessages`
--

CREATE TABLE `ChatMessages` (
  `ChatMessageID` int(11) NOT NULL,
  `ChatMessageTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ChatSenderID` int(11) NOT NULL,
  `ChatGroupID` int(11) NOT NULL,
  `ChatText` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Individual message texts with sender and receiver group.';

--
-- Dumping data for table `ChatMessages`
--

INSERT INTO `ChatMessages` (`ChatMessageID`, `ChatMessageTime`, `ChatSenderID`, `ChatGroupID`, `ChatText`) VALUES
(1, '2017-05-11 17:30:38', 10, 5, 'Hello World!'),
(2, '2017-05-11 17:30:39', 19, 5, 'Are you nuts!'),
(3, '2017-05-11 17:39:06', 20, 5, 'Hello guys!'),
(4, '2017-05-11 17:39:07', 21, 5, 'Yea hello...'),
(5, '2017-05-11 17:39:08', 22, 5, 'Hello guys!'),
(6, '2017-05-11 17:39:09', 23, 5, 'hey!!!'),
(7, '2017-05-11 17:39:10', 26, 5, 'wow !!'),
(8, '2017-05-11 17:39:11', 27, 5, 'Hello guys!'),
(9, '2017-05-11 17:39:12', 28, 5, 'how are you??'),
(10, '2017-05-11 17:39:13', 29, 5, 'Hello guys!'),
(11, '2017-05-11 17:39:14', 30, 5, 'how do you do??'),
(12, '2017-05-11 17:39:15', 31, 5, 'Hello guys!'),
(13, '2017-05-11 17:39:16', 10, 6, 'how do you do??'),
(14, '2017-05-11 17:39:17', 28, 6, 'hey!!!'),
(15, '2017-05-11 17:39:18', 31, 6, 'how do you do??'),
(16, '2017-05-11 17:39:19', 10, 7, 'hey!!!'),
(17, '2017-05-11 17:39:20', 29, 8, 'how are you??'),
(18, '2017-05-11 17:39:21', 27, 9, 'hey!!!'),
(19, '2017-05-11 17:39:28', 26, 9, 'how do you do??'),
(20, '2017-05-12 04:14:20', 10, 5, 'I am feeling bored.'),
(23, '2017-05-12 09:03:17', 10, 5, 'helloooo'),
(24, '2017-05-12 10:32:34', 10, 5, 'is anybody there'),
(25, '2017-05-12 10:41:30', 10, 5, 'hello'),
(26, '2017-05-12 10:44:35', 20, 5, 'why are you bothering everyone else??'),
(27, '2017-05-12 10:45:09', 20, 5, 'I am bored too'),
(28, '2017-05-12 10:45:15', 10, 5, 'I see..'),
(29, '2017-05-12 10:45:30', 20, 5, 'Should we go somewhere??'),
(30, '2017-05-12 10:48:35', 10, 5, 'u still there??'),
(31, '2017-05-12 10:48:43', 10, 5, 'wow ...'),
(32, '2017-05-12 10:49:10', 20, 5, 'this page is refrshing on its own!'),
(33, '2017-05-12 10:49:21', 10, 5, 'weird!!'),
(34, '2017-05-12 12:11:06', 20, 5, 'should we go for dinner somewhere??'),
(35, '2017-05-12 12:11:37', 10, 5, 'this is not a private chat!! People can listen'),
(36, '2017-05-12 12:11:48', 20, 5, 'OOps.'),
(37, '2017-05-12 13:13:02', 10, 5, 'good!'),
(38, '2017-05-12 13:14:14', 20, 5, 'Everything alright?'),
(39, '2017-05-12 13:32:09', 30, 5, 'hey!'),
(40, '2017-05-12 13:35:04', 20, 5, 'quick!'),
(41, '2017-10-11 08:18:45', 10, 5, 'ajdfslkjasdfl'),
(42, '2018-01-14 14:11:16', 10, 5, 'hurry');

-- --------------------------------------------------------

--
-- Table structure for table `Comments`
--

CREATE TABLE `Comments` (
  `CommentID` int(100) NOT NULL,
  `Comment` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `CommenterID` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CommentDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Deleted` int(11) NOT NULL DEFAULT '0',
  `PostID` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Stores all the comments for all the posts.';

--
-- Dumping data for table `Comments`
--

INSERT INTO `Comments` (`CommentID`, `Comment`, `CommenterID`, `CommentDate`, `Deleted`, `PostID`) VALUES
(1, 'Nice Blog.', '10', '2017-05-01 00:03:42', 0, 1),
(2, 'Great work!', '15', '2017-05-01 08:27:47', 0, 1),
(3, 'but this looks like copied....', '10', '2017-05-01 08:28:29', 0, 1),
(4, 'Nice Examples.', '15', '2017-05-01 08:33:26', 0, 3),
(5, 'Totally impractical. What\'s the use of such a long article?', '23', '2017-05-01 08:52:30', 0, 4),
(6, 'But web animation started much earlier than said above.', '19', '2017-05-01 08:53:24', 0, 4),
(7, 'Gooooooood!!!', '23', '2017-05-01 08:54:03', 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `Followers`
--

CREATE TABLE `Followers` (
  `FollowersTableID` int(100) NOT NULL,
  `UserID` int(100) NOT NULL,
  `FollowerID` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Followers`
--

INSERT INTO `Followers` (`FollowersTableID`, `UserID`, `FollowerID`) VALUES
(1, 10, 15),
(3, 10, 19),
(4, 10, 20),
(5, 10, 21),
(6, 10, 22),
(7, 15, 23),
(8, 23, 15),
(9, 21, 22),
(10, 22, 15),
(11, 15, 10),
(12, 21, 10),
(13, 15, 20),
(14, 20, 10),
(15, 23, 19),
(16, 26, 27),
(17, 27, 28),
(18, 28, 29),
(19, 29, 31),
(20, 31, 30),
(21, 31, 27),
(22, 31, 28),
(23, 31, 29),
(24, 31, 19),
(25, 31, 10),
(26, 29, 21),
(27, 29, 22),
(28, 29, 27),
(29, 15, 31),
(30, 15, 30),
(31, 15, 29),
(32, 15, 26),
(33, 26, 10),
(34, 26, 30);

-- --------------------------------------------------------

--
-- Table structure for table `PostDetails`
--

CREATE TABLE `PostDetails` (
  `PostDetailID` int(100) NOT NULL,
  `PostID` int(100) NOT NULL,
  `Sequence` int(100) NOT NULL DEFAULT '1',
  `PostText` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Stores the post body.';

--
-- Dumping data for table `PostDetails`
--

INSERT INTO `PostDetails` (`PostDetailID`, `PostID`, `Sequence`, `PostText`) VALUES
(1, 1, 1, 'Vestibulum ultricies venenatis dictumst donec mi neque accumsan eros mauris curabitur odio, fringilla torquent quisque sociosqu nisi pulvinar senectus suspendisse inceptos litora turpis, tincidunt mollis conubia non malesuada maecenas aptent venenatis auctor mattis.\n\nEleifend venenatis nisi arcu quis nunc turpis ullamcorper, augue fermentum himenaeos lacus dictum nam, non etiam volutpat primis elementum volutpat.\n\nConvallis neque dolor nisl dictum non posuere et viverra urna pharetra, ut nostra elit auctor eget semper turpis sagittis cursus ac, nisl faucibus justo consequat quam ultrices sociosqu vitae suspendisse vitae sollicitudin magna massa.\n\nMattis et etiam tortor aptent vitae aptent commodo diam, tempus accumsan pellentesque commodo consequat lorem consequat cubilia, ultrices in commodo curabitur commodo vivamus ante.'),
(2, 2, 1, 'Vestibulum ultricies venenatis dictumst donec mi neque accumsan eros mauris curabitur odio, fringilla torquent quisque sociosqu nisi pulvinar senectus suspendisse inceptos litora turpis, tincidunt mollis conubia non malesuada maecenas aptent venenatis auctor mattis.\n\nEleifend venenatis nisi arcu quis nunc turpis ullamcorper, augue fermentum himenaeos lacus dictum nam, non etiam volutpat primis elementum volutpat.\n\nConvallis neque dolor nisl dictum non posuere et viverra urna pharetra, ut nostra elit auctor eget semper turpis sagittis cursus ac, nisl faucibus justo consequat quam ultrices sociosqu vitae suspendisse vitae sollicitudin magna massa.\n\nMattis et etiam tortor aptent vitae aptent commodo diam, tempus accumsan pellentesque commodo consequat lorem consequat cubilia, ultrices in commodo curabitur commodo vivamus ante.'),
(3, 3, 1, 'Vestibulum ultricies venenatis dictumst donec mi neque accumsan eros mauris curabitur odio, fringilla torquent quisque sociosqu nisi pulvinar senectus suspendisse inceptos litora turpis, tincidunt mollis conubia non malesuada maecenas aptent venenatis auctor mattis.\n\nEleifend venenatis nisi arcu quis nunc turpis ullamcorper, augue fermentum himenaeos lacus dictum nam, non etiam volutpat primis elementum volutpat.\n\nConvallis neque dolor nisl dictum non posuere et viverra urna pharetra, ut nostra elit auctor eget semper turpis sagittis cursus ac, nisl faucibus justo consequat quam ultrices sociosqu vitae suspendisse vitae sollicitudin magna massa.\n\nMattis et etiam tortor aptent vitae aptent commodo diam, tempus accumsan pellentesque commodo consequat lorem consequat cubilia, ultrices in commodo curabitur commodo vivamus ante.'),
(4, 4, 1, 'Vestibulum ultricies venenatis dictumst donec mi neque accumsan eros mauris curabitur odio, fringilla torquent quisque sociosqu nisi pulvinar senectus suspendisse inceptos litora turpis, tincidunt mollis conubia non malesuada maecenas aptent venenatis auctor mattis.\n\nEleifend venenatis nisi arcu quis nunc turpis ullamcorper, augue fermentum himenaeos lacus dictum nam, non etiam volutpat primis elementum volutpat.\n\nConvallis neque dolor nisl dictum non posuere et viverra urna pharetra, ut nostra elit auctor eget semper turpis sagittis cursus ac, nisl faucibus justo consequat quam ultrices sociosqu vitae suspendisse vitae sollicitudin magna massa.\n\nMattis et etiam tortor aptent vitae aptent commodo diam, tempus accumsan pellentesque commodo consequat lorem consequat cubilia, ultrices in commodo curabitur commodo vivamus ante.'),
(5, 4, 2, 'Vestibulum ultricies venenatis dictumst donec mi neque accumsan eros mauris curabitur odio, fringilla torquent quisque sociosqu nisi pulvinar senectus suspendisse inceptos litora turpis, tincidunt mollis conubia non malesuada maecenas aptent venenatis auctor mattis.\n\nEleifend venenatis nisi arcu quis nunc turpis ullamcorper, augue fermentum himenaeos lacus dictum nam, non etiam volutpat primis elementum volutpat.\n\nConvallis neque dolor nisl dictum non posuere et viverra urna pharetra, ut nostra elit auctor eget semper turpis sagittis cursus ac, nisl faucibus justo consequat quam ultrices sociosqu vitae suspendisse vitae sollicitudin magna massa.\n\nMattis et etiam tortor aptent vitae aptent commodo diam, tempus accumsan pellentesque commodo consequat lorem consequat cubilia, ultrices in commodo curabitur commodo vivamus ante.'),
(6, 5, 1, 'Vestibulum ultricies venenatis dictumst donec mi neque accumsan eros mauris curabitur odio, fringilla torquent quisque sociosqu nisi pulvinar senectus suspendisse inceptos litora turpis, tincidunt mollis conubia non malesuada maecenas aptent venenatis auctor mattis.\n\nEleifend venenatis nisi arcu quis nunc turpis ullamcorper, augue fermentum himenaeos lacus dictum nam, non etiam volutpat primis elementum volutpat.\n\nConvallis neque dolor nisl dictum non posuere et viverra urna pharetra, ut nostra elit auctor eget semper turpis sagittis cursus ac, nisl faucibus justo consequat quam ultrices sociosqu vitae suspendisse vitae sollicitudin magna massa.\n\nMattis et etiam tortor aptent vitae aptent commodo diam, tempus accumsan pellentesque commodo consequat lorem consequat cubilia, ultrices in commodo curabitur commodo vivamus ante.'),
(7, 6, 1, 'Vestibulum ultricies venenatis dictumst donec mi neque accumsan eros mauris curabitur odio, fringilla torquent quisque sociosqu nisi pulvinar senectus suspendisse inceptos litora turpis, tincidunt mollis conubia non malesuada maecenas aptent venenatis auctor mattis.\n\nEleifend venenatis nisi arcu quis nunc turpis ullamcorper, augue fermentum himenaeos lacus dictum nam, non etiam volutpat primis elementum volutpat.\n\nConvallis neque dolor nisl dictum non posuere et viverra urna pharetra, ut nostra elit auctor eget semper turpis sagittis cursus ac, nisl faucibus justo consequat quam ultrices sociosqu vitae suspendisse vitae sollicitudin magna massa.\n\nMattis et etiam tortor aptent vitae aptent commodo diam, tempus accumsan pellentesque commodo consequat lorem consequat cubilia, ultrices in commodo curabitur commodo vivamus ante.'),
(8, 6, 2, 'Vestibulum ultricies venenatis dictumst donec mi neque accumsan eros mauris curabitur odio, fringilla torquent quisque sociosqu nisi pulvinar senectus suspendisse inceptos litora turpis, tincidunt mollis conubia non malesuada maecenas aptent venenatis auctor mattis.\n\nEleifend venenatis nisi arcu quis nunc turpis ullamcorper, augue fermentum himenaeos lacus dictum nam, non etiam volutpat primis elementum volutpat.\n\nConvallis neque dolor nisl dictum non posuere et viverra urna pharetra, ut nostra elit auctor eget semper turpis sagittis cursus ac, nisl faucibus justo consequat quam ultrices sociosqu vitae suspendisse vitae sollicitudin magna massa.\n\nMattis et etiam tortor aptent vitae aptent commodo diam, tempus accumsan pellentesque commodo consequat lorem consequat cubilia, ultrices in commodo curabitur commodo vivamus ante.'),
(9, 7, 1, 'Vestibulum ultricies venenatis dictumst donec mi neque accumsan eros mauris curabitur odio, fringilla torquent quisque sociosqu nisi pulvinar senectus suspendisse inceptos litora turpis, tincidunt mollis conubia non malesuada maecenas aptent venenatis auctor mattis.\n\nEleifend venenatis nisi arcu quis nunc turpis ullamcorper, augue fermentum himenaeos lacus dictum nam, non etiam volutpat primis elementum volutpat.\n\nConvallis neque dolor nisl dictum non posuere et viverra urna pharetra, ut nostra elit auctor eget semper turpis sagittis cursus ac, nisl faucibus justo consequat quam ultrices sociosqu vitae suspendisse vitae sollicitudin magna massa.\n\nMattis et etiam tortor aptent vitae aptent commodo diam, tempus accumsan pellentesque commodo consequat lorem consequat cubilia, ultrices in commodo curabitur commodo vivamus ante.'),
(10, 7, 2, 'Vestibulum ultricies venenatis dictumst donec mi neque accumsan eros mauris curabitur odio, fringilla torquent quisque sociosqu nisi pulvinar senectus suspendisse inceptos litora turpis, tincidunt mollis conubia non malesuada maecenas aptent venenatis auctor mattis.\n\nEleifend venenatis nisi arcu quis nunc turpis ullamcorper, augue fermentum himenaeos lacus dictum nam, non etiam volutpat primis elementum volutpat.\n\nConvallis neque dolor nisl dictum non posuere et viverra urna pharetra, ut nostra elit auctor eget semper turpis sagittis cursus ac, nisl faucibus justo consequat quam ultrices sociosqu vitae suspendisse vitae sollicitudin magna massa.\n\nMattis et etiam tortor aptent vitae aptent commodo diam, tempus accumsan pellentesque commodo consequat lorem consequat cubilia, ultrices in commodo curabitur commodo vivamus ante.'),
(11, 8, 1, 'Vestibulum ultricies venenatis dictumst donec mi neque accumsan eros mauris curabitur odio, fringilla torquent quisque sociosqu nisi pulvinar senectus suspendisse inceptos litora turpis, tincidunt mollis conubia non malesuada maecenas aptent venenatis auctor mattis.\n\nEleifend venenatis nisi arcu quis nunc turpis ullamcorper, augue fermentum himenaeos lacus dictum nam, non etiam volutpat primis elementum volutpat.\n\nConvallis neque dolor nisl dictum non posuere et viverra urna pharetra, ut nostra elit auctor eget semper turpis sagittis cursus ac, nisl faucibus justo consequat quam ultrices sociosqu vitae suspendisse vitae sollicitudin magna massa.\n\nMattis et etiam tortor aptent vitae aptent commodo diam, tempus accumsan pellentesque commodo consequat lorem consequat cubilia, ultrices in commodo curabitur commodo vivamus ante.'),
(12, 8, 2, 'Vestibulum ultricies venenatis dictumst donec mi neque accumsan eros mauris curabitur odio, fringilla torquent quisque sociosqu nisi pulvinar senectus suspendisse inceptos litora turpis, tincidunt mollis conubia non malesuada maecenas aptent venenatis auctor mattis.\n\nEleifend venenatis nisi arcu quis nunc turpis ullamcorper, augue fermentum himenaeos lacus dictum nam, non etiam volutpat primis elementum volutpat.\n\nConvallis neque dolor nisl dictum non posuere et viverra urna pharetra, ut nostra elit auctor eget semper turpis sagittis cursus ac, nisl faucibus justo consequat quam ultrices sociosqu vitae suspendisse vitae sollicitudin magna massa.\n\nMattis et etiam tortor aptent vitae aptent commodo diam, tempus accumsan pellentesque commodo consequat lorem consequat cubilia, ultrices in commodo curabitur commodo vivamus ante.'),
(13, 8, 3, 'Vestibulum ultricies venenatis dictumst donec mi neque accumsan eros mauris curabitur odio, fringilla torquent quisque sociosqu nisi pulvinar senectus suspendisse inceptos litora turpis, tincidunt mollis conubia non malesuada maecenas aptent venenatis auctor mattis.\n\nEleifend venenatis nisi arcu quis nunc turpis ullamcorper, augue fermentum himenaeos lacus dictum nam, non etiam volutpat primis elementum volutpat.\n\nConvallis neque dolor nisl dictum non posuere et viverra urna pharetra, ut nostra elit auctor eget semper turpis sagittis cursus ac, nisl faucibus justo consequat quam ultrices sociosqu vitae suspendisse vitae sollicitudin magna massa.\n\nMattis et etiam tortor aptent vitae aptent commodo diam, tempus accumsan pellentesque commodo consequat lorem consequat cubilia, ultrices in commodo curabitur commodo vivamus ante.'),
(14, 8, 4, 'Vestibulum ultricies venenatis dictumst donec mi neque accumsan eros mauris curabitur odio, fringilla torquent quisque sociosqu nisi pulvinar senectus suspendisse inceptos litora turpis, tincidunt mollis conubia non malesuada maecenas aptent venenatis auctor mattis.\n\nEleifend venenatis nisi arcu quis nunc turpis ullamcorper, augue fermentum himenaeos lacus dictum nam, non etiam volutpat primis elementum volutpat.\n\nConvallis neque dolor nisl dictum non posuere et viverra urna pharetra, ut nostra elit auctor eget semper turpis sagittis cursus ac, nisl faucibus justo consequat quam ultrices sociosqu vitae suspendisse vitae sollicitudin magna massa.\n\nMattis et etiam tortor aptent vitae aptent commodo diam, tempus accumsan pellentesque commodo consequat lorem consequat cubilia, ultrices in commodo curabitur commodo vivamus ante.'),
(15, 8, 5, 'Vestibulum ultricies venenatis dictumst donec mi neque accumsan eros mauris curabitur odio, fringilla torquent quisque sociosqu nisi pulvinar senectus suspendisse inceptos litora turpis, tincidunt mollis conubia non malesuada maecenas aptent venenatis auctor mattis.\n\nEleifend venenatis nisi arcu quis nunc turpis ullamcorper, augue fermentum himenaeos lacus dictum nam, non etiam volutpat primis elementum volutpat.\n\nConvallis neque dolor nisl dictum non posuere et viverra urna pharetra, ut nostra elit auctor eget semper turpis sagittis cursus ac, nisl faucibus justo consequat quam ultrices sociosqu vitae suspendisse vitae sollicitudin magna massa.\n\nMattis et etiam tortor aptent vitae aptent commodo diam, tempus accumsan pellentesque commodo consequat lorem consequat cubilia, ultrices in commodo curabitur commodo vivamus ante.'),
(16, 9, 1, 'Vestibulum ultricies venenatis dictumst donec mi neque accumsan eros mauris curabitur odio, fringilla torquent quisque sociosqu nisi pulvinar senectus suspendisse inceptos litora turpis, tincidunt mollis conubia non malesuada maecenas aptent venenatis auctor mattis.\n\nEleifend venenatis nisi arcu quis nunc turpis ullamcorper, augue fermentum himenaeos lacus dictum nam, non etiam volutpat primis elementum volutpat.\n\nConvallis neque dolor nisl dictum non posuere et viverra urna pharetra, ut nostra elit auctor eget semper turpis sagittis cursus ac, nisl faucibus justo consequat quam ultrices sociosqu vitae suspendisse vitae sollicitudin magna massa.\n\nMattis et etiam tortor aptent vitae aptent commodo diam, tempus accumsan pellentesque commodo consequat lorem consequat cubilia, ultrices in commodo curabitur commodo vivamus ante.'),
(17, 9, 2, 'Vestibulum ultricies venenatis dictumst donec mi neque accumsan eros mauris curabitur odio, fringilla torquent quisque sociosqu nisi pulvinar senectus suspendisse inceptos litora turpis, tincidunt mollis conubia non malesuada maecenas aptent venenatis auctor mattis.\n\nEleifend venenatis nisi arcu quis nunc turpis ullamcorper, augue fermentum himenaeos lacus dictum nam, non etiam volutpat primis elementum volutpat.\n\nConvallis neque dolor nisl dictum non posuere et viverra urna pharetra, ut nostra elit auctor eget semper turpis sagittis cursus ac, nisl faucibus justo consequat quam ultrices sociosqu vitae suspendisse vitae sollicitudin magna massa.\n\nMattis et etiam tortor aptent vitae aptent commodo diam, tempus accumsan pellentesque commodo consequat lorem consequat cubilia, ultrices in commodo curabitur commodo vivamus ante.'),
(18, 9, 3, 'Vestibulum ultricies venenatis dictumst donec mi neque accumsan eros mauris curabitur odio, fringilla torquent quisque sociosqu nisi pulvinar senectus suspendisse inceptos litora turpis, tincidunt mollis conubia non malesuada maecenas aptent venenatis auctor mattis.\n\nEleifend venenatis nisi arcu quis nunc turpis ullamcorper, augue fermentum himenaeos lacus dictum nam, non etiam volutpat primis elementum volutpat.\n\nConvallis neque dolor nisl dictum non posuere et viverra urna pharetra, ut nostra elit auctor eget semper turpis sagittis cursus ac, nisl faucibus justo consequat quam ultrices sociosqu vitae suspendisse vitae sollicitudin magna massa.\n\nMattis et etiam tortor aptent vitae aptent commodo diam, tempus accumsan pellentesque commodo consequat lorem consequat cubilia, ultrices in commodo curabitur commodo vivamus ante.'),
(19, 9, 4, 'Vestibulum ultricies venenatis dictumst donec mi neque accumsan eros mauris curabitur odio, fringilla torquent quisque sociosqu nisi pulvinar senectus suspendisse inceptos litora turpis, tincidunt mollis conubia non malesuada maecenas aptent venenatis auctor mattis.\n\nEleifend venenatis nisi arcu quis nunc turpis ullamcorper, augue fermentum himenaeos lacus dictum nam, non etiam volutpat primis elementum volutpat.\n\nConvallis neque dolor nisl dictum non posuere et viverra urna pharetra, ut nostra elit auctor eget semper turpis sagittis cursus ac, nisl faucibus justo consequat quam ultrices sociosqu vitae suspendisse vitae sollicitudin magna massa.\n\nMattis et etiam tortor aptent vitae aptent commodo diam, tempus accumsan pellentesque commodo consequat lorem consequat cubilia, ultrices in commodo curabitur commodo vivamus ante.'),
(20, 9, 5, 'Vestibulum ultricies venenatis dictumst donec mi neque accumsan eros mauris curabitur odio, fringilla torquent quisque sociosqu nisi pulvinar senectus suspendisse inceptos litora turpis, tincidunt mollis conubia non malesuada maecenas aptent venenatis auctor mattis.\n\nEleifend venenatis nisi arcu quis nunc turpis ullamcorper, augue fermentum himenaeos lacus dictum nam, non etiam volutpat primis elementum volutpat.\n\nConvallis neque dolor nisl dictum non posuere et viverra urna pharetra, ut nostra elit auctor eget semper turpis sagittis cursus ac, nisl faucibus justo consequat quam ultrices sociosqu vitae suspendisse vitae sollicitudin magna massa.\n\nMattis et etiam tortor aptent vitae aptent commodo diam, tempus accumsan pellentesque commodo consequat lorem consequat cubilia, ultrices in commodo curabitur commodo vivamus ante.'),
(21, 10, 1, 'Vestibulum ultricies venenatis dictumst donec mi neque accumsan eros mauris curabitur odio, fringilla torquent quisque sociosqu nisi pulvinar senectus suspendisse inceptos litora turpis, tincidunt mollis conubia non malesuada maecenas aptent venenatis auctor mattis.\n\nEleifend venenatis nisi arcu quis nunc turpis ullamcorper, augue fermentum himenaeos lacus dictum nam, non etiam volutpat primis elementum volutpat.\n\nConvallis neque dolor nisl dictum non posuere et viverra urna pharetra, ut nostra elit auctor eget semper turpis sagittis cursus ac, nisl faucibus justo consequat quam ultrices sociosqu vitae suspendisse vitae sollicitudin magna massa.\n\nMattis et etiam tortor aptent vitae aptent commodo diam, tempus accumsan pellentesque commodo consequat lorem consequat cubilia, ultrices in commodo curabitur commodo vivamus ante.'),
(22, 11, 1, 'Vestibulum ultricies venenatis dictumst donec mi neque accumsan eros mauris curabitur odio, fringilla torquent quisque sociosqu nisi pulvinar senectus suspendisse inceptos litora turpis, tincidunt mollis conubia non malesuada maecenas aptent venenatis auctor mattis.\n\nEleifend venenatis nisi arcu quis nunc turpis ullamcorper, augue fermentum himenaeos lacus dictum nam, non etiam volutpat primis elementum volutpat.\n\nConvallis neque dolor nisl dictum non posuere et viverra urna pharetra, ut nostra elit auctor eget semper turpis sagittis cursus ac, nisl faucibus justo consequat quam ultrices sociosqu vitae suspendisse vitae sollicitudin magna massa.\n\nMattis et etiam tortor aptent vitae aptent commodo diam, tempus accumsan pellentesque commodo consequat lorem consequat cubilia, ultrices in commodo curabitur commodo vivamus ante.'),
(23, 11, 2, 'Vestibulum ultricies venenatis dictumst donec mi neque accumsan eros mauris curabitur odio, fringilla torquent quisque sociosqu nisi pulvinar senectus suspendisse inceptos litora turpis, tincidunt mollis conubia non malesuada maecenas aptent venenatis auctor mattis.\n\nEleifend venenatis nisi arcu quis nunc turpis ullamcorper, augue fermentum himenaeos lacus dictum nam, non etiam volutpat primis elementum volutpat.\n\nConvallis neque dolor nisl dictum non posuere et viverra urna pharetra, ut nostra elit auctor eget semper turpis sagittis cursus ac, nisl faucibus justo consequat quam ultrices sociosqu vitae suspendisse vitae sollicitudin magna massa.\n\nMattis et etiam tortor aptent vitae aptent commodo diam, tempus accumsan pellentesque commodo consequat lorem consequat cubilia, ultrices in commodo curabitur commodo vivamus ante.'),
(24, 11, 3, 'Vestibulum ultricies venenatis dictumst donec mi neque accumsan eros mauris curabitur odio, fringilla torquent quisque sociosqu nisi pulvinar senectus suspendisse inceptos litora turpis, tincidunt mollis conubia non malesuada maecenas aptent venenatis auctor mattis.\n\nEleifend venenatis nisi arcu quis nunc turpis ullamcorper, augue fermentum himenaeos lacus dictum nam, non etiam volutpat primis elementum volutpat.\n\nConvallis neque dolor nisl dictum non posuere et viverra urna pharetra, ut nostra elit auctor eget semper turpis sagittis cursus ac, nisl faucibus justo consequat quam ultrices sociosqu vitae suspendisse vitae sollicitudin magna massa.\n\nMattis et etiam tortor aptent vitae aptent commodo diam, tempus accumsan pellentesque commodo consequat lorem consequat cubilia, ultrices in commodo curabitur commodo vivamus ante.'),
(25, 11, 4, 'Vestibulum ultricies venenatis dictumst donec mi neque accumsan eros mauris curabitur odio, fringilla torquent quisque sociosqu nisi pulvinar senectus suspendisse inceptos litora turpis, tincidunt mollis conubia non malesuada maecenas aptent venenatis auctor mattis.\n\nEleifend venenatis nisi arcu quis nunc turpis ullamcorper, augue fermentum himenaeos lacus dictum nam, non etiam volutpat primis elementum volutpat.\n\nConvallis neque dolor nisl dictum non posuere et viverra urna pharetra, ut nostra elit auctor eget semper turpis sagittis cursus ac, nisl faucibus justo consequat quam ultrices sociosqu vitae suspendisse vitae sollicitudin magna massa.\n\nMattis et etiam tortor aptent vitae aptent commodo diam, tempus accumsan pellentesque commodo consequat lorem consequat cubilia, ultrices in commodo curabitur commodo vivamus ante.'),
(26, 11, 5, 'Vestibulum ultricies venenatis dictumst donec mi neque accumsan eros mauris curabitur odio, fringilla torquent quisque sociosqu nisi pulvinar senectus suspendisse inceptos litora turpis, tincidunt mollis conubia non malesuada maecenas aptent venenatis auctor mattis.\n\nEleifend venenatis nisi arcu quis nunc turpis ullamcorper, augue fermentum himenaeos lacus dictum nam, non etiam volutpat primis elementum volutpat.\n\nConvallis neque dolor nisl dictum non posuere et viverra urna pharetra, ut nostra elit auctor eget semper turpis sagittis cursus ac, nisl faucibus justo consequat quam ultrices sociosqu vitae suspendisse vitae sollicitudin magna massa.\n\nMattis et etiam tortor aptent vitae aptent commodo diam, tempus accumsan pellentesque commodo consequat lorem consequat cubilia, ultrices in commodo curabitur commodo vivamus ante.'),
(27, 11, 6, 'Vestibulum ultricies venenatis dictumst donec mi neque accumsan eros mauris curabitur odio, fringilla torquent quisque sociosqu nisi pulvinar senectus suspendisse inceptos litora turpis, tincidunt mollis conubia non malesuada maecenas aptent venenatis auctor mattis.\n\nEleifend venenatis nisi arcu quis nunc turpis ullamcorper, augue fermentum himenaeos lacus dictum nam, non etiam volutpat primis elementum volutpat.\n\nConvallis neque dolor nisl dictum non posuere et viverra urna pharetra, ut nostra elit auctor eget semper turpis sagittis cursus ac, nisl faucibus justo consequat quam ultrices sociosqu vitae suspendisse vitae sollicitudin magna massa.\n\nMattis et etiam tortor aptent vitae aptent commodo diam, tempus accumsan pellentesque commodo consequat lorem consequat cubilia, ultrices in commodo curabitur commodo vivamus ante.'),
(28, 12, 1, 'Vestibulum ultricies venenatis dictumst donec mi neque accumsan eros mauris curabitur odio, fringilla torquent quisque sociosqu nisi pulvinar senectus suspendisse inceptos litora turpis, tincidunt mollis conubia non malesuada maecenas aptent venenatis auctor mattis.\n\nEleifend venenatis nisi arcu quis nunc turpis ullamcorper, augue fermentum himenaeos lacus dictum nam, non etiam volutpat primis elementum volutpat.\n\nConvallis neque dolor nisl dictum non posuere et viverra urna pharetra, ut nostra elit auctor eget semper turpis sagittis cursus ac, nisl faucibus justo consequat quam ultrices sociosqu vitae suspendisse vitae sollicitudin magna massa.\n\nMattis et etiam tortor aptent vitae aptent commodo diam, tempus accumsan pellentesque commodo consequat lorem consequat cubilia, ultrices in commodo curabitur commodo vivamus ante.'),
(29, 13, 1, 'Vestibulum ultricies venenatis dictumst donec mi neque accumsan eros mauris curabitur odio, fringilla torquent quisque sociosqu nisi pulvinar senectus suspendisse inceptos litora turpis, tincidunt mollis conubia non malesuada maecenas aptent venenatis auctor mattis.\n\nEleifend venenatis nisi arcu quis nunc turpis ullamcorper, augue fermentum himenaeos lacus dictum nam, non etiam volutpat primis elementum volutpat.\n\nConvallis neque dolor nisl dictum non posuere et viverra urna pharetra, ut nostra elit auctor eget semper turpis sagittis cursus ac, nisl faucibus justo consequat quam ultrices sociosqu vitae suspendisse vitae sollicitudin magna massa.\n\nMattis et etiam tortor aptent vitae aptent commodo diam, tempus accumsan pellentesque commodo consequat lorem consequat cubilia, ultrices in commodo curabitur commodo vivamus ante.'),
(30, 13, 2, 'Vestibulum ultricies venenatis dictumst donec mi neque accumsan eros mauris curabitur odio, fringilla torquent quisque sociosqu nisi pulvinar senectus suspendisse inceptos litora turpis, tincidunt mollis conubia non malesuada maecenas aptent venenatis auctor mattis.\n\nEleifend venenatis nisi arcu quis nunc turpis ullamcorper, augue fermentum himenaeos lacus dictum nam, non etiam volutpat primis elementum volutpat.\n\nConvallis neque dolor nisl dictum non posuere et viverra urna pharetra, ut nostra elit auctor eget semper turpis sagittis cursus ac, nisl faucibus justo consequat quam ultrices sociosqu vitae suspendisse vitae sollicitudin magna massa.\n\nMattis et etiam tortor aptent vitae aptent commodo diam, tempus accumsan pellentesque commodo consequat lorem consequat cubilia, ultrices in commodo curabitur commodo vivamus ante.'),
(31, 14, 1, 'Vestibulum ultricies venenatis dictumst donec mi neque accumsan eros mauris curabitur odio, fringilla torquent quisque sociosqu nisi pulvinar senectus suspendisse inceptos litora turpis, tincidunt mollis conubia non malesuada maecenas aptent venenatis auctor mattis.\n\nEleifend venenatis nisi arcu quis nunc turpis ullamcorper, augue fermentum himenaeos lacus dictum nam, non etiam volutpat primis elementum volutpat.\n\nConvallis neque dolor nisl dictum non posuere et viverra urna pharetra, ut nostra elit auctor eget semper turpis sagittis cursus ac, nisl faucibus justo consequat quam ultrices sociosqu vitae suspendisse vitae sollicitudin magna massa.\n\nMattis et etiam tortor aptent vitae aptent commodo diam, tempus accumsan pellentesque commodo consequat lorem consequat cubilia, ultrices in commodo curabitur commodo vivamus ante.'),
(32, 14, 2, 'Vestibulum ultricies venenatis dictumst donec mi neque accumsan eros mauris curabitur odio, fringilla torquent quisque sociosqu nisi pulvinar senectus suspendisse inceptos litora turpis, tincidunt mollis conubia non malesuada maecenas aptent venenatis auctor mattis.\n\nEleifend venenatis nisi arcu quis nunc turpis ullamcorper, augue fermentum himenaeos lacus dictum nam, non etiam volutpat primis elementum volutpat.\n\nConvallis neque dolor nisl dictum non posuere et viverra urna pharetra, ut nostra elit auctor eget semper turpis sagittis cursus ac, nisl faucibus justo consequat quam ultrices sociosqu vitae suspendisse vitae sollicitudin magna massa.\n\nMattis et etiam tortor aptent vitae aptent commodo diam, tempus accumsan pellentesque commodo consequat lorem consequat cubilia, ultrices in commodo curabitur commodo vivamus ante.'),
(33, 14, 3, 'Vestibulum ultricies venenatis dictumst donec mi neque accumsan eros mauris curabitur odio, fringilla torquent quisque sociosqu nisi pulvinar senectus suspendisse inceptos litora turpis, tincidunt mollis conubia non malesuada maecenas aptent venenatis auctor mattis.  Eleifend venenatis nisi arcu quis nunc turpis ullamcorper, augue fermentum himenaeos lacus dictum nam, non etiam volutpat primis elementum volutpat.  Convallis neque dolor nisl dictum non posuere et viverra urna pharetra, ut nostra elit auctor eget semper turpis sagittis cursus ac, nisl faucibus justo consequat quam ultrices sociosqu vitae suspendisse vitae sollicitudin magna massa.  Mattis et etiam tortor aptent vitae aptent commodo diam, tempus accumsan pellentesque commodo consequat lorem consequat cubilia, ultrices in commodo curabitur commodo vivamus ante.'),
(34, 15, 1, 'Vestibulum ultricies venenatis dictumst donec mi neque accumsan eros mauris curabitur odio, fringilla torquent quisque sociosqu nisi pulvinar senectus suspendisse inceptos litora turpis, tincidunt mollis conubia non malesuada maecenas aptent venenatis auctor mattis.\n\nEleifend venenatis nisi arcu quis nunc turpis ullamcorper, augue fermentum himenaeos lacus dictum nam, non etiam volutpat primis elementum volutpat.\n\nConvallis neque dolor nisl dictum non posuere et viverra urna pharetra, ut nostra elit auctor eget semper turpis sagittis cursus ac, nisl faucibus justo consequat quam ultrices sociosqu vitae suspendisse vitae sollicitudin magna massa.\n\nMattis et etiam tortor aptent vitae aptent commodo diam, tempus accumsan pellentesque commodo consequat lorem consequat cubilia, ultrices in commodo curabitur commodo vivamus ante.'),
(35, 15, 2, 'Vestibulum ultricies venenatis dictumst donec mi neque accumsan eros mauris curabitur odio, fringilla torquent quisque sociosqu nisi pulvinar senectus suspendisse inceptos litora turpis, tincidunt mollis conubia non malesuada maecenas aptent venenatis auctor mattis.\n\nEleifend venenatis nisi arcu quis nunc turpis ullamcorper, augue fermentum himenaeos lacus dictum nam, non etiam volutpat primis elementum volutpat.\n\nConvallis neque dolor nisl dictum non posuere et viverra urna pharetra, ut nostra elit auctor eget semper turpis sagittis cursus ac, nisl faucibus justo consequat quam ultrices sociosqu vitae suspendisse vitae sollicitudin magna massa.\n\nMattis et etiam tortor aptent vitae aptent commodo diam, tempus accumsan pellentesque commodo consequat lorem consequat cubilia, ultrices in commodo curabitur commodo vivamus ante.'),
(36, 15, 3, 'Vestibulum ultricies venenatis dictumst donec mi neque accumsan eros mauris curabitur odio, fringilla torquent quisque sociosqu nisi pulvinar senectus suspendisse inceptos litora turpis, tincidunt mollis conubia non malesuada maecenas aptent venenatis auctor mattis.\n\nEleifend venenatis nisi arcu quis nunc turpis ullamcorper, augue fermentum himenaeos lacus dictum nam, non etiam volutpat primis elementum volutpat.\n\nConvallis neque dolor nisl dictum non posuere et viverra urna pharetra, ut nostra elit auctor eget semper turpis sagittis cursus ac, nisl faucibus justo consequat quam ultrices sociosqu vitae suspendisse vitae sollicitudin magna massa.\n\nMattis et etiam tortor aptent vitae aptent commodo diam, tempus accumsan pellentesque commodo consequat lorem consequat cubilia, ultrices in commodo curabitur commodo vivamus ante.'),
(37, 16, 1, 'Vestibulum ultricies venenatis dictumst donec mi neque accumsan eros mauris curabitur odio, fringilla torquent quisque sociosqu nisi pulvinar senectus suspendisse inceptos litora turpis, tincidunt mollis conubia non malesuada maecenas aptent venenatis auctor mattis.\n\nEleifend venenatis nisi arcu quis nunc turpis ullamcorper, augue fermentum himenaeos lacus dictum nam, non etiam volutpat primis elementum volutpat.\n\nConvallis neque dolor nisl dictum non posuere et viverra urna pharetra, ut nostra elit auctor eget semper turpis sagittis cursus ac, nisl faucibus justo consequat quam ultrices sociosqu vitae suspendisse vitae sollicitudin magna massa.\n\nMattis et etiam tortor aptent vitae aptent commodo diam, tempus accumsan pellentesque commodo consequat lorem consequat cubilia, ultrices in commodo curabitur commodo vivamus ante.'),
(38, 16, 2, 'Vestibulum ultricies venenatis dictumst donec mi neque accumsan eros mauris curabitur odio, fringilla torquent quisque sociosqu nisi pulvinar senectus suspendisse inceptos litora turpis, tincidunt mollis conubia non malesuada maecenas aptent venenatis auctor mattis.\n\nEleifend venenatis nisi arcu quis nunc turpis ullamcorper, augue fermentum himenaeos lacus dictum nam, non etiam volutpat primis elementum volutpat.\n\nConvallis neque dolor nisl dictum non posuere et viverra urna pharetra, ut nostra elit auctor eget semper turpis sagittis cursus ac, nisl faucibus justo consequat quam ultrices sociosqu vitae suspendisse vitae sollicitudin magna massa.\n\nMattis et etiam tortor aptent vitae aptent commodo diam, tempus accumsan pellentesque commodo consequat lorem consequat cubilia, ultrices in commodo curabitur commodo vivamus ante.'),
(39, 16, 3, 'Vestibulum ultricies venenatis dictumst donec mi neque accumsan eros mauris curabitur odio, fringilla torquent quisque sociosqu nisi pulvinar senectus suspendisse inceptos litora turpis, tincidunt mollis conubia non malesuada maecenas aptent venenatis auctor mattis.\n\nEleifend venenatis nisi arcu quis nunc turpis ullamcorper, augue fermentum himenaeos lacus dictum nam, non etiam volutpat primis elementum volutpat.\n\nConvallis neque dolor nisl dictum non posuere et viverra urna pharetra, ut nostra elit auctor eget semper turpis sagittis cursus ac, nisl faucibus justo consequat quam ultrices sociosqu vitae suspendisse vitae sollicitudin magna massa.\n\nMattis et etiam tortor aptent vitae aptent commodo diam, tempus accumsan pellentesque commodo consequat lorem consequat cubilia, ultrices in commodo curabitur commodo vivamus ante.'),
(40, 16, 4, 'Vestibulum ultricies venenatis dictumst donec mi neque accumsan eros mauris curabitur odio, fringilla torquent quisque sociosqu nisi pulvinar senectus suspendisse inceptos litora turpis, tincidunt mollis conubia non malesuada maecenas aptent venenatis auctor mattis.\n\nEleifend venenatis nisi arcu quis nunc turpis ullamcorper, augue fermentum himenaeos lacus dictum nam, non etiam volutpat primis elementum volutpat.\n\nConvallis neque dolor nisl dictum non posuere et viverra urna pharetra, ut nostra elit auctor eget semper turpis sagittis cursus ac, nisl faucibus justo consequat quam ultrices sociosqu vitae suspendisse vitae sollicitudin magna massa.\n\nMattis et etiam tortor aptent vitae aptent commodo diam, tempus accumsan pellentesque commodo consequat lorem consequat cubilia, ultrices in commodo curabitur commodo vivamus ante.'),
(41, 17, 1, 'Vestibulum ultricies venenatis dictumst donec mi neque accumsan eros mauris curabitur odio, fringilla torquent quisque sociosqu nisi pulvinar senectus suspendisse inceptos litora turpis, tincidunt mollis conubia non malesuada maecenas aptent venenatis auctor mattis.\n\nEleifend venenatis nisi arcu quis nunc turpis ullamcorper, augue fermentum himenaeos lacus dictum nam, non etiam volutpat primis elementum volutpat.\n\nConvallis neque dolor nisl dictum non posuere et viverra urna pharetra, ut nostra elit auctor eget semper turpis sagittis cursus ac, nisl faucibus justo consequat quam ultrices sociosqu vitae suspendisse vitae sollicitudin magna massa.\n\nMattis et etiam tortor aptent vitae aptent commodo diam, tempus accumsan pellentesque commodo consequat lorem consequat cubilia, ultrices in commodo curabitur commodo vivamus ante.'),
(42, 17, 2, 'Vestibulum ultricies venenatis dictumst donec mi neque accumsan eros mauris curabitur odio, fringilla torquent quisque sociosqu nisi pulvinar senectus suspendisse inceptos litora turpis, tincidunt mollis conubia non malesuada maecenas aptent venenatis auctor mattis.\n\nEleifend venenatis nisi arcu quis nunc turpis ullamcorper, augue fermentum himenaeos lacus dictum nam, non etiam volutpat primis elementum volutpat.\n\nConvallis neque dolor nisl dictum non posuere et viverra urna pharetra, ut nostra elit auctor eget semper turpis sagittis cursus ac, nisl faucibus justo consequat quam ultrices sociosqu vitae suspendisse vitae sollicitudin magna massa.\n\nMattis et etiam tortor aptent vitae aptent commodo diam, tempus accumsan pellentesque commodo consequat lorem consequat cubilia, ultrices in commodo curabitur commodo vivamus ante.'),
(43, 17, 3, 'Vestibulum ultricies venenatis dictumst donec mi neque accumsan eros mauris curabitur odio, fringilla torquent quisque sociosqu nisi pulvinar senectus suspendisse inceptos litora turpis, tincidunt mollis conubia non malesuada maecenas aptent venenatis auctor mattis.\n\nEleifend venenatis nisi arcu quis nunc turpis ullamcorper, augue fermentum himenaeos lacus dictum nam, non etiam volutpat primis elementum volutpat.\n\nConvallis neque dolor nisl dictum non posuere et viverra urna pharetra, ut nostra elit auctor eget semper turpis sagittis cursus ac, nisl faucibus justo consequat quam ultrices sociosqu vitae suspendisse vitae sollicitudin magna massa.\n\nMattis et etiam tortor aptent vitae aptent commodo diam, tempus accumsan pellentesque commodo consequat lorem consequat cubilia, ultrices in commodo curabitur commodo vivamus ante.'),
(44, 17, 4, 'Vestibulum ultricies venenatis dictumst donec mi neque accumsan eros mauris curabitur odio, fringilla torquent quisque sociosqu nisi pulvinar senectus suspendisse inceptos litora turpis, tincidunt mollis conubia non malesuada maecenas aptent venenatis auctor mattis.\n\nEleifend venenatis nisi arcu quis nunc turpis ullamcorper, augue fermentum himenaeos lacus dictum nam, non etiam volutpat primis elementum volutpat.\n\nConvallis neque dolor nisl dictum non posuere et viverra urna pharetra, ut nostra elit auctor eget semper turpis sagittis cursus ac, nisl faucibus justo consequat quam ultrices sociosqu vitae suspendisse vitae sollicitudin magna massa.\n\nMattis et etiam tortor aptent vitae aptent commodo diam, tempus accumsan pellentesque commodo consequat lorem consequat cubilia, ultrices in commodo curabitur commodo vivamus ante.'),
(45, 17, 5, 'Vestibulum ultricies venenatis dictumst donec mi neque accumsan eros mauris curabitur odio, fringilla torquent quisque sociosqu nisi pulvinar senectus suspendisse inceptos litora turpis, tincidunt mollis conubia non malesuada maecenas aptent venenatis auctor mattis.  Eleifend venenatis nisi arcu quis nunc turpis ullamcorper, augue fermentum himenaeos lacus dictum nam, non etiam volutpat primis elementum volutpat.  Convallis neque dolor nisl dictum non posuere et viverra urna pharetra, ut nostra elit auctor eget semper turpis sagittis cursus ac, nisl faucibus justo consequat quam ultrices sociosqu vitae suspendisse vitae sollicitudin magna massa.  Mattis et etiam tortor aptent vitae aptent commodo diam, tempus accumsan pellentesque commodo consequat lorem consequat cubilia, ultrices in commodo curabitur commodo vivamus ante.'),
(46, 18, 1, 'Vestibulum ultricies venenatis dictumst donec mi neque accumsan eros mauris curabitur odio, fringilla torquent quisque sociosqu nisi pulvinar senectus suspendisse inceptos litora turpis, tincidunt mollis conubia non malesuada maecenas aptent venenatis auctor mattis.\n\nEleifend venenatis nisi arcu quis nunc turpis ullamcorper, augue fermentum himenaeos lacus dictum nam, non etiam volutpat primis elementum volutpat.\n\nConvallis neque dolor nisl dictum non posuere et viverra urna pharetra, ut nostra elit auctor eget semper turpis sagittis cursus ac, nisl faucibus justo consequat quam ultrices sociosqu vitae suspendisse vitae sollicitudin magna massa.\n\nMattis et etiam tortor aptent vitae aptent commodo diam, tempus accumsan pellentesque commodo consequat lorem consequat cubilia, ultrices in commodo curabitur commodo vivamus ante.'),
(47, 18, 2, 'Vestibulum ultricies venenatis dictumst donec mi neque accumsan eros mauris curabitur odio, fringilla torquent quisque sociosqu nisi pulvinar senectus suspendisse inceptos litora turpis, tincidunt mollis conubia non malesuada maecenas aptent venenatis auctor mattis.\n\nEleifend venenatis nisi arcu quis nunc turpis ullamcorper, augue fermentum himenaeos lacus dictum nam, non etiam volutpat primis elementum volutpat.\n\nConvallis neque dolor nisl dictum non posuere et viverra urna pharetra, ut nostra elit auctor eget semper turpis sagittis cursus ac, nisl faucibus justo consequat quam ultrices sociosqu vitae suspendisse vitae sollicitudin magna massa.\n\nMattis et etiam tortor aptent vitae aptent commodo diam, tempus accumsan pellentesque commodo consequat lorem consequat cubilia, ultrices in commodo curabitur commodo vivamus ante.'),
(48, 18, 3, 'Vestibulum ultricies venenatis dictumst donec mi neque accumsan eros mauris curabitur odio, fringilla torquent quisque sociosqu nisi pulvinar senectus suspendisse inceptos litora turpis, tincidunt mollis conubia non malesuada maecenas aptent venenatis auctor mattis.\n\nEleifend venenatis nisi arcu quis nunc turpis ullamcorper, augue fermentum himenaeos lacus dictum nam, non etiam volutpat primis elementum volutpat.\n\nConvallis neque dolor nisl dictum non posuere et viverra urna pharetra, ut nostra elit auctor eget semper turpis sagittis cursus ac, nisl faucibus justo consequat quam ultrices sociosqu vitae suspendisse vitae sollicitudin magna massa.\n\nMattis et etiam tortor aptent vitae aptent commodo diam, tempus accumsan pellentesque commodo consequat lorem consequat cubilia, ultrices in commodo curabitur commodo vivamus ante.'),
(49, 19, 1, 'world'),
(50, 20, 1, 'world'),
(51, 21, 1, 'Among going manor who did. Do ye is celebrated it sympathize considered. May ecstatic did surprise elegance the ignorant age. Own her miss cold last. It so numerous if he outlived disposal. How but sons mrs lady when. Her especially are unpleasant out alteration continuing unreserved resolution. Hence hopes noisy may china fully and. Am it regard stairs branch thirty length afford. \n\nAnswer misery adieus add wooded how nay men before though. Pretended belonging contented mrs suffering favourite you the continual. Mrs civil nay least means tried drift. Natural end law whether but and towards certain. Furnished unfeeling his sometimes see day promotion. Quitting informed concerns can men now. Projection to or up conviction uncommonly delightful continuing. In appetite ecstatic opinions hastened by handsome admitted. \n\nOpen know age use whom him than lady was. On lasted uneasy exeter my itself effect spirit. At design he vanity at cousin longer looked ye. Design praise me father an favour. As greatly replied it windows of an minuter behaved passage. Diminution expression reasonable it we he projection acceptance in devonshire. Perpetual it described at he applauded. '),
(52, 22, 1, 'Sigh view am high neat half to what. Sent late held than set why wife our. If an blessing building steepest. Agreement distrusts mrs six affection satisfied. Day blushes visitor end company old prevent chapter. Consider declared out expenses her concerns. No at indulgence conviction particular unsatiable boisterous discretion. Direct enough off others say eldest may exeter she. Possible all ignorant supplied get settling marriage recurred. \n\nRendered her for put improved concerns his. Ladies bed wisdom theirs mrs men months set. Everything so dispatched as it increasing pianoforte. Hearing now saw perhaps minutes herself his. Of instantly excellent therefore difficult he northward. Joy green but least marry rapid quiet but. Way devonshire introduced expression saw travelling affronting. Her and effects affixed pretend account ten natural. Need eat week even yet that. Incommode delighted he resolving sportsmen do in listening. \n'),
(53, 23, 1, 'Among going manor who did. Do ye is celebrated it sympathize considered. May ecstatic did surprise elegance the ignorant age. Own her miss cold last. It so numerous if he outlived disposal. How but sons mrs lady when. Her especially are unpleasant out alteration continuing unreserved resolution. Hence hopes noisy may china fully and. Am it regard stairs branch thirty length afford. \n\nAnswer misery adieus add wooded how nay men before though. Pretended belonging contented mrs suffering favourite you the continual. Mrs civil nay least means tried drift. Natural end law whether but and towards certain. Furnished unfeeling his sometimes see day promotion. Quitting informed concerns can men now. Projection to or up conviction uncommonly delightful continuing. In appetite ecstatic opinions hastened by handsome admitted. \n\nOpen know age use whom him than lady was. On lasted uneasy exeter my itself effect spirit. At design he vanity at cousin longer looked ye. Design praise me father an favour. As greatly replied it windows of an minuter behaved passage. Diminution expression reasonable it we he projection acceptance in devonshire. Perpetual it described at he applauded. '),
(54, 24, 1, 'Preserved defective offending he daughters on or. Rejoiced prospect yet material servants out answered men admitted. Sportsmen certainty prevailed suspected am as. Add stairs admire all answer the nearer yet length. Advantages prosperous remarkably my inhabiting so reasonably be if. Too any appearance announcing impossible one. Out mrs means heart ham tears shall power every. \n\nDwelling and speedily ignorant any steepest. Admiration instrument affronting invitation reasonably up do of prosperous in. Shy saw declared age debating ecstatic man. Call in so want pure rank am dear were. Remarkably to continuing in surrounded diminution on. In unfeeling existence objection immediate repulsive on he in. Imprudence comparison uncommonly me he difficulty diminution resolution. Likewise proposal differed scarcely dwelling as on raillery. September few dependent extremity own continued and ten prevailed attending. Early to weeks we could. \n\nIn friendship diminution instrument so. Son sure paid door with say them. Two among sir sorry men court. Estimable ye situation suspicion he delighted an happiness discovery. Fact are size cold why had part. If believing or sweetness otherwise in we forfeited. Tolerably an unwilling arranging of determine. Beyond rather sooner so if up wishes or. \n\nGreatly hearted has who believe. Drift allow green son walls years for blush. Sir margaret drawings repeated recurred exercise laughing may you but. Do repeated whatever to welcomed absolute no. Fat surprise although outlived and informed shy dissuade property. Musical by me through he drawing savings an. No we stand avoid decay heard mr. Common so wicket appear to sudden worthy on. Shade of offer ye whole stood hoped. '),
(55, 25, 1, 'Sigh view am high neat half to what. Sent late held than set why wife our. If an blessing building steepest. Agreement distrusts mrs six affection satisfied. Day blushes visitor end company old prevent chapter. Consider declared out expenses her concerns. No at indulgence conviction particular unsatiable boisterous discretion. Direct enough off others say eldest may exeter she. Possible all ignorant supplied get settling marriage recurred. \n\nRendered her for put improved concerns his. Ladies bed wisdom theirs mrs men months set. Everything so dispatched as it increasing pianoforte. Hearing now saw perhaps minutes herself his. Of instantly excellent therefore difficult he northward. Joy green but least marry rapid quiet but. Way devonshire introduced expression saw travelling affronting. Her and effects affixed pretend account ten natural. Need eat week even yet that. Incommode delighted he resolving sportsmen do in listening. \n'),
(56, 26, 1, '<p><img src=\"http://localhost/DreamBlogv3//uploads/posts/images/047a553f1342be44e18f3c744b2c02865b513922.jpg\" style=\"width: 300px;\" class=\"fr-fic fr-dib\">Forfeited you engrossed but gay sometimes explained. Another as studied it to evident. Merry sense given he be arise. Conduct at an replied removal an amongst. Remaining determine few her two cordially admitting old. Sometimes strangers his ourselves her depending you boy. Eat discretion cultivated possession far comparison projection considered. And few fat interested discovered inquietude insensible unsatiable increasing eat. \n\nTo they four in love. Settling you has separate supplied bed. Concluded resembled suspected his resources curiosity joy. Led all cottage met enabled attempt through talking delight. Dare he feet my tell busy. Considered imprudence of he friendship boisterous. \n\nIgnorant branched humanity led now marianne too strongly entrance. Rose to shew bore no ye of paid rent form. Old design are dinner better nearer silent excuse. She which are maids boy sense her shade. Considered reasonable we affronting on expression in. So cordial anxious mr delight. Shot his has must wish from sell nay. Remark fat set why are sudden depend change entire wanted. Performed remainder attending led fat residence far. \n\nShewing met parties gravity husband sex pleased. On to no kind do next feel held walk. Last own loud and knew give gay four. Sentiments motionless or principles preference excellence am. Literature surrounded insensible at indulgence or to admiration remarkably. Matter future lovers desire marked boy use. Chamber reached do he nothing be. \n\nShe wholly fat who window extent either formal. Removing welcomed civility or hastened is. Justice elderly but perhaps expense six her are another passage. Full her ten open fond walk not down. For request general express unknown are. He in just mr door body held john down he. So journey greatly or garrets. Draw door kept do so come on open mean. Estimating stimulated how reasonably precaution diminution she simplicity sir but. Questions am sincerity zealously concluded consisted or no gentleman it. \n<strong>dklsjlk</strong><img src=\"http://localhost/DreamBlogv3//uploads/posts/images/d37fd1c80df70c607a9b0c05eb3e18119cdce2ac.png\" style=\"width: 300px;\" class=\"fr-fic fr-dib\">kjjaldjflja<em>dlklads</em></p>');
INSERT INTO `PostDetails` (`PostDetailID`, `PostID`, `Sequence`, `PostText`) VALUES
(57, 27, 1, '<p>This is logo! <img src=\"http://localhost/DreamBlogv3//uploads/posts/images/0e994dfda3ad040e79a26c24811717d169864c98.png\" style=\"width: 300px;\" class=\"fr-fic fr-dib\">\n Up maids me an ample stood given. Certainty say suffering his him collected intention promotion. Hill sold ham men made lose case. Views abode law heard jokes too. Was are delightful solicitude discovered collecting man day. Resolving neglected sir tolerably but existence conveying for. Day his put off unaffected literature partiality inhabiting. \n\nRooms oh fully taken by worse do. Points afraid but may end law lasted. Was out laughter raptures returned outweigh. Luckily cheered colonel me do we attacks on highest enabled. Tried law yet style child. Bore of true of no be deal. Frequently sufficient in be unaffected. The furnished she concluded depending procuring concealed. \n\nCause dried no solid no an small so still widen. Ten weather evident smiling bed against she examine its. Rendered far opinions two yet moderate sex striking. Sufficient motionless compliment by stimulated assistance at. Convinced resolving extensive agreeable in it on as remainder. Cordially say affection met who propriety him. Are man she towards private weather pleased. In more part he lose need so want rank no. At bringing or he sensible pleasure. Prevent he parlors do waiting be females an message society. \n\nAlteration literature to or an sympathize mr imprudence. Of is ferrars subject as enjoyed or tedious cottage. Procuring as in resembled by in agreeable. Next long no gave mr eyes. Admiration advantages no he celebrated so pianoforte unreserved. Not its herself forming charmed amiable. Him why feebly expect future now. \n\nFar quitting dwelling graceful the likewise received building. An fact so to that show am shed sold cold. Unaffected remarkably get yet introduced excellence terminated led. Result either design saw she esteem and. On ashamed no inhabit ferrars it ye besides resolve. Own judgment directly few trifling. Elderly as pursuit at regular do parlors. Rank what has into fond she. \n\nBy spite about do of do allow blush. Additions in conveying or collected objection in. Suffer few desire wonder her object hardly nearer. Abroad no chatty others my silent an. Fat way appear denote who wholly narrow gay settle. Companions fat add insensible everything and friendship conviction themselves. Theirs months ten had add narrow own. \n\nIncreasing impression interested expression he my at. Respect invited request charmed me warrant to. Expect no pretty as do though so genius afraid cousin. Girl when of ye snug poor draw. Mistake totally of in chiefly. Justice visitor him entered for. Continue delicate as unlocked entirely mr relation diverted in. Known not end fully being style house. An whom down kept lain name so at easy. \n\nFor norland produce age wishing. To figure on it spring season up. Her provision acuteness had excellent two why intention. As called mr needed praise at. Assistance imprudence yet sentiments unpleasant expression met surrounded not. Be at talked ye though secure nearer. \n\nYe to misery wisdom plenty polite to as. Prepared interest proposal it he exercise. My wishing an in attempt ferrars. Visited eat you why service looking engaged. At place no walls hopes rooms fully in. Roof hope shy tore leaf joy paid boy. Noisier out brought entered detract because sitting sir. Fat put occasion rendered off humanity has. \n\nVillage did removed enjoyed explain nor ham saw calling talking. Securing as informed declared or margaret. Joy horrible moreover man feelings own shy. Request norland neither mistake for yet. Between the for morning assured country believe. On even feet time have an no at. Relation so in confined smallest children unpacked delicate. Why sir end believe uncivil respect. Always get adieus nature day course for common. My little garret repair to desire he esteem. </p>'),
(58, 28, 1, 'Some random text again! <p><img src=\"http://localhost/DreamBlogv3//uploads/posts/images/047a553f1342be44e18f3c744b2c02865b513922.jpg\" style=\"width: 300px;\" class=\"fr-fic fr-dib\">As collected deficient objection by it discovery sincerity curiosity. Quiet decay who round three world whole has mrs man. Built the china there tried jokes which gay why. Assure in adieus wicket it is. But spoke round point and one joy. Offending her moonlight men sweetness see unwilling. Often of it tears whole oh balls share an. \n\nSurrounded to me occasional pianoforte alteration unaffected impossible ye. For saw half than cold. Pretty merits waited six talked pulled you. Conduct replied off led whether any shortly why arrived adapted. Numerous ladyship so raillery humoured goodness received an. So narrow formal length my highly longer afford oh. Tall neat he make or at dull ye. \n\nAn do on frankness so cordially immediate recommend contained. Imprudence insensible be literature unsatiable do. Of or imprudence solicitude affronting in mr possession. Compass journey he request on suppose limited of or. She margaret law thoughts proposal formerly. Speaking ladyship yet scarcely and mistaken end exertion dwelling. All decisively dispatched instrument particular way one devonshire. Applauded she sportsman explained for out objection. \n\nLiterature admiration frequently indulgence announcing are who you her. Was least quick after six. So it yourself repeated together cheerful. Neither it cordial so painful picture studied if. Sex him position doubtful resolved boy expenses. Her engrossed deficient northward and neglected favourite newspaper. But use peculiar produced concerns ten. \n\nDebating me breeding be answered an he. Spoil event was words her off cause any. Tears woman which no is world miles woody. Wished be do mutual except in effect answer. Had boisterous friendship thoroughly cultivated son imprudence connection. Windows because concern sex its. Law allow saved views hills day ten. Examine waiting his evening day passage proceed. \n\n<strong>jdfljaslj</strong><img src=\"http://localhost/DreamBlogv3//uploads/posts/images/047a553f1342be44e18f3c744b2c02865b513922.jpg\" style=\"width: 300px;\" class=\"fr-fic fr-dib\"></p>');

-- --------------------------------------------------------

--
-- Table structure for table `Posts`
--

CREATE TABLE `Posts` (
  `PostID` int(100) NOT NULL,
  `PostTitle` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `PostDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Deleted` int(11) NOT NULL DEFAULT '0',
  `OwnerID` int(11) NOT NULL,
  `Upvotes` int(11) NOT NULL DEFAULT '0',
  `TemporaryDraft` int(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Stores Information about the post.';

--
-- Dumping data for table `Posts`
--

INSERT INTO `Posts` (`PostID`, `PostTitle`, `PostDate`, `Deleted`, `OwnerID`, `Upvotes`, `TemporaryDraft`) VALUES
(1, 'Lorem ipsum purus morbi adipiscing curabitur', '2017-04-30 23:56:36', 0, 10, 3, 0),
(2, 'Lorem ipsum purus morbi adipiscing curabitur', '2017-05-01 08:30:14', 0, 15, -10, 0),
(3, 'Lorem ipsum purus morbi adipiscing curabitur', '2017-05-01 08:31:42', 1, 10, 2, 1),
(4, 'Lorem ipsum purus morbi adipiscing curabitur', '2017-05-01 08:49:40', 0, 21, 5, 0),
(5, 'Lorem ipsum purus morbi adipiscing curabitur', '2017-05-04 00:00:54', 0, 21, 5, 0),
(6, 'Lorem ipsum purus morbi adipiscing curabitur', '2017-05-04 00:02:25', 0, 20, 9, 0),
(7, 'Lorem ipsum purus morbi adipiscing curabitur', '2017-05-04 00:05:02', 0, 22, 0, 0),
(8, 'Lorem ipsum purus morbi adipiscing curabitur', '2017-05-04 00:06:32', 0, 22, 0, 0),
(9, 'Lorem ipsum purus morbi adipiscing curabitur', '2017-05-04 00:11:38', 0, 19, 7, 0),
(10, 'Lorem ipsum purus morbi adipiscing curabitur', '2017-05-04 00:14:36', 0, 19, 0, 0),
(11, 'Lorem ipsum purus morbi adipiscing curabitur', '2017-05-04 00:15:19', 0, 10, -1, 0),
(12, 'Lorem ipsum purus morbi adipiscing curabitur', '2017-05-04 00:22:14', 0, 26, 1, 0),
(13, 'Lorem ipsum purus morbi adipiscing curabitur', '2017-05-04 00:23:57', 0, 28, 8, 0),
(14, 'Lorem ipsum purus morbi adipiscing curabitur', '2017-05-04 00:25:52', 0, 30, 1, 0),
(15, 'Lorem ipsum purus morbi adipiscing curabitur', '2017-05-04 00:30:39', 0, 31, 0, 0),
(16, 'Lorem ipsum purus morbi adipiscing curabitur', '2017-05-04 00:32:11', 0, 31, 0, 0),
(17, 'Lorem ipsum purus morbi adipiscing curabitur', '2017-05-04 00:33:53', 0, 26, 0, 0),
(18, 'Lorem ipsum purus morbi adipiscing curabitur', '2017-05-04 00:38:39', 0, 28, 0, 0),
(20, 'hello', '2017-10-11 07:45:52', 0, 10, 2, 0),
(21, 'hello again', '2017-10-11 07:47:42', 0, 10, 1, 0),
(22, 'hello again', '2017-10-11 07:50:29', 0, 10, 4, 0),
(23, 'random title', '2017-10-11 13:35:36', 0, 10, -2, 0),
(24, 'random title', '2017-10-11 13:36:03', 0, 10, 1, 0),
(25, 'random title ljasfljlfjkd', '2017-10-11 13:36:20', 0, 10, 4, 0),
(26, 'random title ljasfljlfjkd', '2017-10-11 13:38:59', 0, 10, -3, 0),
(27, 'klafdljaldkfj', '2017-10-11 13:45:52', 0, 10, -1, 0),
(28, 'hello up', '2017-10-14 22:22:44', 0, 10, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `PostsTopics`
--

CREATE TABLE `PostsTopics` (
  `PostsTopicsID` int(100) NOT NULL,
  `PostID` int(100) NOT NULL,
  `TopicID` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='A post can cover more than one topic.';

--
-- Dumping data for table `PostsTopics`
--

INSERT INTO `PostsTopics` (`PostsTopicsID`, `PostID`, `TopicID`) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 1),
(4, 4, 1),
(5, 5, 2),
(6, 6, 2),
(7, 7, 3),
(8, 8, 3),
(9, 9, 6),
(10, 10, 6),
(11, 11, 6),
(12, 12, 8),
(13, 13, 8),
(14, 14, 8),
(15, 15, 5),
(16, 16, 5),
(17, 17, 5),
(18, 18, 1),
(19, 19, 1),
(20, 20, 1),
(21, 21, 1),
(22, 22, 1),
(23, 23, 1),
(24, 24, 1),
(25, 25, 1),
(26, 26, 1),
(27, 27, 1),
(28, 28, 1);

-- --------------------------------------------------------

--
-- Table structure for table `TopicFollowers`
--

CREATE TABLE `TopicFollowers` (
  `TopicFollowersID` int(11) NOT NULL,
  `TopicID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Stores the topics and corressponding users that follow it.';

--
-- Dumping data for table `TopicFollowers`
--

INSERT INTO `TopicFollowers` (`TopicFollowersID`, `TopicID`, `UserID`) VALUES
(1, 1, 10),
(2, 2, 10),
(3, 3, 10),
(4, 4, 10),
(5, 5, 10),
(6, 6, 10),
(7, 7, 10),
(8, 8, 10),
(9, 9, 10),
(10, 10, 10),
(11, 2, 23),
(12, 8, 23),
(13, 5, 23),
(14, 6, 22),
(15, 7, 22),
(16, 3, 21),
(17, 2, 19),
(18, 9, 19),
(19, 8, 19),
(20, 7, 19);

-- --------------------------------------------------------

--
-- Table structure for table `Topics`
--

CREATE TABLE `Topics` (
  `TopicID` int(100) NOT NULL,
  `Topic` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `Topics`
--

INSERT INTO `Topics` (`TopicID`, `Topic`) VALUES
(1, 'Racing'),
(2, 'Amateur'),
(3, 'Olympic'),
(4, 'Women\'s'),
(5, 'Adventure'),
(6, 'Team'),
(7, 'Athletics'),
(8, 'Gymnastics'),
(9, 'Swimming'),
(10, 'Others');

-- --------------------------------------------------------

--
-- Table structure for table `UserPersonalInfo`
--

CREATE TABLE `UserPersonalInfo` (
  `UserPersonalInfoID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `UserFirstName` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UserMiddleName` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UserLastName` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UserContactNo` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UserNickName` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UserDOB` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `UserPersonalInfo`
--

INSERT INTO `UserPersonalInfo` (`UserPersonalInfoID`, `UserID`, `UserFirstName`, `UserMiddleName`, `UserLastName`, `UserContactNo`, `UserNickName`, `UserDOB`) VALUES
(1, 10, 'Tuhin', 'Subhra', 'Patra', '9764204512', 'Adam', '1998-02-27'),
(2, 15, 'Ramanada', 'Kumar', 'Patel', '9123456789', 'Ramu', '1997-02-02'),
(3, 19, 'Timothy', NULL, 'Wildman', '321895432', 'tim', '1994-01-03');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `oauth_provider` enum('','facebook','google','twitter') COLLATE utf8mb4_unicode_ci NOT NULL,
  `oauth_uid` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `locale` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `picture` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `link` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `oauth_provider`, `oauth_uid`, `first_name`, `last_name`, `email`, `gender`, `locale`, `picture`, `link`, `created`, `modified`) VALUES
(6, 'facebook', '1318721691543282', 'Tuhin Subhra', 'Patra', '', 'male', 'en_US', 'https://scontent.xx.fbcdn.net/v/t1.0-1/p50x50/15590093_1182784058470380_4339421876012960707_n.jpg?oh=9255b07f2d71d34c7cd3ed2962c93489&oe=5A8759D8', 'https://www.facebook.com/app_scoped_user_id/1318721691543282/', '2017-05-16 10:19:03', '2017-10-06 20:43:58'),
(7, 'google', '117693721220337704783', 'TUHIN SUBHRA', 'Patra', '', '', 'en-GB', 'https://lh3.googleusercontent.com/-G9inrPnP7DA/AAAAAAAAAAI/AAAAAAAAADQ/1sgIo9etYtw/s96-c/photo.jpg', '', '2017-05-17 17:16:54', '2017-05-17 19:11:04');

-- --------------------------------------------------------

--
-- Table structure for table `Users`
--

CREATE TABLE `Users` (
  `UserID` int(100) NOT NULL,
  `UserName` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `UserEmail` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CreatedDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Active` int(11) NOT NULL DEFAULT '1',
  `Password` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Stores all the users even inactive.';

--
-- Dumping data for table `Users`
--

INSERT INTO `Users` (`UserID`, `UserName`, `UserEmail`, `CreatedDate`, `Active`, `Password`) VALUES
(10, 'tuhin', 'tsubhrapatra@gmail.com', '2017-04-30 14:29:07', 1, '81dc9bdb52d04dc20036dbd8313ed055'),
(15, 'rama', 'rama@abc.com', '2017-04-30 23:17:35', 1, 'e04f28cc33cb20274dd3ff44e600a923'),
(19, 'Timothy', 'tim@othy.com', '2017-04-30 23:25:24', 1, 'e2fc714c4727ee9395f324cd2e7f331f'),
(20, 'Clara', 'clara@yahoo.in', '2017-05-01 08:45:42', 1, '23d1e10df85ef805b442a922b240ce25'),
(21, 'just_another_random_girl_from_brazil', 'hahahaha@hotmail.com', '2017-05-01 08:46:58', 1, '81dc9bdb52d04dc20036dbd8313ed055'),
(22, 'Dhanpat_Girija', 'dhanpat123@gmail.com', '2017-05-01 08:47:57', 0, 'bc49331238d0a7f225507996abd19f58'),
(23, 'Cios_Pro', 'ProAtWork@mydomain.com', '2017-05-01 08:48:54', 1, '81dc9bdb52d04dc20036dbd8313ed055'),
(26, 'bleach', 'tsp@tsp.com', '2017-05-01 14:34:28', 1, '902bcfe577b6644c4a7024c28fc3ec94'),
(27, 'jkl', 'jkl@jkl', '2017-05-01 14:37:37', 1, '202cb962ac59075b964b07152d234b70'),
(28, 'RK', 'rkapoor@gmail.com', '2017-05-01 14:43:27', 0, '202cb962ac59075b964b07152d234b70'),
(29, 'asd', 'asd@asd', '2017-05-01 14:48:23', 1, '202cb962ac59075b964b07152d234b70'),
(30, 'qwe', 'qwe@qwe.io', '2017-05-01 14:49:30', 1, '202cb962ac59075b964b07152d234b70'),
(31, 'greg', 'greg123456@yahoo.com', '2017-05-01 14:51:10', 1, '202cb962ac59075b964b07152d234b70'),
(32, 'aparajita', 'ap@gmail.com', '2017-05-05 13:03:05', 1, '81dc9bdb52d04dc20036dbd8313ed055'),
(33, 'uday_123', 'uday.chopra.1997@gmail.com', '2017-05-18 12:23:21', 1, '81dc9bdb52d04dc20036dbd8313ed055'),
(35, 'ajay_root', 'justanotheruser@gmail.com', '2017-05-18 13:43:34', 1, '81dc9bdb52d04dc20036dbd8313ed055'),
(36, 'bleacH', 'mynameistuhin_12.@com', '2017-10-07 11:35:11', 1, '202cb962ac59075b964b07152d234b70'),
(37, 'tuhin2', 'myame@gmail.com', '2017-10-11 13:43:24', 1, '97db1846570837fce6ff62a408f1c26a');

-- --------------------------------------------------------

--
-- Table structure for table `UserSocialInfo`
--

CREATE TABLE `UserSocialInfo` (
  `UserSocialInfoID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `UserFacebookHandle` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UserGoogleHandle` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UserTwitterHandle` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UserWebsite` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Activity`
--
ALTER TABLE `Activity`
  ADD PRIMARY KEY (`ActivityID`);

--
-- Indexes for table `ActivityType`
--
ALTER TABLE `ActivityType`
  ADD PRIMARY KEY (`ActivityTypeID`);

--
-- Indexes for table `ChatGroups`
--
ALTER TABLE `ChatGroups`
  ADD PRIMARY KEY (`ChatGroupsTableID`);

--
-- Indexes for table `ChatMessages`
--
ALTER TABLE `ChatMessages`
  ADD PRIMARY KEY (`ChatMessageID`);

--
-- Indexes for table `Comments`
--
ALTER TABLE `Comments`
  ADD PRIMARY KEY (`CommentID`),
  ADD UNIQUE KEY `CommentID` (`CommentID`),
  ADD UNIQUE KEY `CommentID_2` (`CommentID`);

--
-- Indexes for table `Followers`
--
ALTER TABLE `Followers`
  ADD PRIMARY KEY (`FollowersTableID`);

--
-- Indexes for table `PostDetails`
--
ALTER TABLE `PostDetails`
  ADD PRIMARY KEY (`PostDetailID`);

--
-- Indexes for table `Posts`
--
ALTER TABLE `Posts`
  ADD PRIMARY KEY (`PostID`);

--
-- Indexes for table `PostsTopics`
--
ALTER TABLE `PostsTopics`
  ADD PRIMARY KEY (`PostsTopicsID`);

--
-- Indexes for table `TopicFollowers`
--
ALTER TABLE `TopicFollowers`
  ADD PRIMARY KEY (`TopicFollowersID`);

--
-- Indexes for table `Topics`
--
ALTER TABLE `Topics`
  ADD PRIMARY KEY (`TopicID`);

--
-- Indexes for table `UserPersonalInfo`
--
ALTER TABLE `UserPersonalInfo`
  ADD PRIMARY KEY (`UserPersonalInfoID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `Users`
--
ALTER TABLE `Users`
  ADD PRIMARY KEY (`UserID`),
  ADD UNIQUE KEY `UserID` (`UserID`);

--
-- Indexes for table `UserSocialInfo`
--
ALTER TABLE `UserSocialInfo`
  ADD PRIMARY KEY (`UserSocialInfoID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Activity`
--
ALTER TABLE `Activity`
  MODIFY `ActivityID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ActivityType`
--
ALTER TABLE `ActivityType`
  MODIFY `ActivityTypeID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT for table `ChatGroups`
--
ALTER TABLE `ChatGroups`
  MODIFY `ChatGroupsTableID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;
--
-- AUTO_INCREMENT for table `ChatMessages`
--
ALTER TABLE `ChatMessages`
  MODIFY `ChatMessageID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;
--
-- AUTO_INCREMENT for table `Comments`
--
ALTER TABLE `Comments`
  MODIFY `CommentID` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `Followers`
--
ALTER TABLE `Followers`
  MODIFY `FollowersTableID` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;
--
-- AUTO_INCREMENT for table `PostDetails`
--
ALTER TABLE `PostDetails`
  MODIFY `PostDetailID` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;
--
-- AUTO_INCREMENT for table `Posts`
--
ALTER TABLE `Posts`
  MODIFY `PostID` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;
--
-- AUTO_INCREMENT for table `PostsTopics`
--
ALTER TABLE `PostsTopics`
  MODIFY `PostsTopicsID` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;
--
-- AUTO_INCREMENT for table `TopicFollowers`
--
ALTER TABLE `TopicFollowers`
  MODIFY `TopicFollowersID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT for table `Topics`
--
ALTER TABLE `Topics`
  MODIFY `TopicID` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `UserPersonalInfo`
--
ALTER TABLE `UserPersonalInfo`
  MODIFY `UserPersonalInfoID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `Users`
--
ALTER TABLE `Users`
  MODIFY `UserID` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;
--
-- AUTO_INCREMENT for table `UserSocialInfo`
--
ALTER TABLE `UserSocialInfo`
  MODIFY `UserSocialInfoID` int(11) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
