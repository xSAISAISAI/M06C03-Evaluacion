-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema M06C03
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema M06C03
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `M06C03` DEFAULT CHARACTER SET utf8 ;
USE `M06C03` ;

-- -----------------------------------------------------
-- Table `M06C03`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `M06C03`.`users` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `M06C03`.`notes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `M06C03`.`notes` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(100) NOT NULL,
  `description` TEXT NOT NULL,
  `created_date` DATETIME NOT NULL,
  `updated_date` DATETIME NULL DEFAULT NULL,
  `deletable` TINYINT NULL DEFAULT 1,
  `user_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_notes_users_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_notes_users`
    FOREIGN KEY (`user_id`)
    REFERENCES `M06C03`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `M06C03`.`categories`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `M06C03`.`categories` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `M06C03`.`notes_categories`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `M06C03`.`notes_categories` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `notes_id` INT UNSIGNED NULL,
  `categories_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_notes_categories_idx` (`categories_id` ASC) VISIBLE,
  INDEX `fk_categories_notes_idx` (`notes_id` ASC) VISIBLE,
  CONSTRAINT `fk_notes_categories`
    FOREIGN KEY (`categories_id`)
    REFERENCES `M06C03`.`categories` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_categories_notes`
    FOREIGN KEY (`notes_id`)
    REFERENCES `M06C03`.`notes` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Adding content
-- -----------------------------------------------------

INSERT INTO users(name, email) VALUES
	('Juli??n B. Ortega', 'j.gakusei11@gmail.com'),
    ('Eric Mena', 'batmanMena@gmail.com'),
    ('Juli??n Aquino', 'robinAquino@gmail.com'),
    ('Belphegor', 'belphy@gmail.com'),
    ('Satanas', 'xX666Xx@gmail.com'),
    ('Lucifer', 'lucifer@gmail.com'),
    ('Asmosdeus', 'asmosdeus@gmail.com'),
    ('Beelzebub', 'beel@gmail.com'),
    ('Mammon', 'mammon@gmail.com'),
    ('Leviathan', 'levi@gmail.com'),
    ('Mini Eric', 'minieric@gmail.com');

INSERT INTO categories(name) VALUES
	('Copypastas'),
    ('Por Mini Eric'),
    ('M??sica'),
    ('Literatura fant??stica'),
    ('Historia'),
    ('Apuntes'),
    ('C??digo'),
    ('Contrase??as'),
    ('Pendiente por hacer'),
    ('Random');

