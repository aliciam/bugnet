using System;
using System.Collections;
using System.Collections.Generic;
using System.Drawing;
using System.Drawing.Imaging;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Runtime.InteropServices;
using System.Web;
using System.Web.Security;
using System.Web.UI.MobileControls;
using System.Web.UI.WebControls;
using BugNET.BLL;
using BugNET.Common;
using BugNET.Entities;
using BugNET.UserInterfaceLayer;
using DotNetOpenAuth.OpenId.Extensions.AttributeExchange;
using log4net;
using Image = System.Drawing.Image;

namespace BugNET.Account
{
    /// <summary>
    /// 
    /// </summary>
    public partial class UserProfile : BasePage
    {
        private static readonly ILog Log = LogManager.GetLogger(typeof(UserProfile));

        /// <summary>
        /// Handles the Load event of the Page control.
        /// </summary>
        /// <param name="sender">The source of the event.</param>
        /// <param name="e">The <see cref="System.EventArgs"/> instance containing the event data.</param>
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack) return;

            litUserProfile.Text = Page.Title;

            foreach (ListItem li in BulletedList4.Items)
                li.Attributes.Add("class", "");

            BulletedList4.Items[0].Attributes.Add("class", "active");

            var resources = ResourceManager.GetInstalledLanguageResources();
            var resourceItems = (from code in resources let cultureInfo = new CultureInfo(code, false) select new ListItem(cultureInfo.DisplayName, code)).ToList();
            ddlPreferredLocale.DataSource = resourceItems;
            ddlPreferredLocale.DataBind();

            var membershipUser = UserManager.GetUser(User.Identity.Name);
            litUserName.Text = User.Identity.Name;
            FirstName.Text = WebProfile.Current.FirstName;
            LastName.Text = WebProfile.Current.LastName;
            FullName.Text = WebProfile.Current.DisplayName;
            ddlPreferredLocale.SelectedValue = WebProfile.Current.PreferredLocale;
            IssueListItems.SelectedValue = UserManager.GetProfilePageSize().ToString();
            AllowNotifications.Checked = WebProfile.Current.ReceiveEmailNotifications;

            int[] notificationsAccepted = Array.ConvertAll(WebProfile.Current.NotificationOfChanges.Split(new char[]{' '}, StringSplitOptions.RemoveEmptyEntries), int.Parse);
            chkIssueAssignedToMe.Checked = notificationsAccepted.Any(n => n == (int)NotificationOfChange.IssueAssignedToReceiver);
            chkIssueAddedToProject.Checked = notificationsAccepted.Any(n => n == (int)NotificationOfChange.IssueAddedToMonitoredProject);
            chkIssueStatusChanged.Checked = notificationsAccepted.Any(n => n == (int)NotificationOfChange.IssueStatusChanged);
            chkIssueAnyOtherColumnChanged.Checked = notificationsAccepted.Any(n => n == (int)NotificationOfChange.IssueOtherColumnChanged);
            chkIssueCommentAdded.Checked = notificationsAccepted.Any(n => n == (int)NotificationOfChange.IssueCommentAdded);

            if (membershipUser == null) return;

            UserName.Text = membershipUser.UserName;
            Email.Text = membershipUser.Email;

            if (HostSettingManager.Get(HostSettingNames.EnableGravatar, true))
            {
                if (File.Exists(Server.MapPath("~/Images/Users/" + membershipUser.UserName + "64.jpg")))
                {
                    rblAvatar.SelectedValue = "LocalAvatar";
                }
            }
            else
            {
                lblAvatar.AssociatedControlID = "fupAvatar";
                rblAvatar.Visible = false;
            }
            imgAvatar.ImageUrl = PresentationUtils.GetAvatarImageUrl(membershipUser.UserName, membershipUser.Email, 64);

            var isFromOpenIdRegistration = Request.Get("oid", false);

