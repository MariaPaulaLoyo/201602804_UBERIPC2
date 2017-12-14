-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.2.11-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             9.4.0.5125
-- --------------------------------------------------------

CREATE DATABASE IF NOT EXISTS `uber` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `uber`;

CREATE TABLE IF NOT EXISTS `cliente` (
  `IDcliente` int(11) NOT NULL,
  `EdadCliente` int(11) NOT NULL,
  `NombreCliente` varchar(50) NOT NULL,
  `CantidadViajes` int(11) NOT NULL,
  PRIMARY KEY (`IDcliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE cliente 
	ALTER COLUMN NombreCliente varchar 
	
	

CREATE TABLE IF NOT EXISTS `conductor` (
  `IDconductor` int(11) NOT NULL,
  `NombreConductor` varchar(50) NOT NULL,
  `ExperienciaConductor` varchar(50) NOT NULL,
  `EspecialidadConductor` varchar(50) NOT NULL,
  PRIMARY KEY (`IDconductor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `especificaciones` (
  `IDespecificaciones` int(11) NOT NULL,
  `ModeloTransporte` varchar(100) NOT NULL,
  `ColorTransporte` varchar(100) NOT NULL,
  `Comodidales` varchar(100) NOT NULL,
  PRIMARY KEY (`IDespecificaciones`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `serviciocliente` (
  `IDserviciocliente` int(11) NOT NULL,
  `FechaServicio` int(11) DEFAULT NULL,
  `IDcliente` int(11) DEFAULT NULL,
  PRIMARY KEY (`IDserviciocliente`),
  KEY `FK1IDCliente` (`IDcliente`),
  CONSTRAINT `FK1IDCliente` FOREIGN KEY (`IDcliente`) REFERENCES `cliente` (`IDcliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `servicios` (
  `IDServicio` int(11) NOT NULL,
  `Tipo_Cliente` varchar(50) DEFAULT NULL,
  `Tipo_Conductor` varchar(50) DEFAULT NULL,
  `Ubicacion` varchar(50) DEFAULT NULL,
  `IDVehiculo` int(11) NOT NULL,
  `IDserviciocliente` int(11) NOT NULL,
  `IDconductor` int(11) NOT NULL,
  PRIMARY KEY (`IDServicio`),
  KEY `FK1IDvehiculo` (`IDVehiculo`),
  KEY `FK2IDServiciocliente` (`IDserviciocliente`),
  KEY `FK3IDconductor` (`IDconductor`),
  CONSTRAINT `FK1IDvehiculo` FOREIGN KEY (`IDVehiculo`) REFERENCES `vehiculo` (`IDvehiculo`),
  CONSTRAINT `FK2IDServiciocliente` FOREIGN KEY (`IDserviciocliente`) REFERENCES `serviciocliente` (`IDserviciocliente`),
  CONSTRAINT `FK3IDconductor` FOREIGN KEY (`IDconductor`) REFERENCES `conductor` (`IDconductor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `vehiculo` (
  `IDvehiculo` int(11) NOT NULL,
  `TipoTransporte` int(11) NOT NULL,
  `Capacidad` int(11) NOT NULL,
  `IDespecificacion` int(11) NOT NULL,
  `IDConductor` int(11) DEFAULT NULL,
  PRIMARY KEY (`IDvehiculo`),
  KEY `FK1IDespecificacion` (`IDespecificacion`),
  KEY `FK2IDConductor` (`IDConductor`),
  CONSTRAINT `FK1IDespecificacion` FOREIGN KEY (`IDespecificacion`) REFERENCES `especificaciones` (`IDespecificaciones`),
  CONSTRAINT `FK2IDConductor` FOREIGN KEY (`IDConductor`) REFERENCES `conductor` (`IDconductor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `viajecliente` (
  `IDviajeCliente` int(11) NOT NULL,
  `UbicacionCliente` varchar(50) DEFAULT NULL,
  `DestinoCliente` varchar(50) DEFAULT NULL,
  `IDviaje` int(11) DEFAULT NULL,
  `IDcliente` int(11) DEFAULT NULL,
  PRIMARY KEY (`IDviajeCliente`),
  KEY `FK1IDViaje` (`IDviaje`),
  KEY `FK2IDCliente` (`IDcliente`),
  CONSTRAINT `FK1IDViaje` FOREIGN KEY (`IDviaje`) REFERENCES `viajes` (`IDviaje`),
  CONSTRAINT `FK2IDCliente` FOREIGN KEY (`IDcliente`) REFERENCES `cliente` (`IDcliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `viajes` (
  `IDviaje` int(11) NOT NULL,
  `TipoViaje` varchar(50) NOT NULL,
  `CapacidadVehiculo` int(11) NOT NULL,
  `CantidadClientes` int(11) NOT NULL,
  `RecorridoTotal` varchar(100) NOT NULL,
  `CostoViaje` double NOT NULL,
  `IDConductor` int(11) NOT NULL,
  PRIMARY KEY (`IDviaje`),
  KEY `FK1IDconductor` (`IDConductor`),
  CONSTRAINT `FK1IDconductor` FOREIGN KEY (`IDConductor`) REFERENCES `conductor` (`IDconductor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

