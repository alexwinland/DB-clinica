--
-- Database: `clinicavet`
--
--
-- Extraindo dados da tabela `animals`
--
INSERT INTO `animals` (`ID`, `name`, `escape_attempts`, `neutered`, `weight_kg`, `species_id`, `owner_id`) VALUES
(1, 'Agumon', 0, b'1', '10', 2, 1),
(2, 'Gabumon', 2, b'1', '8', 2, 2),
(3, 'Pikachu', 1, b'0', '15', 1, 2),
(4, 'Devimon', 5, b'1', '11', 2, 3),
(5, 'Charmander', 0, b'0', '11', 1, 4),
(6, 'Plantmon', 2, b'1', '6', 2, 3),
(7, 'Squirtle', 3, b'0', '12', 1, 4),
(8, 'Angemon', 1, b'1', '45', 2, 5),
(9, 'Boarmon', 7, b'1', '20', 2, 5),
(10, 'Blossom', 3, b'1', '17', 1, 4);
--
-- Extraindo dados da tabela `owners`
--
INSERT INTO `owners` (`ID`, `full_name`, `age`) VALUES
(1, 'Sam Smith', 34),
(2, 'Jennifer Orwell', 19),
(3, 'Bob', 45),
(4, 'Melody Pond', 77),
(5, 'Dean Winchester', 14),
(6, 'Jodie Whittaker', 38);
--
-- Extraindo dados da tabela `specializations`
--
INSERT INTO `specializations` (`vets_id`, `species_id`) VALUES
(1, 1),
(3, 1),
(3, 2),
(4, 2),
(1, 1),
(3, 1),
(3, 2),
(4, 2);
--
-- Extraindo dados da tabela `species`
--
INSERT INTO `species` (`ID`, `name`) VALUES
(1, 'Pokemon'),
(2, 'Digimon');
--
-- Extraindo dados da tabela `vets`
--
INSERT INTO `vets` (`ID`, `name`, `age`) VALUES
(1, 'William Tatcher', 45),
(2, 'Maisy Smith', 26),
(3, 'Stephanie Mendez', 64),
(4, 'Jack Harkness', 38),
(5, 'William Tatcher', 45),
(6, 'Maisy Smith', 26),
(7, 'Stephanie Mendez', 64),
(8, 'Jack Harkness', 38);
--
-- Extraindo dados da tabela `visits`
--
INSERT INTO `visits` (`vets_id`, `animals_id`) VALUES
(1, 1),
(3, 1),
(4, 2),
(3, 2),
(3, 2),
(3, 2),
(3, 4),
(4, 5),
(2, 6),
(1, 6),
(2, 6),
(3, 7),
(4, 8),
(4, 8),
(1, 1),
(3, 1),
(4, 2),
(3, 2),
(3, 2),
(3, 2),
(3, 4),
(4, 5),
(2, 6),
(1, 6),
(2, 6),
(3, 7),
(4, 8),
(4, 8),
(2, 9),
(2, 9),
(2, 9),
(2, 9),
(3, 10),
(1, 10);
COMMIT;