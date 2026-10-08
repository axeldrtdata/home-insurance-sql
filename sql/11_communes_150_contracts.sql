-- 11 · Communes with at least 150 contracts
-- Grouped by commune code, not by name: 38,916 communes share only 35,572 names
SELECT region.com_nom_maj_court,
       region.Code_dep_code_commune,
       COUNT(contrat.Contrat_ID) AS contracts
FROM contrat
JOIN region
    ON contrat.Code_dep_code_commune = region.Code_dep_code_commune
GROUP BY region.Code_dep_code_commune, region.com_nom_maj_court
HAVING COUNT(contrat.Contrat_ID) >= 150
ORDER BY contracts DESC;
