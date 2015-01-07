/****** Object:  Table [dbo].[BugNet_Permissions]    Script Date: 08/26/2010 14:05:12 ******/
INSERT [BugNet_Permissions] ([PermissionId], [PermissionKey], [PermissionName]) VALUES (1, N'CloseIssue', N'Close Issue')
INSERT [BugNet_Permissions] ([PermissionId], [PermissionKey], [PermissionName]) VALUES (2, N'AddIssue', N'Add Issue')
INSERT [BugNet_Permissions] ([PermissionId], [PermissionKey], [PermissionName]) VALUES (3, N'AssignIssue', N'Assign Issue')
INSERT [BugNet_Permissions] ([PermissionId], [PermissionKey], [PermissionName]) VALUES (4, N'EditIssue', N'Edit Issue')
INSERT [BugNet_Permissions] ([PermissionId], [PermissionKey], [PermissionName]) VALUES (5, N'SubscribeIssue', N'Subscribe Issue')
INSERT [BugNet_Permissions] ([PermissionId], [PermissionKey], [PermissionName]) VALUES (6, N'DeleteIssue', N'Delete Issue')
INSERT [BugNet_Permissions] ([PermissionId], [PermissionKey], [PermissionName]) VALUES (7, N'AddComment', N'Add Comment')
INSERT [BugNet_Permissions] ([PermissionId], [PermissionKey], [PermissionName]) VALUES (8, N'EditComment', N'Edit Comment')
INSERT [BugNet_Permissions] ([PermissionId], [PermissionKey], [PermissionName]) VALUES (9, N'DeleteComment', N'Delete Comment')
INSERT [BugNet_Permissions] ([PermissionId], [PermissionKey], [PermissionName]) VALUES (10, N'AddAttachment', N'Add Attachment')
INSERT [BugNet_Permissions] ([PermissionId], [PermissionKey], [PermissionName]) VALUES (11, N'DeleteAttachment', N'Delete Attachment')
INSERT [BugNet_Permissions] ([PermissionId], [PermissionKey], [PermissionName]) VALUES (12, N'AddRelated', N'Add Related Issue')
INSERT [BugNet_Permissions] ([PermissionId], [PermissionKey], [PermissionName]) VALUES (13, N'DeleteRelated', N'Delete Related Issue')
INSERT [BugNet_Permissions] ([PermissionId], [PermissionKey], [PermissionName]) VALUES (14, N'ReopenIssue', N'Re-Open Issue')
INSERT [BugNet_Permissions] ([PermissionId], [PermissionKey], [PermissionName]) VALUES (15, N'OwnerEditComment', N'Edit Own Comments')
INSERT [BugNet_Permissions] ([PermissionId], [PermissionKey], [PermissionName]) VALUES (16, N'EditIssueDescription', N'Edit Issue Description')
INSERT [BugNet_Permissions] ([PermissionId], [PermissionKey], [PermissionName]) VALUES (17, N'EditIssueTitle', N'Edit Issue Title')
INSERT [BugNet_Permissions] ([PermissionId], [PermissionKey], [PermissionName]) VALUES (18, N'AdminEditProject', N'Admin Edit Project')
INSERT [BugNet_Permissions] ([PermissionId], [PermissionKey], [PermissionName]) VALUES (19, N'AddTimeEntry', N'Add Time Entry')
INSERT [BugNet_Permissions] ([PermissionId], [PermissionKey], [PermissionName]) VALUES (20, N'DeleteTimeEntry', N'Delete Time Entry')
INSERT [BugNet_Permissions] ([PermissionId], [PermissionKey], [PermissionName]) VALUES (21, N'AdminCreateProject', N'Admin Create Project')
INSERT [BugNet_Permissions] ([PermissionId], [PermissionKey], [PermissionName]) VALUES (22, N'AddQuery', N'Add Query')
INSERT [BugNet_Permissions] ([PermissionId], [PermissionKey], [PermissionName]) VALUES (23, N'DeleteQuery', N'Delete Query')
INSERT [BugNet_Permissions] ([PermissionId], [PermissionKey], [PermissionName]) VALUES (24, N'AdminCloneProject', N'Clone Project')
INSERT [BugNet_Permissions] ([PermissionId], [PermissionKey], [PermissionName]) VALUES (25, N'AddSubIssue', N'Add Sub Issues')
INSERT [BugNet_Permissions] ([PermissionId], [PermissionKey], [PermissionName]) VALUES (26, N'DeleteSubIssue', N'Delete Sub Issues')
INSERT [BugNet_Permissions] ([PermissionId], [PermissionKey], [PermissionName]) VALUES (27, N'AddParentIssue', N'Add Parent Issues')
INSERT [BugNet_Permissions] ([PermissionId], [PermissionKey], [PermissionName]) VALUES (28, N'DeleteParentIssue', N'Delete Parent Issues')
INSERT [BugNet_Permissions] ([PermissionId], [PermissionKey], [PermissionName]) VALUES (29, N'AdminDeleteProject', N'Delete a project')
INSERT [BugNet_Permissions] ([PermissionId], [PermissionKey], [PermissionName]) VALUES (31, N'ChangeIssueStatus', N'Change an issues status field')
INSERT [BugNet_Permissions] ([PermissionId], [PermissionKey], [PermissionName]) VALUES (32, N'EditQuery', N'Edit queries')
INSERT [BugNet_Permissions] ([PermissionId], [PermissionKey], [PermissionName]) VALUES (33, N'ViewPrivateComment', N'View Private Comments')

