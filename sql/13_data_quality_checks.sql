-- 13 · Data quality checks, added on a second look at the data

-- a) Contracts whose commune code does not exist in the region table (lost by every inner join)
PRAGMA foreign_key_check;

SELECT Contrat_ID, Code_dep_code_commune, Code_postal
FROM contrat
WHERE Code_dep_code_commune NOT IN (SELECT Code_dep_code_commune FROM region);

-- b) Communes that share their name with another commune
SELECT COUNT(*) AS communes, COUNT(DISTINCT com_nom_maj_court) AS distinct_names
FROM region;

-- c) What the premium depends on: declared value, then the other variables
SELECT Valeur_declaree_biens, ROUND(AVG(Prix_cotisation_mensuel), 1) AS average_premium
FROM contrat GROUP BY Valeur_declaree_biens;

SELECT Formule, ROUND(AVG(Prix_cotisation_mensuel), 1) AS average_premium
FROM contrat GROUP BY Formule;

SELECT Type_local, ROUND(AVG(Prix_cotisation_mensuel), 1) AS average_premium
FROM contrat GROUP BY Type_local;

-- d) Paris against the rest of France, within each band of declared value
SELECT contrat.Valeur_declaree_biens,
       ROUND(AVG(CASE WHEN region.dep_nom = 'Paris' THEN contrat.Prix_cotisation_mensuel END), 1)  AS paris,
       ROUND(AVG(CASE WHEN region.dep_nom <> 'Paris' THEN contrat.Prix_cotisation_mensuel END), 1) AS elsewhere
FROM contrat
JOIN region
    ON contrat.Code_dep_code_commune = region.Code_dep_code_commune
GROUP BY contrat.Valeur_declaree_biens;
