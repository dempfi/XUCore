//
//  NSXMLAdditions.m
//  DownieCore
//
//  Created by Charlie Monroe on 5/10/14.
//  Copyright (c) 2014 Charlie Monroe Software. All rights reserved.
//

#import "NSXMLAdditions.h"

@implementation NSXMLNode (XUAdditions)

-(NSInteger)integerValue{
	return [[self stringValue] integerValue];
}
-(id)firstNodeOnXPath:(NSString*)xpath{
	return [[self nodesForXPath:xpath error:NULL] firstObject];
}
-(NSInteger)integerValueOfFirstNodeOnXPath:(nonnull NSString *)xpath{
	return [self integerValueOfFirstNodeOnXPaths:@[ xpath ]];
}
-(NSInteger)integerValueOfFirstNodeOnXPaths:(nonnull NSArray<NSString *> *)xpaths{
	return [[self stringValueOfFirstNodeOnXPaths:xpaths] integerValue];
}
-(id)lastNodeOnXPath:(NSString*)xpath{
	return [[self nodesForXPath:xpath error:NULL] lastObject];
}
-(nonnull NSArray<NSXMLNode *> *)nodesForXPath:(nonnull NSString *)xpath{
	NSArray *nodes = [self nodesForXPath:xpath error:NULL];
	if (nodes == nil){
		nodes = @[];
	}
	return nodes;
}
-(NSString *)stringValueOfFirstNodeOnXPath:(NSString *)xpath{
	return [[self firstNodeOnXPath:xpath] stringValue];
}
-(NSString *)stringValueOfFirstNodeOnXPaths:(NSArray *)xpaths{
	for (NSString *path in xpaths){
		NSString *result = [self stringValueOfFirstNodeOnXPath:path];
		if ([result length] > 0){
			return result;
		}
	}
	return nil;
}
-(NSString *)stringValueOfLastNodeOnXPath:(NSString *)xpath{
	return [[self lastNodeOnXPath:xpath] stringValue];
}

-(NSInteger)integerValueOfAttributeNamed:(nonnull NSString *)attributeName{
	return 0;
}
-(nullable NSString *)stringValueOfAttributeNamed:(nonnull NSString *)attributeName{
	return nil;
}

@end

@implementation NSXMLElement (XUAdditions)

-(NSInteger)integerValueOfAttributeNamed:(NSString *)attributeName{
	return [[self attributeForName:attributeName] integerValue];
}
-(NSString *)stringValueOfAttributeNamed:(NSString *)attributeName{
	return [[self attributeForName:attributeName] stringValue];
}

@end

@implementation NSXMLDocument (XUAdditions)

-(instancetype)initWithXMLString:(NSString *)string andOptions:(NSInteger)mask {
	return [self initWithXMLString:string options:mask error:NULL];
}

@end


@implementation NSDictionary (XMLAdditions)

-(NSXMLElement *)XMLElementWithName:(NSString *)elementName{
	NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
	[formatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"];
	
	NSXMLElement *element = [[NSXMLElement alloc] initWithName:elementName];
	for (NSString *key in [self allKeys]) {
		id value = self[key];
		if ([value isKindOfClass:[NSString class]]) {
			[element addChild:[[NSXMLElement alloc] initWithName:key stringValue:value]];
		}else if ([value isKindOfClass:[NSDecimalNumber class]]) {
			[element addChild:[[NSXMLElement alloc] initWithName:key stringValue:[NSString stringWithFormat:@"%0.4f", [value doubleValue]]]];
		}else if ([value isKindOfClass:[NSNumber class]]) {
			[element addChild:[[NSXMLElement alloc] initWithName:key stringValue:[NSString stringWithFormat:@"%g", [value doubleValue]]]];
		}else if ([value isKindOfClass:[NSDate class]]){
			[element addChild:[[NSXMLElement alloc] initWithName:key stringValue:[formatter stringFromDate:value]]];
		}else if ([value isKindOfClass:[NSDictionary class]]) {
			if ([value count] == 0) {
				continue;
			}
			[element addChild:[value XMLElementWithName:key]];
		}else if ([value isKindOfClass:[NSArray class]]) {
			if ([value count] == 0) {
				continue;
			}
			
			// We require all objects of the array to contain NSDictionaries
			for (NSDictionary *obj in value) {
				[element addChild:[obj XMLElementWithName:key]];
			}
		}else{
			@throw [NSException exceptionWithName:NSInternalInconsistencyException reason:@"Dictionary contains a value of unsupported type." userInfo:nil];
		}
	}
	return element;
}

@end


