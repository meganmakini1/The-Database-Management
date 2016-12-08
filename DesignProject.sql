--------------------------------------------------------------------------------------
--Megan Makini
--Design Project
--The Hobbit: An Unexpected Database
--8 December 2016
--Dr. Alan Labouseur
--------------------------------------------------------------------------------------

drop table if exists TypeOfBeings;

drop table if exists Dragons;
drop table if exists Orcs;
drop table if exists Trolls;
drop table if exists Elves;
drop table if exists Goblins;
drop table if exists Humans;
drop table if exists Wizards;
drop table if exists Hobbits;
drop table if exists Dwarves;
drop table if exists CompanyMembers;
drop table if exists SkinChangers;

drop table if exists Weapons;

drop table if exists FoughtIn;

drop table if exists Battles;

drop table if exists Beings;

drop table if exists Locations;

--Table Creations-------------------------------------------------------------------------------

--TypeOfBeings--
create table TypeOfBeings (
   TypeID	char(3) not null,
   TypeName	text not null,	
  primary key(TypeID)
);

--Locations--
create table Locations (
   LocationID		char(3) not null,
   LocationName		text,
   SecondaryName	text,
  primary key(LocationID)
);

--Beings--
create table Beings (
   CharacterID 		char(4) not null,
   LocationID		char(4) not null references Locations(LocationID),
   TypeID		char(3) not null references TypeOfBeings,
   Name			text,
   Title		text,
   Gender		char(6) not null check(gender='Male' or gender='Female'),
   BirthYear		char(7),
   DeathYear		char(6),
  primary key(CharacterID)
);

--Dragons--
Create table Dragons (
   CharacterID 				char(4) not null references Beings(CharacterID),
   WingSpanFeet				Integer,
   FireIntensityFahrenheit		Integer,
   ScaleDurabilityMetricTon		integer,
  Primary key(CharacterID)
);

--Orcs--
Create table Orcs (
   CharacterID 		char(4) not null references Beings(CharacterID),
   NumberOfKills	integer,
  primary key(CharacterID)
);

--Trolls--
Create table Trolls (
   CharacterID 			char(4) not null references Beings(CharacterID),
   IntelligenceQuotient	Integer,
   GroupRole			text,
  primary key(CharacterID)
);

--Elves--
Create table Elves (
   CharacterID 		char(4) not null references Beings(CharacterID),
   Status		Text,
  primary key(CharacterID)
);

--Goblins--
Create table Goblins (
   CharacterID 			char(4) not null references Beings(CharacterID),
   NumberOfDeformities		Integer,
  Primary key(CharacterID)
);

--Humans--
Create table Humans (
   CharacterID 		char(4) not null references Beings(CharacterID),
  primary key(CharacterID)
);

--Wizards--
Create table Wizards (
   CharacterID 		char(4) not null references Beings(CharacterID),
   AssociatedColor	text,
   StaffHeightInches	integer,
  primary key(CharacterID)
);

--Hobbits--
Create table Hobbits (
   CharacterID 		char(4) not null references Beings(CharacterID),
   TotalAdventures	integer,
  primary key(CharacterID)
);

--Dwarves--
Create table Dwarves (
   CharacterID 		char(4) not null references Beings(CharacterID),
   SpecialSkill		text,
  primary key(CharacterID)
);

--SkinChangers--
create table SkinChangers (
   CharacterID		char(4) not null references Beings(CharacterID),
   FormPreference	text,
  primary key(CharacterID)
);

--CompanyMembers--
Create table CompanyMembers (
   CharacterID 		char(4) not null references Beings(CharacterID),
   WeaponID		char(3),
   CompanyRole		text,
  primary key(CharacterID)
);

--Weapons--
create table Weapons (
   WeaponID		char(3) not null,
   WeaponType		text,
   AssociatedName	text,
  primary key(WeaponID)
);

--Battles--
create table Battles (
   BattleID		char(3) not null,
   LocationID		char(3) not null references Locations(LocationID),
   BattleName		text,
   BattleYear		char(6),
  primary key(BattleID)
);		

--FoughtIn--
create table FoughtIn (
   CharacterID		char(4) not null references Beings(CharacterID),
   BattleID		char(3) not null references Battles(BattleID),
   BattleWon		Boolean,	
   ResultLivingStatus	Boolean,
  primary key(CharacterID, BattleID)
);



--Insert Information---------------------------------------------------------------------------------------

--Locations--
Insert into Locations(LocationID, LocationName, SecondaryName)
  Values('L01', 'Moria', Null);

Insert into Locations(LocationID, LocationName, SecondaryName)
  Values('L02', 'Erebor', 'The Lonely Mountain');

Insert into Locations(LocationID, LocationName, SecondaryName)
  Values('L03', 'Esgaroth', 'Lake Town');

Insert into Locations(LocationID, LocationName, SecondaryName)
  Values('L04', 'Anduin Valley', 'Ford of Carrock');

Insert into Locations(LocationID, LocationName, SecondaryName)
  Values('L05', 'Ettenmoor', null);

Insert into Locations(LocationID, LocationName, SecondaryName)
  Values('L06', 'The Shire', 'Bag End');

Insert into Locations(LocationID, LocationName, SecondaryName)
  Values('L07', 'Iron Hills', 'Wilderland');

Insert into Locations(LocationID, LocationName, SecondaryName)
  Values('L08', 'Havens of Sirian', 'Beleriand');

Insert into Locations(LocationID, LocationName, SecondaryName)
  Values('L09', 'Valinor', 'The Land Across the Sea');

Insert into Locations(LocationID, LocationName, SecondaryName)
  Values('L10', 'Arda', null);

Insert into Locations(LocationID, LocationName, SecondaryName)
  Values('L11', 'Vales of Anduin', 'Gladden Fields');

Insert into Locations(LocationID, LocationName, SecondaryName)
  Values('L12', 'Goblin Town', null);

Insert into Locations(LocationID, LocationName, SecondaryName)
  Values('L13', 'Northern Mountains', null);

Insert into Locations(LocationID, LocationName, SecondaryName)
  Values('L14', 'Woodland Realm', 'Mirkwood');

Insert into Locations(LocationID, LocationName, SecondaryName)
  Values('L15', 'Rivendell', 'Imladris');

