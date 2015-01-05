INSERT INTO [dbo].[BugNet_Languages] ([CultureCode], [CultureName], [FallbackCulture]) VALUES('en-GB', 'English (UK)', 'en-US')
GO

ALTER TABLE BugNet_IssueComments
    ADD  [CommentIsPrivate] [bit] NOT NULL CONSTRAINT [DF_BugNet_IssueComments_CommentIsPrivate]  DEFAULT ((0))
GO

ALTER PROCEDURE [dbo].[BugNet_IssueComment_GetIssueCommentsByIssueId]
	@IssueId Int 
AS

SELECT 
	IssueCommentId,
	IssueId,
	Comment,
	CommentIsPrivate,
	U.UserId CreatorUserId,
	U.UserName CreatorUserName,
	IsNull(DisplayName,'') CreatorDisplayName,
	DateCreated
FROM
	BugNet_IssueComments
	INNER JOIN Users U ON BugNet_IssueComments.UserId = U.UserId
	LEFT OUTER JOIN BugNet_UserProfiles ON U.UserName = BugNet_UserProfiles.UserName
WHERE
	IssueId = @IssueId
ORDER BY 
	DateCreated DESC
GO

ALTER PROCEDURE [dbo].[BugNet_IssueWorkReport_GetIssueWorkReportsByIssueId]
	@IssueId INT
AS
SELECT      
	IssueWorkReportId,
	BugNet_IssueWorkReports.IssueId,
	WorkDate,
	Duration,
	BugNet_IssueWorkReports.IssueCommentId,
	BugNet_IssueWorkReports.UserId CreatorUserId, 
	U.UserName CreatorUserName,
	IsNull(DisplayName,'') CreatorDisplayName,
    ISNULL(BugNet_IssueComments.Comment, '') Comment,
	ISNULL(BugNet_IssueComments.CommentIsPrivate, 1) CommentIsPrivate
FROM         
	BugNet_IssueWorkReports
	INNER JOIN Users U ON BugNet_IssueWorkReports.UserId = U.UserId
	LEFT OUTER JOIN BugNet_UserProfiles ON U.UserName = BugNet_UserProfiles.UserName
	LEFT OUTER JOIN BugNet_IssueComments ON BugNet_IssueComments.IssueCommentId =  BugNet_IssueWorkReports.IssueCommentId
WHERE
	 BugNet_IssueWorkReports.IssueId = @IssueId
ORDER BY WorkDate DESC
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER VIEW [dbo].[BugNet_IssueCommentsView]
AS
SELECT     dbo.BugNet_IssueComments.IssueCommentId, dbo.BugNet_IssueComments.IssueId, dbo.BugNet_IssuesView.ProjectId, dbo.BugNet_IssueComments.Comment, 
                      dbo.BugNet_IssueComments.DateCreated, dbo.BugNet_UserView.UserId AS CreatorUserId, dbo.BugNet_UserView.DisplayName AS CreatorDisplayName, 
                      dbo.BugNet_UserView.UserName AS CreatorUserName, dbo.BugNet_IssuesView.Disabled AS IssueDisabled, dbo.BugNet_IssuesView.IsClosed AS IssueIsClosed, 
                      dbo.BugNet_IssuesView.IssueVisibility, dbo.BugNet_IssuesView.ProjectCode, dbo.BugNet_IssuesView.ProjectName, dbo.BugNet_IssuesView.ProjectDisabled,
					  dbo.BugNet_IssueComments.CommentIsPrivate
FROM         dbo.BugNet_IssuesView INNER JOIN
                      dbo.BugNet_IssueComments ON dbo.BugNet_IssuesView.IssueId = dbo.BugNet_IssueComments.IssueId INNER JOIN
                      dbo.BugNet_UserView ON dbo.BugNet_IssueComments.UserId = dbo.BugNet_UserView.UserId

GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[BugNet_IssueComment_GetIssueCommentById]
 @IssueCommentId INT
AS
SELECT
	IssueCommentId,
	IssueId,
	Comment,
	CommentIsPrivate,
	U.UserId CreatorUserId,
	U.UserName CreatorUserName,
	IsNull(DisplayName,'') CreatorDisplayName,
	DateCreated
FROM
	BugNet_IssueComments
	INNER JOIN Users U ON BugNet_IssueComments.UserId = U.UserId
	LEFT OUTER JOIN BugNet_UserProfiles ON U.UserName = BugNet_UserProfiles.UserName
WHERE
	IssueCommentId = @IssueCommentId
GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[BugNet_IssueComment_UpdateIssueComment]
	@IssueCommentId int,
	@IssueId int,
	@CreatorUserName nvarchar(255),
	@Comment ntext,
	@CommentIsPrivate bit
AS

DECLARE @UserId uniqueidentifier
SELECT @UserId = UserId FROM Users WHERE UserName = @CreatorUserName

UPDATE BugNet_IssueComments SET
	IssueId = @IssueId,
	UserId = @UserId,
	Comment = @Comment,
	CommentIsPrivate = @CommentIsPrivate
WHERE IssueCommentId= @IssueCommentId
GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[BugNet_IssueWorkReport_GetIssueWorkReportsByIssueId]
	@IssueId INT
AS
SELECT      
	IssueWorkReportId,
	BugNet_IssueWorkReports.IssueId,
	WorkDate,
	Duration,
	BugNet_IssueWorkReports.IssueCommentId,
	BugNet_IssueWorkReports.UserId CreatorUserId, 
	U.UserName CreatorUserName,
	IsNull(DisplayName,'') CreatorDisplayName,
    ISNULL(BugNet_IssueComments.Comment, '') Comment,
	ISNULL(BugNet_IssueComments.CommentIsPrivate, 1) CommentIsPrivate
FROM         
	BugNet_IssueWorkReports
	INNER JOIN Users U ON BugNet_IssueWorkReports.UserId = U.UserId
	LEFT OUTER JOIN BugNet_UserProfiles ON U.UserName = BugNet_UserProfiles.UserName
	LEFT OUTER JOIN BugNet_IssueComments ON BugNet_IssueComments.IssueCommentId =  BugNet_IssueWorkReports.IssueCommentId
WHERE
	 BugNet_IssueWorkReports.IssueId = @IssueId
ORDER BY WorkDate DESC
GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[BugNet_IssueComment_GetIssueCommentById]
 @IssueCommentId INT
AS
SELECT
	IssueCommentId,
	IssueId,
	Comment,
	CommentIsPrivate,
	U.UserId CreatorUserId,
	U.UserName CreatorUserName,
	IsNull(DisplayName,'') CreatorDisplayName,
	DateCreated
FROM
	BugNet_IssueComments
	INNER JOIN Users U ON BugNet_IssueComments.UserId = U.UserId
	LEFT OUTER JOIN BugNet_UserProfiles ON U.UserName = BugNet_UserProfiles.UserName
WHERE
	IssueCommentId = @IssueCommentId
GO



ALTER PROCEDURE [dbo].[BugNet_IssueComment_CreateNewIssueComment]
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
