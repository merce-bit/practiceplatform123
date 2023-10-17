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

     -- Begin a transaction

    BEGIN

         -- Check if the script has been executed before

            CREATE TABLE IF NOT EXISTS metadata."ControlTable" (

                "ScriptName" character(500),
                "Version" integer,
                "Description" character(500),
                "Developer" character(500),
                "Timestamp" timestamp(6) with time zone,
                "Executed" boolean
            );


    EXCEPTION

        -- Handle any errors that occur

         WHEN OTHERS THEN

            -- Rollback the transaction
            ROLLBACK;

            -- Rethrow the error
            RAISE;

    END;
commit;
END$$;