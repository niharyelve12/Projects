-- MySQL dump 10.13  Distrib 8.0.43, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: ev
-- ------------------------------------------------------
-- Server version	8.0.43

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Temporary view structure for view `successful_payments`
--

DROP TABLE IF EXISTS `successful_payments`;
/*!50001 DROP VIEW IF EXISTS `successful_payments`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `successful_payments` AS SELECT 
 1 AS `session_id`,
 1 AS `payment_method`,
 1 AS `payment_status`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `user_vehicle_view`
--

DROP TABLE IF EXISTS `user_vehicle_view`;
/*!50001 DROP VIEW IF EXISTS `user_vehicle_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `user_vehicle_view` AS SELECT 
 1 AS `user_name`,
 1 AS `email`,
 1 AS `vehicle_model`,
 1 AS `battery_capacity_kwh`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `popular_payment_method_view`
--

DROP TABLE IF EXISTS `popular_payment_method_view`;
/*!50001 DROP VIEW IF EXISTS `popular_payment_method_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `popular_payment_method_view` AS SELECT 
 1 AS `payment_method`,
 1 AS `usage_count`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `chargerusage`
--

DROP TABLE IF EXISTS `chargerusage`;
/*!50001 DROP VIEW IF EXISTS `chargerusage`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `chargerusage` AS SELECT 
 1 AS `charger_id`,
 1 AS `type`,
 1 AS `total_energy`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `station_charger_view`
--

DROP TABLE IF EXISTS `station_charger_view`;
/*!50001 DROP VIEW IF EXISTS `station_charger_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `station_charger_view` AS SELECT 
 1 AS `location`,
 1 AS `charger_id`,
 1 AS `type`,
 1 AS `max_power_kw`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `successful_payments`
--

/*!50001 DROP VIEW IF EXISTS `successful_payments`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `successful_payments` AS select `payments`.`session_id` AS `session_id`,`payments`.`payment_method` AS `payment_method`,`payments`.`payment_status` AS `payment_status` from `payments` where (`payments`.`payment_status` = 'success') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `user_vehicle_view`
--

/*!50001 DROP VIEW IF EXISTS `user_vehicle_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `user_vehicle_view` AS select `u`.`user_name` AS `user_name`,`u`.`email` AS `email`,`up`.`vehicle_model` AS `vehicle_model`,`up`.`battery_capacity_kWh` AS `battery_capacity_kwh` from (`users` `u` left join `userprofiles` `up` on((`u`.`user_id` = `up`.`user_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `popular_payment_method_view`
--

/*!50001 DROP VIEW IF EXISTS `popular_payment_method_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `popular_payment_method_view` AS select `payments`.`payment_method` AS `payment_method`,count(0) AS `usage_count` from `payments` group by `payments`.`payment_method` order by `usage_count` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `chargerusage`
--

/*!50001 DROP VIEW IF EXISTS `chargerusage`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `chargerusage` AS select `c`.`charger_id` AS `charger_id`,`c`.`type` AS `type`,sum(`cs`.`energy_kWh`) AS `total_energy` from (`chargers` `c` join `chargingsessions` `cs` on((`c`.`charger_id` = `cs`.`charger_id`))) group by `c`.`charger_id`,`c`.`type` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `station_charger_view`
--

/*!50001 DROP VIEW IF EXISTS `station_charger_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `station_charger_view` AS select `s`.`location` AS `location`,`c`.`charger_id` AS `charger_id`,`c`.`type` AS `type`,`c`.`max_power_kW` AS `max_power_kw` from (`chargingstations` `s` left join `chargers` `c` on((`s`.`station_id` = `c`.`station_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-11-20 15:23:55
