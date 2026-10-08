-- 00 · Schema of the database (street addresses removed from the public version)
CREATE TABLE region (
    Code_dep_code_commune VARCHAR(45) PRIMARY KEY,  -- department code + commune code
    reg_code              CHAR(2),
    reg_nom               VARCHAR(45),              -- region
    aca_nom               VARCHAR(45),              -- education authority (académie)
    dep_nom               VARCHAR(45),              -- department
    com_nom_maj_court     VARCHAR(45),              -- commune, short name in capitals
    dep_code              VARCHAR(45),
    dep_nom_num           VARCHAR(49)               -- department name and number
);

CREATE TABLE contrat (
    Contrat_ID              INTEGER PRIMARY KEY,
    Code_dep_code_commune   VARCHAR(45) REFERENCES region (Code_dep_code_commune),
    Code_postal             INTEGER,
    Surface                 INTEGER,                -- m²
    Type_local              VARCHAR(45),            -- Appartement / Maison
    Occupation              VARCHAR(45),            -- Locataire / Proprietaire
    Type_contrat            VARCHAR(45),            -- main home, second home, rented out
    Formule                 VARCHAR(45),            -- Classique / Integral
    Valeur_declaree_biens   VARCHAR(45),            -- band of declared value of the contents, in €
    Prix_cotisation_mensuel INTEGER                 -- monthly premium, in €
);
