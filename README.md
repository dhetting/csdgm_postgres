csdgm_postgres
==============

Postgres schema for FGDC's CSDGM metadata model

----

More information on FGDC's bloated-yet-insufficient-but-widely-adopted metadata standard: http://www.fgdc.gov/metadata/csdgm/.


Written for PostgreSQL 9.3, but should be backwards compatible to most any version (not tested).


Generally, single column values are used where the standard dictates only one value and lookup values are used when multiple elements are allowed. Additional tables are created for restricted values, e.g. Section 8.6 Geospatial Data Presentation Form.

--
#### References ####
* http://perceval.bio.nau.edu/mpcer_old/metadata/downloads/FGDC-CSDGM%20v2%20Summary1.pdf
* http://perceval.bio.nau.edu/mpcer_old/metadata/downloads/workbook_0501_bmk.pdf
