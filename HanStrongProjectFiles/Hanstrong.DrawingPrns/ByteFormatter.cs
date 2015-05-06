using System;
using System.Collections.Generic;
using System.Text;

namespace Hanstrong.Decrypts
{
    public static class ByteFormatter
    {
        private const long KB = 1024;
        private const long MB = KB * 1024;
        private const long GB = MB * 1024;

        private const string BFormatPattern = "{0} bytes";
        private const string KBFormatPattern = "{0:f1} KB";
        private const string MBFormatPattern = "{0:f1} MB";
        private const string GBFormatPattern = "{0:f1} GB";

        public static string ToString(long size)
        {
            if (size < KB)
            {
                return String.Format(BFormatPattern, size);
            }
            else if (size >= KB && size < MB)
            {
                return String.Format(KBFormatPattern, size / 1024.0f);
            }
            else if (size >= MB && size < GB)
            {
                return String.Format(MBFormatPattern, size / (KB * 1024f));
            }
            else // size >= GB
            {
                return String.Format(GBFormatPattern, size / (MB * 1024f));
            }
        }
    }
}
