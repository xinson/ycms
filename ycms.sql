-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 2016-11-14 07:58:08
-- 服务器版本： 10.1.13-MariaDB
-- PHP Version: 5.6.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ycms`
--

-- --------------------------------------------------------

--
-- 表的结构 `ycms_admin`
--

CREATE TABLE `ycms_admin` (
  `adminid` mediumint(8) UNSIGNED NOT NULL,
  `adminname` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `groupid` mediumint(8) UNSIGNED DEFAULT '0',
  `super` smallint(2) UNSIGNED DEFAULT '0',
  `timeline` int(10) UNSIGNED DEFAULT '0',
  `flag` smallint(2) UNSIGNED DEFAULT '0',
  `logintimeline` int(10) UNSIGNED DEFAULT '0',
  `logintimes` int(10) UNSIGNED DEFAULT '0',
  `loginip` varchar(50) DEFAULT NULL,
  `memo` varchar(500) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ycms_admin`
--

INSERT INTO `ycms_admin` (`adminid`, `adminname`, `password`, `groupid`, `super`, `timeline`, `flag`, `logintimeline`, `logintimes`, `loginip`, `memo`) VALUES
(1, 'admin', '19e7d665ff5530bf4baf739cfc0d4447', 0, 1, 1478283705, 1, 1478396010, 23, '127.0.0.1', ''),
(12, 'xinson1', 'e10adc3949ba59abbe56e057f20f883e', 0, NULL, 1478285424, 1, 0, 0, NULL, ''),
(11, 'xinson', 'e10adc3949ba59abbe56e057f20f883e', 0, NULL, 1478284303, 1, 0, 0, NULL, '');

-- --------------------------------------------------------

--
-- 表的结构 `ycms_adsfigure`
--