Insert into Locations(LocationID, LocationName, SecondaryName)
  Values('L16', 'Eriador', null);

Insert into Locations(LocationID, LocationName, SecondaryName)
  Values('L17', 'Lonelands', 'Weather Hills');

Insert into Locations(LocationID, LocationName, SecondaryName)
  Values('L18', 'City of Dale', null);

Insert into Locations(LocationID, LocationName, SecondaryName)
  Values('L19', 'High Pass', 'Cirith Forn en Andrath');

Insert into Locations(LocationID, LocationName, SecondaryName)
  Values('L20', 'Misty Mountains', 'Hithaeglir');

Insert into Locations(LocationID, LocationName, SecondaryName)
  Values('L21', 'Azanulbizar', 'Dimrill Dale');

Insert into Locations(LocationID, LocationName, SecondaryName)
  Values('L22', 'Gollums Lake', 'Gollums Lake');

--Beings--

insert into Beings(CharacterID, LocationID, TypeID, Name, Title, Gender, BirthYear, DeathYear)
  Values ('c001', 'L01',  't08', 'Azog', 'The Defiler', 'Male', 'Unknown', 'TA2799');

insert into Beings(CharacterID, LocationID, TypeID, Name, Title, Gender, BirthYear, DeathYear)
  Values ('c002', 'L02', 't01', 'Balin', 'Guardian of Erebor', 'Male', 'TA2763', 'TA2994');

insert into Beings(CharacterID, LocationID, TypeID, Name, Title, Gender, BirthYear, DeathYear)
  Values ('c003', 'L03', 't04', 'Bard', 'The Bowman', 'Male', 'TA2898', 'TA2977');

insert into Beings(CharacterID, LocationID, TypeID, Name, Title, Gender, BirthYear, DeathYear)
  Values ('c004', 'L04', 't10', 'Beorn', 'The SkinChanger', 'Male', 'Unknown', null);

insert into Beings(CharacterID, LocationID, TypeID, Name, Title, Gender, BirthYear, DeathYear)
  Values ('c005', 'L05', 't07', 'Bert', 'The Cook', 'Male', 'Unknown', 'TA2941');

insert into Beings(CharacterID, LocationID, TypeID, Name, Title, Gender, BirthYear, DeathYear)
  Values ('c006', 'L02', 't01', 'Bifur', null, 'Male', 'TA2814', null);

insert into Beings(CharacterID, LocationID, TypeID, Name, Title, Gender, BirthYear, DeathYear)
  Values ('c007', 'L06', 't02', 'Bilbo Baggins', 'Burglar', 'Male', 'TA2890', null);

insert into Beings(CharacterID, LocationID, TypeID, Name, Title, Gender, BirthYear, DeathYear)
  Values ('c008', 'L02', 't01', 'Bofur', null, 'Male', 'TA2843', null);

insert into Beings(CharacterID, LocationID, TypeID, Name, Title, Gender, BirthYear, DeathYear)
  Values ('c009', 'L01', 't08', 'Bolg', 'Gundabad', 'Male', 'Unknown', 'TA2941');

insert into Beings(CharacterID, LocationID, TypeID, Name, Title, Gender, BirthYear, DeathYear)
  Values ('c010', 'L02', 't01', 'Bombur', null, 'Male', 'TA2834', null); 

insert into Beings(CharacterID, LocationID, TypeID, Name, Title, Gender, BirthYear, DeathYear)
  Values ('c011', 'L07', 't01', 'Dain II Ironfoot', 'King of Durins Folk', 'Male', 'TA2767', null);
  
insert into Beings(CharacterID, LocationID, TypeID, Name, Title, Gender, BirthYear, DeathYear)
  Values ('c012', 'L02', 't01', 'Dori', null, 'Male', 'TA2827', null);   

insert into Beings(CharacterID, LocationID, TypeID, Name, Title, Gender, BirthYear, DeathYear)
  Values ('c013', 'L02', 't01', 'Dwalin', null, 'Male', 'TA2772', null);

insert into Beings(CharacterID, LocationID, TypeID, Name, Title, Gender, BirthYear, DeathYear)
  Values ('c014', 'L08', 't06', 'Elrond', 'Lord of Rivendell', 'Male', 'FA0532', null);

insert into Beings(CharacterID, LocationID, TypeID, Name, Title, Gender, BirthYear, DeathYear)
  Values ('c015', 'L02', 't01', 'Fili', null, 'Male', 'TA2859', 'TA2941');

insert into Beings(CharacterID, LocationID, TypeID, Name, Title, Gender, BirthYear, DeathYear)
  Values ('c016', 'L01', 't08', 'Fimbul', 'Captain of the Warg Riders', 'Male', 'Unknown', 'TA2941');

insert into Beings(CharacterID, LocationID, TypeID, Name, Title, Gender, BirthYear, DeathYear)
  Values ('c017', 'L06', 't02', 'Frodo Baggins', null, 'Male', 'TA2968', null);

insert into Beings(CharacterID, LocationID, TypeID, Name, Title, Gender, BirthYear, DeathYear)
  Values ('c018', 'L09', 't06', 'Galadriel', 'Lady of Lorien', 'Female', 'YT1362', null);

insert into Beings(CharacterID, LocationID, TypeID, Name, Title, Gender, BirthYear, DeathYear)
  Values ('c019', 'L10', 't03', 'Gandalf', 'Mithrandir', 'Male', 'Unknown', null);

insert into Beings(CharacterID, LocationID, TypeID, Name, Title, Gender, BirthYear, DeathYear)
  Values ('c020', 'L02', 't01', 'Gloin', null, 'Male', 'TA2783', null);

insert into Beings(CharacterID, LocationID, TypeID, Name, Title, Gender, BirthYear, DeathYear)
  Values ('c021', 'L11', 't02', 'Gollum', 'Smeagol', 'Male', 'TA2430', null);

insert into Beings(CharacterID, LocationID, TypeID, Name, Title, Gender, BirthYear, DeathYear)
  Values ('c022', 'L12', 't05', 'The Great Goblin', 'Chieftain of Goblin-town', 'Male', 'Unknown', 'TA2941');

insert into Beings(CharacterID, LocationID, TypeID, Name, Title, Gender, BirthYear, DeathYear)
  Values ('c023', 'L02', 't01', 'Kili', null, 'Male', 'TA2864', 'TA2941');

