package cn.sai.Utils;

import cn.sai.entity.User;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.util.ByteSource;

/**
 * 加密工具
*/
public class EncryptionUtils {
    public static String encrypt(User user){
        String hashAlgorithmName = "MD5";
        String credentials = user.getPassword();
        int hashIterations = 1024;
        ByteSource credentialsSalt = ByteSource.Util.bytes(user.getUsername());
        Object obj = new SimpleHash(hashAlgorithmName, credentials, credentialsSalt, hashIterations);
        System.out.println(obj);
        return obj.toString();
    }
}
