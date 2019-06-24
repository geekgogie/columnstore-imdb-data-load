CREATE SCHEMA imdb;
USE imdb;


CREATE TABLE name_basics(
	id char(10),
	primaryName varchar(500),
	birthyear smallint unsigned,
	deathYear smallint unsigned,
	profession varchar(500),
	knownForTitles varchar(500)
) ENGINE=ColumnStore DEFAULT CHARSET=utf8;

CREATE TABLE title_akas(
	titleId char(10),
	ordering tinyint unsigned,
	title varchar(500),
	region char(5),
	language char(5),
	types varchar(20),
	attributes varchar(200),
	isOriginalTitle tinyint unsigned
)ENGINE=ColumnStore DEFAULT CHARSET=utf8;
          
          
CREATE TABLE title_basics(
	titleId char(9),
	titleType varchar(15),
	primaryTitle varchar(550),
	originalTitle varchar(550),
	isAdult tinyint unsigned,
	startYear smallint unsigned,
	endYear smallint unsigned,
	runtimeMinutes int unsigned,
	genres varchar(60)
) ENGINE=ColumnStore DEFAULT CHARSET=utf8;     		 
          
          
CREATE TABLE title_crew(
	titleId char(9),
	directors varchar(800),
	writers varchar(800)
) ENGINE=ColumnStore DEFAULT CHARSET=utf8;   


CREATE TABLE title_episode(
        titleId char(9),
        parentId char(9),
        seasonNumber smallint unsigned,
        episodeNumbrer int unsigned
) ENGINE=ColumnStore DEFAULT CHARSET=utf8;   


CREATE TABLE title_ratings(
        titleId char(9),
        averageRating decimal(5,2),
        numVotes int unsigned
) ENGINE=ColumnStore DEFAULT CHARSET=utf8;   