insert into Beings(CharacterID, LocationID, TypeID, Name, Title, Gender, BirthYear, DeathYear)
  Values ('c024', 'L02', 't01', 'Nori', null, 'Male', 'TA2837', null);

insert into Beings(CharacterID, LocationID, TypeID, Name, Title, Gender, BirthYear, DeathYear)
  Values ('c025', 'L02', 't01', 'Oin', null, 'Male', 'TA2774', null);

insert into Beings(CharacterID, LocationID, TypeID, Name, Title, Gender, BirthYear, DeathYear)
  Values ('c026', 'L02', 't01', 'Ori', null, 'Male', 'TA2875', null);

insert into Beings(CharacterID, LocationID, TypeID, Name, Title, Gender, BirthYear, DeathYear)
  Values ('c027', 'L10', 't03', 'Radagast', 'Tender of Beasts', 'Male', 'Unknown', null);

insert into Beings(CharacterID, LocationID, TypeID, Name, Title, Gender, BirthYear, DeathYear)
  Values ('c028', 'L10', 't03', 'Saruman', 'Lord of Isengard', 'Male', 'Unknown', null);

insert into Beings(CharacterID, LocationID, TypeID, Name, Title, Gender, BirthYear, DeathYear)
  Values ('c029', 'L13', 't09', 'Smaug', 'Lord Smaug', 'Male', 'TA2770', 'TA2941');

insert into Beings(CharacterID, LocationID, TypeID, Name, Title, Gender, BirthYear, DeathYear)
  Values ('c030', 'L02', 't01', 'Thorin I', 'King of Durins Folk', 'Male', 'TA2035', 'TA2289');

insert into Beings(CharacterID, LocationID, TypeID, Name, Title, Gender, BirthYear, DeathYear)
  Values ('c031', 'L02', 't01', 'Thorin II', 'Oakenshield', 'Male', 'TA2746', 'TA2941');

insert into Beings(CharacterID, LocationID, TypeID, Name, Title, Gender, BirthYear, DeathYear)
  Values ('c032', 'L02', 't01', 'Thrain I', 'Thrain the Old', 'Male', 'TA1934', 'TA2190' );

insert into Beings(CharacterID, LocationID, TypeID, Name, Title, Gender, BirthYear, DeathYear)
  Values ('c033', 'L02', 't01', 'Thrain II', 'King of Durins Folk', 'Male', 'TA2644', 'TA2850');

insert into Beings(CharacterID, LocationID, TypeID, Name, Title, Gender, BirthYear, DeathYear)
  Values ('c034', 'L14', 't06', 'Thranduil', 'King of the Woodland Realm', 'Male', 'FA0000', null);

insert into Beings(CharacterID, LocationID, TypeID, Name, Title, Gender, BirthYear, DeathYear)
  Values ('c035', 'L02', 't01', 'Thror', 'King of Durins Folk', 'Male', 'TA2542', 'TA2790');

insert into Beings(CharacterID, LocationID, TypeID, Name, Title, Gender, BirthYear, DeathYear)
  Values ('c036', 'L05', 't07', 'Tom', null, 'Male', 'Unknown', 'TA2941');

insert into Beings(CharacterID, LocationID, TypeID, Name, Title, Gender, BirthYear, DeathYear)
  Values ('c037', 'L05', 't07', 'William', null, 'Male', 'Unknown', 'TA2941');

insert into Beings(CharacterID, LocationID, TypeID, Name, Title, Gender, BirthYear, DeathYear)
  Values ('c038', 'L01', 't08', 'Yazneg', 'Commander of the Warg Riders', 'Male', 'Unknown', 'TA2941');

insert into Beings(CharacterID, LocationID, TypeID, Name, Title, Gender, BirthYear, DeathYear)
  Values ('c039', 'L03',  't04', 'Master of Lake-Town', 'Master', 'Male', 'TA2890', 'TA2941');

insert into Beings(CharacterID, LocationID, TypeID, Name, Title, Gender, BirthYear, DeathYear)
  Values ('c040', 'L14', 't06', 'Legolas', 'Prince of the Woodland Realm', 'Male', 'Unknown', null);

insert into Beings(CharacterID, LocationID, TypeID, Name, Title, Gender, BirthYear, DeathYear)
  Values ('c041', 'L14', 't06', 'Tauriel', 'Captain of the Elven Guard', 'Female', 'TA2341', null);

insert into Beings(CharacterID, LocationID, TypeID, Name, Title, Gender, BirthYear, DeathYear)
  Values ('c042', 'L06', 't02', 'Worrywort', 'Master', 'Male', 'Unknown', null);

insert into Beings(CharacterID, LocationID, TypeID, Name, Title, Gender, BirthYear, DeathYear)
  Values ('c043', 'L03', 't04', 'Alfrid Lickspittle', 'Masters Deputy', 'Male', 'TA2929', null);

insert into Beings(CharacterID, LocationID, TypeID, Name, Title, Gender, BirthYear, DeathYear)
  Values ('c044', 'L03', 't04', 'Bain', null, 'Male', 'TA2924', null);

insert into Beings(CharacterID, LocationID, TypeID, Name, Title, Gender, BirthYear, DeathYear)
  Values ('c045', 'L03', 't04', 'Sigrid', null, 'Female', 'TA2926', null);

insert into Beings(CharacterID, LocationID, TypeID, Name, Title, Gender, BirthYear, DeathYear)
  Values ('c046', 'L03', 't04', 'Tilda', null, 'Female', 'TA2930', null);


--Dragons--
Insert Into Dragons(CharacterID, WingSpanFeet, FireIntensityFahrenheit, ScaleDurabilityMetricTon)
  Values('c029', 800, 9000, 5000);

--Orcs--
insert into Orcs(CharacterID, NumberOfKills)
  Values('c001', 754);

insert into Orcs(CharacterID, NumberOfKills)
  Values('c009', 636);

insert into Orcs(CharacterID, NumberOfKills)
  Values('c016', 238);

insert into Orcs(CharacterID, NumberOfKills)
  Values('c038', 399);


--Trolls--
insert into Trolls(CharacterID, IntelligenceQuotient, GroupRole)
  Values('c005', 85, 'Cook');

insert into Trolls(CharacterID, IntelligenceQuotient, GroupRole)
  Values('c036', 72, 'Muscle');

