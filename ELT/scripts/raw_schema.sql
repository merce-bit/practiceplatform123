IF NOT EXISTS (SELECT schema_id FROM sys.schemas WHERE name = 'RAW')
BEGIN
    EXEC('CREATE SCHEMA [RAW]')
END;