
import 'package:encrypt/encrypt.dart' as Encrytion;

class AISBEncryption {

  static final _secretKey = Encrytion.Key.fromUtf8('1234567890abcdef');

  static String AES_Encrypt(String secret, String text){
    var secretKey = secret == null ? _secretKey : Encrytion.Key.fromUtf8(secret);
    final encrypt = Encrytion.Encrypter(Encrytion.AES(secretKey, mode: Encrytion.AESMode.ecb));
    return encrypt.encrypt(text, iv: Encrytion.IV.fromLength(16)).base64;
  }

  static String AES_SimpleEncrypt(String text){
    final encrypt = Encrytion.Encrypter(Encrytion.AES(_secretKey, mode: Encrytion.AESMode.ecb));
    return encrypt.encrypt(text, iv: Encrytion.IV.fromLength(16)).base64;
  }

  static String AES_Decrypt(String hash){
    final decrypt = Encrytion.Encrypter(Encrytion.AES(_secretKey, mode: Encrytion.AESMode.ecb));
    return decrypt.decrypt64(hash, iv: Encrytion.IV.fromLength(16));
  }
}