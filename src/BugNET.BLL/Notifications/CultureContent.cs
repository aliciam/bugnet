using System;
using System.Collections.Generic;
using System.Globalization;
using System.Text.RegularExpressions;
using System.Threading;
using System.Web.UI;

namespace BugNET.BLL.Notifications
{
    /// <summary>
    /// Represents the content for a specific culture
    /// </summary>
    public class CultureContent
    {
        /// <summary>
        /// The culture code
        /// </summary>
        public string CultureString { get; set; }

        /// <summary>
        /// The content key (usually the Name property of resource files)
        /// </summary>
        public string ContentKey { get; set; }

        /// <summary>
        /// The content part (could be a xslt body or just a string)
        /// </summary>
        public string Content { get; set; }

        private string _currentCulture;

        /// <summary>
        /// Used when the culture content is a xslt template
        /// </summary>
        /// <param name="data">The data to be converted to XML and then transformed with XML/XSL</param>
        /// <returns></returns>
        public string TransformContent(Dictionary<string, object> data)
        {
            SetCultureThread();
            var content = NotificationManager.GenerateNotificationContent(Content, data);
            ResetCultureThread();

            return content;
        }

        /// <summary>
        /// Used when culture content is in the string.format format
        /// </summary>
        /// <param name="contentValues">The parameter array of values to be inserted into the string.format call</param>
        /// <returns></returns>
        public string FormatContent(params object[] contentValues)
        {
            if (contentValues == null) return Content;

            SetCultureThread();
            var content = string.Format(Content, contentValues);
            ResetCultureThread();

            return content;
        }


        /// <summary>
        /// Used when culture content is in the string.format format, except with named (rather than numbered) parameters
        /// </summary>
        /// <param name="source">The anonymous object containing the data to be inserted into the string.format call</param>
        /// <returns>The formatted string with parameter values inserted at the specified places.</returns>
        public string FormatContentWith(object source)
        {
            if (source == null) return Content;

            var r = new Regex(@"(?<start>\{)+(?<property>[\w\.\[\]]+)(?<format>:[^}]+)?(?<end>\})+",
              RegexOptions.Compiled | RegexOptions.CultureInvariant | RegexOptions.IgnoreCase);


            var values = new List<object>();

            string rewrittenFormat = r.Replace(Content, delegate(Match m)
            {
                Group startGroup = m.Groups["start"];
                Group propertyGroup = m.Groups["property"];
                Group formatGroup = m.Groups["format"];
                Group endGroup = m.Groups["end"];

                values.Add((propertyGroup.Value == "0")? source: DataBinder.Eval(source, propertyGroup.Value));

                return new string('{', startGroup.Captures.Count) + (values.Count - 1) + formatGroup.Value
                  + new string('}', endGroup.Captures.Count);
            });

            SetCultureThread();
            var content = string.Format(rewrittenFormat, values.ToArray());
            ResetCultureThread();

            return content;
        }


        private void SetCultureThread()
        {
            // store the current culture
            _currentCulture = Thread.CurrentThread.CurrentCulture.Name;

            // no culture string use what is configured
            if (string.IsNullOrWhiteSpace(CultureString)) return;

            // if the same as current no change needed
            if (_currentCulture.ToLower() == CultureString.ToLower()) return;

            // set the culture to the string
            Thread.CurrentThread.CurrentCulture = CultureInfo.CreateSpecificCulture(CultureString);
        }

        private void ResetCultureThread()
        {
            Thread.CurrentThread.CurrentCulture = CultureInfo.CreateSpecificCulture(_currentCulture);
        }
    }
}