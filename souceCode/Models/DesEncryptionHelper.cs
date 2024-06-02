using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;

namespace Team_13st.Models
{
    public class DesEncryptionHelper
    {
        private readonly byte[] key;

        public DesEncryptionHelper(string hexKey)
        {
            key = StringToByteArray(hexKey);
        }

        public string Encrypt(string plaintext)
        {
            using (var des = DES.Create())
            {
                des.Mode = CipherMode.ECB;
                des.Key = key;

                var plaintextBytes = Encoding.UTF8.GetBytes(plaintext);

                using (var encryptor = des.CreateEncryptor())
                {
                    var encryptedBytes = PerformCryptography(plaintextBytes, encryptor);
                    return ByteArrayToHexString(encryptedBytes);
                }
            }
        }

        public string Decrypt(string ciphertext)
        {
            var cipherBytes = StringToByteArray(ciphertext);

            using (var des = DES.Create())
            {
                des.Mode = CipherMode.ECB;
                des.Key = key;

                using (var decryptor = des.CreateDecryptor())
                {
                    var decryptedBytes = PerformCryptography(cipherBytes, decryptor);
                    return Encoding.UTF8.GetString(decryptedBytes);
                }
            }
        }

        private static byte[] PerformCryptography(byte[] data, ICryptoTransform cryptoTransform)
        {
            using (var memoryStream = new MemoryStream())
            {
                using (var cryptoStream = new CryptoStream(memoryStream, cryptoTransform, CryptoStreamMode.Write))
                {
                    cryptoStream.Write(data, 0, data.Length);
                    cryptoStream.FlushFinalBlock();
                    return memoryStream.ToArray();
                }
            }
        }

        private static byte[] StringToByteArray(string hex)
        {
            int numberChars = hex.Length;
            byte[] bytes = new byte[numberChars / 2];
            for (int i = 0; i < numberChars; i += 2)
                bytes[i / 2] = Convert.ToByte(hex.Substring(i, 2), 16);
            return bytes;
        }

        private static string ByteArrayToHexString(byte[] bytes)
        {
            StringBuilder hex = new StringBuilder(bytes.Length * 2);
            foreach (byte b in bytes)
                hex.AppendFormat("{0:x2}", b);
            return hex.ToString();
        }
    }
}