insert into Trolls(CharacterID, IntelligenceQuotient, GroupRole)
  Values('c037', 71, 'Joker');

--Elves--
insert into Elves(CharacterID, Status)
  Values('c014', 'Lord');

insert into Elves(CharacterID, Status)
  Values('c018', 'Lady');

insert into Elves(CharacterID, Status)
  Values('c040', 'Prince');

insert into Elves(CharacterID, Status)
  Values('c041', 'Captain');


--Goblins--
insert into Goblins(CharacterID, NumberOfDeformities)
  Values('c022', 19);

--Humans--
insert into Humans(CharacterID)
  Values('c003');

insert into Humans(CharacterID)
  Values('c043');

insert into Humans(CharacterID)
  Values('c044');

insert into Humans(CharacterID)
  Values('c045');

insert into Humans(CharacterID)
  Values('c046');


--Wizards--
insert into Wizards(CharacterID, AssociatedColor, StaffHeightInches)
  Values('c019', 'Grey', 72);

insert into Wizards(CharacterID, AssociatedColor, StaffHeightInches)
  Values('c027', 'Brown', 65);

insert into Wizards(CharacterID, AssociatedColor, StaffHeightInches)
  Values('c028', 'White', 72);


--Hobbits--
insert into Hobbits(CharacterID, TotalAdventures)
  Values('c007', 1);

insert into Hobbits(CharacterID, TotalAdventures)
  Values('c017', 0);

insert into Hobbits(CharacterID, TotalAdventures)
  Values('c042', 0);


--Dwarves--
insert into Dwarves(CharacterID, SpecialSkill)
  Values('c002', 'Historic Knowledge');

insert into Dwarves(CharacterID, SpecialSkill)
  Values('c006', 'Fearlessness');

insert into Dwarves(CharacterID, SpecialSkill)
  Values('c008', 'Farming');

insert into Dwarves(CharacterID, SpecialSkill)
  Values('c010','Eating');

insert into Dwarves(CharacterID, SpecialSkill)
  Values('c012','Critical Thinking');

insert into Dwarves(CharacterID, SpecialSkill)
  Values('c013', 'Intimidation');

insert into Dwarves(CharacterID, SpecialSkill)
  Values('c015', 'Bravery');

insert into Dwarves(CharacterID, SpecialSkill)
  Values('c020', 'Short-Temper');

insert into Dwarves(CharacterID, SpecialSkill)
  Values('c023', 'Bravery');

insert into Dwarves(CharacterID, SpecialSkill)
  Values('c024', 'Hunting');

insert into Dwarves(CharacterID, SpecialSkill)
  Values('c025', 'Fire Starting');

insert into Dwarves(CharacterID, SpecialSkill)
  Values('c026', 'Manners');

insert into Dwarves(CharacterID, SpecialSkill)
  Values('c030', 'Greed');

insert into Dwarves(CharacterID, SpecialSkill)
  Values('c031', 'Leadership');

insert into Dwarves(CharacterID, SpecialSkill)
  Values('c032', 'Leadership');

insert into Dwarves(CharacterID, SpecialSkill)
  Values('c033', 'Greed');

insert into Dwarves(CharacterID, SpecialSkill)
  Values('c035', 'Leadership');


--SkinChangers--

insert into SkinChangers(CharacterID, FormPreference)
  Values('c004', 'Black Bear');


--CompanyMembers--

insert into CompanyMembers(CharacterID, WeaponID, CompanyRole)
  Values('c002', 'w03', 'Guide');

insert into CompanyMembers(CharacterID, WeaponID, CompanyRole)
  Values('c006', 'w01', 'Muscle');

insert into CompanyMembers(CharacterID, WeaponID, CompanyRole)
  Values('c007', 'w02', 'Burgalar');

insert into CompanyMembers(CharacterID, WeaponID, CompanyRole)
  Values('c008', 'w04', 'Motivator');

insert into CompanyMembers(CharacterID, WeaponID, CompanyRole)
  Values('c010', 'w05', 'Chef');

insert into CompanyMembers(CharacterID, WeaponID, CompanyRole)
  Values('c012', 'w06', 'Supervisor');

insert into CompanyMembers(CharacterID, WeaponID, CompanyRole)
  Values('c013', 'w07', 'Muscle');

insert into CompanyMembers(CharacterID, WeaponID, CompanyRole)
  Values('c015', 'w08', 'Protector');

insert into CompanyMembers(CharacterID, WeaponID, CompanyRole)
  Values('c019', 'w09', 'Counselor');

insert into CompanyMembers(CharacterID, WeaponID, CompanyRole)
  Values('c020', 'w10', 'Muscle');

insert into CompanyMembers(CharacterID, WeaponID, CompanyRole)
  Values('c023', 'w11', 'Protector');

insert into CompanyMembers(CharacterID, WeaponID, CompanyRole)
  Values('c024', 'w12', 'Hunter');

insert into CompanyMembers(CharacterID, WeaponID, CompanyRole)
  Values('c025', 'w13', 'Fire Starter');

insert into CompanyMembers(CharacterID, WeaponID, CompanyRole)
  Values('c026', 'w14', 'Rookie');

insert into CompanyMembers(CharacterID, WeaponID, CompanyRole)
  Values('c031', 'w15', 'Leader');

--Weapons--

insert into Weapons(WeaponID, WeaponType, AssociatedName)
  Values('w01', 'Boar Spear', null);

insert into Weapons(WeaponID, WeaponType, AssociatedName)
  Values('w02', 'Elven Sword', 'Sting' );

insert into Weapons(WeaponID, WeaponType, AssociatedName)
  Values('w03', 'Dagger', null );

insert into Weapons(WeaponID, WeaponType, AssociatedName)
  Values('w04', 'Mattock', null );

insert into Weapons(WeaponID, WeaponType, AssociatedName)
  Values('w05', 'Dwarf Flail', null );

insert into Weapons(WeaponID, WeaponType, AssociatedName)
  Values('w06', 'Sword', null);

insert into Weapons(WeaponID, WeaponType, AssociatedName)
  values('w07', 'Dual Axes', 'Grasper and Keeper');

insert into Weapons(WeaponID, WeaponType, AssociatedName)
  values('w08', 'Dual Swords', 'Fili and Kili');

