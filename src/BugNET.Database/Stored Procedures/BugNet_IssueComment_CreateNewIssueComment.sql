CREATE PROCEDURE [dbo].[BugNet_IssueComment_CreateNewIssueComment]
	@IssueId int,
	@CreatorUserName NVarChar(255),
	@Comment ntext,
	@CommentIsPrivate bit
AS
-- Get Last Update UserID
DECLARE @UserId uniqueidentifier
SELECT @UserId = UserId FROM Users WHERE UserName = @CreatorUserName
INSERT BugNet_IssueComments
(
	IssueId,
	UserId,
	DateCreated,
	Comment,
	CommentIsPrivate
) 
VALUES 
(
	@IssueId,
	@UserId,
	GetDate(),
	@Comment,
	@CommentIsPrivate
)

/* Update the LastUpdate fields of this bug*/
UPDATE BugNet_Issues SET LastUpdate = GetDate(),LastUpdateUserId = @UserId WHERE IssueId = @IssueId

RETURN scope_identity()
