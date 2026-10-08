-- 08 · Contract numbers, contract type and formula for houses in department 71
SELECT contrat.Contrat_ID, contrat.Type_contrat, contrat.Formule
FROM contrat
JOIN region
    ON contrat.Code_dep_code_commune = region.Code_dep_code_commune
WHERE region.dep_code = '71'
  AND contrat.Type_local = 'Maison';
