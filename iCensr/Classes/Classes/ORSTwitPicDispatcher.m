//
//  ORSTwitPicDispatcher.h
//  Twitter Engine
//
//  Created by Nicholas Toumpelis on 12/04/2009.
//  Copyright 2008-2009 Ocean Road Software, Nick Toumpelis.
//
//  Version 0.7.1
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy 
//  of this software and associated documentation files (the "Software"), to 
//  deal in the Software without restriction, including without limitation the 
//  rights to use, copy, modify, merge, publish, distribute, sublicense, and/or 
//  sell copies of the Software, and to permit persons to whom the Software is 
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in 
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR 
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, 
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE 
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER 
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING 
//  FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS 
//  IN THE SOFTWARE.

#import "ORSTwitPicDispatcher.h"

@implementation ORSTwitPicDispatcher

@synthesize twtPicURL;

- (NSString *) uploadData:(NSData *)imageData
			 withUsername:(NSString *)username
				 password:(NSString *)password 
				 filename:(NSString *)filename {
	@synchronized(self) {
		NSURL *url = [NSURL URLWithString:@"http://twitpic.com/api/upload"];
		NSMutableURLRequest *postRequest = [NSMutableURLRequest 
			requestWithURL:url
				cachePolicy:NSURLRequestUseProtocolCachePolicy 
											timeoutInterval:21.0];
		
		[postRequest setHTTPMethod:@"POST"];
		
		NSString *stringBoundary = [NSString 
			stringWithString:@"0xKhTmLbOuNdArY"];
		NSString *contentType = [NSString 
			stringWithFormat:@"multipart/form-data; boundary=%@",
								 stringBoundary];
		[postRequest addValue:contentType forHTTPHeaderField:@"Content-Type"];
		
		NSMutableData *postBody = [NSMutableData data];
		[postBody appendData:[[NSString stringWithFormat:@"\r\n\r\n--%@\r\n", 
			stringBoundary] dataUsingEncoding:NSUTF8StringEncoding]];
		[postBody appendData:[[NSString stringWithString:
				@"Content-Disposition: form-data; name=\"source\"\r\n\r\n"] 
							  dataUsingEncoding:NSUTF8StringEncoding]];
		[postBody appendData:[[NSString stringWithString:@"canary"] 
							  dataUsingEncoding:NSUTF8StringEncoding]];
		
		[postBody appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n", 
			stringBoundary] dataUsingEncoding:NSUTF8StringEncoding]];
		[postBody appendData:[[NSString stringWithString:
			@"Content-Disposition: form-data; name=\"username\"\r\n\r\n"]
							  dataUsingEncoding:NSUTF8StringEncoding]];
		[postBody appendData:[username dataUsingEncoding:NSUTF8StringEncoding]];
		
		[postBody appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n",
			stringBoundary] dataUsingEncoding:NSUTF8StringEncoding]];
		[postBody appendData:[[NSString stringWithString:
			@"Content-Disposition: form-data; name=\"password\"\r\n\r\n"] 
							  dataUsingEncoding:NSUTF8StringEncoding]];
		[postBody appendData:[password dataUsingEncoding:NSUTF8StringEncoding]];
		
		NSString *mimeType = NULL;
		if ([filename hasSuffix:@".jpeg"] || [filename hasSuffix:@".jpg"] || 
			[filename hasSuffix:@".jpe"]) {
			mimeType = @"image/jpeg";
		} else if ([filename hasSuffix:@".png"]) {
			mimeType = @"image/png";
		} else if ([filename hasSuffix:@".gif"]) {
			mimeType = @"image/gif";
		}	
		
		[postBody appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n",
			stringBoundary] dataUsingEncoding:NSUTF8StringEncoding]];
		[postBody appendData:[[NSString stringWithFormat:
		@"Content-Disposition: form-data; name=\"media\"; filename=\"%@\"\r\n", 
			filename] dataUsingEncoding:NSUTF8StringEncoding]];
		[postBody appendData:[[NSString 
			stringWithFormat:@"Content-Type: %@\r\n", mimeType] 
							  dataUsingEncoding:NSUTF8StringEncoding]];
		[postBody appendData:[[NSString stringWithString:
			@"Content-Transfer-Encoding: binary\r\n\r\n"] 
							  dataUsingEncoding:NSUTF8StringEncoding]];
		[postBody appendData:imageData];
		[postBody appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n",
			stringBoundary] dataUsingEncoding:NSUTF8StringEncoding]];
		
		[postRequest setHTTPBody:postBody];
		
		NSURLResponse *response = nil;
		NSError *dataError, *documentError, *nodeError = nil;
		/*NSString *stringNode = [[NSString alloc] initWithData:[NSURLConnection 
			sendSynchronousRequest:postRequest returningResponse:&response 
					error:&dataError] encoding:NSUTF8StringEncoding];*/
		NSXMLParser *parser = [[NSXMLParser alloc] initWithData:[NSURLConnection 
																 sendSynchronousRequest:postRequest returningResponse:&response 
																 error:&dataError]];
		//results = [[NSMutableArray array] retain];
		isURL = NO;
		[parser setDelegate:self];
		[parser parse];
		[parser autorelease];
		
		NSLog(@"Sent to %@", twtPicURL);
		
		//NSDictionary *gasStation = [results objectAtIndex:0]; 
		//NSLog(@"%@ at %@", [gasStation objectForKey:@"Title"], [gasStation objectForKey:@"Address"]);
		
		/*NSXMLDocument *document = [[NSXMLDocument alloc] 
			initWithXMLString:stringNode
				options:NSXMLDocumentTidyXML error:&documentError];
		NSXMLNode *root = [document rootElement];
		return [(NSXMLNode *)[[root nodesForXPath:@".//mediaurl" 
			error:&nodeError] objectAtIndex:0] stringValue];
		 */
		//NSLog(@"____________________PRINTING XML_____________________%@", stringNode);
		
		return twtPicURL;
	}
	return NULL;
}

#pragma mark Parser code

/*** Called when the parser runs into an open tag (<tag>) ***/ 
 - (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict { 
	if ([elementName isEqualToString:@"mediaurl"]) { 
		//currentResult = [NSMutableDictionary dictionary]; 
		isURL = YES;
	} 
} 

/*** This is just to resolve random HTML entities that would otherwise cause the parsing to break ***/
 - (NSData *)parser:(NSXMLParser *)parser resolveExternalEntityName:(NSString *)entityName systemID:(NSString *)systemID { 
	return [entityName dataUsingEncoding:NSASCIIStringEncoding]; 
 } 

/*** Called when the parser finds text between an open and close tag. We add this to the currentResult, using the currentElement (node name) as the key ***/
 - (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string { 
	if (isURL) { 
		if(!twtPicURL) {
			twtPicURL = [[NSMutableString alloc] initWithCapacity:50];
		}
		[twtPicURL appendString:string];
	}
 } 

/*** Called when the parser runs into a close tag (</tag>). If it is the Result tag that is closing, we should add the currentResult to the array, and then forget about it ***/
 - (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName { 
	if ([elementName isEqualToString:@"mediaurl"]) { 
		isURL = NO;
		//[results addObject:currentResult]; currentResult = nil; 
	} 
 } 

@end
