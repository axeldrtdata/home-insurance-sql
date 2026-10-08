-- 10 · Top 10 departments by average monthly premium (with the number of contracts behind each average)
SELECT region.dep_nom,
       ROUND(AVG(contrat.Prix_cotisation_mensuel), 2) AS average_premium,
       COUNT(*)                                       AS contracts
FROM contrat
JOIN region
    ON contrat.Code_dep_code_commune = region.Code_dep_code_commune
GROUP BY region.dep_nom
ORDER BY average_premium DESC
LIMIT 10;
