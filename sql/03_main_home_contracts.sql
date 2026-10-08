-- 03 · Number of contracts on main homes
SELECT COUNT(*) AS main_home_contracts
FROM contrat
WHERE Type_contrat = 'Residence principale';
