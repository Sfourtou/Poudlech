-- MySQL dump 10.13  Distrib 5.6.31, for osx10.8 (x86_64)
--
-- Host: localhost    Database: symfony
-- ------------------------------------------------------
-- Server version	5.6.31

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `answers`
--

DROP TABLE IF EXISTS `answers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `answers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `question_id` int(11) DEFAULT NULL,
  `answer` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_50D0C606A76ED395` (`user_id`),
  KEY `IDX_50D0C6061E27F6BF` (`question_id`),
  CONSTRAINT `FK_50D0C6061E27F6BF` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`),
  CONSTRAINT `FK_50D0C606A76ED395` FOREIGN KEY (`user_id`) REFERENCES `fos_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `answers`
--

LOCK TABLES `answers` WRITE;
/*!40000 ALTER TABLE `answers` DISABLE KEYS */;
/*!40000 ALTER TABLE `answers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `defis`
--

DROP TABLE IF EXISTS `defis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `defis` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `place` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `points` int(11) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `defis`
--

LOCK TABLES `defis` WRITE;
/*!40000 ALTER TABLE `defis` DISABLE KEYS */;
INSERT INTO `defis` VALUES (1,'Test','Test','Test',10,'2016-09-28','2016-09-30');
/*!40000 ALTER TABLE `defis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fos_user`
--

DROP TABLE IF EXISTS `fos_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fos_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `team_id` int(11) DEFAULT NULL,
  `username` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `username_canonical` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `email_canonical` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `salt` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `locked` tinyint(1) NOT NULL,
  `expired` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  `confirmation_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password_requested_at` datetime DEFAULT NULL,
  `roles` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  `credentials_expired` tinyint(1) NOT NULL,
  `credentials_expire_at` datetime DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `first_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `is_team_leader` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_957A647992FC23A8` (`username_canonical`),
  UNIQUE KEY `UNIQ_957A6479A0D96FBF` (`email_canonical`),
  UNIQUE KEY `UNIQ_957A6479C05FB297` (`confirmation_token`),
  KEY `IDX_957A6479296CD8AE` (`team_id`),
  CONSTRAINT `FK_957A6479296CD8AE` FOREIGN KEY (`team_id`) REFERENCES `houses` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=94 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fos_user`
--

LOCK TABLES `fos_user` WRITE;
/*!40000 ALTER TABLE `fos_user` DISABLE KEYS */;
INSERT INTO `fos_user` VALUES (1,1,'Kougara','kougara','sebastien.fourtou@gmail.com','sebastien.fourtou@gmail.com',1,'oksrex98xdwks0k80kws0cocws00ggw','$2y$13$YGx6s/pbZZz6qPVwUF3k/e5hK/rBuInuekNyyFH.Pq2d.QVNnap/K','2016-09-29 14:18:44',0,0,NULL,NULL,NULL,'a:1:{i:0;s:10:\"ROLE_ADMIN\";}',0,NULL,'Fourtou','Sebastien',NULL),(3,2,'devmamba','devmamba','samy.benabderrahmane@epitech.eu','samy.benabderrahmane@epitech.eu',1,'36llm9qdjhs04w8wsc8wow00sssgww0','$2y$13$cpDQ1YaBKlbG9Khs0VsOlOTYwoFjynTDh818p9qaPlawruKdE0mKi','2016-09-26 17:24:04',0,0,NULL,NULL,NULL,'a:1:{i:0;s:10:\"ROLE_ADMIN\";}',0,NULL,'Ben','Samy',NULL),(4,NULL,'casius','casius','calixteb13@orange.fr','calixteb13@orange.fr',1,'6kw48fiq2bs44s8cscso0wwcg8gwwo4','$2y$13$fXhFomrZe07gpF1ynPhZNuS.N33E4AlWq/J.tQTAUj8nMoypYU3MO','2016-09-26 10:10:02',0,0,NULL,NULL,NULL,'a:0:{}',0,NULL,'Blasius','calixte',NULL),(5,NULL,'TristanBf','tristanbf','tristan.boeuf@live.fr','tristan.boeuf@live.fr',1,'av3tuzm7jtskc88w8cccgkwgg0os0kg','$2y$13$XEJLlvdrFPMR/EQm1geH8eyLPoUW09AhYnfCiAQhTjUlcOMiKQWDG','2016-09-26 10:21:50',0,0,NULL,NULL,NULL,'a:0:{}',0,NULL,'Boeuf','Tristan',NULL),(6,NULL,'Damien','damien','bonifaydamien@orange.fr','bonifaydamien@orange.fr',1,'36q2l9fv9lic00404so0kkscocwgw48','$2y$13$Kl/MzmPy/jqMnTYTbWOOY.tzxkYZDI0Orx.Fg1T6arfvK62h5SfY6','2016-09-26 10:23:26',0,0,NULL,NULL,NULL,'a:0:{}',0,NULL,'Bonifay','Damien',NULL),(7,NULL,'eloise04','eloise04','eloise04@live.fr','eloise04@live.fr',1,'nsow3m8xsnkcko4448s40gg08scoww8','$2y$13$pqYBASpU8F6hP34F7wnJju6o7X9wdQ.1oF0Q.rimBNAbAIslNXBJC','2016-09-26 10:37:50',0,0,NULL,NULL,NULL,'a:0:{}',0,NULL,'Boyer','Eloïse',NULL),(8,NULL,'Thomas','thomas','thomas.bultel@hotmail.fr','thomas.bultel@hotmail.fr',1,'sgbmq2qqdfk04so4c8kwcg4okscokwk','$2y$13$kS.oym1vQuNw9g8DN3iZaeCrD2taDV7hf6WL/nEADFbdKGmpFmLyO','2016-09-26 10:46:00',0,0,NULL,NULL,NULL,'a:0:{}',0,NULL,'Thomas','Bultel',NULL),(9,NULL,'nils','nils','nilscambreleng@gmail.com','nilscambreleng@gmail.com',1,'jztel9r8c6oo0cgcwo8oc0ksosowcgo','$2y$13$ARvm/bAE0RKHEOBmWMvtbe7ZRH0zO90C5kBm4bNLSbqjY6pC7C6He','2016-09-26 10:56:49',0,0,NULL,NULL,NULL,'a:0:{}',0,NULL,'cambreleng','nils',NULL),(10,NULL,'willy13or','willy13or','willy13or.wessler@gmail.com','willy13or.wessler@gmail.com',1,'du8ubiw2m7swosck8g08gk04ogoog8s','$2y$13$/iuy1s0m6YVZBaQJcnLgJeB5oqvF6U3nF3Mtp2XW8tsBn33//TOBm','2016-09-26 11:05:04',0,0,NULL,NULL,NULL,'a:0:{}',0,NULL,'wessler','william',NULL),(11,NULL,'Chabs','chabs','naimchabane@outlook.com','naimchabane@outlook.com',1,'9zgibh5fqowksc4og8g4ggsgcw48kgw','$2y$13$pq6whRxQfPOajAeteyCvVeRts4KRHbLK4LXRDZVcZ5XqDqe0NxW7C','2016-09-26 11:15:34',0,0,NULL,NULL,NULL,'a:0:{}',0,NULL,'Chabane','Naim',NULL),(12,NULL,'firefloc','firefloc','chabot.florian1@gmail.com','chabot.florian1@gmail.com',1,'tqzlidjilm8s4s88w8s8000coo8wcw8','$2y$13$eHpLGxbtPF5tkeEbYT7PieX.hGq5SsG5QBb3IdDAgEeSirsQt69S2','2016-09-26 11:30:20',0,0,NULL,NULL,NULL,'a:0:{}',0,NULL,'chabot','florian',NULL),(13,NULL,'Mourad','mourad','mourad.boutar@gmail.com','mourad.boutar@gmail.com',1,'lacsq3cot40k4sgkoss0sooskg0sk0w','$2y$13$8oPoGyFtL5xb2pdV4ihBUukjjN3h6cl45pScOZPAQzESDJTrI3TYO','2016-09-26 11:39:43',0,0,NULL,NULL,NULL,'a:0:{}',0,NULL,'Boutar','boutar',NULL),(14,NULL,'mistralaix','mistralaix','cchaillan@gmail.com','cchaillan@gmail.com',1,'hpa18enao740044oc8kskc0wo0kogsk','$2y$13$6FQXzmnmxNxsltBENfr/EehyDh/Wk7oCLWDbef5N8D2JfOEnTynHi','2016-09-26 11:46:56',0,0,NULL,NULL,NULL,'a:0:{}',0,NULL,'chaillan','cyril',NULL),(15,NULL,'AlexDahan2','alexdahan2','alexande.dahan2406@hotmail.fr','alexande.dahan2406@hotmail.fr',1,'tdf3na6f82ogckoo804ooww4os4ocso','$2y$13$XVIMvekbELK4qwipd1EOmO7I9VonpMAPYzI/ywrlK.uAIJlAOJ0rK','2016-09-26 12:00:20',0,0,NULL,NULL,NULL,'a:0:{}',0,NULL,'dahan','alexandre',NULL),(16,NULL,'stun3r','stun3r','thibaut.david@epitech.eu','thibaut.david@epitech.eu',1,'fqc7owzqrzco4scckkwo08s0800kskg','$2y$13$v9AV5ObXu6ltsL5pbGrKAe4BC7Cdv9iqlQ7ABQ9bMXVNZUKTKmCoK','2016-09-26 13:37:14',0,0,NULL,NULL,NULL,'a:0:{}',0,NULL,'Thibaut','DAVID',NULL),(17,NULL,'dadou2910','dadou2910','david.assolen@epitech.eu','david.assolen@epitech.eu',1,'ovf2gnlsnv4cwg4000wkckg8k0ws40g','$2y$13$YtrgYPAd59w2pUePToQbp.UtKMXEGLpAIylli6v/NaFKlnULiGjDO','2016-09-26 13:38:36',0,0,NULL,NULL,NULL,'a:0:{}',0,NULL,'assolen','david',NULL),(18,NULL,'TenThousand','tenthousand','jeremiah.deboulet@epitech.eu','jeremiah.deboulet@epitech.eu',1,'sdzg8ygmz9wswswgc8gogscc8cscg0c','$2y$13$dRreYg81r50PNxBe9hzvdOAJMev7.wb0LL43Go6IbuE/PKrEcDwLO','2016-09-26 13:40:47',0,0,NULL,NULL,NULL,'a:0:{}',0,NULL,'deboulet','jeremiah',NULL),(19,NULL,'Asbethe','asbethe','gaultier.del-guerra@epitech.eu','gaultier.del-guerra@epitech.eu',1,'qdcc9i1sf284oooksoc4ksw8wgc88wk','$2y$13$WOZLTYV9QMpa01dYIf3Jz.B7fpoNyFVUD7MmBiRNnW6sOOCWLCfra','2016-09-26 13:42:47',0,0,NULL,NULL,NULL,'a:0:{}',0,NULL,'Del Guerra','Gaultier',NULL),(20,NULL,'sezertony','sezertony','demir1349@hotmail.com','demir1349@hotmail.com',1,'ticu7u42dlwws0wcoswwoowcs0k0o8c','$2y$13$e301GOUuyneLiD8WHyyGcenD3MWAPUTTwhw7FIEGi9N7/anQsJadi','2016-09-26 13:51:01',0,0,NULL,NULL,NULL,'a:0:{}',0,NULL,'sezer','demir',NULL),(21,NULL,'Imlash_Sylmaryl','imlash_sylmaryl','clayton83136@gmail.com','clayton83136@gmail.com',1,'36dgp49uvxs0owscog8gwc848gk4ow4','$2y$13$zEZa/ukykuWuRy5DzCcjdO4SqQejN4KAL/9fxMkr5BXvKeojIDSbi','2016-09-26 14:17:41',0,0,NULL,NULL,NULL,'a:0:{}',0,NULL,'DESPRES','Nathan',NULL),(22,NULL,'vercingetorix','vercingetorix','nathandouillet@gmail.com','nathandouillet@gmail.com',1,'3otfibl5ep0kkckkgcw4s8wck48wo80','$2y$13$VNqL2/Wg65C034UQnoy7Pe9m5QhxrLFKl9JNAdpPnGYfgxhXIapPq','2016-09-26 14:17:42',0,0,NULL,NULL,NULL,'a:0:{}',0,NULL,'douillet','nathan',NULL),(23,NULL,'GentleSpy','gentlespy','gentlementlespy@gmail.com','gentlementlespy@gmail.com',1,'ax7882w8etk4c4ocscscwgw4ggk0owk','$2y$13$teU95dRrtAa/oPCR1SC/yOoO/SnHvv4o7gBpiumK32OdMqwEs95Eq','2016-09-26 14:29:32',0,0,NULL,NULL,NULL,'a:0:{}',0,NULL,'Dreyer','Anthony',NULL),(24,NULL,'LudovicDussaud','ludovicdussaud','ludovic.dussaud@yahoo.fr','ludovic.dussaud@yahoo.fr',1,'85r5y8dugp0ks88sscgwk4wsgcg8c4g','$2y$13$sZ3q0SLxDF.C6YqvD..xzuX9rgLC/T3kJgweZ00QIXC4qJyzDre6m','2016-09-26 14:34:19',0,0,NULL,NULL,NULL,'a:0:{}',0,NULL,'Dussaud','Ludovic',NULL),(25,NULL,'K.elasli','k.elasli','k.elsli@icloud.fr','k.elsli@icloud.fr',1,'36bcvs078uyo4w0g0ksos4o8ggwww4w','$2y$13$qe8HLhQM/wj2qbU9d0ptue/0EEfeHcMwGOcyVtAdvEz/E/yc5c586','2016-09-26 14:38:30',0,0,NULL,NULL,NULL,'a:0:{}',0,NULL,'El asli','Karim',NULL),(26,NULL,'gstar10','gstar10','ch-emmanuelli@hotmail.fr','ch-emmanuelli@hotmail.fr',1,'9qhd4d17d9gksgcsk8cwc0scksg088c','$2y$13$95WQpLN3YSEDwZr.qu7T5ugxlfL5kj32rJVWEfiLfmg5LTSN3tO6a','2016-09-26 14:46:53',0,0,NULL,NULL,NULL,'a:0:{}',0,NULL,'emmanuelli','charles-hervé',NULL),(27,NULL,'Filo13','filo13','nathan.filo13@gmail.com','nathan.filo13@gmail.com',1,'8riyupp29b0gwog8wkg80gc0s0o00ow','$2y$13$8xaJ1I2Bq8RZWzsRiSk1iu3cMqbRY0EQDrUvLolf1qjbHyIwwaWMu','2016-09-26 14:51:36',0,0,NULL,NULL,NULL,'a:0:{}',0,NULL,'Nathan','Filleau',NULL),(28,NULL,'Théry','théry','thery13@live.fr','thery13@live.fr',1,'n3e4u33hc34skoccgso4488o4kwk0ko','$2y$13$YRDgNjCwQklNF32UqkKVuu/x9ZlVlqhlRZWNDcQoSY4m.6TBfeh8C','2016-09-26 14:57:27',0,0,NULL,NULL,NULL,'a:0:{}',0,NULL,'Fouchter','Théry',NULL),(29,NULL,'angelo','angelo','gallicalexandre1@gmail.com','gallicalexandre1@gmail.com',1,'qlvp1q3agtcgw088so80ws0k880wgok','$2y$13$mTQpVBmRu2RgFNvv74A90.ueatCZKAJxe/lJ7ir1yJVuEKKtd13me','2016-09-26 15:04:21',0,0,NULL,NULL,NULL,'a:0:{}',0,NULL,'Alexandre','Gallic',NULL),(30,NULL,'macutaine','macutaine','galzotpierre@gmail.com','galzotpierre@gmail.com',1,'ht2cpyw0ofco8w8g880k0wg4kckg4oo','$2y$13$9YsSPMwbfjhWTJdWu6s3IewIVaDwR9lC3XgI47NjY4VlqUQBYnSZS','2016-09-26 15:12:14',0,0,NULL,NULL,NULL,'a:0:{}',0,NULL,'galzot','pierre',NULL),(31,NULL,'TheBed','thebed','olivier.telouk@gmail.com','olivier.telouk@gmail.com',1,'b6nryodfr0o4g8o8ksw4w8cggw04ck4','$2y$13$zAmZ9OOtsuUDcw5hpi7GK.Ix6vvVJ3ex0Zc4afDlEv6HElHjW1CTW','2016-09-26 15:24:18',0,0,NULL,NULL,NULL,'a:0:{}',0,NULL,'Telouk','Olivier',NULL),(32,NULL,'rem13mars','rem13mars','remi13012@live.fr','remi13012@live.fr',1,'emrdxmqzou804s0g0s0c8ckwkocwog4','$2y$13$yYTzmD.gEDe2vtsdRlaOa.n5997p9C8OPxhjigIlTqwkJ1CLAx15W','2016-09-26 15:33:48',0,0,NULL,NULL,NULL,'a:0:{}',0,NULL,'GARGUILO','Rémi',NULL),(33,NULL,'Noctis','noctis','gioaucard7@gmail.com','gioaucard7@gmail.com',1,'8q03lyjrt604o4s4cg0osskcgkwwsgg','$2y$13$HPybbgxegqCYMNDHfIWs/.Mpyowm2juNfp8iIsexLH69vkNLepiTi','2016-09-26 15:41:50',0,0,NULL,NULL,NULL,'a:0:{}',0,NULL,'Giovanni','Genovese Constaratas',NULL),(34,NULL,'PhenX','phenx','jeff.g324@gmail.com','jeff.g324@gmail.com',1,'id3sjo4czu8s0w444ok0ggs0s0oocsk','$2y$13$DuMLMDV65tndQCTLKBZr4eS7b53MpctIQZUQavOPGW2xkknkEcczm','2016-09-26 16:14:14',0,0,NULL,NULL,NULL,'a:0:{}',0,NULL,'Giglio','Jean-François',NULL),(35,NULL,'Elydrid','elydrid','valkirie25@gmail.com','valkirie25@gmail.com',1,'icvox2952800wc844ck4owck8scocsc','$2y$13$.GClJDbP1dnPjfKT1VpRIetznb49S4S41eRvrinBF.RYcJnF4co22','2016-09-26 16:12:20',0,0,NULL,NULL,NULL,'a:0:{}',0,NULL,'Valentin','Grandjean',NULL),(36,NULL,'noé','noé','de_maniac@outlook.fr','de_maniac@outlook.fr',1,'80jfwttom8sg4wkwsoww88sgswo8o44','$2y$13$mJLu1kGg1UpV8qobA4cPauyhcyy8ngnGbD6eydvu4j/W97qtLOASO','2016-09-26 16:16:35',0,0,NULL,NULL,NULL,'a:0:{}',0,NULL,'guillemin','noé',NULL),(37,NULL,'Creepy','creepy','diane.guillot@hotmail.fr','diane.guillot@hotmail.fr',1,'35yg1yrdc0mckk80wgo0wooo4ccwsog','$2y$13$3qrPV1Midf5NefhnEj5wKO5reLl3jljpzlEifKNDz/Ds4aU.ooWl2','2016-09-26 16:29:50',0,0,NULL,NULL,NULL,'a:0:{}',0,NULL,'Diane','Guillot',NULL),(38,NULL,'lesudiste','lesudiste','ni.hebequet@laposte.net','ni.hebequet@laposte.net',1,'qo5asnopmiow0kss8cs4ww08oo8oocc','$2y$13$bfrSYiUr8Z0ybTO44xEYjuINjSA1CVijqm1aZUmBfPtzkNi9C29Ma','2016-09-26 16:36:29',0,0,NULL,NULL,NULL,'a:0:{}',0,NULL,'Nicolas','Hebequet',NULL),(39,3,'pamplemousse','pamplemousse','nicolas.marchal@epitech.eu','nicolas.marchal@epitech.eu',1,'t0p284j1ao0w8sos84ccw4sw0gkgc0k','$2y$13$UlGVvh/45CmrOJNWWICx9eX4hwT8BB4KMhy7hqHdO0BGfyeFjKzdG','2016-09-26 17:16:52',0,0,NULL,NULL,NULL,'a:1:{i:0;s:10:\"ROLE_ADMIN\";}',0,NULL,'marchal','nicolas',NULL),(40,NULL,'Laegan','laegan','quentfsh@live.fr','quentfsh@live.fr',1,'raw2sz7hdc04s8swwgwo0w8sk8484kw','$2y$13$z6RuJvEOK.4YWv4Tm44KmOpVkhoPhHKLPXfXMb/BUFlu5x6Y1ywRu','2016-09-27 09:13:28',0,0,NULL,NULL,NULL,'a:0:{}',0,NULL,'Quentin','Heraud',NULL),(41,NULL,'Cedric','cedric','cedric.hourcade1@gmail.com','cedric.hourcade1@gmail.com',1,'raugxmg0w9w4c0cs0soco0gocko08ko','$2y$13$hOLh2CLqljIBE4VtEDeAg.ZN2KGT1i2TdORU51ZWiq271RUVB56wa','2016-09-27 09:19:02',0,0,NULL,NULL,NULL,'a:0:{}',0,NULL,'Hourcade','Cédric',NULL),(42,NULL,'hamuto','hamuto','miout-13@hotmai.fr','miout-13@hotmai.fr',1,'tt0m7if8vfkg80oooo48484o4ow4o0w','$2y$13$0NkOihsjHF.w1/XOx4gVWOegxpVavB3Iwzp/GgKSayzg/P3bTg8YC','2016-09-27 09:31:07',0,0,NULL,NULL,NULL,'a:0:{}',0,NULL,'Ince','Hamza',NULL),(43,NULL,'dreamkine','dreamkine','sophie.juniet@gmail.com','sophie.juniet@gmail.com',1,'hdnr2rdid2go88wsg4owk4c4so88soc','$2y$13$sjyRr3rFHbfB5sjN9biI/euCRRjlz2o8UD9FLvkhZbkkJ8o3uGFd.','2016-09-27 09:38:33',0,0,NULL,NULL,NULL,'a:0:{}',0,NULL,'Juniet','Sophie',NULL),(45,NULL,'Nico_lrnt','nico_lrnt','nicolas-laurent@outlook.fr','nicolas-laurent@outlook.fr',1,'4w6jt2xxz3eokss4o0kcsocco08ggg8','$2y$13$sYUmdmZJrHH7r5p/ouyTY.Zs/OyqVtCjjLa2iBGPPhN//I4niyNfm','2016-09-27 10:01:09',0,0,NULL,NULL,NULL,'a:0:{}',0,NULL,'Laurent','Nicolas',NULL),(46,NULL,'attoms','attoms','bonjourau@aol.fr','bonjourau@aol.fr',1,'455nebpx6syskckwo0goko4kw844ggk','$2y$13$3Y8JpoBh1AkAw.i26mPgVuyw7ItjFPhMEdgV.KTLM1m6lLhu/sjJS','2016-09-27 10:04:54',0,0,NULL,NULL,NULL,'a:0:{}',0,NULL,'kurz','anthony',NULL),(47,NULL,'Ghostgarrix','ghostgarrix','zimo98@outlook.fr','zimo98@outlook.fr',1,'r19d3y8f0b4cgwwocsw8cccg4g8c0ss','$2y$13$LIfshO7pD23tm9IhYPhfReUWfUFT/TJphExaaqZJp0LfJgM0OjdAm','2016-09-27 10:06:26',0,0,NULL,NULL,NULL,'a:0:{}',0,NULL,'Klouche','Nazim',NULL),(48,NULL,'Nova13190','nova13190','Vladimir.13190@hotmail.com','vladimir.13190@hotmail.com',1,'6sckinccnickso88kgk0w840kwg0c80','$2y$13$13CLzm0O6yrzLiYZnp7s0.276oZSi1W.lxIwCGuaC0qqU.BWko842','2016-09-27 10:08:58',0,0,NULL,NULL,NULL,'a:0:{}',0,NULL,'Vladimir','Becquembois',NULL),(49,NULL,'Cyriack','cyriack','lucas.a.leray@gmail.com','lucas.a.leray@gmail.com',1,'maz8zzotmas0g4skow8wocsoc4g4cc8','$2y$13$dMEkPzFqZnoh0N52tnT97.3Af8go1SVsC8iPWWh0pNkJgSdFJzmzG','2016-09-27 10:13:46',0,0,NULL,NULL,NULL,'a:0:{}',0,NULL,'Le Ray','Lucas',NULL),(50,NULL,'Sadyx83','sadyx83','pal.zangetsu@live.fr','pal.zangetsu@live.fr',1,'rnha7bygk6oocccs40008o0s4ss84k','$2y$13$ZOGb4E0biL8ayO7P.3i19Ow5iAJM8KgwkmQWab2e1DTnfsolmLHBq','2016-09-27 10:20:32',0,0,NULL,NULL,NULL,'a:0:{}',0,NULL,'Lebair','Pierre-Alexis',NULL),(51,NULL,'yohan13002','yohan13002','yoyo.leroy@hotmail.fr','yoyo.leroy@hotmail.fr',1,'cnnrjhhnmjkk08480gsw0080wcww0s0','$2y$13$fm.VS8fKSK0Jo2kXpNWlPuLvdfVdwyuDiByco0AL.IEICP7gaqPvC','2016-09-27 10:38:31',0,0,NULL,NULL,NULL,'a:0:{}',0,NULL,'leroy','yohan',NULL),(52,NULL,'Tekaa','tekaa','e.hugo.lupo@gmail.com','e.hugo.lupo@gmail.com',1,'5ciqcipea90kwg4k4cc80wkwo4w00g4','$2y$13$y/NypbUIbb/4sNFoTY1dC.NTwMJEV32ffAkh39/bIEljOJhYxmtGK','2016-09-27 10:40:35',0,0,NULL,NULL,NULL,'a:0:{}',0,NULL,'Lupo','Hugo',NULL),(53,NULL,'SollStice','sollstice','abadie.thibaut@gmail.com','abadie.thibaut@gmail.com',1,'kedatp02440c00w4o0cgcwcw0ogws08','$2y$13$xWFFUo34XMiaX0bKJ0uDfe0ww16L1UciY55K4ppeCJeVXhjkA6uQ2','2016-09-27 10:41:58',0,0,NULL,NULL,NULL,'a:0:{}',0,NULL,'ABADIE','thibaut',NULL),(54,NULL,'Eliott','eliott','legal.elott@gmail.com','legal.elott@gmail.com',1,'4znjj7q33ekg8wso48o4swkggww00ws','$2y$13$Qn7QJMxNg.qWzb.QrFDLC.1gbEz65aDgluF6Hk..8qmgc9uRJo.tO','2016-09-27 10:43:35',0,0,NULL,NULL,NULL,'a:0:{}',0,NULL,'Eliott','Legal',NULL),(55,NULL,'Antoine','antoine','antoine.masson83@gmail.com','antoine.masson83@gmail.com',1,'necah1ndlysck4swo04g4wg8kwccsg4','$2y$13$6mNAMniuuGCtCbN5mbRi..R.2sE5lJ3ZYmNXpR5TSvsWdfBJLRbfq','2016-09-27 10:53:39',0,0,NULL,NULL,NULL,'a:0:{}',0,NULL,'Masson','Antoinee',NULL),(56,NULL,'HugoFuveau','hugofuveau','hugofuveau@gmail.com','hugofuveau@gmail.com',1,'itabadcfgagwgs80gw0ksgsgokoks48','$2y$13$.Bl4NFa6rP68qFeIAb9t3umX77p3iFAy5.Ne1ISnym6ayDiOUL.Mm','2016-09-27 11:06:07',0,0,NULL,NULL,NULL,'a:0:{}',0,NULL,'Melerowicz','Hugo',NULL),(57,NULL,'Quentin83200','quentin83200','mdpquentin@hotmail.com','mdpquentin@hotmail.com',1,'651obgdekg4kscogwwkk4o0cgwco408','$2y$13$TU/KnFh7lo5m6tzNoUlbL.pyGicxK1bLW2XZqPCQ44tRKowAQTWKu','2016-09-27 11:11:51',0,0,NULL,NULL,NULL,'a:0:{}',0,NULL,'Quentin','MICHEL DE PIERREDON',NULL),(58,NULL,'Mathiaslechat','mathiaslechat','m.minaud@yahoo.fr','m.minaud@yahoo.fr',1,'6nz8rq044mos0kgkosgs04c84kc8cw8','$2y$13$jOFnBY0KwExmmmondn99wexayznBPvZ8/SPNq02OcihP52FHTHbBa','2016-09-27 11:18:33',0,0,NULL,NULL,NULL,'a:0:{}',0,NULL,'Minaud','Mathias',NULL),(59,NULL,'lolomist','lolomist','lolomist@hotmail.fr','lolomist@hotmail.fr',1,'l45mi0fjh1s84skcosg0s8wo0ksgc8g','$2y$13$TbmJAMBwWZB5B29gO86d/.2Q8YIgroywsdDNYmS/.6YB/PetJJFQe','2016-09-27 11:22:39',0,0,NULL,NULL,NULL,'a:0:{}',0,NULL,'Mistrot','Loïc',NULL),(60,NULL,'Kaifuku','kaifuku','rouxleo.13@gmail.com','rouxleo.13@gmail.com',1,'h6dl2hms6g0koow8kg80gwckokgokss','$2y$13$IgmpUbclUITcU42Og9fh0O2R59vpTuaRPfnwBPel0QqojZp3a6G9G','2016-09-27 11:35:05',0,0,NULL,NULL,NULL,'a:0:{}',0,NULL,'ROUX','Léo',NULL),(61,NULL,'BiiP','biip','biip@live.Fr','biip@live.fr',1,'d16y6bj54lws8w0ggssggowcgc84wgs','$2y$13$Nb3h723.Xf/W.d2li8mc.ux8i2Yu2WeHUuJQmTSt6vQi.VhDjnFZq','2016-09-27 13:15:54',0,0,NULL,NULL,NULL,'a:0:{}',0,NULL,'Nabti','Nabil',NULL),(62,NULL,'Rev','rev','romeo.bleach@gmail.com','romeo.bleach@gmail.com',1,'n7e1uh2wyo00ccokg4sg404sgowkgg','$2y$13$93ewB9y09WrZC6fM5ErGS.wrUwGfhRHH4Z2YgtdSroIUfgH47UPOm','2016-09-27 13:23:38',0,0,NULL,NULL,NULL,'a:0:{}',0,NULL,'Nahon','Roméo',NULL),(63,NULL,'Makrah','makrah','seugnotnikaeps@gmail.com','seugnotnikaeps@gmail.com',1,'6hky4i1iwa8s40owc4k8sogso0wwg4o','$2y$13$3qrNS6pKwU3i419iT1..XuvS5td28r//bAG6/QDrxOW91RMeSwzN2','2016-09-27 13:27:44',0,0,NULL,NULL,NULL,'a:0:{}',0,NULL,'Nascimento','Alexandre',NULL),(64,NULL,'Tompente','tompente','pentegnothomas@gmail.com','pentegnothomas@gmail.com',1,'a6f4erb6nt44cwo0c88ksg4wk4cgkw8','$2y$13$CRUHM85iAgXU5q47elr2Bew4aQkMqZUFeOmL4P6tWAvMlYJT2tMNe','2016-09-27 13:34:47',0,0,NULL,NULL,NULL,'a:0:{}',0,NULL,'PENTEGNO','Thomas',NULL),(65,NULL,'PjaYyy','pjayyy','pjpouleur@gmail.com','pjpouleur@gmail.com',1,'rwz7fmzpa5cgwg08w04s4o44oskowsg','$2y$13$QTiJChyQRIYQXjfCrG6rSuLbwSTo9ec/CVOBVmoe6.3/69Ug.GCNm','2016-09-27 13:41:58',0,0,NULL,NULL,NULL,'a:0:{}',0,NULL,'POULEUR','Pierre-Jean',NULL),(66,NULL,'thieu12','thieu12','mathieurabi@gmail.com','mathieurabi@gmail.com',1,'7yyy968wty80oskogow4og8coggkccg','$2y$13$YSx1xqMJu8/2QjxsHnwiHuMFkxwDR0bW7j4gDQP3GkQ7xBdU4eUES','2016-09-27 13:45:36',0,0,NULL,NULL,NULL,'a:0:{}',0,NULL,'Rabissoni','Mathieu',NULL),(67,NULL,'Colin','colin','spartan83470@gmail.com','spartan83470@gmail.com',1,'kwmxym1ujy80cscowwgs4soscsoook','$2y$13$jyiTLZmEqRxeMovgKzjQouGqGiJTsxDCTEPldLrmSdJPBr0xgv5LC','2016-09-27 13:57:49',0,0,NULL,NULL,NULL,'a:0:{}',0,NULL,'RENOUS','Colin',NULL),(68,NULL,'Ake','ake','jonrichard7459@gmail.com','jonrichard7459@gmail.com',1,'hz5rniyjk68kk8oswwkcokooc8wok8w','$2y$13$X28dXxI4b2Ji9WDaWBXmduNJjHFSUaIeOSCRfW8wQX.ul3wFOZ8qO','2016-09-27 14:21:21',0,0,NULL,NULL,NULL,'a:0:{}',0,NULL,'RICHARD','Jonathan',NULL),(69,NULL,'Axel','axel','axeler83@gmail.com','axeler83@gmail.com',1,'r5l3gesxm5ckc00kkgoc4swsgg8wsgs','$2y$13$SxuT2.NlAjwkLFtK2NnP4ecEYuwVrZp9Qqkmak.f8Ymu6g3Vde1ka','2016-09-27 14:31:31',0,0,NULL,NULL,NULL,'a:0:{}',0,NULL,'Richter','Axel',NULL),(70,NULL,'Liillymew','liillymew','lucile.rome@numericable.fr','lucile.rome@numericable.fr',1,'7l0xdpyqzxoog0o0ggg88gwg0s0gogs','$2y$13$90V8WNfP5Dcbv88EN1O.GOT/SI8U5TfBYeImCjz5gSndoORDLZHn.','2016-09-27 14:36:18',0,0,NULL,NULL,NULL,'a:0:{}',0,NULL,'Rome','Julie',NULL),(71,NULL,'boris83','boris83','boris.roussel83@orange.fr','boris.roussel83@orange.fr',1,'r2kra1oittwkockoko0s8k844og4w0w','$2y$13$ZiMgH83oMyISewlx4Z4EWunqDzOZUCxgz7BUzeBDFm1muR2M4NJ2y','2016-09-27 14:53:40',0,0,NULL,NULL,NULL,'a:0:{}',0,NULL,'Roussel','Boris',NULL),(72,NULL,'Zicoss','zicoss','mattzicoss@gmail.com','mattzicoss@gmail.com',1,'8278fbasdick4wo4o0kgsosco4w0gc4','$2y$13$79RJvqDdGVb0dtqRqHw6COJT5OLAVkmUnDMy/nGuzr6xBeqCXyT.6','2016-09-27 15:09:38',0,0,NULL,NULL,NULL,'a:0:{}',0,NULL,'Roux','Matthew',NULL),(73,NULL,'Baptiste','baptiste','Baptiste.roubieu@hotmail.fr','baptiste.roubieu@hotmail.fr',1,'tl0ibbq0cj4s84oc0g4k4kw48wsso8c','$2y$13$mRQH7cBdIERcJne/UPXV7.6gsJMlMUeajRz.HPmFNJtWwWTyvmt4a','2016-09-27 15:12:30',0,0,NULL,NULL,NULL,'a:0:{}',0,NULL,'Roubieu','Baptiste',NULL),(74,NULL,'eliminatormax','eliminatormax','MaxSakoschek@gmail.com','maxsakoschek@gmail.com',1,'45c8dukwgrggg840w8048ogko0c8wo8','$2y$13$IQDWMmtvCDOuid2uGmcsUORF0RtEoNwfOzwYyEHIsHHwZZdXIRvK2','2016-09-27 15:14:50',0,0,NULL,NULL,NULL,'a:0:{}',0,NULL,'Sakoschek','Maximilian',NULL),(75,NULL,'Agnonymous','agnonymous','jilheadphones@gmail.com','jilheadphones@gmail.com',1,'485a1ilg7um8ok4skscgcswsgw044gk','$2y$13$L0ZqZAEXcMsmsBW4oNkGruWypZtFh9Fddrs.aokVOjDDlfelIt.tW','2016-09-27 15:24:58',0,0,NULL,NULL,NULL,'a:0:{}',0,NULL,'Santoro','Agnes',NULL),(76,NULL,'Franki','franki','chichke@mail.com','chichke@mail.com',1,'p907q9vehxc4wgws8wo0w8s8ksgsk0c','$2y$13$63v3GL7fqh4Q9ZMmTofTvO0AvpkUySGStePfcVYrl6dYrQGHfyvuy','2016-09-27 15:31:23',0,0,NULL,NULL,NULL,'a:0:{}',0,NULL,'SILHOL','Bastien',NULL),(77,NULL,'Orionss','orionss','cyrille.siouffi@gmail.com','cyrille.siouffi@gmail.com',1,'9r6et9b8xdkwgwk000o4gw88gg8ckgo','$2y$13$aKIqbS5/Mj7e4nThxUmXB.MOzeBsqGJQyyR1/.Fa7Hnb2akaYmFTm','2016-09-27 15:36:54',0,0,NULL,NULL,NULL,'a:0:{}',0,NULL,'Siouffi','Cyrille',NULL),(78,NULL,'Noémie','noémie','noemie.sobczak@gmail.com','noemie.sobczak@gmail.com',1,'tqqucr48m9co04k0skw0ok0444gkoc4','$2y$13$978/0gtXKfEkNQjHMByPuet0VHFLZ1vvitLNMhyEzokStOTlE0i.S','2016-09-27 16:11:21',0,0,NULL,NULL,NULL,'a:0:{}',0,NULL,'Sobczak','Noémie',NULL),(79,NULL,'Skyvask','skyvask','skyvask15@gmail.com','skyvask15@gmail.com',1,'rw5hcil1rtw000s4kk04kwcc4wgkcw4','$2y$13$qnVBPOoh6g5meWda8897su9B6WNDwdmNgf6Obu2175hG11woyYfiy','2016-09-27 16:19:46',0,0,NULL,NULL,NULL,'a:0:{}',0,NULL,'Jean-baptiste','Tchepitchian',NULL),(80,NULL,'vincentv16','vincentv16','vincent.varyn@laposte.net','vincent.varyn@laposte.net',1,'a180ju1vd1c0owss0o8cksgs0c0s8ws','$2y$13$eTua0RsEFxbbZAvNz1t2KeNt/ylLruicHcsrmaOAkNKdf9GPdgtyK','2016-09-27 16:31:28',0,0,NULL,NULL,NULL,'a:0:{}',0,NULL,'Varyn','Vincent',NULL),(81,NULL,'Killian.villiers','killian.villiers','kikicdz@hotmail.fr','kikicdz@hotmail.fr',1,'h5m3b8zxtfwowckowkogo8kgk8cs0ss','$2y$13$XqknO9K/G6G0fKiQm.VzgOc1bvD6vLJOb6DprWZaACyLr.7gcfY0m','2016-09-27 16:35:00',0,0,NULL,NULL,NULL,'a:0:{}',0,NULL,'Villiers','Killian',NULL),(82,NULL,'Aquafreshka','aquafreshka','x.carbone@hotmail.fr','x.carbone@hotmail.fr',1,'7xla7ymuo7400kg40wg8s8gsgocwg8w','$2y$13$5ntRXo7zIX4b7yQpjZ6pnO82i8A7BIcXY76WG6P9e1LZWMbezswDe','2016-09-27 16:54:26',0,0,NULL,NULL,NULL,'a:0:{}',0,NULL,'Carbone','Xuan',NULL),(83,NULL,'ikerc','ikerc','spam@notfear.net','spam@notfear.net',1,'i4k152xcijw40so0gwo4880804wgk4c','$2y$13$y3hRkw7SxpA71DBnruNV..TgJ8J6.QUUWda.H8Ev/DGo.GfgPmkxO','2016-09-28 09:21:22',0,0,NULL,NULL,NULL,'a:0:{}',0,NULL,'denis','labregere',NULL),(84,NULL,'Marc','marc','marc.peri@homail.fr','marc.peri@homail.fr',1,'noo9bns1xg080ks4kwwggs8s408okww','$2y$13$xEwuxOa5eZ/KFma4wBrfqOzy1wewrJF0fyDsEz/r6SWly0wj0kGI6','2016-09-28 09:40:00',0,0,NULL,NULL,NULL,'a:0:{}',0,NULL,'Marc','PERICHART',NULL),(85,NULL,'chen00','chen00','thibaut-chen@hotmail.com','thibaut-chen@hotmail.com',1,'3prgtzppct0ko0o8co440000wwc4gcc','$2y$13$oMxuCEf2i23kr1v3BygLtOHSMmyjPxeYNUTWs9xcXw9EsTuDCsai2','2016-09-28 09:45:22',0,0,NULL,NULL,NULL,'a:0:{}',0,NULL,'thibaut','CHEN',NULL),(86,NULL,'theo_l','theo_l','theo.legras@epitech.eu','theo.legras@epitech.eu',1,'jv7lc2kpa5so80w0gcwowoswogw0wgs','$2y$13$bioR9Y8G2w19v14aJfd.TuYvgjUsgECs5kSKdFC6kN6XJttrHSYUS','2016-09-28 10:54:01',0,0,NULL,NULL,NULL,'a:0:{}',0,NULL,'legras','theo',NULL),(87,NULL,'decugi_a','decugi_a','arthur.decugis@epitech.eu','arthur.decugis@epitech.eu',1,'s5o5cz06kfks4k00sww0g4kc00c00so','$2y$13$7bpOxK9mgD/A1UvvKzjFNO73JLSnOfbntC3R/wxaRYHaz4Y129Cjq','2016-09-28 10:55:13',0,0,NULL,NULL,NULL,'a:0:{}',0,NULL,'decugis','arthur',NULL),(88,NULL,'chaib_s','chaib_s','saad.chaib@epitech.eu','saad.chaib@epitech.eu',1,'ofgkz14w47kc0084c8co8408osos0ow','$2y$13$LzAAQmFu.UJTJv0DirTTjOAhSWrDw3EZWsP1PQ/qAM7.A18ga1qT2','2016-09-28 10:56:47',0,0,NULL,NULL,NULL,'a:0:{}',0,NULL,'chaib','saad',NULL),(89,NULL,'george_v','george_v','valentin.georges-dubost@epitech.eu','valentin.georges-dubost@epitech.eu',1,'nbii1wpku5w8so40ckw4wc8g4wwkc40','$2y$13$3XxW0D6J5vHSpEiazMSu/uuE130ISx./hPIqLLVgY2V1H5zl.N316','2016-09-28 10:57:34',0,0,NULL,NULL,NULL,'a:0:{}',0,NULL,'Georges-Dubost','Valentin',NULL),(90,NULL,'biato_t','biato_t','tom.biato@epitech.eu','tom.biato@epitech.eu',1,'9zx80xstr8oo4gwcs4gkw8s0wckk08s','$2y$13$nuftSKkhQcG4UZwG/DZ29uX2S4RM/k9NRsuovLMl8SLEG87SKH/GS','2016-09-28 10:58:57',0,0,NULL,NULL,NULL,'a:0:{}',0,NULL,'BIATO','Tom',NULL),(91,NULL,'Castel','castel','le-caste@hotmail.fr','le-caste@hotmail.fr',1,'17ogjwckfmqok4sc00gooooc8ckkss4','$2y$13$aBEyhrM2GLXmtq6Wvwm.5ecuKbs15wJ7sPpfW4HSPye84xuKb7zHW','2016-09-28 11:03:53',0,0,NULL,NULL,NULL,'a:0:{}',0,NULL,'CASTELDACCI','Vincent',NULL),(92,NULL,'Leilith','leilith','theo.tro@outlook.fr','theo.tro@outlook.fr',1,'msll9wjrru8oggoccwwskoo8k8g48og','$2y$13$r2qxKPvS7cZCIxSH7mveDOqsUNL4mtXVpsQB.pNPTXu1lfi7a3udK','2016-09-28 11:07:03',0,0,NULL,NULL,NULL,'a:0:{}',0,NULL,'Trochel','Théol',NULL),(93,NULL,'test','test','test@test.com','test@test.com',1,'6zv2sx6ytyg4cs4ogosckg0kgsk8448','$2y$13$wZxhHf4xR9900EatDY.I2OCQA2OTG67v1pSCRJZS5Vx3CMFuJIfGO','2016-09-28 19:51:58',0,0,NULL,NULL,NULL,'a:0:{}',0,NULL,'test','test',NULL);
/*!40000 ALTER TABLE `fos_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `houses`
--

DROP TABLE IF EXISTS `houses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `houses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `points` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `houses`
--

LOCK TABLES `houses` WRITE;
/*!40000 ALTER TABLE `houses` DISABLE KEYS */;
INSERT INTO `houses` VALUES (1,'Gryffondor',0),(2,'Serdaigle',0),(3,'Poufsouffle',0),(4,'Serpentard',0);
/*!40000 ALTER TABLE `houses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questions`
--

DROP TABLE IF EXISTS `questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `questions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question` longtext COLLATE utf8_unicode_ci NOT NULL,
  `points` int(11) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questions`
--

LOCK TABLES `questions` WRITE;
/*!40000 ALTER TABLE `questions` DISABLE KEYS */;
/*!40000 ALTER TABLE `questions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-09-29 14:38:11
