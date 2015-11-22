//
//  XUCoreMobile.h
//  XUCoreMobile
//
//  Created by Charlie Monroe on 10/1/15.
//  Copyright © 2015 Charlie Monroe Software. All rights reserved.
//

#import <UIKit/UIKit.h>

//! Project version number for XUCoreMobile.
FOUNDATION_EXPORT double XUCoreMobileVersionNumber;

//! Project version string for XUCoreMobile.
FOUNDATION_EXPORT const unsigned char XUCoreMobileVersionString[];

/** Additions. */
#import "NSArrayAdditions.h"
#import "NSData+CommonCryptoSwift.h"
#import "NSDataAdditions.h"
#import "NSDictionaryAdditions.h"
#import "NSStringAdditions.h"
#import "UIAlertViewAdditions.h"

/** AppStore. */
#import "FCInAppPurchaseManager.h"

/** Core. */
#import "FCKeychain.h"
#import "iOSCommon.h"
#import "XUAbstract.h"
#import "XUBlockThreading.h"
#import "XUExceptionHandler.h"
#import "XUString.h"

/** Data. */
#import "FCContextHolder.h"
#import "FCDataEntity.h"
#import "FCPersistentDataStorage.h"
#import "FCTemporaryDataStorage.h"

/** Debug. */
#import "FCLog.h"

/** Documents. */
#import "FCCSVDocument.h"

/** Localization. */
#import "FCLocalizationSupport.h"

/** Regex. */
#import "XURegex.h"