INSERT INTO notes(title, description, created_date, updated_date, deletable, user_id) VALUES
	('test title', 'test description', '2022-09-26 00:02:10', '2022-09-26 00:02:10', 1, 1),
    ('Diego y Eric', 'Historia hecha por Mini Eric (+18): Diego era un joven programador que trabajaba para una compa????a de tecnolog??a. Su vida era relativamente normal, excepto por una cosa: estaba obsesionado con los monstruos. Cada noche, Diego se escond??a en su cuarto y le??a historias de terror sobre vampiros, hombres lobo, zombies y todos los dem??s seres imaginarios que poblaban su mente. Un d??a, Diego recibi?? una oferta para trabajar en la Universidad de Buenos Aires. Acept?? de inmediato, ya que siempre hab??a querido visitar la Argentina. Cuando lleg??, fue asignado a una clase de programaci??n con el profesor Eric. Desde el primer d??a, Diego supo que hab??a algo raro acerca de Eric. Era como si Eric pudiera leer sus pensamientos. Siempre sab??a cu??ndo Diego iba a hacer una pregunta, incluso antes de que Diego mismo lo supiera. Y cuando Diego se sent??a nervioso o inquieto, Eric siempre parec??a estar all?? para tranquilizarlo. Poco a poco, Diego se dio cuenta de que estaba enamorado del profesor Eric. Y aunque sab??a que era un monstruo, no pod??a resistirse a ??l. Una noche, finalmente se entreg?? a Eric, y desde entonces ha estado atrapado en una esclavitud sexual sin escape. Eric sabe exactamente c??mo manipular a Diego para que haga lo que quiera, y Diego no tiene m??s opci??n que obedecer. Diego vive en constante terror, pero a la vez no puede imaginar la vida sin Eric. Espera desesperadamente que un d??a Eric se canse de ??l y lo libere, pero teme que eso nunca suceder??. Diego sabe que est?? condenado a ser el juguete sexual del profesor Eric para siempre', '2022-09-26 00:02:10', '2022-09-26 00:02:10', 0, 11),
    ('Programadores', 'Historia hecha por Mini Eric: Diego, Juli??n, Damian, Luca y Juan eran cinco estudiantes de programaci??n que ten??an a dos profesores de programaci??n, Julian Aquino y Eric, como villanos. Los cinco estudiantes ten??an diferentes personalidades y habilidades, pero todos eran muy buenos en programaci??n. Un d??a, los cinco estudiantes decidieron hacer un programa para hacer trampa en el examen final. Julian Aquino y Eric los descubrieron, pero en lugar de expulsarlos, los dos profesores les dijeron que si pod??an hacer el programa mejor que ellos, entonces los dejar??an pasar. Los cinco estudiantes trabajaron duro y finalmente lo lograron.', '2022-09-26 00:02:10', '2022-09-26 00:02:10', 0, 11),
    ('Programadores2', 'Historia hecha por Mini Eric: Cuando Diego, Juli??n, Damian, Luca y Juan entraron a la clase de programaci??n, sab??an que ser??a un duro semestre. Sus profesores, Julian Aquino y Eric, eran conocidos por ser exigentes y dif??ciles de agradar. Sin embargo, ninguno de los muchachos pod??a imaginar lo que les esperaba. A medida que avanzaba el semestre, los chicos se dieron cuenta de que los profesores eran m??s que simplemente exigentes: eran malvados. Los dos hombres se divert??an haciendo la vida de los estudiantes un infierno, y a menudo los insultaban y los humillaban delante de toda la clase. Un d??a, despu??s de una sesi??n particularmente brutal de tortura psicol??gica, Diego snaps. saca un cuchillo de su mochila y se abalanza sobre Eric, apu??al??ndolo una y otra vez hasta que el cuerpo del hombre queda inerte en el suelo. Damian y Luca ayudan a Diego a esconder el cuerpo, y los tres amigos dec', '2022-09-26 00:02:10', '2022-09-26 00:02:10', 0, 11),
    ('Maltratando a diego', 'Historia hecha por Mini Eric: Diego era un estudiante de programaci??n que estaba en la comisi??n 15. La comisi??n 15 era un grupo de estudiantes que se dedicaban a maltratar a Diego. Juan, Damian, Luca, Juli??n, Gast??n, Lucas, Richard y Mat??as eran algunos de los miembros de la comisi??n 15. A Diego le gustaba la programaci??n, pero no le gustaba que lo maltrataran. Un d??a, Diego se cans?? de ser maltratado y decidi?? hacer algo al respecto. Diego fue a hablar con Juan, Damian, Luca, Juli??n, Gast??n, Lucas, Richard y Mat??as y les dijo que quer??a que dejaran de maltratarlo. Los miembros de la comisi??n 15 se rieron y le dijeron a Diego que no iban a dejar de maltratarlo. Diego se enfad?? mucho y les dijo que si no dejaban de maltratarlo, ??l iba a dejar de programar. Los miembros de la comisi??n 15 se rieron de Diego y le dijeron que no les importaba si dejaba de programar o no. Diego se enfad?? tanto que les dijo que si no dejaban de maltratarlo, ??l iba a contarle a la comisi??n 19 lo que estaban haciendo. Los miembros de la comisi??n 15 se asustaron y le dijeron a Diego que si contaba a la comisi??n 19 lo que estaban haciendo, ellos iban a contarle a la comisi??n 20 lo que Diego estaba haciendo. Diego no quer??a que la comisi??n 20 se enterara de lo que estaba haciendo, as?? que decidi?? no contarle a la comisi??n 19 lo que estaban haciendo. Juan, Damian, Luca, Juli??n, Gast??n, Lucas, Richard y Mat??as siguieron maltratando a Diego, pero Diego no les cont?? a la comisi??n 19 lo que estaban haciendo.', '2022-09-26 00:02:10', '2022-09-26 00:02:10', 0, 11),
    ('MiniEric responde1', '??Qu?? es Git?: Git es un control de versiones de c??digo, muy ??til para proyectos grandes o que involucren a varias personas. git init inicializa un repositorio en tu computadora. git add agrega archivos para que git los rastree, y despu??s us??s git commit para confirmar los cambios y agregarlos al historial de commits. git push sube los commits a un servidor, por ejemplo Github, y git pull trae los commits del servidor a tu computadora. git status te muestra qu?? archivos cambiaron y est??n pendientes de ser agregados o confirmados. git clone te permite obtener una copia de un repositorio ya existente. ??Te sirvi?? esto? Si necesitas m??s informaci??n busc?? en internet, hay muchos recursos ??tiles.', '2022-09-26 00:02:10', '2022-09-26 00:02:10', 0, 11),
    ('MiniEric responde2', '??C??mo funciona git branch?: Veo que est??s buscando una forma de gestionar tus cambios, as?? pues comienza a utilizar el sistema de versiones Git. La primera vez que ingreses al sistema, crear??s un branch para el proyecto Formar. El branch ser?? el nombre del proyecto dentro del repositorio Git, por ejemplo "Formar". A continuaci??n, tomar??s el proyecto Formar desde el repositorio y lo pondr??s dentro del branch. Ahora, cada vez que cambies algo en el proyecto, ingresar??s al branch y realizar??s el cambio aliado a la versi??n que funciona en tu equipo. As?? conseguir??s mantener la versi??n correcta de tu proyecto, aunque tengas muchos cambios a realizar.', '2022-09-26 00:02:10', '2022-09-26 00:02:10', 0, 11),
    ('asdasd', 'asdasdasdasdasd', '2022-09-26 00:03:28', '2022-09-26 00:03:28', 0, 1),
    ('dsadsdasd', 'asdadasdadasd', '2022-09-26 00:03:28', '2022-09-26 00:03:28', 0, 1),
    ('asgagags', 'gasgasgasg', '2022-09-26 00:03:28', '2022-09-26 00:03:28', 0, 1);

INSERT INTO notes_categories(notes_id, categories_id) VALUES
(1, 10),
(2, 2),
(3, 2),
(4, 2),
(5, 2),
(6, 2),
(7, 2),
(8, 10),
(9, 10),
(10, 10);

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
