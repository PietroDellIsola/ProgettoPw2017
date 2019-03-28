-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Creato il: Ott 21, 2017 alle 15:46
-- Versione del server: 10.1.19-MariaDB
-- Versione PHP: 5.6.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dbprogettopw`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `details`
--

CREATE TABLE `details` (
  `IdOrdine` int(11) NOT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `details`
--

INSERT INTO `details` (`IdOrdine`, `id`) VALUES
(5, 1),
(5, 2),
(6, 3),
(7, 3),
(7, 6),
(8, 5);

-- --------------------------------------------------------

--
-- Struttura della tabella `merchandise`
--

CREATE TABLE `merchandise` (
  `id` int(11) NOT NULL,
  `nome` varchar(50) DEFAULT NULL,
  `tipo` varchar(25) DEFAULT NULL,
  `descrizione` varchar(2000) DEFAULT NULL,
  `prezzo` varchar(6) DEFAULT NULL,
  `username` varchar(25) DEFAULT NULL,
  `filename` varchar(50) NOT NULL,
  `sconto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `merchandise`
--

INSERT INTO `merchandise` (`id`, `nome`, `tipo`, `descrizione`, `prezzo`, `username`, `filename`, `sconto`) VALUES
(1, 'Logan - The Wolverine ', 'film', 'Nel 2029 la popolazione mutante è calata drasticamente e gli X-Men si sono divisi. Logan, i cui poteri rigeneranti si stanno indebolendo, ora vive circondato dall''alcol e lavora come autista. Si prende cura di un malato professor Xavier, che tiene nascosto. Un giorno incontra una donna straniera che gli chiede di scortare sua figlia Laura sino ai confini del Canada. Logan in un primo momento rifiuta, ma Xavier aspetta quella ragazzina da molto tempo. Laura infatti possiede una forza straordinaria, molto vicina a quella di Wolverine. Il suo DNA contiene il segreto che la lega a Logan ed è per questo che è inseguita dai membri di un''organizzazione molto potente.', '15.8', 'RussellShop', 'logan.jpg', 0),
(2, 'Captain America Civil War', 'film', 'Il film Marvel Captain America: Civil War vede Steve Rogers al comando della nuova squadra degli Avengers, intenti a proseguire la loro lotta per salvaguardare l''umanità. Ma, quando un altro incidente internazionale in cui sono coinvolti gli Avengers provoca dei danni collaterali, le pressioni politiche chiedono a gran voce l''installazione di un sistema di responsabilità, presieduto da un consiglio d''amministrazione che sorvegli e diriga il team. Questa nuova dinamica divide gli Avengers in due fazioni: una è capeggiata da Steve Rogers, il quale desidera che gli Avengers rimangano liberi dalle interferenze governative, mentre l''altra è guidata da Tony Stark, che ha sorprendentemente deciso di sostenere il sistema di vigilanza istituito dal governo.', '20.0', 'RussellShop', 'capAmericaCivilWar.jpg', 10),
(3, 'Mass effect 3', 'videogioco', 'Non tutti sopravviveranno. Un''antica razza aliena, nota solo come Razziatori, ha lanciato un''invasione su vasta scala lasciandosi alle spalle soltanto una scia di distruzione. La Terra è stata conquistata, la galassia è sull''orlo dell''annientamento totale e tu sei l''unico che possa impedirlo. Il prezzo del fallimento è l''estinzione.\nUna storia entusiasmante con diverse ramificazioni: vivi un''epica saga fantascientifica con finali multipli determinati dalle tue scelte e azioni nel gioco. Mass Effect 3 reagirà a ogni tua decisione mentre affronti un''esperienza di gioco unica, da te stesso creata.\nUn''avventura di enorme respiro: combatti su molti mondi, in tutta la galassia, per riunire le forze necessarie a riprenderti la Terra prima che sia troppo tardi.\nAvversari intelligenti e su larga scala: combatti nemici giganteschi e affronta nemesi più astute, che metteranno costantemente alla prova le tue migliori tattiche di combattimento e ti terranno con il fiato sospeso.\nSblocca un arsenale personalizzabile: aggiungi potenziamenti devastanti a ogni arma, tra cui mirini, impugnature, canne e dozzine di altri accessori unici. Ogni arma ha la propria, singolare forza d''impatto e il proprio stile visivo.\nFai piovere morte da lontano o lanciati nel corpo a corpo: personalizza il tuo soldato e la tua squadra per affrontare i nemici alle tue condizioni. Una grande varietà di armi, abilità ed equipaggiamenti ti permette di sfidare l''avversario con il tuo stile di gioco preferito.', '11.0', 'RussellShop', 'massEffect3.jpg', 25),
(4, 'GTA 5', 'videogioco', 'L''acclamatissimo gioco a esplorazione libera di Rockstar Games, Grand Theft Auto V, è ora disponibile per PlayStation 4.\nUn giovane truffatore, un rapinatore di banche in pensione e uno spaventoso psicopatico si ritrovano nel mirino degli elementi più discutibili del mondo della malavita, del governo e dell''industria dello spettacolo: per sopravvivere dovranno mettere in atto una serie di audaci colpi, in una città spietata dove non possono fidarsi di nessuno, men che meno l''uno dell''altro.\nGrand Theft Auto V per PlayStation 4 è caratterizzato da una vasta gamma di significativi perfezionamenti tecnici e grafici per rendere Los Santos e Blaine County più coinvolgenti che mai. Oltre a una maggiore profondità di campo e a una risoluzione da 1080p a 30 frame al secondo, i giocatori possono aspettarsi una lunga serie di miglioramenti quali:\nNuove armi, nuovi veicoli e nuove attività\nNuovi animali\nTraffico più intenso\nNuovo sistema di rappresentazione della vegetazione\nEffetti di danni e clima più realistici... e molto altro\nGrand Theft Auto V per PlayStation 4 presenta inoltre la nuovissima modalità in prima persona, che permette ai giocatori di esplorare il dettagliatissimo mondo di Los Santos e Blaine County sia nella modalità Storia sia in Grand Theft Auto Online da una prospettiva completamente diversa. \nPer ricompensare i fan di Grand Theft Auto V che torneranno al mondo rinnovato di Los Santos e Blaine County, Rockstar Games ha creato in esclusiva per loro una serie di oggetti unici. Ognuno di essi è collegato ad attività create apposta per permettere a chi ha riacquistato GTAV di godere dell''enorme mondo di gioco in nuovi modi. \nGrand Theft Auto V per PlayStation 4 presenta inoltre stazioni radio più ricche, con oltre 150 nuovi brani e DJ mix dai DJ delle versioni originali, distribuiti tra le 17 stazioni radio del gioco.', '70.0', 'GaryStore', 'GTA5.jpg', 40),
(5, 'Wonder Woman', 'film', 'Prima di diventare Wonder Woman, era Diana la principessa delle Amazzoni, cresciuta su un''isola paradisiaca ben nascosta e addestrata a diventare una guerriera invincibile. Quando un pilota Americano compie un atterraggio di emergenza sulle sue sponde e racconta di un enorme conflitto scoppiato nel mondo esterno, Diana abbandona la propria casa convinta di poter porre fine alla minaccia. Combattendo al fianco dell''uomo in una guerra che metta fine a tutte le guerre, Diana scoprirà i suoi pieni poteri? e il suo vero destino.', '18.99', 'GaryStore', 'WonderWoman.jpg', 0),
(6, 'Pirati dei Caraibi: La vendetta di Salazar ', 'film', 'I pericoli del mare non finiscono mai per lo sventurato Jack Sparrow (Johnny Depp) - pardon, lo sventurato Capitan Jack Sparrow - che diventa nuovamente bersaglio di un''indicibile orda nemica a caccia di pirati. La flotta di marinai fantasma capitanata dal temibile Armando Salazar (Javier Bardem) è intenzionata a ripulire i mari dall''infestazione pirata, distruggendo tutti i vascelli sulla rotta che esibiscono la bandiera nera con teschio e ossa, e condannando i banditi che si trovano a bordo a una fine tremenda. Fuggito dal Triangolo del Diavolo a bordo della Silent Mary, un tempo maestosa, ora oscura e decadente, Salazar sembra avere un conto in sospeso proprio con lo svampito Sparrow, la unica speranza di sopravvivenza risiede nel leggendario Tridente di Poseidone ma per riuscire a trovarlo sarà costretto ad allearsi con la brillante e affascinante astronoma Carina Smyth (Kaya Scodelario) e il risoluto Henry Turner (Brenton Thwaites), giovane marinaio della Royal Navy. Al timone di una nave piccola e malandata, Jack si prepara ad affrontare l''oceano, rassegnato alla sorte avversa e allo scontro con i nemici passati che proprio non ne vogliono sapere di morire definitivamente. Ritroviamo anche Hector Barbossa (Geoffrey Rush), come sempre indeciso se spalleggiare il suo vecchio capitano o venderlo al miglior offerente.', '20.99', 'GaryStore', 'piratiDeiCaraibi.jpg', 0),
(7, 'Guardiani della Galassia Volume 2 ', 'film', 'Al ritmo di una nuova, fantastica raccolta di brani musicali (Awesome Mixtape #2), Guardiani della Galassia Vol. 2, racconta le nuove avventure dei Guardiani, stavolta alle prese con il mistero che avvolge le vere origini di Peter Quill. Scritto e diretto nuovamente da James Gunn, Guardiani della Galassia Vol. 2 vede il ritorno dei Guardiani originali, fra cui Chris Pratt nel ruolo di Peter Quill/Star-Lord, Zoe Saldana nei panni di Gamora, Dave Bautista nella parte di Drax, Michael Rooker nel ruolo di Yondu, Karen Gillan in quello di Nebula, mentre Sean Gunn torna a interpretare Kraglin. Nella versione originale del film, Vin Diesel e Bradley Cooper prestano la propria voce rispettivamente ai personaggi di Groot e Rocket. Il cast include inoltre Pom Klementieff, Elizabeth Debicki, Chris Sullivan e Kurt Russell.', '21.0', 'GaryStore', 'GuardianiDellaGalassia2.jpg', 0);

