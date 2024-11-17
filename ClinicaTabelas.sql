--
-- Database: `clinicavet`
--
-- --------------------------------------------------------
--
-- Estrutura da tabela `animals`
--
CREATE TABLE `animals` (
  `ID` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `escape_attempts` int(11) DEFAULT NULL,
  `neutered` bit(1) DEFAULT NULL,
  `weight_kg` decimal(10,0) DEFAULT NULL,
  `species_id` int(11) DEFAULT NULL,
  `owner_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
-- --------------------------------------------------------
--
-- Estrutura da tabela `owners`
--
CREATE TABLE `owners` (
  `ID` int(11) NOT NULL,
  `full_name` varchar(100) DEFAULT NULL,
  `age` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
-- --------------------------------------------------------
--
-- Estrutura da tabela `specializations`
--
CREATE TABLE `specializations` (
  `vets_id` int(11) NOT NULL,
  `species_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
-- --------------------------------------------------------
--
-- Estrutura da tabela `species`
--
CREATE TABLE `species` (
  `ID` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
-- --------------------------------------------------------
--
-- Estrutura da tabela `vets`
--
CREATE TABLE `vets` (
  `ID` int(11) NOT NULL,
  `name` varchar(300) DEFAULT NULL,
  `age` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
-- --------------------------------------------------------
--
-- Estrutura da tabela `visits`
--
CREATE TABLE `visits` (
  `vets_id` int(11) NOT NULL,
  `animals_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
--
-- Indexes for dumped tables
--
--
-- Indexes for table `animals`
--
ALTER TABLE `animals`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `fk_species` (`species_id`),
  ADD KEY `fk_owners` (`owner_id`);
--
-- Indexes for table `owners`
--
ALTER TABLE `owners`
  ADD PRIMARY KEY (`ID`);
--
-- Indexes for table `specializations`
--
ALTER TABLE `specializations`
  ADD KEY `vets_id` (`vets_id`),
  ADD KEY `species_id` (`species_id`);
--
-- Indexes for table `species`
--
ALTER TABLE `species`
  ADD PRIMARY KEY (`ID`);
--
-- Indexes for table `vets`
--
ALTER TABLE `vets`
  ADD PRIMARY KEY (`ID`);
--
-- Indexes for table `visits`
--
ALTER TABLE `visits`
  ADD KEY `animals_id_asc` (`animals_id`),
  ADD KEY `vet_id_asc` (`vets_id`);
--
-- AUTO_INCREMENT for dumped tables
--
--
-- AUTO_INCREMENT for table `animals`
--
ALTER TABLE `animals`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `owners`
--
ALTER TABLE `owners`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `species`
--
ALTER TABLE `species`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `vets`
--
ALTER TABLE `vets`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--
--
-- Limitadores para a tabela `animals`
--
ALTER TABLE `animals`
  ADD CONSTRAINT `fk_owners` FOREIGN KEY (`owner_id`) REFERENCES `owners` (`ID`),
  ADD CONSTRAINT `fk_species` FOREIGN KEY (`species_id`) REFERENCES `species` (`ID`);
--
-- Limitadores para a tabela `specializations`
--
ALTER TABLE `specializations`
  ADD CONSTRAINT `specializations_ibfk_1` FOREIGN KEY (`vets_id`) REFERENCES `vets` (`ID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `specializations_ibfk_2` FOREIGN KEY (`species_id`) REFERENCES `species` (`ID`) ON UPDATE CASCADE;
--
-- Limitadores para a tabela `visits`
--
ALTER TABLE `visits`
  ADD CONSTRAINT `visits_ibfk_1` FOREIGN KEY (`vets_id`) REFERENCES `vets` (`ID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `visits_ibfk_2` FOREIGN KEY (`animals_id`) REFERENCES `animals` (`ID`) ON UPDATE CASCADE;
COMMIT;
