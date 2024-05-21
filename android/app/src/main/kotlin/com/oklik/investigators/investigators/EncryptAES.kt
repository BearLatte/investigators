package com.oklik.investigators.investigators

import com.blankj.utilcode.util.EncodeUtils
import java.security.Key
import java.security.MessageDigest
import javax.crypto.Cipher
import javax.crypto.spec.IvParameterSpec
import javax.crypto.spec.SecretKeySpec

class EncryptAES {

    //-----類別常數-----
    //-----類別常數-----
    /**
     * 預設的Initialization Vector，為16 Bits的0
     */
    private val DEFAULT_IV = IvParameterSpec(byteArrayOf(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0))

    /**
     * 加密演算法使用AES
     */
    private  val ALGORITHM = "AES"

    /**
     * AES使用CBC模式與PKCS5Padding
     */
    private  val TRANSFORMATION = "AES/CBC/PKCS5Padding"

    //-----物件變數-----
    //-----物件變數-----
    /**
     * 取得AES加解密的密鑰
     */
    private var key: Key? = null

    /**
     * AES CBC模式使用的Initialization Vector
     */
    private var iv: IvParameterSpec? = null

    /**
     * Cipher 物件
     */
    private var cipher: Cipher? = null

    //-----建構子-----
    //-----建構子-----
    /**
     * 建構子，使用128 Bits的AES密鑰(計算任意長度密鑰的MD5)和預設IV
     *
     * @param key 傳入任意長度的AES密鑰
     */
    constructor(key: String?) : this(key, 128)


    /**
     * 建構子，使用128 Bits或是256 Bits的AES密鑰(計算任意長度密鑰的MD5或是SHA256)和預設IV
     *
     * @param key 傳入任意長度的AES密鑰
     * @param bit 傳入AES密鑰長度，數值可以是128、256 (Bits)
     */
    constructor(key: String?, bit: Int) : this(key?:"", bit, null)


    /**
     * 建構子，使用128 Bits或是256 Bits的AES密鑰(計算任意長度密鑰的MD5或是SHA256)，用MD5計算IV值
     *
     * @param key 傳入任意長度的AES密鑰
     * @param bit 傳入AES密鑰長度，數值可以是128、256 (Bits)
     * @param iv 傳入任意長度的IV字串
     */
    constructor(key: String, bit: Int, iv: String?) {
        if (bit == 256) {
            this.key = SecretKeySpec(getHash("SHA-256", key), ALGORITHM)
        } else {
            this.key = SecretKeySpec(getHash("MD5", key), ALGORITHM)
        }
        if (iv != null) {
            this.iv = IvParameterSpec(getHash("MD5", iv))
        } else {
            this.iv = DEFAULT_IV
        }
        init()
    }

    //-----物件方法-----
    //-----物件方法-----
    /**
     * 取得字串的雜湊值
     *
     * @param algorithm 傳入雜驟演算法
     * @param text 傳入要雜湊的字串
     * @return 傳回雜湊後資料內容
     */
    private fun getHash(algorithm: String, text: String): ByteArray? {
        return try {
            getHash(algorithm, text.toByteArray(charset("UTF-8")))
        } catch (ex: Exception) {
            throw RuntimeException(ex.message)
        }
    }

    /**
     * 取得資料的雜湊值
     *
     * @param algorithm 傳入雜驟演算法
     * @param data 傳入要雜湊的資料
     * @return 傳回雜湊後資料內容
     */
    private fun getHash(algorithm: String, data: ByteArray): ByteArray? {
        return try {
            val digest = MessageDigest.getInstance(algorithm)
            digest.update(data)
            digest.digest()
        } catch (ex: Exception) {
            throw RuntimeException(ex.message)
        }
    }

    /**
     * 初始化
     */
    private fun init() {
        cipher = try {
            Cipher.getInstance(TRANSFORMATION)
        } catch (ex: Exception) {
            throw RuntimeException(ex.message)
        }
    }

    /**
     * 加密文字
     *
     * @param str 傳入要加密的文字
     * @return 傳回加密後的文字
     */
    fun encrypt(str: String): String? {
        return try {
            encrypt(str.toByteArray(charset("UTF-8")))
        } catch (ex: Exception) {
//            throw RuntimeException(ex.message)
            ""
        }
    }

    /**
     * 加密資料
     *
     * @param data 傳入要加密的資料
     * @return 傳回加密後的資料
     */
    private fun encrypt(data: ByteArray?): String? {
        return try {
            cipher!!.init(Cipher.ENCRYPT_MODE, key, iv)
            val encryptData = cipher!!.doFinal(data)
            EncodeUtils.base64Encode2String(EncodeUtils.base64Encode2String(encryptData).toByteArray())
        } catch (ex: Exception) {
            throw RuntimeException(ex.message)
        }
    }

    /**
     * 解密文字
     *
     * @param str 傳入要解密的文字
     * @return 傳回解密後的文字
     */
    fun decrypt(str: String?): String? {
        return try {
            decrypt(EncodeUtils.base64Decode(EncodeUtils.base64Decode(str)))
        } catch (ex: Exception) {
            throw RuntimeException(ex.message)
        }
    }

    /**
     * 解密文字
     *
     * @param data 傳入要解密的資料
     * @return 傳回解密後的文字
     */
    fun decrypt(data: ByteArray?): String? {
        return try {
            cipher?.init(Cipher.DECRYPT_MODE, key, iv)
            val decryptData = cipher?.doFinal(data)
            String(decryptData ?: byteArrayOf())
        } catch (ex: Exception) {
            throw RuntimeException(ex.message)
        }
    }
}