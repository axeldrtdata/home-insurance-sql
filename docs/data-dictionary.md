# Data dictionary

The database has two tables, linked by `Code_dep_code_commune`. Column names are kept in French, as in the source files.

## `contrat` — one row per home insurance contract (30,335 rows)

| Column | Type | Description | Rules |
| ------ | ---- | ----------- | ----- |
| `Contrat_ID` | INTEGER | Unique contract number | Primary key |
| `Code_dep_code_commune` | VARCHAR(45) | Department code followed by the commune code, without leading zero (e.g. `1350`, `75118`, `974415`) | Foreign key to `region` |
| `Code_postal` | INTEGER | Postcode of the insured home | |
| `Surface` | INTEGER | Surface of the home, in m² | |
| `Type_local` | VARCHAR(45) | `Appartement` or `Maison` | |
| `Occupation` | VARCHAR(45) | Status of the occupant: `Locataire` (tenant) or `Proprietaire` (owner) | |
| `Type_contrat` | VARCHAR(45) | `Residence principale` (main home), `Residence secondaire` (second home) or `Mise en location` (rented out) | |
| `Formule` | VARCHAR(45) | `Classique` or `Integral` | |
| `Valeur_declaree_biens` | VARCHAR(45) | Band of declared value of the insured contents, in €: `0-25000`, `25000-50000`, `50000-100000`, `100000+` | Text, not a number |
| `Prix_cotisation_mensuel` | INTEGER | Monthly premium, in € | |

## `region` — one row per French commune (38,916 rows)

| Column | Type | Description | Rules |
| ------ | ---- | ----------- | ----- |
| `Code_dep_code_commune` | VARCHAR(45) | Department code followed by the commune code | Primary key |
| `reg_code` | CHAR(2) | Region code | |
| `reg_nom` | VARCHAR(45) | Region name (19 values, overseas included) | |
| `aca_nom` | VARCHAR(45) | Education authority (académie) | |
| `dep_nom` | VARCHAR(45) | Department name | |
| `com_nom_maj_court` | VARCHAR(45) | Commune name, short form in capitals | Not unique: 35,572 names for 38,916 communes |
| `dep_code` | VARCHAR(45) | Department code | |
| `dep_nom_num` | VARCHAR(49) | Department name and number, e.g. `Ain (01)` | |

## Changes from the original database

- **Street addresses removed.** The original `contrat` table also held the street number, repetition index (`B_T_Q`), street type and street name of each insured home. Combined with a commune, a surface and a premium, an address can point to a person, so these four columns are not published.
- **Column renamed back.** `Valeur_declaree_biens` is the name used in the source file. It had become `Valeur_declaree_mensuel` when the table was created, a misleading name since the column holds a band of value, not a monthly amount.

## Known data issue

Nine contracts in La Réunion carry their postcode (`97434`, `97460`, `97470`) instead of their commune code, so they match no row in `region` and disappear from every inner join. They are kept as they are and listed by `sql/13_data_quality_checks.sql`. SQLite only enforces foreign keys after `PRAGMA foreign_keys = ON`, which is why the load accepted them.
