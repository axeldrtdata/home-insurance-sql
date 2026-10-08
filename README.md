# What drives the price of a home insurance policy?

A two-table SQLite database of 30,335 home insurance contracts, twelve business questions answered in SQL, and a second look at what the joins were hiding.

**Read the case study:** https://axeldrtdata.github.io/works/home-insurance-sql/

## Context

A home insurance company kept its contracts in two flat files: one row per contract, and a reference list of French communes. The brief was to design a relational database its teams could query, then answer twelve business questions in SQL: where the customers live, what they insure and how much they pay. This was my first SQL project; I came back to it for my portfolio.

## Key results

| Question | Result |
| -------- | ------ |
| Contracts | 30,335, 92% apartments, 84% main homes, 70% owners |
| Contracts in Île-de-France | 14,177, 47% of the total |
| Average monthly premium | €19.33 (median €15) |
| Average premium by declared value | €13.6 (0–25,000 €) → €30.1 → €76.7 → €193.5 (100,000 € +), ×14 |
| Formula, type of home, occupant status | between €19.2 and €20.2 on average: almost no effect |
| Paris vs the rest of France | €36.40 vs €16.10, but only 5% to 19% more within the same value band |

### A second look at the data

- **Nine contracts are lost by every join.** In La Réunion, nine contracts carry their postcode instead of their commune code, so they match no commune. SQLite only enforces foreign keys after `PRAGMA foreign_keys = ON`; `PRAGMA foreign_key_check` lists them.
- **One value band was missing** from the original answer to question 6: the 104 contracts above €100,000. The query now uses a single `GROUP BY`.
- **Commune names are not unique** (35,572 names for 38,916 communes), so question 11 now groups by commune code.

## Repository structure

```
home-insurance-sql/
├── database/
│   └── home_insurance.db          # SQLite database, street addresses removed
├── docs/
│   └── data-dictionary.md         # every column, its type and its rules
├── sql/
│   ├── 00_schema.sql              # CREATE TABLE statements
│   ├── 01_… to 12_….sql           # the twelve business questions
│   └── 13_data_quality_checks.sql # orphan contracts, homonyms, what drives the premium
└── README.md
```

## How to run it

1. Clone the repository.
2. Open `database/home_insurance.db` with [DB Browser for SQLite](https://sqlitebrowser.org/) or SQLiteStudio, or from a terminal:
   ```bash
   sqlite3 database/home_insurance.db
   ```
3. Run any file from the `sql/` folder, for example `.read sql/06_contracts_by_declared_value.sql` in the `sqlite3` shell.

## Limits

- The data is a single snapshot with no dates.
- Declared values come in four bands, not amounts.
- The nine orphan contracts are kept as they are and documented; matching their postcodes to communes would need an external reference.

## GDPR

The original contract table held the street number, repetition index, street type and street name of each insured home. Combined with a commune, a surface and a premium, an address can point to a person, so these columns are not published.

## Stack

SQL · SQLite

## Data sources

Two files provided by OpenClassrooms for the Data Analyst path: an extract of home insurance contracts (training case) and the official list of French communes with their department and region.

## Note on the translation

This project was first written in French in December 2025 as part of my OpenClassrooms Data Analyst training. The queries were translated into English and re-run for my portfolio in October 2026. Table and column names stay in French, as in the source files.

---

Axel Derobert · Data Analyst · Lyon · [Portfolio](https://axeldrtdata.github.io) · [LinkedIn](https://www.linkedin.com/in/axel-derobert-5717463b1/)