-- --------------------------------------------------------

--
-- Struttura della tabella `orders`
--

CREATE TABLE `orders` (
  `IdOrdine` int(11) NOT NULL,
  `dataOrdine` varchar(25) DEFAULT NULL,
  `username` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `orders`
--

INSERT INTO `orders` (`IdOrdine`, `dataOrdine`, `username`) VALUES
(5, '2017/6/20-7:8:25', 'jake36'),
(6, '2017/6/20-7:9:24', 'jake36'),
(7, '2017/6/24-10:25:18', 'Britt27'),
(8, '2017/6/25-10:19:29', 'GalGadot');

-- --------------------------------------------------------

--
-- Struttura della tabella `users`
--

CREATE TABLE `users` (
  `username` varchar(25) NOT NULL,
  `nome` varchar(25) DEFAULT NULL,
  `cognome` varchar(25) DEFAULT NULL,
  `cellulare` varchar(25) DEFAULT NULL,
  `indirizzo` varchar(25) DEFAULT NULL,
  `citta` varchar(25) NOT NULL,
  `email` varchar(25) DEFAULT NULL,
  `password` varchar(25) DEFAULT NULL,
  `tipo` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `users`
--

INSERT INTO `users` (`username`, `nome`, `cognome`, `cellulare`, `indirizzo`, `citta`, `email`, `password`, `tipo`) VALUES
('Britt27', 'Britt', 'Robertson', '3333456733', 'Via Santa Tecla', 'Maiori, Salerno', 'brittrobertson@gmail.com', 'britt', 'cliente'),
('GalGadot', 'Gal', 'Gadot', '3389922877', 'Via delle amazzoni, 10', 'Themyscira', 'galgadot@gmail.com', 'gal', 'cliente'),
('GaryStore', 'Gary ', 'Oldman', '3342555344', 'Via Casale, 23', 'Salerno, Salerno', 'goldman@gmail.com', 'gary', 'venditore'),
('jake36', 'Jake', 'Gyllenhaal', '3341613379', 'Via delle stelle, 50', 'Roma, Roma', 'jGyllenhaal@gmail.com', 'jake', 'cliente'),
('RussellShop', 'Russell', 'Crowe', '3382345633', 'Via cioccolato, 1', 'Arcole, Verona', 'russShop@live.it', 'russell', 'venditore');

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `details`
--
ALTER TABLE `details`
  ADD PRIMARY KEY (`IdOrdine`,`id`),
  ADD KEY `e` (`id`);

--
-- Indici per le tabelle `merchandise`
--
ALTER TABLE `merchandise`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ff` (`username`);

--
-- Indici per le tabelle `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`IdOrdine`),
  ADD KEY `fk` (`username`);

--
-- Indici per le tabelle `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`username`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `merchandise`
--
ALTER TABLE `merchandise`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT per la tabella `orders`
--
ALTER TABLE `orders`
  MODIFY `IdOrdine` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `details`
--
ALTER TABLE `details`
  ADD CONSTRAINT `e` FOREIGN KEY (`id`) REFERENCES `merchandise` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `s` FOREIGN KEY (`IdOrdine`) REFERENCES `orders` (`IdOrdine`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limiti per la tabella `merchandise`
--
ALTER TABLE `merchandise`
  ADD CONSTRAINT `ff` FOREIGN KEY (`username`) REFERENCES `users` (`username`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limiti per la tabella `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `fk` FOREIGN KEY (`username`) REFERENCES `users` (`username`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
