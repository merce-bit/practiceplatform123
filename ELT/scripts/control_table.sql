-- Set the script metadata variables

DO $$

DECLARE
     ScriptName VARCHAR(100) := 'ControlTable creation';
     Version INT := 20230622-01;
     Description VARCHAR(500) := 'Initial creation of the Control table';
     Developer VARCHAR(100) := 'Merce';
     Timestamp TIMESTAMP := current_timestamp;
     Executed BOOLEAN := true;
BEGIN
     -- Check if the table exists, and if not, create it
     IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_schema = 'metadata' AND table_name = 'ControlTable') THEN
         -- Attempt to create the table
         BEGIN
             -- Create the table if it doesn't exist
             CREATE TABLE metadata."ControlTable" (
                 "ScriptName" character(500),
                 "Version" integer,
                 "Description" character(500),
                 "Developer" character(100),
                 "Timestamp" timestamp,
                 "Executed" boolean
             );
         EXCEPTION
             -- Handle any errors that occur during table creation
             WHEN OTHERS THEN
                 -- You can choose to log the error or take other appropriate actions
                 RAISE NOTICE 'Error creating the "ControlTable": %', SQLERRM;
         END;
     END IF;
END $$;