insert into Weapons(WeaponID, WeaponType, AssociatedName)
  values('w09', 'Sword', 'Foe Hammer');

insert into Weapons(WeaponID, WeaponType, AssociatedName)
  values('w10', 'Walking Axe', null );

insert into Weapons(WeaponID, WeaponType, AssociatedName)
  values('w11', 'Bow and Arrow', null );

insert into Weapons(WeaponID, WeaponType, AssociatedName)
  values('w12', 'Fleshing Knives', null);

insert into Weapons(WeaponID, WeaponType, AssociatedName)
  values('w13', 'Fighting Staff', null);

insert into Weapons(WeaponID, WeaponType, AssociatedName)
  values('w14', 'Slinghshot', null);

insert into Weapons(WeaponID, WeaponType, AssociatedName)
  values('w15', 'Elven Sword', 'Biter');


--Battles--

Insert into Battles(BattleID, LocationID, BattleYear, BattleName)
  Values('b01', 'L21', 'TA2799', 'Battle of Azanulbizar');

Insert into Battles(BattleID, LocationID, BattleYear, BattleName)
  Values('b02', 'L02', 'TA2770', 'The Coming of Smaug');

Insert into Battles(BattleID, LocationID, BattleYear, BattleName)
  Values('b03', 'L03', 'TA2941', 'The Desolation of Smaug');

Insert into Battles(BattleID, LocationID, BattleYear, BattleName)
  Values('b04', 'L02', 'TA2941', 'The Desolation of Smaug');

Insert into Battles(BattleID, LocationID, BattleYear, BattleName)
  Values('b05', 'L12', 'TA2941', 'The Battle Within the Great Goblins Cavern');

Insert into Battles(BattleID, LocationID, BattleYear, BattleName)
  Values('b06', 'L21', 'TA2941', 'Gollum vs. Bilbo');

Insert into Battles(BattleID, LocationID, BattleYear, BattleName)
  Values('b07', 'L20', 'TA2941', 'Reunion of The Defiler and Oakenshield');

Insert into Battles(BattleID, LocationID, BattleYear, BattleName)
  Values('b08', 'L16', 'TA2940', 'The Troll Encounter');

Insert into Battles(BattleID, LocationID, BattleYear, BattleName)
  Values('b09', 'L02', 'TA2941', 'The Battle of The Five Armies');

Insert into Battles(BattleID, LocationID, BattleYear, BattleName)
  Values('b10', 'L17', 'TA2941', 'The Rescue of Gandalf the Grey');


--FoughtIn--

insert into FoughtIn(CharacterID, BattleID, BattleWon, ResultLivingStatus)
  Values('c001', 'b01', false, true);

insert into FoughtIn(CharacterID, BattleID, BattleWon, ResultLivingStatus)
  Values('c011', 'b01', true, true);

insert into FoughtIn(CharacterID, BattleID, BattleWon, ResultLivingStatus)
  Values('c031', 'b01', true, true);

insert into FoughtIn(CharacterID, BattleID, BattleWon, ResultLivingStatus)
  Values('c033', 'b01',true, false);

insert into FoughtIn(CharacterID, BattleID, BattleWon, ResultLivingStatus)
  Values('c035', 'b01',true, false);

insert into FoughtIn(CharacterID, BattleID, BattleWon, ResultLivingStatus)
  Values('c002', 'b01',true, true);

insert into FoughtIn(CharacterID, BattleID, BattleWon, ResultLivingStatus)
  Values('c006', 'b01',true, true);

insert into FoughtIn(CharacterID, BattleID, BattleWon, ResultLivingStatus)
  Values('c013', 'b01',true, true);

insert into FoughtIn(CharacterID, BattleID, BattleWon, ResultLivingStatus)
  Values('c012', 'b01',true, true);

insert into FoughtIn(CharacterID, BattleID, BattleWon, ResultLivingStatus)
  Values('c035' ,'b02', false, true);

insert into FoughtIn(CharacterID, BattleID, BattleWon, ResultLivingStatus)
  Values('c031', 'b02', false, true);

insert into FoughtIn(CharacterID, BattleID, BattleWon, ResultLivingStatus)
  Values('c033', 'b02', false, true);

insert into FoughtIn(CharacterID, BattleID, BattleWon, ResultLivingStatus)
  Values('c029', 'b02', true, true );

insert into FoughtIn(CharacterID, BattleID, BattleWon, ResultLivingStatus)
  Values('c002', 'b02', false, true);

insert into FoughtIn(CharacterID, BattleID, BattleWon, ResultLivingStatus)
  Values('c003' , 'b03', true, true );

insert into FoughtIn(CharacterID, BattleID, BattleWon, ResultLivingStatus)
  Values('c015' , 'b03', true, true );

insert into FoughtIn(CharacterID, BattleID, BattleWon, ResultLivingStatus)
  Values('c023' , 'b03', true, true );

insert into FoughtIn(CharacterID, BattleID, BattleWon, ResultLivingStatus)
  Values('c008' , 'b03', true, true );

insert into FoughtIn(CharacterID, BattleID, BattleWon, ResultLivingStatus)
  Values('c039' , 'b03', true, false );

insert into FoughtIn(CharacterID, BattleID, BattleWon, ResultLivingStatus)
  Values('c040' , 'b03', true, true);

insert into FoughtIn(CharacterID, BattleID, BattleWon, ResultLivingStatus)
  Values('c041' , 'b03', true, true );

insert into FoughtIn(CharacterID, BattleID, BattleWon, ResultLivingStatus)
  Values('c043' , 'b03', true, true );

insert into FoughtIn(CharacterID, BattleID, BattleWon, ResultLivingStatus)
  Values('c044' , 'b03', true, true );

insert into FoughtIn(CharacterID, BattleID, BattleWon, ResultLivingStatus)
  Values('c045' , 'b03', true, true );

insert into FoughtIn(CharacterID, BattleID, BattleWon, ResultLivingStatus)
  Values('c046' , 'b03', true, true );

insert into FoughtIn(CharacterID, BattleID, BattleWon, ResultLivingStatus)
  Values('c002' ,'b04', null, true);

insert into FoughtIn(CharacterID, BattleID, BattleWon, ResultLivingStatus)
  Values('c006' ,'b04', null, true);

