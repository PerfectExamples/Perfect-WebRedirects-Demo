//
//  main.swift
//  Perfect WebRedirects Demo
//
//  Created by Jonathan Guthrie on 2017-02-06.
//	Copyright (C) 2015 PerfectlySoft, Inc.
//
//===----------------------------------------------------------------------===//
//
// This source file is part of the Perfect.org open source project
//
// Copyright (c) 2015 - 2017 PerfectlySoft Inc. and the Perfect project authors
// Licensed under Apache License v2.0
//
// See http://perfect.org/licensing.html for license information
//
//===----------------------------------------------------------------------===//
//

import PerfectLib
import PerfectHTTP
import PerfectHTTPServer
import Perfect_WebRedirects
import PerfectRequestLogger
import SwiftRandom

RequestLogFile.location = "./log.log"
let r = URandom()

// This 'handler' is executed for all requests specified.
func handler(data: [String:Any]) throws -> RequestHandler {
	return {
		request, response in
		// Respond with a simple message.
		response.setHeader(.contentType, value: "text/html")

		let rand = r.secureToken

		var str = "<h1>Perfect Redirects Demo</h1>"
		str += "<p>Current path: \(request.path)</p>"
		str += "<p><a href=\"/test/no\">/test/no (302) to /test/yes</a></p>"
		str += "<p><a href=\"/test/no301\">/test/no (301) to /test/yes</a></p>"
		str += "<p><a href=\"/test/wild/\(rand)\">/test/wild/* {\(rand)}(302) to /test/wildyes</a></p>"
		str += "<p><a href=\"/test/wilder/\(rand)\">/test/wilder/* {\(rand)} (302) to /test/wilding/*</a></p>"
		response.appendBody(string: "<html><title>Hello, world!</title><body>\(str)</body></html>")
		// Ensure that response.completed() is called when your processing is done.
		response.completed()
	}
}


let confData = [
	"servers": [
		[
			"name":"localhost",
			"port":8181,
			"routes":[
				["method":"get", "uri":"/", "handler":handler],
				["method":"get", "uri":"/test/**", "handler":handler],
			],
			"filters":[
				[
					"type":"request",
					"priority":"high",
					"name":RequestLogger.filterAPIRequest,
					],
				[
					"type":"request",
					"priority":"high",
					"name":WebRedirectsFilter.filterAPIRequest,
					],
				[
					"type":"response",
					"priority":"high",
					"name":PerfectHTTPServer.HTTPFilter.contentCompression,
					],
				[
					"type":"response",
					"priority":"low",
					"name":RequestLogger.filterAPIResponse,
					]
			]
		]
	]
]

do {
	// Launch the servers based on the configuration data.
	try HTTPServer.launch(configurationData: confData)
} catch {
	fatalError("\(error)") // fatal error launching one of the servers
}

