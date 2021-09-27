/*
	creates a postgres function that asserts if a table 
	exists in the database.
*/
CREATE OR REPLACE FUNCTION check_table_exists(IN tableName text)
RETURNS boolean
RETURNS NULL ON NULL INPUT
LANGUAGE plpgsql
AS $$
declare tableExists boolean;
BEGIN
	SELECT EXISTS (
		SELECT * FROM INFORMATION_SCHEMA.TABLES
		WHERE table_name = 'conference'
	) INTO tableExists;
	RETURN tableExists;
END;
$$;