insert into FoughtIn(CharacterID, BattleID, BattleWon, ResultLivingStatus)
  Values('c007' ,'b04', null, true);

insert into FoughtIn(CharacterID, BattleID, BattleWon, ResultLivingStatus)
  Values( 'c010','b04', null, true);

insert into FoughtIn(CharacterID, BattleID, BattleWon, ResultLivingStatus)
  Values('c012','b04', null, true);

insert into FoughtIn(CharacterID, BattleID, BattleWon, ResultLivingStatus)
  Values('c013' ,'b04', null, true);

insert into FoughtIn(CharacterID, BattleID, BattleWon, ResultLivingStatus)
  Values('c019' ,'b04', null, true);

insert into FoughtIn(CharacterID, BattleID, BattleWon, ResultLivingStatus)
  Values('c020' ,'b04', null, true);

insert into FoughtIn(CharacterID, BattleID, BattleWon, ResultLivingStatus)
  Values('c024' ,'b04', null, true);

insert into FoughtIn(CharacterID, BattleID, BattleWon, ResultLivingStatus)
  Values('c025' ,'b04', null, true);

insert into FoughtIn(CharacterID, BattleID, BattleWon, ResultLivingStatus)
  Values('c026' ,'b04', null, true);

insert into FoughtIn(CharacterID, BattleID, BattleWon, ResultLivingStatus)
  Values('c031' ,'b04', null, true);

insert into FoughtIn(CharacterID, BattleID, BattleWon, ResultLivingStatus)
  Values('c029' ,'b04', null, true);

insert into FoughtIn(CharacterID, BattleID, BattleWon, ResultLivingStatus)
  Values('c002' ,'b05', true, true);

insert into FoughtIn(CharacterID, BattleID, BattleWon, ResultLivingStatus)
  Values('c006' ,'b05', true, true);

insert into FoughtIn(CharacterID, BattleID, BattleWon, ResultLivingStatus)
  Values('c008' ,'b05', true, true);

insert into FoughtIn(CharacterID, BattleID, BattleWon, ResultLivingStatus)
  Values('c010' ,'b05', true, true);

insert into FoughtIn(CharacterID, BattleID, BattleWon, ResultLivingStatus)
  Values('c012'  ,'b05', true, true);

insert into FoughtIn(CharacterID, BattleID, BattleWon, ResultLivingStatus)
  Values('c013'  ,'b05', true, true);

insert into FoughtIn(CharacterID, BattleID, BattleWon, ResultLivingStatus)
  Values('c015' ,'b05', true, true);

insert into FoughtIn(CharacterID, BattleID, BattleWon, ResultLivingStatus)
  Values('c019' ,'b05', true, true);

insert into FoughtIn(CharacterID, BattleID, BattleWon, ResultLivingStatus)
  Values('c020' ,'b05', true, true);

insert into FoughtIn(CharacterID, BattleID, BattleWon, ResultLivingStatus)
  Values('c023' ,'b05', true, true);

insert into FoughtIn(CharacterID, BattleID, BattleWon, ResultLivingStatus)
  Values('c024' ,'b05', true, true);

insert into FoughtIn(CharacterID, BattleID, BattleWon, ResultLivingStatus)
  Values('c025' ,'b05', true, true);

insert into FoughtIn(CharacterID, BattleID, BattleWon, ResultLivingStatus)
  Values('c026' ,'b05', true, true);

insert into FoughtIn(CharacterID, BattleID, BattleWon, ResultLivingStatus)
  Values('c031' ,'b05', true, true);

insert into FoughtIn(CharacterID, BattleID, BattleWon, ResultLivingStatus)
  Values('c022' ,'b05', false, false);

insert into FoughtIn(CharacterID, BattleID, BattleWon, ResultLivingStatus)
  Values('c007', 'b06', true, true);

insert into FoughtIn(CharacterID, BattleID, BattleWon, ResultLivingStatus)
  Values('c021', 'b06', false, true);

insert into FoughtIn(CharacterID, BattleID, BattleWon, ResultLivingStatus)
  Values('c001','b07', null, true);

insert into FoughtIn(CharacterID, BattleID, BattleWon, ResultLivingStatus)
  Values('c009','b07', null, true);

insert into FoughtIn(CharacterID, BattleID, BattleWon, ResultLivingStatus)
  Values('c016','b07', null, true);

insert into FoughtIn(CharacterID, BattleID, BattleWon, ResultLivingStatus)
  Values('c038','b07', null, true);

insert into FoughtIn(CharacterID, BattleID, BattleWon, ResultLivingStatus)
  Values('c002' ,'b07', null, true);

insert into FoughtIn(CharacterID, BattleID, BattleWon, ResultLivingStatus)
  Values('c006' ,'b07', null, true);

insert into FoughtIn(CharacterID, BattleID, BattleWon, ResultLivingStatus)
  Values('c007' ,'b07', null, true);

insert into FoughtIn(CharacterID, BattleID, BattleWon, ResultLivingStatus)
  Values('c008' ,'b07', null, true);

insert into FoughtIn(CharacterID, BattleID, BattleWon, ResultLivingStatus)
  Values('c010' ,'b07', null, true);

insert into FoughtIn(CharacterID, BattleID, BattleWon, ResultLivingStatus)
  Values('c012' ,'b07', null, true);

insert into FoughtIn(CharacterID, BattleID, BattleWon, ResultLivingStatus)
  Values('c013' ,'b07', null, true);

insert into FoughtIn(CharacterID, BattleID, BattleWon, ResultLivingStatus)
  Values('c015' ,'b07', null, true);

insert into FoughtIn(CharacterID, BattleID, BattleWon, ResultLivingStatus)
  Values('c019' ,'b07', null, true);

insert into FoughtIn(CharacterID, BattleID, BattleWon, ResultLivingStatus)
  Values('c020' ,'b07', null, true);

insert into FoughtIn(CharacterID, BattleID, BattleWon, ResultLivingStatus)
  Values('c023' ,'b07', null, true);

insert into FoughtIn(CharacterID, BattleID, BattleWon, ResultLivingStatus)
  Values('c024' ,'b07', null, true);

insert into FoughtIn(CharacterID, BattleID, BattleWon, ResultLivingStatus)
  Values('c025' ,'b07', null, true);

insert into FoughtIn(CharacterID, BattleID, BattleWon, ResultLivingStatus)
  Values('c026' ,'b07', null, true);

