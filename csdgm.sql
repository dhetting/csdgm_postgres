-- Section 1: Identification Information
CREATE TABLE "csdgm"."idinfo" (
	 "gid" SERIAL PRIMARY KEY NOT NULL		-- COMMENT IS 'Primary Key'
---- Section 1.1: Citation
	, "citation" INT 						-- COMMENT IS 'Citation (citeinfo.gid)'
---- Section 1.2: Description
---- Section 1.2.1: Abstract
	, "abstract" TEXT						-- COMMENT IS 'Abstract'
---- Section 1.2.2: Purpose
	, "purpose" TEXT						-- COMMENT IS 'Purpose'
---- Section 1.2.3: Supplemntal Information
	, "supplinf" TEXT						-- COMMENT IS 'Supplemental Information'
---- Section 1.3: Time Period of Content
	, "timeinfo" INT						-- COMMENT IS 'Time Period Information (timeinfo.gid)'
---- Section 1.3.1
	, "current" INT							-- COMMENT IS 'Currentness Reference (current.gid)'
---- Section 1.4: Status
------ Section 1.4.1: Progress
	, "progress" INT						-- COMMENT IS 'Progress (progress.gid)'
------ Section 1.4.2: Udate
	, "update" INT							-- COMMENT IS 'Maintenance and Updatee Frequency (update.gid)'
---- Section 1.5 Spatial Domain
------ Section 1.5.1: Bounding
-------- Section 1.5.1.1: West Bounding Coordinate
	, "westbc" NUMERIC						-- COMMENT IS 'West Bounding Coordinate'
-------- Section 1.5.1.2: East Bounding Coordinate
	, "eastbc" NUMERIC						-- COMMENT IS 'East Bounding Coordinate'
-------- Section 1.5.1.3: North Bounding Coordinate
	, "northbc" NUMERIC						-- COMMENT IS 'North Bounding Coordinate'
-------- Section 1.5.1.4: South Bounding Coordinate
	, "southbc" NUMERIC						-- COMMENT IS 'South Bounding Coordinate'
------ Section 1.5.2: Data Set G-Polygon
-------- Section 1.5.2.1: Data Set G-Polygon Outer G-Ring: idinfo_dsgpolyo
---------- Section 1.5.2.1.1: G-Ring Point
------------ Section 1.5.2.1.1.1: G-Ring Latitude
------------ Section 1.5.2.1.1.2: G-Ring Longitude
---------- Section 1.5.2.1.2: G-Ring
-------- Section 1.5.2.2: Data Set G-Polygon Outer G-Ring: idinfo_dsgpolyx
---------- Section 1.5.2.1.2: G-Ring Point
------------ Section 1.5.2.2.1.1: G-Ring Latitude
------------ Section 1.5.2.2.1.2: G-Ring Longitude
---------- Section 1.5.2.2.2: G-Ring
---- Section 1.6: Keywords: idinfo_keyword
------ Section 1.6.1: Theme
--------Section 1.6.1.1: Theme Keyword Thesaurus
--------Section 1.6.1.2: Theme Keyword
------ Section 1.6.2: Place
--------Section 1.6.2.1: Place Keyword Thesaurus
--------Section 1.6.2.2: Place Keyword
------ Section 1.6.3: Stratum
--------Section 1.6.3.1: Stratum Keyword Thesaurus
--------Section 1.6.3.2: Stratum Keyword
------ Section 1.6.4: Temporal
--------Section 1.6.4.1: Temporal Keyword Thesaurus
--------Section 1.6.4.2: Temporal Keyword
---- Section 1.7: Access Constraints
	, "accconst" TEXT						-- COMMENT IS "Access Constraints"
---- Section 1.8: Use Constraints
	, "useconst" TEXT						-- COMMENT IS "Use Constraints"
---- Section 1.9: Point of Contact
	, "ptcontac" INT						-- COMMENT IS 'Point of Contact (cntinfo.gid)'
---- Section 1.10: Browse Graphic: idinfo_browse
---- Section 1.11: Data Set Credit
	, "datacred" TEXT						-- COMMENT IS 'Data Set Credit'
---- Section 1.12: Security Information
------ Section 1.12.1: Security Classification System
	, "secsys" TEXT							-- COMMENT IS 'Security Classification System'
------ Section 1.12.2: Security Classification
	, "secclass" INT						-- COMMENT IS 'Security Classification (secclass.gid)'
------ SECTION 1.12.3: Security Handling Description
	, "sechandl" TEXT						-- COMMENT IS 'Security Handling Description'
---- Section 1.13: Native Data Set Environment
	, "native" TEXT							-- COMMENT IS 'Native Data Set Environment'
---- Section 1.14: Cross Reference
	, "crossref" INT						-- COMMENT IS 'Cross Reference (cntinfo.gid)'
) WITH (OIDS=FALSE)
;
ALTER TABLE "csdgm"."idinfo" COMMENT IS 'Identification Information';
ALTER TABLE "csdgm"."idinfo" ADD CONSTRAINT "fkey_idinfo_citation" FOREIGN KEY ("citation") REFERENCES "csdgm"."citation" ("gid") ON UPDATE CASCADE ON DELETE RESTRICT;
ALTER TABLE "csdgm"."idinfo" ADD CONSTRAINT "fkey_idinfo_timeinfo" FOREIGN KEY ("timeinfo") REFERENCES "csdgm"."timeinfo" ("gid") ON UPDATE CASCADE ON DELETE RESTRICT;
ALTER TABLE "csdgm"."idinfo" ADD CONSTRAINT "fkey_idinfo_current" FOREIGN KEY ("current") REFERENCES "csdgm"."current" ("gid") ON UPDATE CASCADE ON DELETE RESTRICT;
ALTER TABLE "csdgm"."idinfo" ADD CONSTRAINT "fkey_idinfo_update" FOREIGN KEY ("update") REFERENCES "csdgm"."update" ("gid") ON UPDATE CASCADE ON DELETE RESTRICT;
ALTER TABLE "csdgm"."idinfo" ADD CONSTRAINT "fkey_idinfo_ptcontac" FOREIGN KEY ("ptcontac") REFERENCES "csdgm"."ptcontac" ("gid") ON UPDATE CASCADE ON DELETE RESTRICT;
ALTER TABLE "csdgm"."idinfo" ADD CONSTRAINT "fkey_idinfo_secclass" FOREIGN KEY ("secclass") REFERENCES "csdgm"."secclass" ("gid") ON UPDATE CASCADE ON DELETE RESTRICT;
ALTER TABLE "csdgm"."idinfo" ADD CONSTRAINT "fkey_idinfo_crossref" FOREIGN KEY ("crossref") REFERENCES "csdgm"."citation" ("gid") ON UPDATE CASCADE ON DELETE RESTRICT;

ALTER TABLE "csdgm"."idinfo" ADD CONSTRAINT "chk_idinfo_westbc" CHECK "westbc" BETWEEN -180 AND 180;
ALTER TABLE "csdgm"."idinfo" ADD CONSTRAINT "chk_idinfo_eastbc" CHECK "eastbc" BETWEEN -180 AND 180;
ALTER TABLE "csdgm"."idinfo" ADD CONSTRAINT "chk_idinfo_northbc" CHECK "northbc" BETWEEN -90 AND 90 AND "northbc" >= "southbc";
ALTER TABLE "csdgm"."idinfo" ADD CONSTRAINT "chk_idinfo_southbc" CHECK "southbc" BETWEEN -90 AND 90 AND "southbc" <= "northbc";

