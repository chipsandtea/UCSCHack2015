//
//  web.swift
//
//
//  Created by Brad on 1/10/15.
//  Copyright (c) 2015 Brad. All rights reserved.
//

import Foundation

// Playground - noun: a place where people can play

import UIKit
//import XCPlayground
//XCPSetExecutionShouldContinueIndefinitely(continueIndefinitely: false)

//  SwiftyJSON.swift
//
//  Copyright (c) 2014 Ruoyu Fu, Pinglin Tang
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.

class MyRequestController {
    func sendRequest(params : JSON) {
        /* Configure session, choose between:
        * defaultSessionConfiguration
        * ephemeralSessionConfiguration
        * backgroundSessionConfigurationWithIdentifier:
        And set session-wide properties, such as: HTTPAdditionalHeaders,
        HTTPCookieAcceptPolicy, requestCachePolicy or timeoutIntervalForRequest.
        */
        let sessionConfig = NSURLSessionConfiguration.defaultSessionConfiguration()
        
        /* Create session, and optionally set a NSURLSessionDelegate. */
        let session = NSURLSession(configuration: sessionConfig, delegate: nil, delegateQueue: nil)
        
        /* Create the Request:
        My API (2) (POST http://oneillseaodyssey.org/testing.php)
        */
        
        var URL = NSURL(string: "http://oneillseaodyssey.org/testing.php")
        let request = NSMutableURLRequest(URL: URL!)
        request.HTTPMethod = "POST"
        
        // Form URL-Encoded Body
        //var error = null;
        
        //var jsonString = NSJSONSerialization.dataWithJSONObject(params, options: nil, error: nil)
        //let jsonString = JSON(params)
        //println(jsonString)
        //jsonString as String
        //jsonString = NSString(data: jsonString, encoding:NSUTF8StringEncoding)
        //jsonString = NSString(data: jsonString!, encoding: NSUTF8StringEncoding)
        //jsonString = String
        //var jsonString: NSString(data:params, encoding:NSUTF8StringEncoding)
        
        var foo = params.rawString(options:nil)
        if let string : String = foo {
            // Downcast to String was successful
            let bodyParameters = [
                "data" : string
            ]
            //println("string:", string)
            //println("jsonString:", jsonString)
            
            let bodyString = self.stringFromQueryParameters(bodyParameters)
            println ("bodyString:", bodyString);
            request.HTTPBody = bodyString.dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: true)
            
            /* Start a new Task */
            let task = session.dataTaskWithRequest(request, completionHandler: { (data : NSData!, response : NSURLResponse!, error : NSError!) -> Void in
                if (error == nil) {
                    // Success
                    let statusCode = (response as NSHTTPURLResponse).statusCode
                    println("URL Session Task Succeeded: HTTP \(statusCode)")
                    println("returned data, should be identical:")
                    var results = (NSString(data: data, encoding: NSUTF8StringEncoding)) as String
                    results = results.stringByReplacingOccurrencesOfString("\\", withString: "")
                    println(results)
                }
                else {
                    // Failure
                    println("URL Session Task Failed: %@", error.localizedDescription);
                }
            })
            task.resume()
        }
    }


/**
This creates a new query parameters string from the given NSDictionary. For
example, if the input is @{@"day":@"Tuesday", @"month":@"January"}, the output
string will be @"day=Tuesday&month=January".
@param queryParameters The input dictionary.
@return The created parameters string.
*/
func stringFromQueryParameters(queryParameters : Dictionary<String, String>) -> String {
    var parts: [String] = []
    for (name, value) in queryParameters {
        var part = NSString(format: "%@=%@",
            name.stringByAddingPercentEscapesUsingEncoding(NSUTF8StringEncoding)!,
            value.stringByAddingPercentEscapesUsingEncoding(NSUTF8StringEncoding)!)
        parts.append(part)
    }
    return "&".join(parts)
}

/**
Creates a new URL by adding the given query parameters.
@param URL The input URL.
@param queryParameters The query parameter dictionary to add.
@return A new NSURL.
*/
func NSURLByAppendingQueryParameters(URL : NSURL!, queryParameters : Dictionary<String, String>) -> NSURL {
    let URLString : NSString = NSString(format: "%@?%@", URL.absoluteString!, self.stringFromQueryParameters(queryParameters))
    return NSURL(string: URLString)!
}
}