            if(isFromOpenIdRegistration)
            {
                Message1.ShowInfoMessage(GetLocalResourceObject("UpdateProfileForOpenId").ToString());
            }
        }


        /// <summary>
        /// Adds the user.
        /// </summary>
        /// <param name="s">The s.</param>
        /// <param name="e">The <see cref="System.EventArgs"/> instance containing the event data.</param>
        protected void AddProjectNotification(Object s, EventArgs e)
        {
            //The users must be added to a list first because the collection can not
            //be modified while we iterate through it.
            var usersToAdd = lstAllProjects.Items.Cast<ListItem>().Where(item => item.Selected).ToList();

            foreach (var item in usersToAdd)
            {
                var notification = new ProjectNotification
                        {
                            ProjectId = Convert.ToInt32(item.Value),
                            NotificationUsername = Security.GetUserName()
                        };

                if (!ProjectNotificationManager.SaveOrUpdate(notification)) continue;

                lstSelectedProjects.Items.Add(item);
                lstAllProjects.Items.Remove(item);
            }

            lstSelectedProjects.SelectedIndex = -1;
        }

        /// <summary>
        /// Removes the user.
        /// </summary>
        /// <param name="s">The s.</param>
        /// <param name="e">The <see cref="T:System.EventArgs"/> instance containing the event data.</param>
        protected void RemoveProjectNotification(Object s, EventArgs e)
        {
            //The users must be added to a list first because the collection can not
            //be modified while we iterate through it.
            var usersToRemove = lstSelectedProjects.Items.Cast<ListItem>().Where(item => item.Selected).ToList();

            foreach (var item in usersToRemove)
            {
                if (!ProjectNotificationManager.Delete(Convert.ToInt32(item.Value), Security.GetUserName())) continue;
                lstAllProjects.Items.Add(item);
                lstSelectedProjects.Items.Remove(item);
            }

            lstAllProjects.SelectedIndex = -1;
        }

        protected void BulletedList4_Click1(object sender, BulletedListEventArgs e)
        {

            //Label1.Text = "The Index of Item you clicked: " + e.Index + "<br> The value of Item you clicked: " + BulletedList4.Items[e.Index].Text;
            foreach (ListItem li in BulletedList4.Items)
                li.Attributes.Add("class", "");

            BulletedList4.Items[e.Index].Attributes.Add("class", "active");

            ProfileView.ActiveViewIndex = e.Index;
            var userName = Security.GetUserName();

            switch (ProfileView.ActiveViewIndex)
            {
                case 2:
                    lstAllProjects.Items.Clear();
                    lstSelectedProjects.Items.Clear();
                    lstAllProjects.DataSource = ProjectManager.GetByMemberUserName(userName);
                    lstAllProjects.DataTextField = "Name";
                    lstAllProjects.DataValueField = "Id";
                    lstAllProjects.DataBind();

                    // Copy selected users into Selected Users List Box
                    var projectNotifications = ProjectNotificationManager.GetByUsername(userName);

                    foreach (var currentNotification in projectNotifications)
                    {
                        var matchItem = lstAllProjects.Items.FindByValue(currentNotification.ProjectId.ToString());
                        if (matchItem == null) continue;

                        lstSelectedProjects.Items.Add(matchItem);
                        lstAllProjects.Items.Remove(matchItem);
                    }
                    break;
            }

        }

        /// <summary>
        /// Handles the Click event of the SaveButton control.
        /// </summary>
        /// <param name="s">The source of the event.</param>
        /// <param name="e">The <see cref="System.EventArgs"/> instance containing the event data.</param>
        protected void SaveButton_Click(object s, EventArgs e)
        {
            var membershipUser = UserManager.GetUser(User.Identity.Name);

            membershipUser.Email = Email.Text;
            WebProfile.Current.FirstName = FirstName.Text;
            WebProfile.Current.LastName = LastName.Text;
            WebProfile.Current.DisplayName = FullName.Text;

            if (HostSettingManager.Get(HostSettingNames.EnableGravatar, true) && rblAvatar.SelectedValue == "Gravatar") DisableAnyLocalAvatarImages(membershipUser.UserName);
            else if (!UploadLocalAvatarImage(fupAvatar, membershipUser.UserName)) {
                EnableAnyLocalAvatarImages(membershipUser.UserName);
                if (HostSettingManager.Get(HostSettingNames.EnableGravatar, true)) MakeDummyAvatar(membershipUser.UserName);
            }

            imgAvatar.ImageUrl = PresentationUtils.GetAvatarImageUrl(membershipUser.UserName, membershipUser.Email, 64);



            try
            {
                WebProfile.Current.Save();
                Membership.UpdateUser(membershipUser);
               
                Message1.ShowSuccessMessage(GetLocalResourceObject("ProfileSaved").ToString());

                if (Log.IsInfoEnabled)
                {
                    if (HttpContext.Current.User != null && HttpContext.Current.User.Identity.IsAuthenticated)
                        MDC.Set("user", HttpContext.Current.User.Identity.Name);
                    Log.Info("Profile updated");
                }
            }
            catch (Exception ex)
            {
                if (Log.IsErrorEnabled)
                {
                    if (HttpContext.Current.User != null && HttpContext.Current.User.Identity.IsAuthenticated)
                        MDC.Set("user", HttpContext.Current.User.Identity.Name);
                    Log.Error("Profile update error", ex);
                }

                Message1.ShowErrorMessage(GetLocalResourceObject("ProfileUpdateError").ToString());
            }


        }


        /// <summary>
        /// Handles the Click event of the BackButton control.
        /// </summary>
        /// <param name="s">The source of the event.</param>
        /// <param name="e">The <see cref="System.EventArgs"/> instance containing the event data.</param>
        protected void BackButton_Click(object s, EventArgs e)
        {
            var url = Request.Get("referrerurl", string.Empty);

            if (!string.IsNullOrEmpty(url))
                Response.Redirect(url);
        }


        /// <summary>
        /// Handles the Click event of the SaveCustomizeSettings control.
        /// </summary>
        /// <param name="sender">The source of the event.</param>
        /// <param name="e">The <see cref="System.EventArgs"/> instance containing the event data.</param>
        protected void SaveCustomSettings_Click(object sender, EventArgs e)
        {
            WebProfile.Current.IssuesPageSize = Convert.ToInt32(IssueListItems.SelectedValue);
            WebProfile.Current.PreferredLocale = ddlPreferredLocale.SelectedValue;
            WebProfile.Current.ReceiveEmailNotifications = AllowNotifications.Checked;

            var selectedNotifications = new List<int>();
            if (chkIssueAssignedToMe.Checked)  selectedNotifications.Add((int)NotificationOfChange.IssueAssignedToReceiver);
            if (chkIssueAddedToProject.Checked)  selectedNotifications.Add((int)NotificationOfChange.IssueAddedToMonitoredProject);
            if (chkIssueStatusChanged.Checked)  selectedNotifications.Add((int)NotificationOfChange.IssueStatusChanged);
            if (chkIssueAnyOtherColumnChanged.Checked)  selectedNotifications.Add((int)NotificationOfChange.IssueOtherColumnChanged);
            if (chkIssueCommentAdded.Checked) selectedNotifications.Add((int)NotificationOfChange.IssueCommentAdded);
            WebProfile.Current.NotificationOfChanges = String.Join(" ", selectedNotifications);

            try
            {
                WebProfile.Current.Save();
                Message3.ShowSuccessMessage(GetLocalResourceObject("CustomSettingsSaved").ToString());

                if (Log.IsInfoEnabled)
                {
                    if (HttpContext.Current.User != null && HttpContext.Current.User.Identity.IsAuthenticated)
                        MDC.Set("user", HttpContext.Current.User.Identity.Name);
                    Log.Info("Profile updated");
                }
            }
            catch (Exception ex)
            {
                if (Log.IsErrorEnabled)
                {
                    if (HttpContext.Current.User != null && HttpContext.Current.User.Identity.IsAuthenticated)
                        MDC.Set("user", HttpContext.Current.User.Identity.Name);
                    Log.Error("Profile update error", ex);
                }
                Message3.ShowErrorMessage(GetLocalResourceObject("CustomSettingsUpdateError").ToString());

            }

        }

        /// <summary>
        /// Uploads the profile image and saves two versions in the images/users folder:
        ///  one as 64x64 pixels called [username]64.jpg
        ///  other as 32x32 pixels called [username]32.jpg
        /// </summary>
        /// <param name="fup">The file image to upload.</param>
        /// <param name="userName">The username of the user.</param>
        /// <returns>True if a file was successfully uploaded, false otherwise.</returns>
        private bool UploadLocalAvatarImage(FileUpload fup, string userName)
        {
            bool imageUploaded = false;
            string[] allowedFileTypes = {".jpg",".jpeg", ".gif", ".png"};
            if (fup.HasFile && fup.PostedFile.ContentLength > 0 && allowedFileTypes.Any(allowedFileType => allowedFileType == Path.GetExtension(fup.PostedFile.FileName)))
            {
                //CreateAvatarImages(fup.PostedFile, userName);
                var fileSize = fup.PostedFile.ContentLength;
                var fileBytes = new byte[fileSize];
                var myStream = fup.PostedFile.InputStream;
                myStream.Read(fileBytes, 0, fileSize);
                System.Drawing.Image image = System.Drawing.Image.FromStream(myStream);
                SaveImage(image, userName, 32);
                SaveImage(image, userName, 64);
                imageUploaded = true;
            }
            return imageUploaded;
        }

        private void SaveImage(Image image, string userName, int size, bool overwrite = true)
        {
            var newImage = (System.Drawing.Image)(new Bitmap(image, new Size(size, size)));
            string filePath = Server.MapPath("~/Images/Users/" + userName + size + ".jpg");
            if (File.Exists((filePath)))
            {
                if (overwrite)
                {
                    File.Delete(filePath);
                    newImage.Save(filePath, ImageFormat.Jpeg);
                }
            } else newImage.Save(filePath, ImageFormat.Jpeg);
        }

        private void DisableAnyLocalAvatarImages(string userName)
        {
            RenameImage(Server.MapPath("~/Images/Users/" + userName + "64.jpg"), Server.MapPath("~/Images/Users/disabled_" + userName + "64.jpg"));
            RenameImage(Server.MapPath("~/Images/Users/" + userName + "32.jpg"), Server.MapPath("~/Images/Users/disabled_" + userName + "32.jpg"));
        }
        private void EnableAnyLocalAvatarImages(string userName)
        {
            RenameImage(Server.MapPath("~/Images/Users/disabled_" + userName + "64.jpg"), Server.MapPath("~/Images/Users/" + userName + "64.jpg"));
            RenameImage(Server.MapPath("~/Images/Users/disabled_" + userName + "32.jpg"), Server.MapPath("~/Images/Users/" + userName + "32.jpg"));
        }

        private void RenameImage(string oldPath, string newPath)
        {
            if (File.Exists(oldPath)) System.IO.File.Move(oldPath, newPath);
        }


        private void MakeDummyAvatar(string userName)
        {
            var image = Image.FromFile(Server.MapPath("~/images/noprofile.png"));
            SaveImage(image, userName, 32, false);
            SaveImage(image, userName, 64, false);            
        }
    }
}
