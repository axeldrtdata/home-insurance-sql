# What do 30,000 home insurance contracts reveal?

A two-table SQLite database of 30,335 home insurance contracts, then twelve business questions answered in SQL: where the customers live, what they insure and how much they pay.

**Read the case study:** https://axeldrtdata.github.io/works/home-insurance-sql/

## Context

A home insurance company kept its contracts in two flat files: one row per contract, and a reference list of French communes. The brief was to design a relational database its teams could query, then answer twelve business questions in SQL: where the customers live, what they insure and how much they pay. This was my first SQL project.

## Key results

| Question | Result |
| -------- | ------ |
| Contracts | 30,335, 92% apartments, 84% main homes, 70% owners |
| Contracts in Île-de-France | 14,177, 47% of the total |
| Average monthly premium | €19.33 |
| Top departments by average premium | Paris €36.40, Hauts-de-Seine €26.27, Val-de-Marne €19.82 |
| Contracts by declared value | 22,720 under €25,000, 6,815 from €25,000 to €50,000, 696 from €50,000 to €100,000, 104 above |
| Average surface in Paris | 51.8 m² |

## Repository structure

```
home-insurance-sql/
├── database/
│   └── home_insurance.db          # SQLite database, street addresses removed
├── docs/
│   └── data-dictionary.md         # every column, its type and its rules
├── sql/
│   ├── 00_schema.sql              # CREATE TABLE statements
│   └── 01_… to 12_….sql           # the twelve business questions
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
