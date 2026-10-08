-- 05 · Average monthly premium (a few large contracts pull it above the median of 15 €)
SELECT ROUND(AVG(Prix_cotisation_mensuel), 2) AS average_premium
FROM contrat;
