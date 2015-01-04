

PRINT 'Add New Permission(s)'
GO
INSERT [BugNet_Permissions] ([PermissionId], [PermissionKey], [PermissionName]) VALUES (33, N'ViewPrivateComment', N'View Private Comments')
GO

PRINT 'Add New Language(s)'
GO
INSERT INTO [dbo].[BugNet_Languages] ([CultureCode], [CultureName], [FallbackCulture]) VALUES('en-GB', 'English (United Kingdom)', 'en-US')
GO




