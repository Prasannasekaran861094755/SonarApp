USE europeswa
GO
SET ANSI_NULLS, QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:  Suresh
-- Create date: 07/08/2024
-- Description: To get user language short name
--exec AcsysX_GetUserLangCode 'System'
-- =============================================
CREATE PROCEDURE [dbo].[AcsysX_GetUserLangCode]
-- Add the parameters for the stored procedure here
@UserName VARCHAR(100)
WITH ENCRYPTION
AS
BEGIN TRY
BEGIN
DECLARE @ShorName VARCHAR(10)
SELECT @ShorName= ShortName FROM AcsysX_Language WHERE Id=(SELECT [PreferredLanguage] FROM [AcsysX_Accounts] WHERE FName = @UserName)
IF @ShorName IS NULL
BEGIN
SELECT @ShorName= ShortName FROM AcsysX_Language WHERE LanguageName = (SELECT [value] FROM settings WHERE [name] ='DefaultLanguage')
END
SELECT @ShorName 'LangCode'
END
END TRY
BEGIN CATCH
EXEC dbo.[AcsysX_WriteErrorLog] 'AcsysX_GetUserLangCode'
END CATCH
GO