insert into FoughtIn(CharacterID, BattleID, BattleWon, ResultLivingStatus)
  Values('c031' ,'b07', null, true);

insert into FoughtIn(CharacterID, BattleID, BattleWon, ResultLivingStatus)
  Values('c005' ,'b08', false, false);

insert into FoughtIn(CharacterID, BattleID, BattleWon, ResultLivingStatus)
  Values('c036' ,'b08', false, false);

insert into FoughtIn(CharacterID, BattleID, BattleWon, ResultLivingStatus)
  Values('c037' ,'b08', false, false);

insert into FoughtIn(CharacterID, BattleID, BattleWon, ResultLivingStatus)
  Values('c002' ,'b08', true, true);

insert into FoughtIn(CharacterID, BattleID, BattleWon, ResultLivingStatus)
  Values('c006' ,'b08', true, true);

insert into FoughtIn(CharacterID, BattleID, BattleWon, ResultLivingStatus)
  Values('c007' ,'b08', true, true);

insert into FoughtIn(CharacterID, BattleID, BattleWon, ResultLivingStatus)
  Values('c008'  ,'b08', true, true);

insert into FoughtIn(CharacterID, BattleID, BattleWon, ResultLivingStatus)
  Values('c010','b08', true, true);

insert into FoughtIn(CharacterID, BattleID, BattleWon, ResultLivingStatus)
  Values('c012' ,'b08', true, true);
  
insert into FoughtIn(CharacterID, BattleID, BattleWon, ResultLivingStatus)
  Values('c013' ,'b08', true, true);

insert into FoughtIn(CharacterID, BattleID, BattleWon, ResultLivingStatus)
  Values('c015' ,'b08', true, true);

insert into FoughtIn(CharacterID, BattleID, BattleWon, ResultLivingStatus)
  Values('c019' ,'b08', true, true);

insert into FoughtIn(CharacterID, BattleID, BattleWon, ResultLivingStatus)
  Values('c020' ,'b08', true, true);

insert into FoughtIn(CharacterID, BattleID, BattleWon, ResultLivingStatus)
  Values('c023' ,'b08', true, true);

insert into FoughtIn(CharacterID, BattleID, BattleWon, ResultLivingStatus)
  Values('c024' ,'b08', true, true);

insert into FoughtIn(CharacterID, BattleID, BattleWon, ResultLivingStatus)
  Values('c025','b08', true, true);

insert into FoughtIn(CharacterID, BattleID, BattleWon, ResultLivingStatus)
  Values('c026','b08', true, true);

insert into FoughtIn(CharacterID, BattleID, BattleWon, ResultLivingStatus)
  Values('c031','b08', true, true);

insert into FoughtIn(CharacterID, BattleID, BattleWon, ResultLivingStatus)
  Values('c001' ,'b09', false, false);

insert into FoughtIn(CharacterID, BattleID, BattleWon, ResultLivingStatus)
  Values('c002' ,'b09', true, true);

insert into FoughtIn(CharacterID, BattleID, BattleWon, ResultLivingStatus)
  Values('c003' ,'b09', true, true);

insert into FoughtIn(CharacterID, BattleID, BattleWon, ResultLivingStatus)
  Values('c006' ,'b09', true, true);

insert into FoughtIn(CharacterID, BattleID, BattleWon, ResultLivingStatus)
  Values('c007' ,'b09', true, true);

insert into FoughtIn(CharacterID, BattleID, BattleWon, ResultLivingStatus)
  Values('c008' ,'b09', true, true);

insert into FoughtIn(CharacterID, BattleID, BattleWon, ResultLivingStatus)
  Values('c009' ,'b09', false, false);

insert into FoughtIn(CharacterID, BattleID, BattleWon, ResultLivingStatus)
  Values('c010' ,'b09', true, true);

insert into FoughtIn(CharacterID, BattleID, BattleWon, ResultLivingStatus)
  Values('c011' ,'b09', true, true);
  
insert into FoughtIn(CharacterID, BattleID, BattleWon, ResultLivingStatus)
  Values('c012' ,'b09', true, true);

insert into FoughtIn(CharacterID, BattleID, BattleWon, ResultLivingStatus)
  Values('c013' ,'b09', true, true);

insert into FoughtIn(CharacterID, BattleID, BattleWon, ResultLivingStatus)
  Values('c015' ,'b09', true, true);

insert into FoughtIn(CharacterID, BattleID, BattleWon, ResultLivingStatus)
  Values('c016' ,'b09', false, false);

insert into FoughtIn(CharacterID, BattleID, BattleWon, ResultLivingStatus)
  Values('c019' ,'b09', true, true);

insert into FoughtIn(CharacterID, BattleID, BattleWon, ResultLivingStatus)
  Values('c020' ,'b09', true, true);

insert into FoughtIn(CharacterID, BattleID, BattleWon, ResultLivingStatus)
  Values('c023' ,'b09', true, false);

insert into FoughtIn(CharacterID, BattleID, BattleWon, ResultLivingStatus)
  Values('c024' ,'b09', true, true);

insert into FoughtIn(CharacterID, BattleID, BattleWon, ResultLivingStatus)
  Values('c025' ,'b09', true, true);

insert into FoughtIn(CharacterID, BattleID, BattleWon, ResultLivingStatus)
  Values('c026' ,'b09', true, true);

insert into FoughtIn(CharacterID, BattleID, BattleWon, ResultLivingStatus)
  Values('c031' ,'b09', true, false);

insert into FoughtIn(CharacterID, BattleID, BattleWon, ResultLivingStatus)
  Values('c034' ,'b09', true, true);

insert into FoughtIn(CharacterID, BattleID, BattleWon, ResultLivingStatus)
  Values('c038' ,'b09', true, true);

insert into FoughtIn(CharacterID, BattleID, BattleWon, ResultLivingStatus)
  Values('c040' ,'b09', true, true);

insert into FoughtIn(CharacterID, BattleID, BattleWon, ResultLivingStatus)
  Values('c041' ,'b09', true, true);
  
insert into FoughtIn(CharacterID, BattleID, BattleWon, ResultLivingStatus)
  Values('c043' ,'b09', true, true);

insert into FoughtIn(CharacterID, BattleID, BattleWon, ResultLivingStatus)
  Values('c044' ,'b09', true, true);

