//
//  NSData+CommonCryptoSwift.h
//  DownieCore
//
//  Created by Charlie Monroe on 10/26/15.
//  Copyright © 2015 Charlie Monroe Software. All rights reserved.
//

@import Foundation;

@interface NSData (CommonCryptoSwift)

/// Digests bytes.
+(nonnull NSString *)MD5DigestOfBytes:(nonnull const void *)bytes ofLength:(NSInteger)length;


/// Decrypts data with RC4 using an encryption key.
-(nullable NSData *)decryptedRC4DataWithEncryptionKey:(nonnull NSString *)key;

/// Decrypts data with AES-128 using an encryption key and IV.
-(nullable NSData *)decryptedAES128DataWithEncryptionKey:(nonnull NSString *)key andInitialVector:(nonnull NSString *)vector;

/// Decrypts data with AES-128 using an encryption key and IV.
-(nullable NSData *)decryptedAES128DataWithEncryptionDataKey:(nonnull NSData *)key andInitialDataVector:(nonnull NSData *)vector;


/// Decrypts data with AES-256 using an encryption key and IV.
-(nullable NSData *)decryptedAES256DataWithEncryptionKey:(nonnull NSString *)key andInitialVector:(nonnull NSString *)vector;

/// Decrypts data with AES-256 using an encryption key and IV.
-(nullable NSData *)decryptedAES256DataWithEncryptionDataKey:(nonnull NSData *)key andInitialDataVector:(nonnull NSData *)vector;

/// Encrypts data with RC4 using an encryption key.
-(nullable NSData *)encryptedRC4DataWithEncryptionKey:(nonnull NSString *)key;

/// Creates a HMAC-SHA1 with custom key.
-(nullable NSData *)HMACSHA1WithKey:(nonnull NSString *)key;

/// Creates a HMAC-SHA256 with custom key.
-(nullable NSData *)HMACSHA256WithKey:(nonnull id)key;

/// Digest.
-(nonnull NSData *)SHA256Digest;

/// Digest.
-(nonnull NSData *)SHA512Digest;

/// Digest.
-(nonnull NSData *)SHA1Digest;

@end
