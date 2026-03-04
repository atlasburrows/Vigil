-- Migration: Add stored procedure to get credentials by group name
-- This is needed for group credential requests where only the group name is stored in the permission request

CREATE OR ALTER PROCEDURE sp_Credentials_GetByGroupName
    @GroupName NVARCHAR(255)
AS
BEGIN
    -- First find the group by name, then get all credentials in that group
    SELECT c.* 
    FROM SecureCredentials c
    INNER JOIN CredentialGroupMembers m ON c.Id = m.CredentialId
    INNER JOIN CredentialGroups g ON m.GroupId = g.Id
    WHERE g.Name = @GroupName;
END
GO
