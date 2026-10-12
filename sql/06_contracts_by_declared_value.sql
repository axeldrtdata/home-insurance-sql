-- 06 · Number of contracts and average premium for each band of declared value
SELECT Valeur_declaree_biens,
       COUNT(*)                                AS contracts,
       ROUND(AVG(Prix_cotisation_mensuel), 1)  AS average_premium
FROM contrat
GROUP BY Valeur_declaree_biens
ORDER BY average_premium;
