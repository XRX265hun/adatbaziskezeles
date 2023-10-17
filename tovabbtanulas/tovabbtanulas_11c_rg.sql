-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2023. Okt 17. 10:37
-- Kiszolgáló verziója: 10.4.20-MariaDB
-- PHP verzió: 7.3.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `tovabbtanulas_11c_rg`
--

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `altalanos_iskola`
--

CREATE TABLE `altalanos_iskola` (
  `id_altalanos_iskola` tinyint(3) UNSIGNED NOT NULL,
  `altalanos_iskola_nevek` varchar(255) COLLATE utf8_hungarian_ci NOT NULL,
  `altalanos_iskola_cime` varchar(255) COLLATE utf8_hungarian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `altalanos_iskola`
--

INSERT INTO `altalanos_iskola` (`id_altalanos_iskola`, `altalanos_iskola_nevek`, `altalanos_iskola_cime`) VALUES
(1, 'Csillagvár Általános Iskola', 'Kocka u. 14');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `kozepiskola`
--

CREATE TABLE `kozepiskola` (
  `id_kozepiskola` tinyint(3) UNSIGNED NOT NULL,
  `kozepiskola_neve` varchar(255) COLLATE utf8_hungarian_ci NOT NULL,
  `kozepiskola_cime` varchar(255) COLLATE utf8_hungarian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `tanulo`
--

CREATE TABLE `tanulo` (
  `id_tanulo` tinyint(3) UNSIGNED NOT NULL,
  `tanulo_neve` varchar(255) COLLATE utf8_hungarian_ci NOT NULL,
  `id_alt_isk` tinyint(3) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `altalanos_iskola`
--
ALTER TABLE `altalanos_iskola`
  ADD PRIMARY KEY (`id_altalanos_iskola`);

--
-- A tábla indexei `kozepiskola`
--
ALTER TABLE `kozepiskola`
  ADD PRIMARY KEY (`id_kozepiskola`);

--
-- A tábla indexei `tanulo`
--
ALTER TABLE `tanulo`
  ADD PRIMARY KEY (`id_tanulo`),
  ADD KEY `id_alt_isk` (`id_alt_isk`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `altalanos_iskola`
--
ALTER TABLE `altalanos_iskola`
  MODIFY `id_altalanos_iskola` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT a táblához `kozepiskola`
--
ALTER TABLE `kozepiskola`
  MODIFY `id_kozepiskola` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `tanulo`
--
ALTER TABLE `tanulo`
  MODIFY `id_tanulo` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `tanulo`
--
ALTER TABLE `tanulo`
  ADD CONSTRAINT `tanulo_ibfk_1` FOREIGN KEY (`id_alt_isk`) REFERENCES `altalanos_iskola` (`id_altalanos_iskola`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
