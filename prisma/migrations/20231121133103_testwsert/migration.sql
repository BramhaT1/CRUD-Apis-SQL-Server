BEGIN TRY

BEGIN TRAN;

-- RedefineTables
BEGIN TRANSACTION;
DECLARE @SQL NVARCHAR(MAX) = N''
SELECT @SQL += N'ALTER TABLE '
    + QUOTENAME(OBJECT_SCHEMA_NAME(PARENT_OBJECT_ID))
    + '.'
    + QUOTENAME(OBJECT_NAME(PARENT_OBJECT_ID))
    + ' DROP CONSTRAINT '
    + OBJECT_NAME(OBJECT_ID) + ';'
FROM SYS.OBJECTS
WHERE TYPE_DESC LIKE '%CONSTRAINT'
    AND OBJECT_NAME(PARENT_OBJECT_ID) = 'InternTesting'
    AND SCHEMA_NAME(SCHEMA_ID) = 'dbo'
EXEC sp_executesql @SQL
;
CREATE TABLE [dbo].[_prisma_new_InternTesting] (
    [name] NVARCHAR(1000) NOT NULL,
    [id] INT NOT NULL IDENTITY(1,1),
    CONSTRAINT [InternTesting_pkey] PRIMARY KEY CLUSTERED ([id])
);
SET IDENTITY_INSERT [dbo].[_prisma_new_InternTesting] ON;
IF EXISTS(SELECT * FROM [dbo].[InternTesting])
    EXEC('INSERT INTO [dbo].[_prisma_new_InternTesting] ([id],[name]) SELECT [id],[name] FROM [dbo].[InternTesting] WITH (holdlock tablockx)');
SET IDENTITY_INSERT [dbo].[_prisma_new_InternTesting] OFF;
DROP TABLE [dbo].[InternTesting];
EXEC SP_RENAME N'dbo._prisma_new_InternTesting', N'InternTesting';
COMMIT;

COMMIT TRAN;

END TRY
BEGIN CATCH

IF @@TRANCOUNT > 0
BEGIN
    ROLLBACK TRAN;
END;
THROW

END CATCH