-- Host Settings 
INSERT INTO [dbo].[BugNet_HostSettings] ([SettingName], [SettingValue]) VALUES (N'AdminNotificationUsername', N'admin')
INSERT INTO [dbo].[BugNet_HostSettings] ([SettingName], [SettingValue]) VALUES (N'ADPassword', N'')
INSERT INTO [dbo].[BugNet_HostSettings] ([SettingName], [SettingValue]) VALUES (N'ADPath', N'')
INSERT INTO [dbo].[BugNet_HostSettings] ([SettingName], [SettingValue]) VALUES (N'ADUserName', N'')
INSERT INTO [dbo].[BugNet_HostSettings] ([SettingName], [SettingValue]) VALUES (N'AllowedFileExtensions', N'*.*')
INSERT INTO [dbo].[BugNet_HostSettings] ([SettingName], [SettingValue]) VALUES (N'AllowAttachments', N'False')
INSERT INTO [dbo].[BugNet_HostSettings] ([SettingName], [SettingValue]) VALUES (N'AttachmentStorageType', N'1')
INSERT INTO [dbo].[BugNet_HostSettings] ([SettingName], [SettingValue]) VALUES (N'AttachmentUploadPath', N'~\Uploads\')
INSERT INTO [dbo].[BugNet_HostSettings] ([SettingName], [SettingValue]) VALUES (N'ApplicationTitle', N'BugNET Issue Tracker')
INSERT INTO [dbo].[BugNet_HostSettings] ([SettingName], [SettingValue]) VALUES (N'DefaultUrl', N'http://localhost/BugNet/')
INSERT INTO [dbo].[BugNet_HostSettings] ([SettingName], [SettingValue]) VALUES (N'AnonymousAccess', N'False')
INSERT INTO [dbo].[BugNet_HostSettings] ([SettingName], [SettingValue]) VALUES (N'UserRegistration', N'0')
INSERT INTO [dbo].[BugNet_HostSettings] ([SettingName], [SettingValue]) VALUES (N'EmailErrors', N'False')
INSERT INTO [dbo].[BugNet_HostSettings] ([SettingName], [SettingValue]) VALUES (N'EnableRepositoryCreation', N'True')
INSERT INTO [dbo].[BugNet_HostSettings] ([SettingName], [SettingValue]) VALUES (N'ErrorLoggingEmailAddress', N'myemail@mysmtpserver.com')
INSERT INTO [dbo].[BugNet_HostSettings] ([SettingName], [SettingValue]) VALUES (N'FileSizeLimit', N'2024')
INSERT INTO [dbo].[BugNet_HostSettings] ([SettingName], [SettingValue]) VALUES (N'HostEmailAddress', N'noreply@mysmtpserver.com')
INSERT INTO [dbo].[BugNet_HostSettings] ([SettingName], [SettingValue]) VALUES (N'Pop3BodyTemplate', N'templates/NewMailboxIssue.xslt')
INSERT INTO [dbo].[BugNet_HostSettings] ([SettingName], [SettingValue]) VALUES (N'Pop3DeleteAllMessages', N'False')
INSERT INTO [dbo].[BugNet_HostSettings] ([SettingName], [SettingValue]) VALUES (N'Pop3InlineAttachedPictures', N'False')
INSERT INTO [dbo].[BugNet_HostSettings] ([SettingName], [SettingValue]) VALUES (N'Pop3Interval', N'6000')
INSERT INTO [dbo].[BugNet_HostSettings] ([SettingName], [SettingValue]) VALUES (N'Pop3Password', N'')
INSERT INTO [dbo].[BugNet_HostSettings] ([SettingName], [SettingValue]) VALUES (N'Pop3ReaderEnabled', N'True')
INSERT INTO [dbo].[BugNet_HostSettings] ([SettingName], [SettingValue]) VALUES (N'Pop3ReportingUsername', N'Admin')
INSERT INTO [dbo].[BugNet_HostSettings] ([SettingName], [SettingValue]) VALUES (N'Pop3Server', N'')
INSERT INTO [dbo].[BugNet_HostSettings] ([SettingName], [SettingValue]) VALUES (N'Pop3Username', N'bugnetuser')
INSERT INTO [dbo].[BugNet_HostSettings] ([SettingName], [SettingValue]) VALUES (N'Pop3UseSSL', N'False')
INSERT INTO [dbo].[BugNet_HostSettings] ([SettingName], [SettingValue]) VALUES (N'RepositoryBackupPath', N'')
INSERT INTO [dbo].[BugNet_HostSettings] ([SettingName], [SettingValue]) VALUES (N'RepositoryRootPath', N'C:\\SVN\\')
INSERT INTO [dbo].[BugNet_HostSettings] ([SettingName], [SettingValue]) VALUES (N'RepositoryRootUrl', N'svn://localhost/')
INSERT INTO [dbo].[BugNet_HostSettings] ([SettingName], [SettingValue]) VALUES (N'SMTPAuthentication', N'False')
INSERT INTO [dbo].[BugNet_HostSettings] ([SettingName], [SettingValue]) VALUES (N'SMTPPassword', N'')
INSERT INTO [dbo].[BugNet_HostSettings] ([SettingName], [SettingValue]) VALUES (N'SMTPPort', N'25')
INSERT INTO [dbo].[BugNet_HostSettings] ([SettingName], [SettingValue]) VALUES (N'SMTPServer', N'localhost')
INSERT INTO [dbo].[BugNet_HostSettings] ([SettingName], [SettingValue]) VALUES (N'SMTPUsername', N'')
INSERT INTO [dbo].[BugNet_HostSettings] ([SettingName], [SettingValue]) VALUES (N'SMTPUseSSL', N'False')
INSERT INTO [dbo].[BugNet_HostSettings] ([SettingName], [SettingValue]) VALUES (N'SvnAdminEmailAddress', N'')
INSERT INTO [dbo].[BugNet_HostSettings] ([SettingName], [SettingValue]) VALUES (N'SvnHookPath', N'')
INSERT INTO [dbo].[BugNet_HostSettings] ([SettingName], [SettingValue]) VALUES (N'UserAccountSource', N'None')
INSERT INTO [dbo].[BugNet_HostSettings] ([SettingName], [SettingValue]) VALUES (N'Version', N'')
INSERT INTO [dbo].[BugNet_HostSettings] ([SettingName], [SettingValue]) VALUES (N'WelcomeMessage', N'Welcome to your new BugNET installation! Log in as <br/><br/> Username: admin <br/>Password: password')
INSERT INTO [dbo].[BugNet_HostSettings] ([SettingName], [SettingValue]) VALUES('SMTPEmailTemplateRoot', '~/templates')
INSERT INTO [dbo].[BugNet_HostSettings] ([SettingName], [SettingValue]) VALUES('SMTPEMailFormat','2')
INSERT INTO [dbo].[BugNet_HostSettings] ([SettingName], [SettingValue]) VALUES('SMTPDomain','')
INSERT INTO [dbo].[BugNet_HostSettings] ([SettingName], [SettingValue]) VALUES('ApplicationDefaultLanguage','en-US')
INSERT INTO [dbo].[BugNet_HostSettings] ([SettingName], [SettingValue]) VALUES('Pop3ProcessAttachments','False')
INSERT INTO [dbo].[BugNet_HostSettings] ([SettingName], [SettingValue]) VALUES('Pop3Port', '110')
INSERT INTO [dbo].[BugNet_HostSettings] ([SettingName], [SettingValue]) VALUES('EnableGravatar', 'False')
INSERT INTO [dbo].[BugNet_HostSettings] ([SettingName], [SettingValue]) VALUES('GoogleAuthentication', 'False')
INSERT INTO [dbo].[BugNet_HostSettings] ([SettingName], [SettingValue]) VALUES (N'GoogleClientId', N'')
INSERT INTO [dbo].[BugNet_HostSettings] ([SettingName], [SettingValue]) VALUES (N'GoogleClientSecret', N'')
INSERT INTO [dbo].[BugNet_HostSettings] ([SettingName], [SettingValue]) VALUES('FacebookAuthentication', 'False')
INSERT INTO [dbo].[BugNet_HostSettings] ([SettingName], [SettingValue]) VALUES('FacebookAppId', '')
INSERT INTO [dbo].[BugNet_HostSettings] ([SettingName], [SettingValue]) VALUES('FacebookAppSecret', '')
INSERT INTO [dbo].[BugNet_HostSettings] ([SettingName], [SettingValue]) VALUES('TwitterAuthentication', 'False')
INSERT INTO [dbo].[BugNet_HostSettings] ([SettingName], [SettingValue]) VALUES('TwitterConsumerKey', '')
INSERT INTO [dbo].[BugNet_HostSettings] ([SettingName], [SettingValue]) VALUES('TwitterConsumerSecret', '')
INSERT INTO [dbo].[BugNet_HostSettings] ([SettingName], [SettingValue]) VALUES('MicrosoftAuthentication', 'False')
INSERT INTO [dbo].[BugNet_HostSettings] ([SettingName], [SettingValue]) VALUES('MicrosoftClientId', '')
INSERT INTO [dbo].[BugNet_HostSettings] ([SettingName], [SettingValue]) VALUES('MicrosoftClientSecret', '')

-- Custom Field Types 
INSERT INTO [dbo].[BugNet_ProjectCustomFieldTypes] ([CustomFieldTypeName]) VALUES (N'Text')
INSERT INTO [dbo].[BugNet_ProjectCustomFieldTypes] ([CustomFieldTypeName]) VALUES (N'Drop Down List')
INSERT INTO [dbo].[BugNet_ProjectCustomFieldTypes] ([CustomFieldTypeName]) VALUES (N'Date')
INSERT INTO [dbo].[BugNet_ProjectCustomFieldTypes] ([CustomFieldTypeName]) VALUES (N'Rich Text')
INSERT INTO [dbo].[BugNet_ProjectCustomFieldTypes] ([CustomFieldTypeName]) VALUES (N'Yes / No')
INSERT INTO [dbo].[BugNet_ProjectCustomFieldTypes] ([CustomFieldTypeName]) VALUES (N'User List')

/****** Object:  Table [dbo].[BugNet_RequiredFieldList]    Script Date: 08/26/2010 14:05:12 ******/
INSERT [BugNet_RequiredFieldList] ([RequiredFieldId], [FieldName], [FieldValue]) VALUES (1, N'-- Select Field --', N'0')
INSERT [BugNet_RequiredFieldList] ([RequiredFieldId], [FieldName], [FieldValue]) VALUES (2, N'Issue Id', N'IssueId')
INSERT [BugNet_RequiredFieldList] ([RequiredFieldId], [FieldName], [FieldValue]) VALUES (3, N'Title', N'IssueTitle')
INSERT [BugNet_RequiredFieldList] ([RequiredFieldId], [FieldName], [FieldValue]) VALUES (4, N'Description', N'IssueDescription')
INSERT [BugNet_RequiredFieldList] ([RequiredFieldId], [FieldName], [FieldValue]) VALUES (5, N'Type', N'IssueTypeId')
INSERT [BugNet_RequiredFieldList] ([RequiredFieldId], [FieldName], [FieldValue]) VALUES (6, N'Category', N'IssueCategoryId')
INSERT [BugNet_RequiredFieldList] ([RequiredFieldId], [FieldName], [FieldValue]) VALUES (7, N'Priority', N'IssuePriorityId')
INSERT [BugNet_RequiredFieldList] ([RequiredFieldId], [FieldName], [FieldValue]) VALUES (8, N'Milestone', N'IssueMilestoneId')
INSERT [BugNet_RequiredFieldList] ([RequiredFieldId], [FieldName], [FieldValue]) VALUES (9, N'Status', N'IssueStatusId')
INSERT [BugNet_RequiredFieldList] ([RequiredFieldId], [FieldName], [FieldValue]) VALUES (10, N'Assigned', N'IssueAssignedUserId')
INSERT [BugNet_RequiredFieldList] ([RequiredFieldId], [FieldName], [FieldValue]) VALUES (11, N'Owner', N'IssueOwnerUserId')
INSERT [BugNet_RequiredFieldList] ([RequiredFieldId], [FieldName], [FieldValue]) VALUES (12, N'Creator', N'IssueCreatorUserId')
INSERT [BugNet_RequiredFieldList] ([RequiredFieldId], [FieldName], [FieldValue]) VALUES (13, N'Date Created', N'DateCreated')
INSERT [BugNet_RequiredFieldList] ([RequiredFieldId], [FieldName], [FieldValue]) VALUES (14, N'Last Update', N'LastUpdate')
INSERT [BugNet_RequiredFieldList] ([RequiredFieldId], [FieldName], [FieldValue]) VALUES (15, N'Resolution', N'IssueResolutionId')
INSERT [BugNet_RequiredFieldList] ([RequiredFieldId], [FieldName], [FieldValue]) VALUES (16, N'Affected Milestone', N'IssueAffectedMilestoneId')
INSERT [BugNet_RequiredFieldList] ([RequiredFieldId], [FieldName], [FieldValue]) VALUES (17, N'Due Date', N'IssueDueDate')
INSERT [BugNet_RequiredFieldList] ([RequiredFieldId], [FieldName], [FieldValue]) VALUES (18, N'Progress', N'IssueProgress')
INSERT [BugNet_RequiredFieldList] ([RequiredFieldId], [FieldName], [FieldValue]) VALUES (19, N'Estimation', N'IssueEstimation')
INSERT [BugNet_RequiredFieldList] ([RequiredFieldId], [FieldName], [FieldValue]) VALUES (20, N'Time Logged', N'TimeLogged')
INSERT [BugNet_RequiredFieldList] ([RequiredFieldId], [FieldName], [FieldValue]) VALUES (21, N'Custom Fields', N'CustomFieldName')

INSERT INTO [dbo].[BugNet_Languages] ([CultureCode], [CultureName], [FallbackCulture]) VALUES('en-US', 'English (United States)', 'en')
INSERT INTO [dbo].[BugNet_Languages] ([CultureCode], [CultureName], [FallbackCulture]) VALUES('en-GB', 'English (United Kingdom)', 'en-US')
INSERT INTO [dbo].[BugNet_Languages] ([CultureCode], [CultureName], [FallbackCulture]) VALUES('es-ES', 'Spanish (Spain)', 'en-US')
INSERT INTO [dbo].[BugNet_Languages] ([CultureCode], [CultureName], [FallbackCulture]) VALUES('nl-NL', 'Dutch (Netherlands)', 'en-US')
INSERT INTO [dbo].[BugNet_Languages] ([CultureCode], [CultureName], [FallbackCulture]) VALUES('it-IT', 'Italian (Italy)', 'en-US')
INSERT INTO [dbo].[BugNet_Languages] ([CultureCode], [CultureName], [FallbackCulture]) VALUES('ru-RU', 'Russian (Russia)', 'en-US')
INSERT INTO [dbo].[BugNet_Languages] ([CultureCode], [CultureName], [FallbackCulture]) VALUES('ro-RO', 'Romanian (Romania)', 'en-US')
INSERT INTO [dbo].[BugNet_Languages] ([CultureCode], [CultureName], [FallbackCulture]) VALUES('fr-CA', 'French (Canadian)', 'en-US')
INSERT INTO [dbo].[BugNet_Languages] ([CultureCode], [CultureName], [FallbackCulture]) VALUES('de-DE', 'German (Germany)', 'en-US')
INSERT INTO [dbo].[BugNet_Languages] ([CultureCode], [CultureName], [FallbackCulture]) VALUES('zh-CN', 'Chinese (China)', 'en-US')

-- Roles and Permissions 
PRINT 'Add Default Roles & Permissions'
EXEC BugNet_Role_CreateNewRole @ProjectId = NULL, @RoleName = 'Super Users', @RoleDescription = 'A role for application super users', @AutoAssign = 0
