# SQL Join exercise
#

#
# 1: Get the cities with a name starting with ping sorted by their population with the least populated cities first
#SELECT *
 FROM city
 WHERE Name LIKE 'ping%'
 ORDER BY Population ASC;
#
# 2: Get the cities with a name starting with ran sorted by their population with the most populated cities first
#SELECT *
 FROM city
 WHERE Name LIKE 'ran%'
 ORDER BY Population DESC;
#
# 3: Count all cities
#SELECT count(*) FROM city
#
# 4: Get the average population of all cities
#SELECT AVG(Population) FROM city
#
# 5: Get the biggest population found in any of the cities
SELECT MAX(Population) FROM city;
#
#
# 6: Get the smallest population found in any of the cities
#SELECT MIN(Population) FROM city;
#
# 7: Sum the population of all cities with a population below 10000
#SELECT SUM(Population)
 FROM City
 WHERE Population < 10000
#
# 8: Count the cities with the countrycodes MOZ and VNM
SELECT COUNT(*)
FROM City
WHERE CountryCode IN ('MOZ' , 'VNM')
#
#
# 9: Get individual count of cities for the countrycodes MOZ and VNM
#SELECT countrycode, COUNT(*) AS city_count
 FROM city
 WHERE countrycode IN ('MOZ', 'VNM')
 GROUP BY countrycode;
#
# 10: Get average population of cities in MOZ and VNM
#SELECT AVG(Population)
 FROM City
 WHERE CountryCode IN ('MOZ' , 'VNM' )
 GROUP BY CountryCode
#
# 11: Get the countrycodes with more than 200 cities
#SELECT CountryCode
 FROM City
 GROUP BY CountryCode
 HAVING COUNT(*) > 200
#
# 12: Get the countrycodes with more than 200 cities ordered by city count
#SELECT CountryCode, COUNT(*)
 FROM city
 GROUP BY CountryCode
 HAVING COUNT(*) > 200
 ORDER BY COUNT(*) DESC;

#
# 13: What language(s) is spoken in the city with a population between 400 and 500 ?
#SELECT countrylanguage.language FROM city
 JOIN countrylanguage ON city.countrycode = countrylanguage.countrycode
 WHERE city.population BETWEEN 400 AND 500;
#
# 14: What are the name(s) of the cities with a population between 500 and 600 people and the language(s) spoken in them
#SELECT City.Name , CountryLanguage.Language
 FROM City
 JOIN CountryLanguage
 ON City.CountryCode = CountryLanguage.CountryCode
 WHERE City.Population BETWEEN 400 AND 600
#
# 15: What names of the cities are in the same country as the city with a population of 122199 (including the that city itself)
#SELECT city2.Name
 FROM city AS city1
 JOIN city AS city2
 ON city1.CountryCode = city2.CountryCode
 WHERE city1.Population = 122199
#
# 16: What names of the cities are in the same country as the city with a population of 122199 (excluding the that city itself)
#SELECT city2.Name
  FROM city AS city1
  JOIN city AS city2
  ON city1.CountryCode = city2.CountryCode
  WHERE city1.Population = 122199
  AND City2.population <> 122199;
#
# 17: What are the city names in the country where Luanda is capital?
#SELECT *
 FROM country
 JOIN City
 ON Country.code = city.countrycode
 WHERE Capital = ( SELECT Id FROM city WHERE Name = 'Luanda' );
#
# 18: What are the names of the capital cities in countries in the same region as the city named Yaren
#SELECT city.Name
 FROM country
 JOIN city
   ON country.Capital = city.Id
 WHERE country.Region = (
     SELECT country.Region
     FROM country
     JOIN city
       ON country.Code = city.CountryCode
     WHERE city.Name = 'Yaren'
 );
#
# 19: What unique languages are spoken in the countries in the same region as the city named Riga
#SELECT DISTINCT countrylanguage.Language
 FROM country
 JOIN countrylanguage
   ON country.Code = countrylanguage.CountryCode
 WHERE country.Region = (
     SELECT country.Region
     FROM country
     JOIN city
       ON country.Code = city.CountryCode
     WHERE city.Name = 'Riga'
 );

#
# 20: Get the name of the most populous city
#SELECT Name
 FROM city
 ORDER BY Population DESC
 LIMIT 1;



# SQL select query exercise
#
# World database layout:
# To use this database from a default MySQL install, type: use world;
#
# Table: City
# Columns: Id,Name,CountryCode,District,Population
#
# Table: Country
# Columns: Code, Name, Continent, Region, SurfaceArea, IndepYear, Population, LifeExpectancy, GNP, Capital
#
# Table: CountryLanguage
# Columns: CountryCode, Language, IsOfficial,Percentage