using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Security.Cryptography;
using System.IO;

namespace Trident.Common
{
    public class EnCryptionAndDecription
    {
        #region " Encrypt / Decrypt variables "
        string passPhrase = "sachuSsa9ro@Sa#chi";
        string saltValue = "Dees@1tViN5pu";
        string hashAlgorithm = "SHA1";
        int passwordIterations = 9;
        //"@1o2R3a4S5iHc6aS"
        string initVector = "@1o2R3a4S5iHc6aS";

        int keySize = 256;
        private byte[] key = {
	11,
	2,
	7,
	24,
	16,
	22,
	4,
	38,
	27,
	3,
	11,
	10,
	17,
	15,
	6,
	23
};
        private byte[] iv = {
	1,
	2,
	3,
	4,
	5,
	6,
	17,
	8,
	9,
	10,
	11,
	12,
	13,
	14,
	15,
	16
};
        private RijndaelManaged cryptoprovider = new RijndaelManaged();
        #endregion

        #region " UMS Encrypt / Decrypt "
        public string fEncrypt(string strInputText)
        {
            string functionReturnValue = null;
            byte[] initVectorBytes = null;
            byte[] saltValueBytes = null;
            byte[] plainTextBytes = null;
            PasswordDeriveBytes password = default(PasswordDeriveBytes);
            byte[] keyBytes = null;
            RijndaelManaged symmetricKey = default(RijndaelManaged);
            ICryptoTransform encryptor = default(ICryptoTransform);
            MemoryStream memoryStream = default(MemoryStream);
            CryptoStream cryptoStream = default(CryptoStream);
            byte[] cipherTextBytes = null;

            try
            {
                // Convert strings into byte arrays.
                initVectorBytes = Encoding.ASCII.GetBytes(initVector);


                saltValueBytes = Encoding.ASCII.GetBytes(saltValue);

                // Convert strInputText into a byte array.
                plainTextBytes = Encoding.UTF8.GetBytes(strInputText);

                // First, we must create a password, from which the key will be derived.
                // This password will be generated from the specified passphrase and 
                // salt value. The password will be created using the specified hash 
                // algorithm. Password creation can be done in several iterations.
                password = new PasswordDeriveBytes(passPhrase, saltValueBytes, hashAlgorithm, passwordIterations);

                // Use the password to generate pseudo-random bytes for the encryption
                // key. Specify the size of the key in bytes (instead of bits).
                keyBytes = password.GetBytes(keySize / 8);

                // Create uninitialized Rijndael encryption object.
                symmetricKey = new RijndaelManaged();

                // It is reasonable to set encryption mode to Cipher Block Chaining
                // (CBC). Use default options for other symmetric key parameters.
                symmetricKey.Mode = CipherMode.CBC;

                // Generate encryptor from the existing key bytes and initialization 
                // vector. Key size will be defined based on the number of the key 
                // bytes.
                encryptor = symmetricKey.CreateEncryptor(keyBytes, initVectorBytes);

                // Define memory stream which will be used to hold encrypted data.
                memoryStream = new MemoryStream();

                // Define cryptographic stream (always use Write mode for encryption).
                cryptoStream = new CryptoStream(memoryStream, encryptor, CryptoStreamMode.Write);

                // Start encrypting.
                cryptoStream.Write(plainTextBytes, 0, plainTextBytes.Length);

                // Finish encrypting.
                cryptoStream.FlushFinalBlock();

                // Convert our encrypted data from a memory stream into a byte array.
                cipherTextBytes = memoryStream.ToArray();

                // Close both streams.
                memoryStream.Close();
                cryptoStream.Close();

                // Convert encrypted data into a base64-encoded string.
                functionReturnValue = Convert.ToBase64String(cipherTextBytes);

            }
            catch (Exception ex)
            {
                //Interaction.MsgBox(" Problem in encrypting the string" + Constants.vbCrLf + ex.Message);
            }
            return functionReturnValue;
        }


        public string fDecrypt(System.Object strDecrypText)
        {
            string functionReturnValue = null;

            byte[] initVectorBytes = null;
            byte[] saltValueBytes = null;
            byte[] cipherTextBytes = null;
            PasswordDeriveBytes password = default(PasswordDeriveBytes);
            byte[] keyBytes = null;
            RijndaelManaged symmetricKey = default(RijndaelManaged);
            ICryptoTransform decryptor = default(ICryptoTransform);
            MemoryStream memoryStream = default(MemoryStream);
            CryptoStream cryptoStream = default(CryptoStream);
            byte[] plainTextBytes = null;
            int decryptedByteCount = 0;

            try
            {
                // Convert strings defining encryption key characteristics into byte arrays. 
                initVectorBytes = Encoding.ASCII.GetBytes(initVector);

                saltValueBytes = Encoding.ASCII.GetBytes(saltValue);

                // Convert our strDecryptext into a byte array.
                cipherTextBytes = Convert.FromBase64String(strDecrypText.ToString());

                // First, we must create a password, from which the key will be 
                // derived. This password will be generated from the specified 
                // passphrase and salt value. The password will be created using
                // the specified hash algorithm. Password creation can be done in
                // several iterations.
                password = new PasswordDeriveBytes(passPhrase, saltValueBytes, hashAlgorithm, passwordIterations);

                // Use the password to generate pseudo-random bytes for the encryption
                // key. Specify the size of the key in bytes (instead of bits).
                keyBytes = password.GetBytes(keySize / 8);

                // Create uninitialized Rijndael encryption object.

                symmetricKey = new RijndaelManaged();

                // It is reasonable to set encryption mode to Cipher Block Chaining
                // (CBC). Use default options for other symmetric key parameters.
                symmetricKey.Mode = CipherMode.CBC;

                // Generate decryptor from the existing key bytes and initialization 
                // vector. Key size will be defined based on the number of the key 
                // bytes.

                decryptor = symmetricKey.CreateDecryptor(keyBytes, initVectorBytes);

                // Define memory stream which will be used to hold encrypted data.

                memoryStream = new MemoryStream(cipherTextBytes);

                // Define memory stream which will be used to hold encrypted data.

                cryptoStream = new CryptoStream(memoryStream, decryptor, CryptoStreamMode.Read);

                // Since at this point we don't know what the size of decrypted data
                // will be, allocate the buffer long enough to hold strDecryptext;
                // strInputText is never longer than strDecryptext.

                // ERROR: Not supported in C#: ReDimStatement               
                plainTextBytes = cipherTextBytes;

                // Start decrypting.

                decryptedByteCount = cryptoStream.Read(plainTextBytes, 0, plainTextBytes.Length);

                // Close both streams.
                memoryStream.Close();
                cryptoStream.Close();

                // Convert decrypted data into a string. 
                // Let us assume that the original strInputText string was UTF8-encoded.
                functionReturnValue = Encoding.UTF8.GetString(plainTextBytes, 0, decryptedByteCount);
            }
            catch (Exception ex)
            {
                //Interaction.MsgBox(" Problem in decrypting the Text" + Constants.vbCrLf + ex.Message);
            }
            return functionReturnValue;

        }



        #endregion
    }
}