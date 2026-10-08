-- 07 · Number of "Integral" contracts in the Pays de la Loire region
SELECT COUNT(contrat.Contrat_ID) AS integral_contracts_pays_de_la_loire
FROM contrat
JOIN region
    ON contrat.Code_dep_code_commune = region.Code_dep_code_commune
WHERE region.reg_nom = 'Pays de la Loire'
  AND contrat.Formule = 'Integral';
