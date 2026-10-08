-- 09 · Average surface of the contracts in Paris
SELECT ROUND(AVG(contrat.Surface), 2) AS average_surface_paris
FROM contrat
JOIN region
    ON contrat.Code_dep_code_commune = region.Code_dep_code_commune
WHERE region.dep_nom = 'Paris';
