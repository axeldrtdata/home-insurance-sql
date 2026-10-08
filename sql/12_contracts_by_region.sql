-- 12 · Number of contracts in each region
SELECT region.reg_nom, COUNT(contrat.Contrat_ID) AS contracts
FROM contrat
JOIN region
    ON contrat.Code_dep_code_commune = region.Code_dep_code_commune
GROUP BY region.reg_nom
ORDER BY contracts DESC;