-- SECTION 2: Data Quality Information
CREATE TABLE "csdgm"."dataqual" (
	  "gid" SERIAL NOT NULL PRIMARY KEY			-- COMMENT IS 'Primary Key'
---- Section 2.1: Attribute Accuracy
----- Section 2.1.1: Attribute Accuracy Report
	, "attraccr" TEXT							-- COMMENT IS 'Attribute Accuracy Report'
----- Section 2.1.2: Quantitative Attribute Accuracy Assessment: dataqual_qattracc	
---- Section 2.2: Logical Consistency Report
	, "logic" TEXT								-- COMMENT IS 'Logical Consistency Report'
---- Section 2.3: Completeness Report
	, "complete" TEXT							-- COMMENT IS 'Completeness Report'
---- Section 2.4: Positional Accuracy
------ Section 2.4.1: Horizontal Positional Accuracy
	, "horizpa" INT								-- COMMENT IS 'Horizontal Positional Accuracy Report (horizpa.gid)'
---- Section 2.4.2: Vertical Positional Accuracy
	, "vertpa" INT								-- COMMENT IS 'Vertical Positional Accuracy Report (vertpa.gid)'
---- Section 2.5: Lineage
	, "lineage" INT								-- COMMENT IS 'Info about the events, parameters, and source data which constructed the data set, and info. about the responsible parties. (lineage.gid)'
---- Section 2.6: Cloud Cover
	, "cloud" NUMERIC							-- COMMENT IS 'Cloud Cover'
) WITH (OIDS=FALSE)
;
ALTER TABLE "csdgm"."dataqual" COMMENT IS 'A general assessment of the quality of the data set.'
ALTER TABLE "csdgm"."dataqual" ADD CONSTRAINT "fkey_dataqual_horizpa" FOREIGN KEY ("horizpa") REFERENCES "csdgm"."horizpa" ("gid") ON UPDATE CASCADE ON DELETE RESTRICT;
ALTER TABLE "csdgm"."dataqual" ADD CONSTRAINT "fkey_dataqual_vertpa" FOREIGN KEY ("vertpa") REFERENCES "csdgm"."vertpa" ("gid") ON UPDATE CASCADE ON DELETE RESTRICT;
ALTER TABLE "csdgm"."dataqual" ADD CONSTRAINT "fkey_dataqual_lineage" FOREIGN KEY ("lineage") REFERENCES "csdgm"."lineage" ("gid") ON UPDATE CASCADE ON DELETE RESTRICT;


-- SECTION 3: Spatial Data Organization Information
CREATE TABLE "csdgm"."spdoinfo" (
	  "gid" SERIAL NOT NULL PRIMARY KEY			-- COMMENT IS 'Primary Key'
	, "indspref" TEXT							-- COMMENT IS 'Indirect Spatial Reference'
	, "direct" INT								-- COMMENT IS 'Direct Spatial Reference (direct.gid)'
) WITH (OIDS=FALSE)
;
ALTER TABLE "csdgm"."spdoinfo" COMMENT IS 'The mechanism used to represent spatial information in the data set.'
ALTER TABLE "csdgm"."spdoinfo" ADD CONSTRAINT "fkey_spdoinfo_direct" FOREIGN KEY ("direct") REFERENCES "csdgm"."direct" ("gid") ON UPDATE CASCADE ON DELETE RESTRICT;

-- SECTION 3.4: Raster Object Information
CREATE TABLE "csdgm"."rastinfo" (
	  "gid" SERIAL NOT NULL PRIMARY KEY			-- COMMENT IS 'Primary Key'
	, "rasttype" INT							-- COMMENT IS 'Raster Object Type (rasttype.gid)'
	, "rowcount" INT							-- COMMENT IS 'Row Count'
	, "colcount" INT							-- COMMENT IS 'Column Count'
	, "vrtcount" INT							-- COMMENT IS 'Vertical Count'
) WITH (OIDS=FALSE)
;
ALTER TABLE "csdgm"."rastinfo" COMMENT IS 'The types and numbers of raster spatial objects in the data set';
ALTER TABLE "csdgm"."rastinfo" ADD CONSTRAINT "fkey_rastinfo_rasttype" FOREIGN KEY ("rasttype") REFERENCES "csdgm"."rasttype" ("gid") ON UPDATE CASCADE ON DELETE RESTRICT;

CREATE TABLE "csdgm"."rasttype" (
	  "gid" SERIAL NOT NULL PRIMARY KEY			-- COMMENT IS 'Primary Key'
	, "rasttype" TEXT NOT NULL					-- COMMENT IS 'Raster Object Type'
) WITH (OIDS=FALSE)
;
ALTER TABLE "csdgm"."rasttype" COMMENT IS 'Raster Object Type';
INSERT INTO "csdgm"."rasttype" ("rasttype") VALUES
	  ('Point')
	, ('Pixel')
	, ('Grid Cell')
	, ('Voxel')
;

CREATE TABLE "csdgm"."spdoinfo_rastinfo" (
	  "spdoinfo" INT							-- COMMENT IS 'spdoinfo.gid'
	, "rastinfo" INT							-- COMMENT IS 'rastinfo.gid'
) WITH (OIDS=FALSE)
;
ALTER TABLE "csdgm"."spdoifno_rastinfo" COMMENT IS 'rastinfo lookup for spdoinfo';

-- SECTION 3.3/3.3.1: Point and Vector Object Information/SDTS Terms Description
CREATE TABLE "csdgm"."spdoinfo_sdtsterm" (
	  "spdoinfo" INT NOT NULL					-- COMMENT IS 'spdoinfo.gid'
	, "sdtsterm" INT NOT NULL					-- COMMENT IS 'sdtsterm.gid'
) WITH (OIDS=FALSE)
;
ALTER TABLE "csdgm"."spdoinfo_sdtsterm" ADD COMMENT 'sdtsterm lookup for spdoinfo';
ALTER TABLE "csdgm"."spdoinfo_sdtsterm" ADD CONSTRAINT "pkey_spdoinfo_sdtsterm" PRIMARY KEY ("spdoinfo", "sdtsterm");
ALTER TABLE "csdgm"."spdoinfo_sdtsterm" ADD CONSTRAINT "fkey_spdoinfo_sdtsterm_spdoinfo" FOREIGN KEY ("spdoinfo") REFERENCES "csdgm"."spdoinfo" ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE "csdgm"."spdoinfo_sdtsterm" ADD CONSTRAINT "fkey_spdoinfo_sdtsterm_sdtsterm" FOREIGN KEY ("sdtsterm") REFERENCES "csdgm"."sdtsterm" ON UPDATE CASCADE ON DELETE CASCADE;


