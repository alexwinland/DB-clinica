# Gerenciador de Clínica Veterinária

Este repositório contém o modelo de banco de dados utilizado para gerenciar informações sobre animais, donos, veterinários e visitas a uma clínica veterinária. O banco de dados foi projetado para armazenar e organizar dados relacionados a animais de estimação, seus donos, as especializações dos veterinários e as visitas realizadas.

## Estrutura do Banco de Dados

O banco de dados **clinicavet** é composto pelas seguintes tabelas principais:

1. **animals** - Informações sobre os animais.
2. **owners** - Detalhes sobre os donos dos animais.
3. **specializations** - Especializações dos veterinários em espécies de animais.
4. **species** - Tipos de espécies de animais (por exemplo, "Pokemon", "Digimon").
5. **vets** - Dados sobre os veterinários.
6. **visits** - Registra as visitas dos animais aos veterinários.

Cada tabela possui uma relação com outras tabelas por meio de **chaves estrangeiras**.

### 1. **Tabela `animals`**
Armazena informações sobre os animais, incluindo nome, tentativas de fuga, se foram castrados, peso e a espécie do animal.

#### Campos:
- **ID**: Identificador único do animal (chave primária).
- **name**: Nome do animal.
- **escape_attempts**: Número de tentativas de fuga do animal.
- **neutered**: Indica se o animal foi castrado (0 = Não, 1 = Sim).
- **weight_kg**: Peso do animal em quilogramas.
- **species_id**: Identificador da espécie do animal (chave estrangeira referenciando a tabela `species`).
- **owner_id**: Identificador do dono do animal (chave estrangeira referenciando a tabela `owners`).

### 2. **Tabela `owners`**
Armazena informações sobre os donos dos animais, incluindo nome completo e idade.

#### Campos:
- **ID**: Identificador único do dono (chave primária).
- **full_name**: Nome completo do dono.
- **age**: Idade do dono.

### 3. **Tabela `specializations`**
Armazena as especializações dos veterinários, ou seja, quais espécies de animais cada veterinário atende.

#### Campos:
- **vets_id**: Identificador do veterinário (chave estrangeira referenciando a tabela `vets`).
- **species_id**: Identificador da espécie do animal que o veterinário atende (chave estrangeira referenciando a tabela `species`).

### 4. **Tabela `species`**
Armazena os tipos de espécies de animais, como "Pokemon" e "Digimon".

#### Campos:
- **ID**: Identificador único da espécie (chave primária).
- **name**: Nome da espécie (ex: "Pokemon", "Digimon").

### 5. **Tabela `vets`**
Armazena informações sobre os veterinários, como nome e idade.

#### Campos:
- **ID**: Identificador único do veterinário (chave primária).
- **name**: Nome do veterinário.
- **age**: Idade do veterinário.

### 6. **Tabela `visits`**
Armazena informações sobre as visitas feitas pelos animais aos veterinários.

#### Campos:
- **vets_id**: Identificador do veterinário que atendeu o animal (chave estrangeira referenciando a tabela `vets`).
- **animals_id**: Identificador do animal que foi atendido (chave estrangeira referenciando a tabela `animals`).

## Funcionalidades do Banco de Dados

### 1. **Gerenciamento de Animais**
A tabela `animals` permite gerenciar as informações dos animais, como nome, peso, tentativas de fuga e se o animal foi castrado. Além disso, ela mantém o vínculo com o dono e a espécie do animal.

### 2. **Gerenciamento de Donos**
A tabela `owners` armazena dados sobre os donos, incluindo nome e idade. Ela também está relacionada à tabela `animals`, permitindo consultar quais animais pertencem a cada dono.

### 3. **Especializações de Veterinários**
A tabela `specializations` conecta os veterinários às espécies de animais que eles atendem. Cada veterinário pode ser especializado em várias espécies de animais.

### 4. **Gerenciamento de Veterinários**
A tabela `vets` contém dados sobre os veterinários, incluindo nome e idade. Ela está diretamente relacionada às tabelas `specializations` (especializações) e `visits` (visitas).

### 5. **Registro de Visitas**
A tabela `visits` registra as visitas dos animais aos veterinários, criando uma relação entre o veterinário e o animal atendido.

## Relacionamentos entre as Tabelas

- **animals → owners**: Cada animal tem um dono. O campo `owner_id` em `animals` referencia `ID` em `owners`.
- **animals → species**: Cada animal pertence a uma espécie. O campo `species_id` em `animals` referencia `ID` em `species`.
- **vets → specializations**: Os veterinários têm especializações em determinadas espécies. A tabela `specializations` conecta `vets` com `species`.
- **visits → vets**: Cada visita a um veterinário é registrada na tabela `visits`, que faz referência à tabela `vets`.
- **visits → animals**: Cada visita envolve um animal. A tabela `visits` também faz referência à tabela `animals`.

## Exemplo de Dados

### Inserção de Animais

```sql
INSERT INTO `animals` (`name`, `escape_attempts`, `neutered`, `weight_kg`, `species_id`, `owner_id`) VALUES
('Agumon', 0, b'1', 10, 2, 1),
('Gabumon', 2, b'1', 8, 2, 2),
('Pikachu', 1, b'0', 15, 1, 2);
```

### Inserção de Donos

```sql
INSERT INTO `owners` (`full_name`, `age`) VALUES
('Sam Smith', 34),
('Jennifer Orwell', 19),
('Bob', 45);
```

### Inserção de Especializações

```sql
INSERT INTO `specializations` (`vets_id`, `species_id`) VALUES
(1, 1),
(3, 1),
(3, 2);
```

### Inserção de Espécies

```sql
INSERT INTO `species` (`name`) VALUES
('Pokemon'),
('Digimon');
```

### Inserção de Veterinários

```sql
INSERT INTO `vets` (`name`, `age`) VALUES
('William Tatcher', 45),
('Maisy Smith', 26),
('Stephanie Mendez', 64);
```

### Inserção de Visitas

```sql
INSERT INTO `visits` (`vets_id`, `animals_id`) VALUES
(1, 1),
(3, 1),
(4, 2);
```

## Consultas Comuns

### Consultar Todos os Animais e Seus Donos

```sql
SELECT a.name AS animal, o.full_name AS owner
FROM animals a
JOIN owners o ON a.owner_id = o.ID;
```

### Consultar Todos os Veterinários e Suas Especializações

```sql
SELECT v.name AS vet, s.name AS species
FROM vets v
JOIN specializations sp ON v.ID = sp.vets_id
JOIN species s ON sp.species_id = s.ID;
```

### Consultar Visitas de um Animal

```sql
SELECT v.name AS vet, a.name AS animal
FROM visits vi
JOIN vets v ON vi.vets_id = v.ID
JOIN animals a ON vi.animals_id = a.ID
WHERE a.name = 'Agumon';
```

## Conclusão

Este banco de dados oferece uma solução completa para o gerenciamento de uma clínica veterinária, permitindo armazenar e consultar informações sobre animais, donos, veterinários, especializações e visitas. O modelo de dados é flexível, possibilitando o acompanhamento detalhado das interações entre os animais, seus donos e os profissionais que os atendem.
