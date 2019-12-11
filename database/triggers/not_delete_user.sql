--TODO: Finnish dont delete trigger

CREATE TRIGGER dbo.trg_dont_delete_user
ON dbo.TUsers
INSTEAD OF DELETE
AS
SET NOCOUNT ON
IF(SELECT COUNT(*) FROM TUsers WHERE nTotalAmount >0) > 0

DECLARE @ERROR_MESSAGE VARCHAR(500)
SELECT @ERROR_MESSAGE		=
	'Trigger trg_dont_delete_user - '+
	'User has more than one purchase. Deletion is disabled'
RAISERROR( @ERROR_MESSAGE, 16, 1)
if @@trancount > 0 BEGIN ROLLBACK END

RETURN
GO