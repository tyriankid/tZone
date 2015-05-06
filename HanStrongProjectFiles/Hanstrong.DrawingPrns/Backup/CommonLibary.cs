using System;
using System.Collections.Generic;
using System.Text;
using System.Runtime.InteropServices;
using System.Security.Cryptography;
using System.Data;
using System.IO;
using System.Windows.Forms;
namespace Hanstrong.Decrypts
{
   public class CommonLibary
   {
       #region ini�����ļ��Ĳ���
       //д��������Ϣ
        [DllImport("kernel32")]
       private static extern long WritePrivateProfileString(string section, string key, string val, string filePath);
        //���������ļ�
        [DllImport("kernel32")]
        private static extern int GetPrivateProfileString(string section, string key, string def, StringBuilder retVal, int size, string filePath);

        /// <summary>
        /// ��ȡ������Ϣ
        /// </summary>
        /// <param name="path"></param>
        /// <param name="selction"></param>
        /// <param name="Key"></param>
        /// <returns></returns>
        public static string GetIniKeyValue(string path, string selction, string Key)
        {
            StringBuilder strTemp = new StringBuilder(1000);
            GetPrivateProfileString(selction, Key, string.Empty, strTemp, 1000, path);
            return strTemp.ToString();
        }
       /// <summary>
       /// д��������Ϣ
       /// </summary>
       /// <param name="section"></param>
       /// <param name="key"></param>
       /// <param name="val"></param>
       /// <param name="filepath"></param>
       public static void SetIniKeyValue(string path, string section, string key, string value)
       {
           WritePrivateProfileString(section, key, value, path);
       }
       #endregion ini�����ļ��Ĳ���

       #region �ļ�����


       public static void DelFolderSubObjects(string strPath)
       {
           try
           {
               SetAttribute(strPath, FileAttributes.Normal);

               DelFolderFiles(strPath);

               foreach (string folder in Directory.GetDirectories(strPath))
               {
                   Directory.Delete(folder, true);
               }
           }
           catch
           { 
            
           }
       }

       public static void DelFolder(string strPath)
       {
           DelFolderSubObjects(strPath);
           Directory.Delete(strPath);

       }

       public static void DelFolderFiles(string strPath)
       {
           foreach (string path in Directory.GetFiles(strPath))
           {
               File.SetAttributes(path, FileAttributes.Normal);
               File.Delete(path);
           }
       }

       private static void SetAttribute(string strFolder, FileAttributes attr)
       {
           foreach (string file in Directory.GetFiles(strFolder))
           {
               File.SetAttributes(file, attr);
           }

           foreach (string folder in Directory.GetDirectories(strFolder))
           {
               SetAttribute(folder, attr);
           }
       }

       #endregion

       const string IV_64 = "DNG_HTKJ"; //ע���ˣ���8���ַ���64λ 

        public static string Decode(string data, string key)
		{
			if ( key.Length < 8 )
			{
				key += key;
			}
			try
			{
				byte[] byKey = System.Text.ASCIIEncoding.ASCII.GetBytes(key.Substring(0, 8));
                byte[] byIV = System.Text.ASCIIEncoding.ASCII.GetBytes(IV_64);
				byte[] byEnc;
				try
				{
					byEnc = Convert.FromBase64String(data);
				}
				catch
				{
					return data;
				}
                DESCryptoServiceProvider cryptoProvider = new DESCryptoServiceProvider();
                MemoryStream ms = new MemoryStream(byEnc);
                CryptoStream cst = new CryptoStream(ms, cryptoProvider.CreateDecryptor(byKey, byIV), CryptoStreamMode.Read);
                StreamReader sr = new StreamReader(cst);
                return sr.ReadToEnd();
			}
			catch { return string.Empty; }
		}

       public static string Encode(string data, string key)
       {
           while (key.Length < 8)
           {
               key += key;
           }

           try
           {
               byte[] byKey = System.Text.ASCIIEncoding.ASCII.GetBytes(key.Substring(0, 8));
               byte[] byIV = System.Text.ASCIIEncoding.ASCII.GetBytes(IV_64);

               DESCryptoServiceProvider cryptoProvider = new DESCryptoServiceProvider();
               int i = cryptoProvider.KeySize;
               MemoryStream ms = new MemoryStream();
               CryptoStream cst = new CryptoStream(ms, cryptoProvider.CreateEncryptor(byKey, byIV), CryptoStreamMode.Write);

               StreamWriter sw = new StreamWriter(cst);
               sw.Write(data);
               sw.Flush();
               cst.FlushFinalBlock();
               sw.Flush();
               return Convert.ToBase64String(ms.GetBuffer(), 0, (int)ms.Length);
           }
           catch { return string.Empty; }

       }


       /// <summary>
       /// ���ݼ���
       /// </summary>
       /// <param name="strSrcText">��������ַ���</param>
       /// <param name="sMD5Len">32,����16</param>
       /// <returns>��������</returns>
       public static string MD5(string strSrcText, int sMdLen)
       {

           if (sMdLen == 16) //16λ���� 
           {
               return System.Web.Security.FormsAuthentication.HashPasswordForStoringInConfigFile(strSrcText, "MD5").ToLower().Substring(8, 16);
           }

           else if (sMdLen == 32) //32λ���� 
           {
               return System.Web.Security.FormsAuthentication.HashPasswordForStoringInConfigFile(strSrcText, "MD5");
           }
           return strSrcText;
       }

       ///<summary>
       ///  ����  GUID  �������ݿ�������ض���ʱ����������߼���Ч��
       ///  </summary>
       ///  <returns>COMB  (GUID  ��ʱ������)  ����  GUID  ����</returns>
       public static string CombGUID()
       {
           byte[] guidArray = System.Guid.NewGuid().ToByteArray();
           DateTime baseDate = new DateTime(1900, 1, 1);
           DateTime now = DateTime.Now;
           string GUID;

           TimeSpan days = new TimeSpan(now.Ticks - baseDate.Ticks);
           TimeSpan msecs = new TimeSpan(now.Ticks - (new DateTime(now.Year, now.Month, now.Day).Ticks));

           byte[] daysArray = BitConverter.GetBytes(days.Days);
           byte[] msecsArray = BitConverter.GetBytes((long)(msecs.TotalMilliseconds / 3.333333));

           Array.Reverse(daysArray);
           Array.Reverse(msecsArray);

           Array.Copy(daysArray, daysArray.Length - 2, guidArray, guidArray.Length - 6, 2);
           Array.Copy(msecsArray, msecsArray.Length - 4, guidArray, guidArray.Length - 4, 4);
           GUID = new System.Guid(guidArray).ToString();
           GUID = GUID.ToUpper();
           GUID = GUID.Replace("-", "");
           return GUID;
       }

       ////��̬��Ա
       public const string ButtonType = "button";
       public const string CheckBoxType = "chkbox";
       public const string ComboBoxType = "combox";
       public const string ImageType = "image";
       public const string LinkType = "link";
       public const string TextBoxType = "text";


       public static bool ContainsValue(string valuePairs, string value)
       {
           string strValues = string.Format(",{0},", valuePairs.Trim(',').Replace(" ", "")).ToLower();
           string strSearch = string.Format(",{0},", value).ToLower();
           return strValues.Contains(strSearch);
       }
   }
}
