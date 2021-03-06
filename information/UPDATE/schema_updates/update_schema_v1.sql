-- Convert schema '/home/mlangill/Dropbox/projects/MicrobeDB/information//DEVELOPERS_ONLY/microbedb_schema_old.sql' to '/home/mlangill/Dropbox/projects/MicrobeDB/information//INSTALL/microbedb_schema.sql':;

BEGIN;

SET foreign_key_checks=0;

CREATE TABLE IF NOT EXISTS `microbedb_meta` (
  meta_id integer(10) unsigned NOT NULL,
  meta_key varchar(255) NOT NULL,
  meta_value text,
  PRIMARY KEY (meta_id),
  UNIQUE meta_key (meta_key)
);

SET foreign_key_checks=1;

ALTER TABLE gene CHANGE COLUMN gene_strand gene_strand enum('+', '-', '1', '-1', '0') DEFAULT NULL;
                
ALTER TABLE genomeproject ADD COLUMN chromosome_num integer(10) unsigned DEFAULT 0,
                          ADD COLUMN plasmid_num integer(10) unsigned DEFAULT 0,
                          ADD COLUMN contig_num integer(10) unsigned DEFAULT 0,
                          CHANGE COLUMN taxon_id taxon_id integer(10) unsigned DEFAULT 0;
                          

ALTER TABLE replicon DROP COLUMN genome_id,
                     CHANGE COLUMN rep_type rep_type enum('chromosome', 'plasmid', 'contig') DEFAULT NULL,
                     CHANGE COLUMN file_name file_name text DEFAULT NULL;


COMMIT;