CREATE TABLE `ycms_adsfigure` (
  `adsid` mediumint(8) UNSIGNED NOT NULL,
  `adsname` varchar(255) DEFAULT NULL,
  `zoneid` mediumint(8) UNSIGNED DEFAULT '0',
  `uploadfiles` varchar(255) DEFAULT NULL,
  `uploadfiles1` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `width` smallint(2) UNSIGNED DEFAULT '0',
  `height` smallint(2) UNSIGNED DEFAULT '0',
  `orders` mediumint(8) UNSIGNED DEFAULT '0',
  `flag` smallint(2) UNSIGNED DEFAULT '0',
  `content` text,
  `timeline` int(10) UNSIGNED DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ycms_adsfigure`
--

INSERT INTO `ycms_adsfigure` (`adsid`, `adsname`, `zoneid`, `uploadfiles`, `uploadfiles1`, `url`, `width`, `height`, `orders`, `flag`, `content`, `timeline`) VALUES
(11, '广告1', 1, 'thumb/adsfigure/201310/26/4aba8190d6e10d60f22e576b86d1b08b.jpg', '', '', 0, 0, 1, 1, '', 1380092747),
(10, '广告3', 1, 'thumb/adsfigure/201310/26/adfb1157cc10b378aa1ba961e659d224.jpg', '', '', 0, 0, 3, 1, '', 1378354250),
(8, '广告4', 1, 'thumb/adsfigure/201310/26/df641d483fb5ee20855ef942421d8dbc.jpg', '', '', 0, 0, 4, 1, '', 1378354118),
(9, '广告2', 1, 'thumb/adsfigure/201310/26/148ae6b1349ae9082b049e625c7696c0.jpg', '', '', 0, 0, 2, 1, '', 1378354227);

-- --------------------------------------------------------

--
-- 表的结构 `ycms_adszone`
--

CREATE TABLE `ycms_adszone` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `zonename` varchar(255) DEFAULT NULL,
  `orders` mediumint(8) UNSIGNED DEFAULT '0',
  `flag` smallint(2) UNSIGNED DEFAULT '0',
  `intro` varchar(500) DEFAULT NULL,
  `width` smallint(5) UNSIGNED DEFAULT '0',
  `height` smallint(5) UNSIGNED DEFAULT '0',
  `timeline` int(10) UNSIGNED DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ycms_adszone`
--

INSERT INTO `ycms_adszone` (`id`, `zonename`, `orders`, `flag`, `intro`, `width`, `height`, `timeline`) VALUES
(1, '首页广告', 1, 1, '', 1440, 500, 0);

-- --------------------------------------------------------

--
-- 表的结构 `ycms_authgroup`
--

CREATE TABLE `ycms_authgroup` (
  `groupid` mediumint(8) UNSIGNED NOT NULL,
  `groupname` varchar(50) DEFAULT NULL,
  `auths` text,
  `flag` smallint(2) UNSIGNED DEFAULT '0',
  `timeline` int(10) UNSIGNED DEFAULT '0',
  `orders` smallint(2) UNSIGNED DEFAULT '0',
  `intro` varchar(500) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ycms_config`
--

CREATE TABLE `ycms_config` (
  `sitename` varchar(255) DEFAULT NULL,
  `sitetitle` varchar(255) DEFAULT NULL,
  `siteurl` varchar(255) DEFAULT NULL,
  `cssurl` varchar(255) NOT NULL,
  `metadescription` varchar(500) DEFAULT NULL,
  `metakeyword` varchar(500) DEFAULT NULL,
  `sitecopyright` text,
  `icpcode` varchar(255) DEFAULT NULL,
  `tjcode` text,
  `tjurl` varchar(50) NOT NULL,
  `weibourl` varchar(50) NOT NULL,
  `cachstatus` smallint(2) UNSIGNED DEFAULT '0',
  `cachtime` mediumint(8) UNSIGNED DEFAULT '0',
  `maxthumbwidth` varchar(20) NOT NULL,
  `maxthumbheight` varchar(20) NOT NULL,
  `thumbwidth` varchar(20) NOT NULL,
  `thumbheight` varchar(20) NOT NULL,
  `newthumbwidth` varchar(20) NOT NULL,
  `newthumbheight` varchar(20) NOT NULL,
  `productthumbwidth` varchar(20) NOT NULL,
  `productthumbheight` varchar(20) NOT NULL,
  `honorthumbwidth` varchar(20) NOT NULL,
  `address` varchar(30) NOT NULL,
  `phone` varchar(30) NOT NULL,
  `fax` varchar(30) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ycms_config`
--

INSERT INTO `ycms_config` (`sitename`, `sitetitle`, `siteurl`, `cssurl`, `metadescription`, `metakeyword`, `sitecopyright`, `icpcode`, `tjcode`, `tjurl`, `weibourl`, `cachstatus`, `cachtime`, `maxthumbwidth`, `maxthumbheight`, `thumbwidth`, `thumbheight`, `newthumbwidth`, `newthumbheight`, `productthumbwidth`, `productthumbheight`, `honorthumbwidth`, `address`, `phone`, `fax`) VALUES
('大渔电商', '致力于高端的信息化服务|网页设计|网站推广|网店运营-大渔点商', 'http://www.dayu8.com', 'http://www.dayu8.com', '广州大渔点高是一家专注高端网页设计，网络营销推广，平面设计，网店运营托管的电高公司，我们致力于以品牌为导向，为客户提供具有价值性的高端的信息化服务', '广州网页设计，广州网络营销推广，广州网店托管运营，广州平面设计', 'Copyright © 2006-2014 广州思纬文化传播有限公司  保留公司所有权利', '粤ICP备08122113号-2', '', 'http://www.swcn.net.cn/', 'http://www.weibo.com/', 0, 6000000, '2000', '768', '120', '160', '100', '100', '422', '240', '', '广州市天河区中山大道中138号汇勤商业大厦605-608', '020-82529502', '020-8232 8192 转 8002 ');

-- --------------------------------------------------------

--
-- 表的结构 `ycms_guestbook`
--

CREATE TABLE `ycms_guestbook` (
  `bookid` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `bookuser` varchar(255) DEFAULT NULL,
  `gender` smallint(2) UNSIGNED DEFAULT '0',
  `jobs` varchar(50) DEFAULT NULL,
  `telephone` varchar(255) DEFAULT NULL,
  `fax` varchar(255) DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `qqmsn` varchar(255) DEFAULT NULL,
  `companyname` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `trade` varchar(255) DEFAULT NULL,
  `homepage` varchar(255) DEFAULT NULL,
  `content` text,
  `booktimeline` int(10) UNSIGNED DEFAULT '0',
  `ip` varchar(50) DEFAULT NULL,
  `flag` smallint(2) UNSIGNED DEFAULT '0',
  `replyuser` varchar(50) DEFAULT NULL,
  `replytimeline` int(10) UNSIGNED DEFAULT '0',
  `replycontent` text
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ycms_link`
--

CREATE TABLE `ycms_link` (
  `linkid` mediumint(8) UNSIGNED NOT NULL,
  `linktitle` varchar(255) DEFAULT NULL,
  `fontcolor` varchar(50) DEFAULT NULL,
  `linkurl` varchar(255) DEFAULT NULL,
  `linktype` smallint(2) UNSIGNED DEFAULT '0',
  `logoimg` varchar(255) DEFAULT NULL,
  `timeline` int(10) UNSIGNED DEFAULT '0',
  `flag` smallint(2) UNSIGNED DEFAULT '0',
  `intro` varchar(255) DEFAULT NULL,
  `orders` smallint(2) UNSIGNED DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ycms_log`
--

CREATE TABLE `ycms_log` (
  `logid` int(10) UNSIGNED NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `ip` varchar(50) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `logtype` smallint(2) UNSIGNED DEFAULT '0',
  `timeline` int(10) UNSIGNED DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ycms_log`
--

INSERT INTO `ycms_log` (`logid`, `username`, `ip`, `content`, `logtype`, `timeline`) VALUES
(1, 'admin', '127.0.0.1', '登录后台成功', 1, 1478187776),
(2, 'admin', '127.0.0.1', '登录后台成功', 1, 1478188351),
(3, 'admin', '127.0.0.1', '登录后台成功', 1, 1478188601),
(4, 'admin', '127.0.0.1', '退出后台管理', 2, 1478223479),
(5, 'admin', '127.0.0.1', '登录后台成功', 1, 1478223485),
(6, 'admin', '127.0.0.1', '编辑管理用户[1]', 1, 1478280191),
(7, 'admin', '127.0.0.1', '编辑管理用户[1]', 1, 1478280261),
(8, 'admin', '127.0.0.1', '编辑管理用户[1]', 1, 1478280304),
(9, 'admin', '127.0.0.1', '添加管理用户[xinson]', 1, 1478281739),
(10, 'admin', '127.0.0.1', '编辑管理用户[1]', 1, 1478281751),
(11, 'admin', '127.0.0.1', '编辑管理用户[1]', 1, 1478283689),
(12, 'admin', '127.0.0.1', '编辑管理用户[1]', 1, 1478283705),
(13, 'admin', '127.0.0.1', '编辑用户密码[admin]', 1, 1478283910),
(14, 'admin', '127.0.0.1', '添加管理用户[xinson]', 1, 1478284303),
(15, 'admin', '127.0.0.1', '添加管理用户[xinson1]', 1, 1478285424),
(16, 'admin', '127.0.0.1', '编辑授权[10]', 1, 1478289566),
(17, 'admin', '127.0.0.1', '编辑授权[1]', 1, 1478289591),
(18, 'admin', '127.0.0.1', '编辑授权[1]', 1, 1478289639),
(19, 'admin', '127.0.0.1', '编辑授权[1]', 1, 1478289650),
(20, 'admin', '127.0.0.1', '退出后台管理', 2, 1478290222),
(21, 'admin', '127.0.0.1', '登录后台成功', 1, 1478290451),
(22, 'admin', '127.0.0.1', '退出后台管理', 2, 1478291200),
(23, 'admin', '127.0.0.1', '登录后台成功', 1, 1478396010),
(24, 'admin', '127.0.0.1', '编辑授权[]', 1, 1478399086),
(25, 'admin', '127.0.0.1', '编辑授权[]', 1, 1478399148);

-- --------------------------------------------------------

--
-- 表的结构 `ycms_new`
--

CREATE TABLE `ycms_new` (
  `infoid` mediumint(8) UNSIGNED NOT NULL,
  `cateid` mediumint(8) UNSIGNED DEFAULT '0',
  `title` varchar(255) DEFAULT NULL,
  `thumbfiles` varchar(255) DEFAULT NULL,
  `uploadfiles` varchar(255) DEFAULT NULL,
  `content` text,
  `summary` varchar(255) NOT NULL,
  `timeline` int(10) UNSIGNED DEFAULT '0',
  `releasetime` varchar(25) NOT NULL,
  `flag` smallint(2) UNSIGNED DEFAULT '0',
  `top` smallint(2) UNSIGNED DEFAULT '0',
  `hot` smallint(2) UNSIGNED DEFAULT '0',
  `orders` mediumint(8) UNSIGNED DEFAULT '10',
  `metatitle` varchar(255) DEFAULT NULL,
  `metakeyword` varchar(255) DEFAULT NULL,
  `metadescription` varchar(255) DEFAULT NULL,
  `come` varchar(15) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ycms_newcate`
--

CREATE TABLE `ycms_newcate` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `catename` varchar(50) DEFAULT NULL,
  `encatename` varchar(50) DEFAULT NULL,
  `metatitle` char(255) DEFAULT NULL,
  `metakeyword` char(255) DEFAULT NULL,
  `metadescription` char(255) DEFAULT NULL,
  `orders` mediumint(8) UNSIGNED DEFAULT '0',
  `flag` smallint(2) UNSIGNED DEFAULT '0',
  `intro` char(255) DEFAULT NULL,
  `timeline` int(10) UNSIGNED DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ycms_page`
--

CREATE TABLE `ycms_page` (
  `pageid` mediumint(8) UNSIGNED NOT NULL,
  `cateid` mediumint(8) UNSIGNED DEFAULT '0',
  `title` char(100) DEFAULT NULL,
  `entitle` char(100) DEFAULT NULL,
  `content` text,
  `flag` smallint(2) UNSIGNED DEFAULT '0',
  `orders` mediumint(8) UNSIGNED DEFAULT '10',
  `timeline` int(10) UNSIGNED DEFAULT '0',
  `metatitle` char(255) NOT NULL,
  `metakeyword` char(255) DEFAULT NULL,
  `metadescription` char(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ycms_pagecate`
--

CREATE TABLE `ycms_pagecate` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `catename` char(50) DEFAULT NULL,
  `metatitle` char(255) DEFAULT NULL,
  `metakeyword` char(255) DEFAULT NULL,
  `metadescription` char(255) DEFAULT NULL,
  `orders` smallint(2) UNSIGNED DEFAULT '0',
  `flag` smallint(2) UNSIGNED DEFAULT '0',
  `intro` char(255) DEFAULT NULL,
  `timeline` int(10) UNSIGNED DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ycms_product`
--

CREATE TABLE `ycms_product` (
  `infoid` mediumint(8) UNSIGNED NOT NULL,
  `cateid` mediumint(8) UNSIGNED DEFAULT '0',
  `title` varchar(255) DEFAULT NULL,
  `thumbfiles` varchar(255) DEFAULT NULL,
  `uploadfiles` varchar(255) DEFAULT NULL,
  `summary` varchar(255) NOT NULL,
  `content` text,
  `timeline` int(10) UNSIGNED DEFAULT '0',
  `flag` smallint(2) UNSIGNED DEFAULT '0',
  `top` smallint(2) UNSIGNED DEFAULT '0',
  `hot` smallint(2) UNSIGNED DEFAULT '0',
  `orders` mediumint(8) UNSIGNED DEFAULT '10',
  `price` varchar(10) DEFAULT NULL,
  `number` mediumint(6) NOT NULL,
  `url` varchar(255) NOT NULL,
  `metatitle` varchar(255) DEFAULT NULL,
  `metakeyword` varchar(255) DEFAULT NULL,
  `metadescription` varchar(255) DEFAULT NULL,
  `come` varchar(15) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ycms_product`
--

INSERT INTO `ycms_product` (`infoid`, `cateid`, `title`, `thumbfiles`, `uploadfiles`, `summary`, `content`, `timeline`, `flag`, `top`, `hot`, `orders`, `price`, `number`, `url`, `metatitle`, `metakeyword`, `metadescription`, `come`) VALUES
(1, 0, '6d3cf06b5967ce31547d0ef751859427', NULL, NULL, '', NULL, 1481697900, 1, 0, 0, 10, NULL, 0, '', NULL, NULL, NULL, ''),
(2, 0, 'daf656ae93d6cf078b7d870ed382c432', NULL, NULL, '', NULL, 1478311494, 0, 0, 0, 10, NULL, 0, '', NULL, NULL, NULL, ''),
(3, 0, 'd3592dc2a3f00c0f982a1c0a00ed302c', NULL, NULL, '', NULL, 1478312350, 0, 0, 0, 10, NULL, 0, '', NULL, NULL, NULL, ''),
(4, 0, '98293e8342e7360d75d6236dafc405cd', NULL, NULL, '', NULL, 1, 0, 0, 0, 10, NULL, 0, '', NULL, NULL, NULL, ''),
(5, 0, '4930675e00669a21ef6f15bc68a820ed', NULL, NULL, '', NULL, 1478892028, 0, 0, 0, 10, NULL, 0, '', NULL, NULL, NULL, ''),
(6, 0, '0e78a1034f2544034e5b2701a5d2a60c', NULL, NULL, '', NULL, 1478892046, 0, 0, 0, 10, NULL, 0, '', NULL, NULL, NULL, ''),
(7, 0, 'f5bef29887fece1b59253de8d3a59ff2', NULL, NULL, '', NULL, 1478892048, 0, 0, 0, 10, NULL, 0, '', NULL, NULL, NULL, ''),
(8, 0, 'ea3ed3a75c16d34012532205ce03494d', NULL, NULL, '', NULL, 1478892048, 0, 0, 0, 10, NULL, 0, '', NULL, NULL, NULL, ''),
(9, 0, '089ef015efded02ad07bbc4dfe942204', NULL, NULL, '', NULL, 1478892048, 0, 0, 0, 10, NULL, 0, '', NULL, NULL, NULL, ''),
(10, 0, 'a90679917ae15959c4ee3f510ed00234', NULL, NULL, '', NULL, 2016, 0, 0, 0, 10, NULL, 0, '', NULL, NULL, NULL, ''),
(11, 0, 'cab05ac044ece1ec04c16e80eaa25232', NULL, NULL, '', NULL, 1478892049, 0, 0, 0, 10, NULL, 0, '', NULL, NULL, NULL, ''),
(12, 0, '8ef2a3b3af2c6628f1db545e9e59411c', NULL, NULL, '', NULL, 1478892049, 0, 0, 0, 10, NULL, 0, '', NULL, NULL, NULL, ''),
(13, 0, 'a258d9e2ffef11e429d1481f77ca08f5', NULL, NULL, '', NULL, 1478892049, 0, 0, 0, 10, NULL, 0, '', NULL, NULL, NULL, ''),
(14, 0, '7fa96d8a777cef36ab69e138119875c3', NULL, NULL, '', NULL, 1478892049, 0, 0, 0, 10, NULL, 0, '', NULL, NULL, NULL, ''),
(15, 0, '4c08ce1c07a682f5453b4f5fcd05185e', NULL, NULL, '', NULL, 1478892050, 0, 0, 0, 10, NULL, 0, '', NULL, NULL, NULL, ''),
(16, 0, '7af1d670e21cf12597db71068e7c1db7', NULL, NULL, '', NULL, 1478892050, 0, 0, 0, 10, NULL, 0, '', NULL, NULL, NULL, ''),
(17, 0, 'a2a3ca5225ae644db3716f2e07b2ab56', NULL, NULL, '', NULL, 1478892050, 0, 0, 0, 10, NULL, 0, '', NULL, NULL, NULL, ''),
(18, 0, 'a5a37f1cc2ed2465a993e71b0d7609b9', NULL, NULL, '', NULL, 1478892050, 0, 0, 0, 10, NULL, 0, '', NULL, NULL, NULL, ''),
(19, 0, '2477c441dfebac9aae2cab63f5a62e38', NULL, NULL, '', NULL, 1478892050, 0, 0, 0, 10, NULL, 0, '', NULL, NULL, NULL, ''),
(20, 0, 'd0f9c2f001fe20f93ae57cdac0badf51', NULL, NULL, '', NULL, 1478892051, 0, 0, 0, 10, NULL, 0, '', NULL, NULL, NULL, ''),
(21, 0, '29231a55b885d7b9eac948acbd3d910c', NULL, NULL, '', NULL, 1478892051, 0, 0, 0, 10, NULL, 0, '', NULL, NULL, NULL, ''),
(22, 0, 'ede2eb8dded31c37531c0b08669e42e0', NULL, NULL, '', NULL, 1478892051, 0, 0, 0, 10, NULL, 0, '', NULL, NULL, NULL, ''),
(23, 0, '3dfb56d18166eae604e57f63bbb75107', NULL, NULL, '', NULL, 1478892051, 0, 0, 0, 10, NULL, 0, '', NULL, NULL, NULL, ''),
(24, 0, 'd91bf96830640a00fae32efa5dbdeeb8', NULL, NULL, '', NULL, 1478892051, 0, 0, 0, 10, NULL, 0, '', NULL, NULL, NULL, ''),
(25, 0, '9d3a7de2f83eb3b3a71b26571ec1f497', NULL, NULL, '', NULL, 1478892052, 0, 0, 0, 10, NULL, 0, '', NULL, NULL, NULL, ''),
(26, 0, 'b885cb00afcb13554f97f3244448e2b2', NULL, NULL, '', NULL, 1478892052, 0, 0, 0, 10, NULL, 0, '', NULL, NULL, NULL, ''),
(27, 0, '6f9c8eaeae991ec61cb4bd13244ce857', NULL, NULL, '', NULL, 1478892052, 0, 0, 0, 10, NULL, 0, '', NULL, NULL, NULL, ''),
(28, 0, '80c873f73da2c1cfa30d8693dce76b6b', NULL, NULL, '', NULL, 1478892052, 0, 0, 0, 10, NULL, 0, '', NULL, NULL, NULL, ''),
(29, 0, 'cc135f8f614fc04355fed32d28fa2e4d', NULL, NULL, '', NULL, 1478892052, 0, 0, 0, 10, NULL, 0, '', NULL, NULL, NULL, ''),
(30, 0, 'c02d1791b27d8701ec4ac7b3397c129a', NULL, NULL, '', NULL, 1478892053, 0, 0, 0, 10, NULL, 0, '', NULL, NULL, NULL, ''),
(31, 0, 'f0631b5fe0dfbf0c81540762d0bdeb52', NULL, NULL, '', NULL, 1478892053, 0, 0, 0, 10, NULL, 0, '', NULL, NULL, NULL, ''),
(32, 0, '6d373ec00ad93121ff179a5502cd64f0', NULL, NULL, '', NULL, 1478892053, 0, 0, 0, 10, NULL, 0, '', NULL, NULL, NULL, ''),
(33, 0, 'dd806410bb68cdec7c987122f6408a3a', NULL, NULL, '', NULL, 1478892053, 0, 0, 0, 10, NULL, 0, '', NULL, NULL, NULL, ''),
(34, 0, '57cd4c2a633d2489b5a54bc2a192155d', NULL, NULL, '', NULL, 1478892053, 0, 0, 0, 10, NULL, 0, '', NULL, NULL, NULL, ''),
(35, 0, 'bcfd79adca8c69170264ab5952a11dac', NULL, NULL, '', NULL, 1478892054, 0, 0, 0, 10, NULL, 0, '', NULL, NULL, NULL, ''),
(36, 0, '36564a38e943721b2518d86343485473', NULL, NULL, '', NULL, 1478892054, 0, 0, 0, 10, NULL, 0, '', NULL, NULL, NULL, ''),
(37, 0, 'ffb5b1d103842e5cd412b751aeffae81', NULL, NULL, '', NULL, 1478892054, 0, 0, 0, 10, NULL, 0, '', NULL, NULL, NULL, ''),
(38, 0, 'c37fedb086c7a9076757dd1ca2534516', NULL, NULL, '', NULL, 1478892054, 0, 0, 0, 10, NULL, 0, '', NULL, NULL, NULL, ''),
(39, 0, '35bf1b97b87b4754e97cfc19142a1502', NULL, NULL, '', NULL, 1478892054, 0, 0, 0, 10, NULL, 0, '', NULL, NULL, NULL, ''),
(40, 0, '', NULL, NULL, '', NULL, 1479003571, 0, 0, 0, 10, NULL, 0, '', NULL, NULL, NULL, ''),
(41, 0, 'bbc4d6d6dfd2e6311d6c84f4fd8185a6', NULL, NULL, '', NULL, 1479003946, 0, 0, 0, 10, NULL, 0, '', NULL, NULL, NULL, '');

-- --------------------------------------------------------

--
-- 表的结构 `ycms_productcate`
--

CREATE TABLE `ycms_productcate` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `catename` varchar(50) DEFAULT NULL,
  `encatename` varchar(50) NOT NULL,
  `metatitle` char(255) DEFAULT NULL,
  `metakeyword` char(255) DEFAULT NULL,
  `metadescription` char(255) DEFAULT NULL,
  `orders` mediumint(8) UNSIGNED DEFAULT '0',
  `flag` smallint(2) UNSIGNED DEFAULT '0',
  `intro` char(255) DEFAULT NULL,
  `timeline` int(10) UNSIGNED DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ycms_admin`
--
ALTER TABLE `ycms_admin`
  ADD PRIMARY KEY (`adminid`),
  ADD KEY `flag` (`flag`),
  ADD KEY `groupid` (`groupid`);

--
-- Indexes for table `ycms_adsfigure`
--
ALTER TABLE `ycms_adsfigure`
  ADD PRIMARY KEY (`adsid`),
  ADD KEY `zoneid` (`zoneid`),
  ADD KEY `flag` (`flag`);

--
-- Indexes for table `ycms_adszone`
--
ALTER TABLE `ycms_adszone`
  ADD PRIMARY KEY (`id`),
  ADD KEY `flag` (`flag`);

--
-- Indexes for table `ycms_authgroup`
--
ALTER TABLE `ycms_authgroup`
  ADD PRIMARY KEY (`groupid`),
  ADD KEY `flag` (`flag`);

--
-- Indexes for table `ycms_guestbook`
--
ALTER TABLE `ycms_guestbook`
  ADD PRIMARY KEY (`bookid`);

--
-- Indexes for table `ycms_link`
--
ALTER TABLE `ycms_link`
  ADD PRIMARY KEY (`linkid`),
  ADD KEY `flag` (`flag`),
  ADD KEY `linktype` (`linktype`);

--
-- Indexes for table `ycms_log`
--
ALTER TABLE `ycms_log`
  ADD PRIMARY KEY (`logid`);

--
-- Indexes for table `ycms_new`
--
ALTER TABLE `ycms_new`
  ADD PRIMARY KEY (`infoid`),
  ADD KEY `cateid` (`cateid`),
  ADD KEY `flag` (`flag`);

--
-- Indexes for table `ycms_newcate`
--
ALTER TABLE `ycms_newcate`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders` (`orders`),
  ADD KEY `flag` (`flag`);

--
-- Indexes for table `ycms_page`
--
ALTER TABLE `ycms_page`
  ADD PRIMARY KEY (`pageid`),
  ADD KEY `cateid` (`cateid`),
  ADD KEY `flag` (`flag`),
  ADD KEY `orders` (`orders`);

--
-- Indexes for table `ycms_pagecate`
--
ALTER TABLE `ycms_pagecate`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ycms_product`
--
ALTER TABLE `ycms_product`
  ADD PRIMARY KEY (`infoid`),
  ADD KEY `cateid` (`cateid`),
  ADD KEY `flag` (`flag`);

--
-- Indexes for table `ycms_productcate`
--
ALTER TABLE `ycms_productcate`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders` (`orders`),
  ADD KEY `flag` (`flag`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `ycms_admin`
--
ALTER TABLE `ycms_admin`
  MODIFY `adminid` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- 使用表AUTO_INCREMENT `ycms_adsfigure`
--
ALTER TABLE `ycms_adsfigure`
  MODIFY `adsid` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- 使用表AUTO_INCREMENT `ycms_adszone`
--
ALTER TABLE `ycms_adszone`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- 使用表AUTO_INCREMENT `ycms_authgroup`
--
ALTER TABLE `ycms_authgroup`
  MODIFY `groupid` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `ycms_guestbook`
--
ALTER TABLE `ycms_guestbook`
  MODIFY `bookid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `ycms_link`
--
ALTER TABLE `ycms_link`
  MODIFY `linkid` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `ycms_log`
--
ALTER TABLE `ycms_log`
  MODIFY `logid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
--
-- 使用表AUTO_INCREMENT `ycms_new`
--
ALTER TABLE `ycms_new`
  MODIFY `infoid` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `ycms_newcate`
--
ALTER TABLE `ycms_newcate`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `ycms_page`
--
ALTER TABLE `ycms_page`
  MODIFY `pageid` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `ycms_pagecate`
--
ALTER TABLE `ycms_pagecate`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `ycms_product`
--
ALTER TABLE `ycms_product`
  MODIFY `infoid` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;
--
-- 使用表AUTO_INCREMENT `ycms_productcate`
--
ALTER TABLE `ycms_productcate`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