insert into FoughtIn(CharacterID, BattleID, BattleWon, ResultLivingStatus)
  Values('c045' ,'b09', true, true);

insert into FoughtIn(CharacterID, BattleID, BattleWon, ResultLivingStatus)
  Values('c046' ,'b09', true, true);

insert into FoughtIn(CharacterID, BattleID, BattleWon, ResultLivingStatus)
  Values('c019' ,'b10', true, true);

insert into FoughtIn(CharacterID, BattleID, BattleWon, ResultLivingStatus)
  Values('c018' ,'b10', true, true);

insert into FoughtIn(CharacterID, BattleID, BattleWon, ResultLivingStatus)
  Values('c027' ,'b10', true, true);

insert into FoughtIn(CharacterID, BattleID, BattleWon, ResultLivingStatus)
  Values('c028' ,'b10', true, true);

insert into FoughtIn(CharacterID, BattleID, BattleWon, ResultLivingStatus)
  Values('c009' ,'b10', false, true);


--TypeOfBeings--

insert into TypeOfBeings(TypeID, TypeName)
  values('t01', 'Dwarf');

insert into TypeOfBeings(TypeID, TypeName)
  values('t02', 'Hobbit');

insert into TypeOfBeings(TypeID, TypeName)
  values('t03', 'Wizard');

insert into TypeOfBeings(TypeID, TypeName)
  values('t04', 'Human');

insert into TypeOfBeings(TypeID, TypeName)
  values('t05', 'Goblin');

insert into TypeOfBeings(TypeID, TypeName)
  values('t06', 'Elf');

insert into TypeOfBeings(TypeID, TypeName)
  values('t07', 'Troll');

insert into TypeOfBeings(TypeID, TypeName)
  values('t08', 'Orc');

insert into TypeOfBeings(TypeID, TypeName)
  values('t09', 'Dragon');

insert into TypeOfBeings(TypeID, TypeName)
  values('t10', 'SkinChanger');


-------------------------------------------------------------------
---------------------------Views-----------------------------------
-------------------------------------------------------------------

--BattleRecord--
create view BattleRecord as
       select b.Name as Name,
	      ba.BattleName
       from FoughtIn f inner join Beings b on f.CharacterID = b.CharacterID
	               inner join Battles ba on f.BattleID = ba.BattleID
order by name ASC;

select *
from BattleRecord

--KilledInAction--
create view KilledInAction as
       select b.Name,
              ba.BattleName,
              ba.BattleYear
       from FoughtIn f inner join Beings b on f.CharacterID = b.CharacterID
	               inner join Battles ba on f.BattleID = ba.BattleID
       where f.ResultLivingStatus = 'f'
order by name asc;

select *
from KilledInAction

--LivingStatus--
create view LivingStatus as
       select distinct  b.Name,
                        b.TypeID,
                        f.ResultLivingStatus
       from FoughtIn f inner join Beings b on f.CharacterID = b.CharacterID
	               inner join Battles ba on f.BattleID = ba.BattleID
       where f.ResultLivingStatus = 't'
       and   b.DeathYear is null
order by name ASC;

select *
From LivingStatus

-------------------------------------------------------------------
-------------------------Queries-----------------------------------
-------------------------------------------------------------------
--Query to return the number of battles one by each person.
select b.Name,
       count(b.CharacterID) as BattlesWon
from FoughtIn f inner join Beings b on f.CharacterID = b.CharacterID
	        inner join Battles ba on f.BattleID = ba.BattleID
where f.BattleWon = 't'
group by b.Name
order by BattlesWon DESC;

--Query to return the remaining Company members.
select b.name
from Beings b inner join CompanyMembers cm on b.CharacterID = cm.CharacterID
where b.DeathYear is null
group by b.CharacterID
Order by b.name ASC;

-------------------------------------------------------------------
-----------------Stored Procedures---------------------------------
-------------------------------------------------------------------
--CalculateWinningPercentage
create or replace function CalculateWinningPercentage(CombatantName text)
returns table(WinningPercentage numeric) as
$$
begin
  Return query select trunc (
  (cast(
        (select count(f.BattleWon)
         from FoughtIn f inner join Beings b on f.CharacterID = b.CharacterID
	                 inner join Battles ba on f.BattleID = ba.BattleID
	 where b.Name = CombatantName
	 and   f.BattleWon = 't' 
        ) as decimal (5,2)
       )
       /
       (select count(f.BattleWon) as TotalBattlesFought
        from FoughtIn f inner join Beings b on f.CharacterID = b.CharacterID
	                inner join Battles ba on f.BattleID = ba.BattleID
	where b.Name = CombatantName
       )*100), 2
  )as WinningPercentage
From Beings
where name = CombatantName;
end;
$$
language plpgsql;

select CalculateWinningPercentage('Thorin II');

drop function CalculateWinningPercentage(text)


--DeathUpdate
create or replace function DeathUpdate() returns trigger as
$$
declare CurrentYear string := 'TA2942';
begin
  if new.ResultLivingStatus = false
  and (select DeathYear
       from Beings
       where ResultLivingStatus = new.ResultLivingStatus) is null
  then update Beings
       set DeathYear = CurrentYear
       where ResultLivingStatus = new.ResultLivingStatus
  end if;
  return new;
end;
$$
language plpgsql; 

-------------------------------------------------------------------
--------------------------Triggers---------------------------------
-------------------------------------------------------------------
--DeathUpdate
create trigger DeathUpdate
after update on FoughtIn
for each row execute DeathUpdate();

-------------------------------------------------------------------
-------------------------Security----------------------------------
-------------------------------------------------------------------

create role admin;
grant all on all tables in schema public to admin;

Create role Baggins;
grant select on all tables in schema public to admin;
grant insert on Beings, TypeOfBeings, SkinChangers, Dragons, 
                Orcs, Trolls, Elves, Goblins, Humans, Wizards, 
                Hobbits, Dwarves, FoughtIn, Battles, Locations to Baggins;
grant update on Beings, TypeOfBeings, SkinChangers, Dragons, 
                Orcs, Trolls, Elves, Goblins, Humans, Wizards, 
                Hobbits, Dwarves, FoughtIn, Battles, Locations,
                CompanyMembers, Weapons to Baggins;






