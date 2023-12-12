-- Set the script metadata variables
DO $$

DECLARE

    ScriptName VARCHAR(100) := 'LoadError table creation';

    Version INT := 20230622-01;

    Description VARCHAR(500) := 'Initial creation of the LoadError table';

    Developer VARCHAR(100) := 'Merce';

    Timestamp TIMESTAMP := current_timestamp;

    Executed BOOLEAN := true;

BEGIN

     -- Check if the script has been executed before

        IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE WHERE table_schema = 'metadata' AND table_name = 'LoadError' ) THEN
 
    -- Begin a transaction

 	   BEGIN

             -- Your SQL script logic here

                CREATE TABLE IF NOT EXISTS metadata."LoadError"
                (
                    "ScriptName" character(500),
                    "Version" integer,
                    "Description" character(500),
                    "Developer" character(500),
                    "ErrorMessage" character(500),
                    "ErrorTimestamp" timestamp(6) with time zone
                );


    EXCEPTION

     -- Handle any errors that occur

         WHEN OTHERS THEN

            -- Rethrow the error

         RAISE NOTICE 'Error creating the "ControlTable": %', SQLERRM;
 
       END;

   END IF;
END$$;