CREATE TABLE "csdgm"."sdtsterm" (
	  "gid" SERIAL NOT NULL PRIMARY KEY			-- COMMENT IS 'Primary Key'
	, "sdtstype" INT							-- COMMENT IS 'SDTS Point and Vector Object Type (sdtstype.gid)'
	, "ptvctcnt" INT							-- COMMENT IS 'Point and Vector Object Count'
	, "vpflevel" INT							-- COMMENT IS ' VPF Topology Level'

ALTER TABLE "csdgm"."sdtstem" COMMENT IS 'Point and vector object info. using the terms and concepts from "Spatial Data Concepts".'
ALTER TABLE "csdgm"."sdtstem" ADD CONSTRAINT "fkey_sdtsterm_sdtstype" FOREIGN KEY ("sdtstype") REFERENCES "csdgm"."sdtsteyp" ("gid") ON UPDATE CASCADE ON DELETE RESTRICT;


CREATE TABLE "csdgm"."vpfterm_vpfinfo" (
	  "vpfterm" INT NOT NULL				-- COMMENT IS vpfterm.gid'
	, "vpfinfo" INT NOT NULL				-- COMMENT IS vpfinfo.gid'
) WITH (OIDS=FALSE)
;
ALTER TABLE "csdgm"."vpfterm_vpfinfo" COMMENT IS 'vpfinfo lookup for vpfterm';
ALTER TABLE "csdgm"."vpfterm_vpfinfo" ADD CONSTRAINT "pkey_vpfterm_vpfinfo" PRIMARY KEY ("vpfterm", "vpfinfo");
ALTER TABLE "csdgm"."vpfterm_vpfinfo" ADD CONSTRAINT "fkey_vpfterm_vpfinfo_vpfterm" FOREIGN KEY ("vpfterm") REFERENCES "csdgm"."vpfterm" ("gid") ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE "csdgm"."vpfterm_vpfinfo" ADD CONSTRAINT "fkey_vpfterm_vpfinfo_vpfinfo" FOREIGN KEY ("vpfinfo") REFERENCES "csdgm"."vpfinfo" ("gid") ON UPDATE CASCADE ON DELETE CASCADE;

CREATE TABLE "csdgm"."vpflevel" (
	  "gid" SERIAL NOT NULL PRIMARY KEY			-- COMMENT IS 'Primary Key'
	, "vpflevel" INT							-- COMMENT IS "VPF Topology Level'
) WITH (OIDS=FALSE)
;
ALTER TABLE "csdgm"."vpflevel" COMMENT IS 'Point and vector object info. using the terms and concepts from DoD\'s Vector Product File.'

CREATE TABLE "csdgm"."vpfinfo" (
	  "gid" SERIAL NOT NULL PRIMARY KEY			-- COMMENT IS 'Primary Key'
	, "vpftype" INT NOT NULL					-- COMMENT IS 'VPF Point and Vector Object Type (cpftype.gid)'
	, "ptvctcnt" INT NOT NULL					-- COMMENT IS 'Point and Vector Object Count'
) WITH (OIDS=FALSE)
;
ALTER TABLE "csdgm"."vpfinfo" COMMENT IS 'Info. about VPF point and vector objects.'
ALTER TABLE "csdgm"."vpfinfo" ADD CONSTRAINT "fkey_cpfinfo_vpftype" FOREIGN KEY ("cpftype") REFERENCES "csdgm"."vpftype" ("gid") ON UPDATE CASCADE ON DELETE RESTRICT;

CREATE TABLE "csdgm"."vpftype" (
	  "gid" SERIAL NOT NULL PRIMARY KEY			-- COMMENT IS 'Primary Key'
	, "vpftype" TEXT NOT NULL					-- COMMENT IS 'VPF Point and Vector Object Type'
) WITH (OIDS=FALSE)
;
ALTER TABLE "csdgm"."vpftype" COMMENT IS 'VPF Point and Vector Object Type';
INSERT INTO "csdgm"."vpftype" VALUES
	  ('Node')
	, ('Edge')
	, ('Face')
	, ('Text')
;

CREATE TABLE "csdgm"."sdtstype" (
	  "gid" SERIAL NOT NULL PRIMARY KEY			-- COMMENT IS 'Primary Key'
	, "sdtstype" TEXT NOT NULL					-- SDTS Point and Vector Object Type
) WITH (OIDS=FALSE)
;
INSERT INTO "csdgm"."sdtstype" VALUES
	  ('Point')
	, ('Entity point')
	, ('Label point')
	, ('Area point')
	, ('Node, planar graph')
	, ('Node, network')
	, ('String')
	, ('Link')
	, ('Complete chain')
	, ('Area chain')
	, ('Network chain, planar graph')
	, ('Networkchain, nonplanar graph')
	, ('Circular arc, three point center')
	, ('Elliptical arc')
	, ('Uniform B spline')
	, ('Piecewise Bezier')
	, ('Ring with mixed composition')
	, ('Ring composed of strings')
	, ('Ring composed of chains')
	, ('Ring composed of arcs')
	, ('G-polygon')
	, ('GT-polygon composed of rings')
	, ('GT-polygon composed of chains')
	, ('Universe polygon composed of rings')
	, ('Universe polygon composed of chains')
	, ('Void polygon composed of rings')
	, ('Void polygon composed of chains')
;

CREATE TABLE "csdgm"."direct" (
	  "gid" SERIAL NOT NULL PRIMARY KEY
	, "direct" TEXT NOT NULL
) WITH (OIDS=FALSE)
;
ALTER TABLE "csdgm"."direct" COMMENT IS 'Directt Spatial Reference';
INSERT INTO "csdgm"."direct" ("direct") VALUES
	  ('Point')
	, ('Vector')
	, ('Raster')
;

-- SECTION 2.5: Lineage
CREATE TABLE "csdgm"."lineage" (
	  "srcinfo" INT NOT NULL					-- COMMENT IS 'List of sources and a short discussion of the info. contributed by each (lineage.gid)'
	, "procstep" INT NOT NULL					-- COMMENT IS 'Information about a single event (procstep.gid)'
) WITH (OIDS=FALSE)
;
ALTER TABLE "csdgm"."lineage" COMMENT IS 'Info about the events, parameters, and source data which constructed the data set, and info.
about the responsible parties.';
ALTER TABLE "csdgm"."lineage" ADD CONSTRAINT "pkey_lineage" PRIMARY KEY ("srcinfo", "procestep");
ALTER TABLE "csdgm"."lineage" ADD CONSTRAINT "fkey_lineage_srcinfo" FOREIGN KEY ("srcinfo") REFERENCES "csdgm"."lineage" ("gid") ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE "csdgm"."lineage" ADD CONSTRAINT "fkey_lineage_procstep" FOREIGN KEY ("procstep") REFERENCES "csdgm"."procstep" ("gid") ON UPDATE CASCADE ON DELETE CASCADE;


-- SECTION 2.5.2: Source Time Period of Content
CREATE TABLE "csdgm"."procstep" (
	  "gid" SERIAL NOT NULL PRIMARY KEY
	, "procdesc" TEXT NOT NULL					-- COMMENT IS 'Process Description'
	, "procdate" DATE							-- COMMENT IS 'Process Date'
	, "proctime" TIMESTAMP						-- COMMENT IS 'Process Time'
	, "proccont" INT							-- COMMENT IS 'The party responsible for the processing step information (cntinfo.gid).
) WITH (OIDS=FALSE)
;
ALTER TABLE "csdgm"."procstep" COMMENT IS 'Information about a single event.'
ALTER TABLE "csdgm"."procstep" ADD CONSTRAINT "fkey_procstep_proccont" FOREIGN KEY ("proccont") REFERENCES "csdgm"."cntinfo" ("gid") ON UPDATE CASCADE ON DELETE RESTRICT;


CREATE TABLE "csdgm"."srcprod" (
	  "gid" SERIAL NOT NULL PRIMARY KEY			-- COMMENT IS 'Primary Key'
	, "srcprod" TEXT							-- COMMENT IS 'Source Citation Abbreviations from the Source Information entries for the data set.'
) WITH (OIDS=FALSE)
;
ALTER TABLE "csdgm"."srcprod" COMMENT IS 'Source Citation Abbreviations from the Source Information entries for the data set.';

CREATE TABLE "csdgm"."procstep_srcprod" (
	  "procstep" INT NOT NULL					-- COMMENT IS 'procstep.gid'
	, "srcprod" INT	NOT NULL					-- COMMENT IS 'srcprod.gid'
) WITH (OIDS=FALSE)
;
ALTER TABLE "csdgm"."procstep_srcprod" COMMENT IS 'srcprod lookup for procstep';
ALTER TABLE "csdgm"."procstep_srcprod" ADD CONSTRAINT "pkey_procstep_srcprod" PRIMARY KEY ("procstep", "srcprod");
ALTER TABLE "csdgm"."procstep_srcprod" ADD CONSTRAINT "fkey_procstep_srcprod_procstep" FOREIGN KEY ("procstep") REFERENCES "csdgm"."procstep" ("gid") ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE "csdgm"."procstep_srcprod" ADD CONSTRAINT "fkey_procstep_srcprod_srcprod" FOREIGN KEY ("srcprod") REFERENCES "csdgm"."srcprod" ("gid") ON UPDATE CASCADE ON DELETE CASCADE;

CREATE TABLE "csdgm"."srcused" (
	  "gid" SERIAL NOT NULL PRIMARY				-- COMMENT IS 'Primary Key'
	, "srcused" TEXT NOT NULL					-- COMMENT IS 'Source Citation Abbreviations'
) WITH (OIDS=FALSE)
;
ALTER TABLE "csdgm"."srcused" COMMENT IS 'Source Citation Abbreviations from the Source Information entries for the data set.'

CREATE TABLE "csdgm"."procstep_srcused" (
	  "procstep" INT NOT NULL					-- COMMENT IS 'Process Step (procstep.gid).'
	, "srcused" INT	NOT NULL					-- COMMENT IS 'Source Citation Abbreviations (srcused.gid).'
) WITH (OIDS=FALSE)
;
ALTER TABLE "csdgm"."procstep_srcused" COMMENT IS 'srcused lookup for procstep';
ALTER TABLE "csdgm"."procstep_srcused" ADD CONSTRAINT "pkey_procestep_srcused" PRIMARY KEY ("procstep", "srcused");
ALTER TABLE "csdgm"."procstep_srcused" ADD CONSTRAINT "fkey_procestep_srcused_procstep" FOREIGN KEY ("procstep", "procstep") REFERENCES "procstep" ("gid") ON UPDATE CASCADE ON DELETE CASCADE;;
ALTER TABLE "csdgm"."procstep_srcused" ADD CONSTRAINT "fkey_procestep_srcused_srcused" FOREIGN KEY ("procstep", "srcused") REFERENCES "srcused" ("gid") ON UPDATE CASCADE ON DELETE CASCADE;


-- SECTION 2.5.1: Source Information
CREATE TABLE "csdgm"."srcinfo" (
	  "gid" SERIAL NOT NULL PRIMARY KEY			-- COMMENT IS 'Primary Key'
	, "srccite" INT NOT NULL					-- COMMENT IS 'Reference for a source data set (citeinfo.gid).'
	, "srcscale" NUMERIC						-- COMMENT IS 'Source Scale Denominator > 1'
	, "typesrc" INT								-- COMMENT IS 'Type of Source Media' (typesrc.gid).'
	, "srctime" INT								-- COMMENT IS 'Time period(s) for which the source data set corresponds to the ground (timeinfo.gid).'
	, "srccurr" TEXT							-- COMMENT IS 'Source Currentness Reference'
	, "srccitea" TEXT							-- COMMENT IS 'Source Citation Abbreviation'
	, "srccontr" TEXT							-- COMMENT IS 'Source Contribution'
) WITH (OIDS=FALSE)
;
ALTER TABLE "csdgm"."srcinfo" COMMENT IS 'List of sources and a short discussion of the info. contributed by each';
ALTER TABLE "csdgm"."srcinfo" ADD CONSTRAINT "fkey_srcinfo_srccite" FOREIGN KEY ("srccite") REFERENCES "csdgm"."citeinfo" ("gid") ON UPDATE CASCADE ON DELETE RESTRICT;
ALTER TABLE "csdgm"."srcinfo" ADD CONSTRAINT "fkey_srcinfo_typesrc" FOREIGN KEY ("typesrc") REFERENCES "csdgm"."typesrc" ("gid") ON UPDATE CASCADE ON DELETE RESTRICT;
ALTER TABLE "csdgm"."srcinfo" ADD CONSTRAINT "fkey_srcinfo_srctime" FOREIGN KEY ("srctime") REFERENCES "csdgm"."timeinfo" ("gid") ON UPDATE CASCADE ON DELETE RESTRICT;



-- SECTION 2.4.1: Horizontal Positional Accuracy
CREATE TABLE "csdgm"."horizpa" (
	  "gid" SERIAL NOT NULL PRIMARY KEY			-- COMMENT IS 'Primary Key'
	, "horizpar" TEXT							-- COMMENT IS 'Horizontal Positional Accuracy Report'
) WITH (OIDS=FALSE)
;
ALTER TBLE "scdgm"."horizpa" COMMENT IS 'An estimate of accuracy of the horizontal positions in the data set.'

CREATE TABLE "csdgm"."qhorizpa" (
	  "gid" SERIAL NOT NULL PRIMARY KEY			-- COMMENT IS 'Primary Key'
	, "horizpav" NUMERIC						-- COMMENT IS 'Horizontal Positional Accuracy Value'
	, "horizpae" TEXT							-- COMMENT IS 'Horizontal Positional Accuracy Explanation'
) WITH (OIDS=FALSE)
;
ALTER TABLE "csdgm"."qhorizpa" COMMENT IS 'Numeric value assigned to summarize the accuracy of the horiz. coord. measurements and the identification of the test that yielded the value';

CREATE TABLE "csdgm"."horizpa_qhorizpa" (
	  "horizpa" INT NOT NULL
	, "qhorizpa" INT NOT NULL
) WITH (OIDS=FALSE)
;
ALTER TABLE "csdgm"."horizpa_qhorizpa" COMMENT IS 'qhorizpa lookup for horizpa';
ALTER TABLE "csdgm"."horizpa_qhorizpa" ADD CONSTRAINT "pkey_horizpa_qhorizpa" PRIMARY KEY ("horizpa", "qhorizpa");
ALTER TABLE "csdgm"."horizpa_qhorizpa" ADD CONSTRAINT "fkey_horizpa_qhorizpa_horizpa" FOREIGN KEY ("horizpa") REFERENCES "csdgm"."horizpa" ("gid") ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE "csdgm"."horizpa_qhorizpa" ADD CONSTRAINT "fkey_horizpa_qhorizpa_qhorizpa" FOREIGN KEY ("qhorizpa") REFERENCES "csdgm"."qhorizpa" ("gid") ON UPDATE CASCADE ON DELETE CASCADE;


-- SECTION 2.4.2: Vertical Positional Accuracy
CREATE TABLE "csdgm"."vertpa" (
	  "gid" SERIAL NOT NULL PRIMARY KEY			-- COMMENT IS 'Primary Key'
	, "vertpar" TEXT							-- COMMENT IS 'Vertical Positional Accuracy Report'
) WITH (OIDS=FALSE)
;
ALTER TBLE "scdgm"."vertpa" COMMENT IS 'An estimate of accuracy of the vertical positions in the data set.'

CREATE TABLE "csdgm"."qvertpa" (
	  "gid" SERIAL NOT NULL PRIMARY KEY			-- COMMENT IS 'Primary Key'
	, "vertpav" NUMERIC						    -- COMMENT IS 'Vertical Positional Accuracy Value'
	, "vertpae" TEXT							-- COMMENT IS 'Vertical Positional Accuracy Explanation'
) WITH (OIDS=FALSE)
;
ALTER TABLE "csdgm"."qvertpa" COMMENT IS 'Numeric value assigned to summarize the accuracy of the vertical coord. measurements and the identification of the test that yielded the value';

CREATE TABLE "csdgm"."vertpa_qvertpa" (
	  "vertpa" INT NOT NULL
	, "qvertpa" INT NOT NULL
) WITH (OIDS=FALSE)
;
ALTER TABLE "csdgm"."vertpa_qvertpa" COMMENT IS 'qvertpa lookup for vertpa';
ALTER TABLE "csdgm"."vertpa_qvertpa" ADD CONSTRAINT "pkey_vertpa_qvertpa" PRIMARY KEY ("vertpa", "qvertpa");
ALTER TABLE "csdgm"."vertpa_qvertpa" ADD CONSTRAINT "fkey_vertpa_qvertpa_vertpa" FOREIGN KEY ("vertpa") REFERENCES "csdgm"."vertpa" ("gid") ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE "csdgm"."vertpa_qvertpa" ADD CONSTRAINT "fkey_vertpa_qvertpa_qvertpa" FOREIGN KEY ("qvertpa") REFERENCES "csdgm"."qvertpa" ("gid") ON UPDATE CASCADE ON DELETE CASCADE;


-- SECTION 2.1.2: Quantitative Attribute Accuracy Assessment
CREATE TABLE "csdgm"."qattracc" (
	  "gid" SERIAL NOT NULL PRIMARY KEY
	, "attraccv" NUMERIC						-- COMMENT IS 'Attribute Accuracy Value'
	, "attracce" TEXT							-- COMMENT IS 'Attribute Accuracy Explanation'
) WITH (OIDS=FALSE)
;
ALTER TABLE "csdgm"."qattracc" COMMENT IS 'A value assigned to summarize the accuracy of the identification of the entities and
 assignments of values in the data set and the identification of the test that yielded the value.'

CREATE TABLE "csdgm"."dataqual_qattracc" (
	  "dataqual" INT NOT NULL
	, "attraccv" INT NOT NULL
) WITH (OIDS=FALSE)
;
ALTER TABLE "csdgm"."dataqual_qattracc" COMMENT IS 'quattracc lookup for dataqual';
ALTER TABLE "csdgm"."dataqual_qattracc" ADD CONSTRAINT "pkey_dataqual_qattracc" PRIMARY KEY ("dataqual", "attraccv");
ALTER TABLE "csdgm"."dataqual_qattracc" ADD CONSTRAINT "fkey_dataqual_quattracc_dataqual" FOREIGN KEY ("dataqual") REFERENCES "csdgm"."dataqual" ("gid") ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE "csdgm"."dataqual_qattracc" ADD CONSTRAINT "fkey_dataqual_quattracc_qattracc" FOREIGN KEY ("qattracc") REFERENCES "csdgm"."qattracc" ("gid") ON UPDATE CASCADE ON DELETE CASCADE;

-- SECTION 1.12.2: Security Classification
CREATE TABLE "csdgm"."secclass" (
	  "gid" SERIAL NOT NULL PRIMARY KEY
	, "secclass" TEXT NOT NULL
) WITH (OIDS=FALSE)
;
INSERT INTO "csdgm"."secclass" ("secclass") VALUES (
	  ('Top Secret')
	, ('Secret')
	, ('Confidential')
	, ('Restricted')
	, ('Unclassified')
	, ('Sensitive')
;

-- SECTION 1.10: Browse Graphic
CREATE TABLE "csdgm"."browse" (
	  "gid" SERIAL NOT NULL PRIMARY KEY		-- COMMENT IS 'PRIMARY KEY'
	, "browsen" TEXT						-- COMMENT IS 'Browse Graphic File Name'
	, "browsed" TEXT						-- COMMENT IS 'Browse Graphic File Description'
	, "browset" INT							-- COMMENT IS 'browset.gid'
) WITH (OIDS=FALSE)
;
ALTER TABLE "csdgm"."browse" COMMENT IS 'A graphic that provides an illustration of the data set. The graphic should contain a legend.'
ALTER TABLE "csdgm"."browse" ADD CONSTRAINT 'fkey_browse_browset' FOREIGN KEY ("browset") REFERENCES "csdgm"."browset" ("gid") ON UPDATE CASCADE ON DELETE RESTRICT;

CREATE TABLE "csdgm"."browset" (
	  "gid" INT NOT NULL PRIMARY KEY
	, "browset" TEXT NOT NULL
	, "description" TEXT NOT NULL
) WITH (OIDS=FALSE)
;
ALTER TABLE "csdgm"."browset" COMMENT IS 'Browse Graphic File Type lookup for browse.';
INSERT INTO "csdgm"."browset" ("browset", "description") VALUES
	  ('CGM', 'Computer Graphics Metafile')
	, ('EPS', 'Encapsulated Postscript format')
	, ('GIF', ' Graphic Interchange Format')
	, ('JPEG', 'Joint Photographic Experts Group format')
	, ('PBM', 'Portable Bit Map format')
	, ('PS', 'Postscript format,')
	, ('TIFF', 'Tagged Image File Format')
	, ('XWD', 'X-Windows Dump')
;

CREATE TABLE "csdgm"."idinfo_browse" (
	  "idinfo" INT NOT NULL					-- COMMENT IS 'idinfo.gid'
	, "browse" INT NOT NULL					-- COMMENT IS 'browse.gid'
) WITH (OIDS=FALSE)
;
ALTER TABLE "csdgm"."idinfo_browse" COMMENT IS 'Browse graphic lookup for idinfo.'
ALTER TABLE "csdgm"."idinfo_browse" ADD CONSTRAINT "fkey_idinfo_browse_idinfo" FOREIGN KEY ("idinfo") REFERENCES "csdgm"."idinfo" ("gid") ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE "csdgm"."idinfo_browse" ADD CONSTRAINT "fkey_idinfo_browse_browse" FOREIGN KEY ("browse") REFERENCES "csdgm"."browse" ("gid") ON UPDATE CASCADE ON DELETE CASCADE;


-- SECTION 1.6: Keywords
CREATE TABLE "csdgm"."keyword" (
	  "gid" SERIAL NOT NULL PRIMARY KEY
	, "thesaurus" TEXT
	, "keyword" TEXT NOT NULL
	, "type" TEXT NOT NULL
) WITH (OIDS=FALSE)
;
ALTER TABLE "csdgm"."keyword" COMMENT IS 'Words or phrases summarizing an aspect of the data set.';
ALTER TABLE "csdgm"."keyword" ADD CONSTRAINT "fkey_keyword_type" FOREIGN KEY ("type") REFERENCES "csdgm"."keyword_type" ("gid") ON UPDATE CASCADE ON DELETE RESTRICT;

CREATE TABLE "csdgm"."keyword_type" (
	  "gid" SERIAL NOT NULL PRIMARY KEY		-- COMMENT IS 'Primary Key'
	, "keyword_type" TEXT					-- COMMENT IS 'Keyword Type'
) WITH (OIDS=FALSE)
;
ALTER TABLE "csdgm"."keyword_type" COMMENT IS 'Keyword types for keyword table.'
INSERT INTO "csdgm"."keyword_type" ("keyword_type") VALUES
	  ('theme')
	, ('place')
	, ('stratum')
	, ('temporal')
;

CREATE TABLE "csdgm"."idinfo_keyword" (
	  "idinfo" INT NOT NULL					-- COMMENT IS idinfo.gid
	, "keyword" INT NOT NULL				-- COMMENT IS keyword.gid
) WITH (OIDS=FALSE)
;
ALTER TABLE "csdgm"."idinfo_keyword" COMMENT IS 'Keyword lookup for idinfo';
ALTER TABLE "csdgm"."idinfo_keyword" ADD CONSTRAINT "pkey_idinfo_keyword" PRIMARY KEY ("idinfo", "keyword");
ALTER TABLE "csdgm"."idinfo_keyword" ADD CONSTRAINT "fkey_idinfo_idinfo" FOREIGN KEY ("idinfo") REFERENCES "csdgm"."idinfo" ("gid") ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE "csdgm"."idinfo_keyword" ADD CONSTRAINT "fkey_idinfo_keyword" FOREIGN KEY ("keyword") REFERENCES "csdgm"."keyword" ("gid") ON UPDATE CASCADE ON DELETE CASCADE;


-- SECTION 1.5.2.1: Data Set G-Polygon
CREATE TABLE "csdgm"."dsgpolyo" (
	  "gid" SERIAL NOT NULL PRIMARY KEY		-- COMMENT IS 'Primary Key'
	, "dsgpolyo" GEOMETRY NOT NULL			-- COMMENT IS 'Coordinates defining the outline of an area covered by a data set.'
) WITH (OIDS=FALSE)
;
ALTER TABLE "csdgm"."dsgpolyo" COMMENT IS 'Coordinates defining the outline of an area covered by a data set.'

CREATE TABLE "csdgm"."citeinfo_dsgpolyo" (
	  "citeinfo" INT NOT NULL				-- COMMENT IS 'citinfo.gid'
	, "dsgpolyo" INT NOT NULL				-- COMMENT IS 'dsgpolyo.gid'
) WITH (OIDS=FALSE)
;
ALTER TABLE "csdgm"."citeinfo_dsgpolyo" COMMENT IS 'dsgpolyy lookup for citeinfo';
ALTER TABLE "csdgm"."citeinfo_dsgpolyo" ADD CONSTRAINT "fkey_citeinfo_dsgpolyo_citeinfo" FOREIGN KEY ("citeinfo") REFERENCES "csdgm"."citeinfo" ("gid") ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE "csdgm"."citeinfo_dsgpolyo" ADD CONSTRAINT "fkey_citeinfo_dsgpolyo_dsgpolyo" FOREIGN KEY ("dsgpolyo") REFERENCES "csdgm"."dsgpolyo" ("gid") ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE "csdgm"."citeinfo_dsgpolyo" ADD CONSTRAINT "pkey_citeinfo_dsgpolyo" PRIMARY KEY ("citeinfo", "dsgpolyo");


-- SECTION 1.5.2.2: Data Set G-Polygon Outer G-Ring
CREATE TABLE "csdgm"."dsgpolyx" (
	  "gid" SERIAL NOT NULL PRIMARY KEY		-- COMMENT IS 'Primary Key'
	, "dsgpolyx" GEOMETRY NOT NULL			-- COMMENT IS 'The closed nonintersecting boundary of a void area (or "hole" in an interior area).'
) WITH (OIDS=FALSE)
;
ALTER TABLE "csdgm"."dsgpolyx" COMMENT IS 'The closed nonintersecting boundary of a void area (or "hole" in an interior area).'
ALTER TABLE "csdgm"."dsgpolyx" ADD CONSTRAINT "chk_dsgpolyx_srid" CHECK (ST_Srid("csdgm"."dsgpolyx") = 4326);
ALTER TABLE "csdgm"."dsgpolyx" ADD CONSTRAINT "chk_dsgpolyx_ndims" CHECK (ST_NDims("csdgm"."dsgpolyx") = 2);
ALTER TABLE "csdgm"."dsgpolyx" ADD CONSTRAINT "chk_dsgpolyx_geomtype" CHECK (ST_GeometryType("csdgm"."dsgpolyx") = 'POLYGON');

CREATE TABLE "csdgm"."citeinfo_dsgpolyx" (
	  "citeinfo" INT NOT NULL				-- COMMENT IS 'citeinfo.gid'
	, "dsgpolyx" INT NOT NULL				-- COMMENT IS 'dsgpolyx.gid'
) WITH (OIDS=FALSE)
;
ALTER TABLE "csdgm"."citeinfo_dsgpolyx"
ALTER TABLE "csdgm"."citeinfo_dsgpolyx" ADD CONSTRAINT "pkey_citeinfo_dsgpolyx" PRIMARY KEY ("citeinfo", "dsgpolyx");


-- SECTION 1.3: Time Period of Content
CREATE TABLE "csdgm"."current" (
	  "gid" SERIAL NOT NULL PRIMARY KEY
	, "current" TEXT NOT NULL
) WITH (OIDS=FALSE)
;
ALTER TABLE "csdgm"."current" COMMENT IS 'Currentness Reference';
INSERT INTO "csdgm"."current" ("current") VALUES
	  ('ground condition')
	, ('publication date')
;

-- SECTION 1.4.1: Status
CREATE TABLE "csdgm"."progress" (
	  "gid" SERIAL NOT NULL PRIMARY KEY
	, "progress" TEXT NOT NULL
) WITH (OIDS=FALSE)
;
ALTER TABLE "csdgm"."progress" COMMENT IS 'Progress';
INSERT INTO "csdgm"."progress" ("progress") VALUES
	  ('Complete')
	, ('In Work')
	, ('Planned')
;

-- SECTION 1.4.2: Status
CREATE TABLE "csdgm"."update" (
	  "gid" SERIAL NOT NULL PRIMARY KEY
	, "update" TEXT NOT NULL
) WITH (OIDS=FALSE)
;
ALTER TABLE "csdgm"."update" COMMENT IS 'Maintenance and Update Frequency';
INSERT INTO "csdgm"."update" ("update") VALUES
	  ('Continually')
	, ('Daily')
	, ('Weekly')
	, ('Monthly')
	, ('Annually')
	, ('Unknown')
	, ('As Needed')
	, ('Irregular')
	, ('None Planned')
;

-- Section 8: Citation Information
CREATE TABLE "csdgm"."citeinfo" (			-- COMMENT IS 'The recommended reference to be used for the data set'
	  "gid" SERIAL PRIMARY KEY NOT NULL		-- COMMENT IS 'Primary Key'
---- Section 8.6: Geospatial Data Presentation Form: "citeinfo_geoform"
---- Section 8.2: Publication Date
	, "pubdate" DATE						-- COMMENT IS 'Publication Date'
---- Section 8.3: Publication Time
	, "pubtime" TIMESTAMP					-- COMMENT IS 'Publication Time'
---- Section 8.4: Title
	, "title" TEXT							-- COMMENT IS 'Title'
---- Section 8.5: Edition
	, "edition" TEXT						-- COMMENT IS 'Edition'
---- SECTION 8.6: Geospatial Data Presentation Form
	, "geoform" INT							-- FKEY geoform.gid; COMMENT IS 'geoform.gid'
---- SECTION 8.7:
	, "sername" TEXT						-- COMMENT IS 'Series Name'
	, "issue" TEXT							-- COMMENT IS 'Issue Identification'
---- Section 8.8: Publication Information
	, "pubplace" TEXT						-- COMMENT IS 'Publication Place'
	, "publish" TEXT						-- COMMENT IS 'Publisher'
---- SECTION 8.9: Other Citation Details
	, "othercit" TEXT						-- COMMENT IS 'Other Citation Details'
---- Section 8.10: Online Linkage: "citeinfo_linkage"
---- Section 8.11: Larger Work Citation
	, "lworkcit" INT						-- FKEY citeinfo; COMMENT IS 'Larger Work Citation'
) WITH (OIDS=FALSE)
;
ALTER TABLE "csdgm"."citeinfo" COMMENT IS 'The recommeded reference to be used for the data set';
ALTER TABLE "csdgm"."citeinfo" ADD CONSTRAINT "fkey_citeinfo_geoform" FOREIGN KEY ("geoform") REFERENCES "csdgm"."geoform" ("gid") ON UPDATE CASCADE ON DELETE RESTRICT;

---- SECTION 8.1: Originator
CREATE TABLE "csdgm"."origin" (
	  "gid" SERIAL PRIMARY KEY NOT NULL		-- COMMENT IS 'Primary Key'
	, "origin" TEXT	NOT NULL				-- COMMENT IS 'Originator'
) WITH (OIDS=FALSE)
;
ALTER TABLE "csdgm"."orgin" COMMENT IS 'Originator';

---- SECTION 8.1: Originator Lookup
CREATE TABLE "csdgm"."citeinfo_origin" (
	  "citeinfo" INT NOT NULL
	, "origin" INT NOT NULL
) WITH (OIDS=FALSE)
;
ALTER TALBE "csdgm"."citeinfo_origin" COMMENT IS 'Originator lookup for citeinfo';
ALTER TABLE "csdgm"."citeinfo_origin" ADD CONSTRAINT "pkey_citeinfo_origin" PRIMARY KEY ("citeinfo", "origin");
ALTER TABLE "csdgm"."citeinfo_origin" ADD CONSTRAINT "fkey_citeinfo_onlink_citeinfo" FOREIGN KEY ("citeinfo") REFERENCES "csdgm"."citeinfo" ("gid") ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE "csdgm"."citeinfo_origin" ADD CONSTRAINT "fkey_citeinfo_onlink_origin" FOREIGN KEY ("origin") REFERENCES "csdgm"."origin" ("gid") ON UPDATE CASCADE ON DELETE CASCADE;


---- SECTION 8.6: Geospatial Data Presentation Form: "citeinfo_geoform"
CREATE TABLE "csdgm"."geoform" (
	  "gid" SERIAL PRIMARY KEY NOT NULL
	, "geoform" TEXT NOT NULL				-- COMMENT IS 'Geospatial Data Presentation Form: ("atlas", "diagram", "globe", "map", "model", "profile", "remote-sensing image", "section", "view")'
;
ALTER TABLE "csdgm"."geoform" COMMENT IS 'Geospatial Data Presentation Form';


---- SECTION 8.10: Online Linkage
CREATE TABLE "csdgm"."onlink" (
	  "gid" SERIAL PRIMARY KEY NOT NULL		-- COMMENT IS 'Primary Key'
	, "onlink" TEXT	NOT NULL				-- COMMENT IS 'Online Linkage'
) WITH (OIDS=FALSE)
;
ALTER TABLE "csdgm"."onlink" IS 'Online Linkage';

---- SECTION 8.10: Online Linkage Lookup
CREATE TABLE "csdgm"."citeinfo_onlink" (
	  "citeinfo" INT NOT NULL				-- FKEY citeinfo.gid; COMMENT IS 'citeinfo.gid'
	, "onlink" INT NOT NULL					-- FKEY onlink.gid; COMMENT IS 'onlink.gid'
) WITH (OIDS=FALSE)
;
ALTER TABLE "csdgm"."citeinfo_onlink" COMMENT IS 'Online Linkage lookup for citeinfo';
ALTER TABLE "csdgm"."citeinfo_onlink" ADD CONSTRAINT "pkey_citeinfo_onlink" PRIMARY KEY ("citeinfo", "onlink");
ALTER TABLE "csdgm"."citeinfo_onlink" ADD CONSTRAINT "fkey_citeinfo_onlink_citeinfo" FOREIGN KEY ("citeinfo") REFERENCES "csdgm"."citeinfo" ("gid") ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE "csdgm"."citeinfo_onlink" ADD CONSTRAINT "fkey_citeinfo_onlink_onlnk" FOREIGN KEY ("onlink") REFERENCES "csdgm"."onlink" ("gid") ON UPDATE CASCADE ON DELETE CASCADE;


-- Section 9: Time Period Information
CREATE TABLE "csdgm"."timeinfo" (
	  "gid" SERIAL PRIMARY KEY NOT NULL		-- COMMENT IS 'Primary Key'
	, "sngdate" TIMESTAMP					-- COMMENT IS 'Single Date/Time'
	, "mdattime" TIMESTAMP[]				-- COMMENT IS 'Multiple Dates/Times'
	, "begdate" DATE					    -- COMMENT IS 'Beginning Date'
	, "begtime" TIMESTAMP					-- COMMENT IS 'Beginning Time'
	, "enddate" DATE						-- COMMENT IS 'Ending Date'
	, "endtime" TIMESTAMP					-- COMMENT IS 'Ending Time'
) WITH (OIDS=FALSE)
;
ALTER TABLE "csdgm"."timeinfo" COMMENT IS 'Information about the date and time of an event.'


-- Section 10: Contact Information
CREATE TABLE "csdgm"."cntinfo" (
	  "gid" SERIAL NOT NULL PRIMARY KEY
	, "cntperp" INT							-- FKEY cntperp.gid; COMMENT IS 'cntperp.gid'
	, "cntorgp" INT							-- FKEY cntorg.gid; COMMENT IS 'cntorg.gid'
	, "hours" TEXT							-- COMMENT IS 'Hours of Service'
	, "cntinst" TEXT						-- COMMENT IS 'Constact Instructions'
) WITH (OIDS=FALSE)
;
ALTER TABLE "csdgm"."continfo" COMMENT IS 'Identity of, and means to communicate with, person(s) and organization(s) associated with the data set.'
ALTER TABLE "csdgm"."continfo" ADD CONSTRAINT "fkey_continfo_cntperp" FOREIGN KEY ("cntperp") REFERENCES "csdgm"."cntperp" ("gid") ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE "csdgm"."continfo" ADD CONSTRAINT "fkey_continfo_cntorgp" FOREIGN KEY ("cntorgp") REFERENCES "csdgm"."cntorgp" ("gid") ON UPDATE CASCADE ON DELETE CASCADE;

---- Section 10.1: Contact Person Primary
CREATE TABLE "csdgm"."cntperp" (
	  "gid" SERIAL NOT NULL PRIMARY KEY
	, "cntper" TEXT	NOT NULL				-- COMMENT IS 'Contact Person'
	, "cntorg" TEXT							-- COMMENT IS 'Contact Organization'
	, "cntpos" TEXT							-- COMMENT IS 'Contact Position'
) WITH (OIDS=FALSE)
;
ALTER TABLE "csdgm"."cntperp" COMMENT IS 'The person, and the affiliation of the person, associated with the data set. Used in cases where
the assoc. of the person is more significant than the assoc. of the organization to the data set.';

---- Section 10.2: Contact Organization Primary
CREATE TABLE "csdgm"."cntorgp" (
	  "gid" SERIAL NOT NULL PRIMARY KEY
	, "cntorg" TEXT NOT NULL				-- COMMENT IS 'Contact Organization'
	, "cntper" TEXT							-- COMMENT IS 'Contact Person'
) WITH (OIDS=FALSE)
;
ALTER TABLE "csdgm"."cntorgp" COMMENT IS 'The organization, and the member of the org., associated with the data set. Used in cases where
the assoc. of the organization is more significant than the assoc. of the person to the data set.';

---- Section 10.4: Contact Address
CREATE TABLE "csdgm"."cntaddr" (
	  "gid" SERIAL NOT NULL PRIMARY KEY		-- COMMENT IS 'Primary Key'
	, "addrtype" INT						-- FKEY addrtype.gid; COMMENT IS 'addrtype.gid'
	, "address" TEXT						-- COMMENT IS 'Address'
	, "city" TEXT							-- COMMENT IS 'City'
	, "state" TEXT							-- COMMENT IS 'State or Province'
	, "postal" TEXT							-- COMMENT IS 'Postal Code'
	, "country" TEXT						-- COMMENT IS "Country"
) WITH (OIDS=FALSE)
;
ALTER TABLE "csdgm"."cntaddr" COMMENT IS 'The address for the organization or individual.';
ALTER TABLE "csdgm"."cntaddr" ADD CONSTRAINT "fkey_cntaddr_addrtype" FOREIGN KEY ("addrtype") REFERENCES "csdgm"."addrtype" ("gid") ON UPDATE CASCADE ON DELETE RESTRICT;

CREATE TABLE "csdgm"."addrtype" (
	  "gid" SERIAL NOT NULL PRIMARY KEY		-- COMMENT IS 'Primary Key'
	, "addrtype" TEXT NOT NULL				-- COMMENT IS 'Address Type'
) WITH (OIDS=FALSE)
;
ALTER TABLE "csdgm"."addrtype" COMMENT IS 'Address type for address';
INSERT INTO "csdgm"."addrtype" ("addrtype") VALUES
	  ('Mailing Address')
	, ('Physical Address')
	, ('Mailing and Physical Address')
;

CREATE TABLE "csdgm"."cntperp_cntaddr" (
	  "cntperp" INT NOT NULL				-- COMMENT IS 'cntperp.gid'
	, "cntaddr" INT NOT NULL				-- COMMENT IS 'cntaddr.gid'
) WITH (ODS=FALSE)
;
ALTER TABLE "csdgm"."cntperp_cntaddr" COMMENT IS 'Address lookup for cntperp.'
ALTER TABLE "csdgm"."cntperp_cntaddr" ADD CONSTRAINT "fkey_cntperp_cntaddr_cntperp" FOREIGN KEY ("cntperp") REFERENCES "csdgm"."cntperp" ("gid") ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE "csdgm"."cntperp_cntaddr" ADD CONSTRAINT "fkey_cntperp_cntaddr_cntaddr" FOREIGN KEY ("cntaddr") REFERENCES "csdgm"."cntaddr" ("gid") ON UPDATE CASCADE ON DELETE CASCADE;

CREATE TABLE "csdgm"."cntorgp_cntaddr" (
	  "cntorgp" INT NOT NULL				-- COMMENT IS 'cntorgp.gid'
	, "cntaddr" INT NOT NULL				-- COMMENT IS 'cntaddr.gid'
) WITH (ODS=FALSE)
;
ALTER TABLE "csdgm"."cntorgp_cntaddr" COMMENT IS 'Address lookup for cntorgp.'
ALTER TABLE "csdgm"."cntorgp_cntaddr" ADD CONSTRAINT "fkey_cntorgp_cntaddr_cntorgp" FOREIGN KEY ("cntorgp") REFERENCES "csdgm"."cntorgp" ("gid") ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE "csdgm"."cntorgp_cntaddr" ADD CONSTRAINT "fkey_cntorgp_cntaddr_cntaddr" FOREIGN KEY ("cntaddr") REFERENCES "csdgm"."cntaddr" ("gid") ON UPDATE CASCADE ON DELETE CASCADE;

CREATE TABLE "csdgm"."cntvoice" (
	  "gid" SERIAL NOT NULL PRIMARY KEY		-- COMMENT IS 'Primary Key'
	, "cntvoice" TEXT						-- COMMENT IS 'Contact Voice Telephone'
) WITH (OIDS=FALSE)
;
ALTER TABLE "csdgm"."cntvoice" COMMENT IS 'Contact Voice Telephone.';

CREATE TABLE "csdgm"."cnttdd" (
	  "gid" SERIAL NOT NULL PRIMARY KEY		-- COMMENT IS 'Primary Key'
	, "cnttdd" TEXT							-- COMMENT IS 'Contact TDD/TTY Telephone'
) WITH (OIDS=FALSE)
;
ALTER TABLE "csdgm"."cnttdd" COMMENT IS 'Contact TDD/TTY Telephone.';

CREATE TABLE "csdgm"."cntfax" (
	  "gid" SERIAL NOT NULL PRIMARY KEY		-- COMMENT IS 'Primary Key'
	, "cntfax" TEXT							-- COMMENT IS 'Contact Facsimile Telephone'
) WITH (OIDS=FALSE)
;
ALTER TABLE "csdgm"."cntfax" COMMENT IS 'Contact Facsmimile Telephone.';

CREATE TABLE "csdgm"."cntemail" (
	  "gid" SERIAL NOT NULL PRIMARY KEY		-- COMMENT IS 'Primary Key'
	, "cntemail" TEXT						-- COMMENT IS 'Contact Electronic Mail Address'
) WITH (OIDS=FALSE)
;
ALTER TABLE "csdgm"."cntemail" COMMENT IS 'Contact Electronic Mail Address.';

CREATE TABLE "csdgm"."cntperp_cntvoice" (
	  "cntperp" INT NOT NULL				-- COMMENT IS 'cntperp.gid'
	, "cntvoice" INT NOT NULL				-- COMMENT IS 'cntvoice.gid'
) WITH (OIDS=FALSE)
;
ALTER TABLE "csdgm"."cntperp_cntvoice" COMMENT IS 'Contact Voice Telephone lookup for cntperp.'
ALTER TABLE "csdgm"."cntperp_cntvoice" ADD CONSTRAINT "fkey_cntperp_cntvoice_cntperp" FOREIGN KEY ("cntperp") REFERENCES "csdgm"."cntperp" ("gid") ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE "csdgm"."cntperp_cntvoice" ADD CONSTRAINT "fkey_cntperp_cntvoice_cntvoice" FOREIGN KEY ("cntvoice") REFERENCES "csdgm"."cntvoice" ("gid") ON UPDATE CASCADE ON DELETE CASCADE;

CREATE TABLE "csdgm"."cntperp_cnttdd" (
	  "cntperp" INT NOT NULL				-- COMMENT IS 'cntperp.gid'
	, "cnttdd" INT NOT NULL					-- COMMENT IS 'cnttdd.gid'
) WITH (OIDS=FALSE)
;
ALTER TABLE "csdgm"."cntperp_cnttdd" COMMENT IS 'Contact TDD/TYY Telephone lookup for cntperp.'
ALTER TABLE "csdgm"."cntperp_cnttdd" ADD CONSTRAINT "fkey_cntperp_cnttdd_cnttdd" FOREIGN KEY ("cntperp") REFERENCES "csdgm"."cntperp" ("gid") ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE "csdgm"."cntperp_cnttdd" ADD CONSTRAINT "fkey_cnttdd_cnttdd_cntvoice" FOREIGN KEY ("cntvoice") REFERENCES "csdgm"."cnttdd" ("gid") ON UPDATE CASCADE ON DELETE CASCADE;

CREATE TABLE "csdgm"."cntperp_cntfax" (
	  "cntperp" INT NOT NULL				-- COMMENT IS 'cntperp.gid'
	, "cntfax" INT NOT NULL					-- COMMENT IS 'cntfax.gid'
) WITH (OIDS=FALSE)
;
ALTER TABLE "csdgm"."cntperp_cntfax" COMMENT IS 'Contact Facsimile Telephone lookup for cntperp.'
ALTER TABLE "csdgm"."cntperp_cntfax" ADD CONSTRAINT "fkey_cntperp_cntfax_cntperp" FOREIGN KEY ("cntperp") REFERENCES "csdgm"."cntperp" ("gid") ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE "csdgm"."cntperp_cntfax" ADD CONSTRAINT "fkey_cntperp_cntfax_cntfax" FOREIGN KEY ("cntfax") REFERENCES "csdgm"."cntfax" ("gid") ON UPDATE CASCADE ON DELETE CASCADE;

CREATE TABLE "csdgm"."cntperp_cntemail" (
	  "cntperp" INT NOT NULL				-- COMMENT IS 'cntperp.gid'
	, "cntemail" INT NOT NULL				-- COMMENT IS 'cntemail.gid'
) WITH (OIDS=FALSE)
;
ALTER TABLE "csdgm"."cntperp_cntemail" COMMENT IS 'Contact Electronic Mail lookup for cntperp.'
ALTER TABLE "csdgm"."cntperp_cntemail" ADD CONSTRAINT "fkey_cntperp_cntemail_cntperp" FOREIGN KEY ("cntperp") REFERENCES "csdgm"."cntperp" ("gid") ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE "csdgm"."cntperp_cntemail" ADD CONSTRAINT "fkey_cntperp_cntemail_cntemail" FOREIGN KEY ("cntemail") REFERENCES "csdgm"."cntemail" ("gid") ON UPDATE CASCADE ON DELETE CASCADE;

CREATE TABLE "csdgm"."cntorgp_cntvoice" (
	  "cntorgp" INT NOT NULL				-- COMMENT IS 'cntorgp.gid'
	, "cntvoice" INT NOT NULL				-- COMMENT IS 'cntvoice.gid'
) WITH (OIDS=FALSE)
;
ALTER TABLE "csdgm"."cntorgp_cntvoice" COMMENT IS 'Contact Voice Telephone lookup for cntorgp.'
ALTER TABLE "csdgm"."cntorgp_cntvoice" ADD CONSTRAINT "fkey_cntorgp_cntvoice_cntorgp" FOREIGN KEY ("cntorgp") REFERENCES "csdgm"."cntorgp" ("gid") ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE "csdgm"."cntorgp_cntvoice" ADD CONSTRAINT "fkey_cntorgp_cntvoice_cntvoice" FOREIGN KEY ("cntvoice") REFERENCES "csdgm"."cntvoice" ("gid") ON UPDATE CASCADE ON DELETE CASCADE;

CREATE TABLE "csdgm"."cntorgp_cnttdd" (
	  "cntorgp" INT NOT NULL				-- COMMENT IS 'cntorgp.gid'
	, "cnttdd" INT NOT NULL					-- COMMENT IS 'cnttdd.gid'
) WITH (OIDS=FALSE)
;
ALTER TABLE "csdgm"."cntorgp_cnttdd" COMMENT IS 'Contact TDD/TYY Telephone lookup for cntorgp.'
ALTER TABLE "csdgm"."cntorgp_cnttdd" ADD CONSTRAINT "fkey_cntorgp_cnttdd_cnttdd" FOREIGN KEY ("cntorgp") REFERENCES "csdgm"."cntorgp" ("gid") ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE "csdgm"."cntorgp_cnttdd" ADD CONSTRAINT "fkey_cnttdd_cnttdd_cntvoice" FOREIGN KEY ("cntvoice") REFERENCES "csdgm"."cnttdd" ("gid") ON UPDATE CASCADE ON DELETE CASCADE;

CREATE TABLE "csdgm"."cntorgp_cntfax" (
	  "cntorgp" INT NOT NULL				-- COMMENT IS 'cntorgp.gid'
	, "cntfax" INT NOT NULL					-- COMMENT IS 'cntfax.gid'
) WITH (OIDS=FALSE)
;
ALTER TABLE "csdgm"."cntorgp_cntfax" COMMENT IS 'Contact Facsimile Telephone lookup for cntorgp.'
ALTER TABLE "csdgm"."cntorgp_cntfax" ADD CONSTRAINT "fkey_cntorgp_cntfax_cntorgp" FOREIGN KEY ("cntorgp") REFERENCES "csdgm"."cntorgp" ("gid") ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE "csdgm"."cntorgp_cntfax" ADD CONSTRAINT "fkey_cntorgp_cntfax_cntfax" FOREIGN KEY ("cntfax") REFERENCES "csdgm"."cntfax" ("gid") ON UPDATE CASCADE ON DELETE CASCADE;

CREATE TABLE "csdgm"."cntorgp_cntemail" (
	  "cntorgp" INT NOT NULL				-- COMMENT IS 'cntorgp.gid'
	, "cntemail" INT NOT NULL				-- COMMENT IS 'cntemail.gid'
) WITH (OIDS=FALSE)
;
ALTER TABLE "csdgm"."cntorgp_cntemail" COMMENT IS 'Contact Electronic Mail lookup for cntorgp.'
ALTER TABLE "csdgm"."cntorgp_cntemail" ADD CONSTRAINT "fkey_cntorgp_cntemail_cntorgp" FOREIGN KEY ("cntorgp") REFERENCES "csdgm"."cntorgp" ("gid") ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE "csdgm"."cntorgp_cntemail" ADD CONSTRAINT "fkey_cntorgp_cntemail_cntemail" FOREIGN KEY ("cntemail") REFERENCES "csdgm"."cntemail" ("gid") ON UPDATE CASCADE ON DELETE CASCADE;
