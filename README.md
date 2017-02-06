# Perfect Web Redirects Demo

<p align="center">
    <a href="http://perfect.org/get-involved.html" target="_blank">
        <img src="http://perfect.org/assets/github/perfect_github_2_0_0.jpg" alt="Get Involed with Perfect!" width="854" />
    </a>
</p>

<p align="center">
    <a href="https://github.com/PerfectlySoft/Perfect" target="_blank">
        <img src="http://www.perfect.org/github/Perfect_GH_button_1_Star.jpg" alt="Star Perfect On Github" />
    </a>  
    <a href="http://stackoverflow.com/questions/tagged/perfect" target="_blank">
        <img src="http://www.perfect.org/github/perfect_gh_button_2_SO.jpg" alt="Stack Overflow" />
    </a>  
    <a href="https://twitter.com/perfectlysoft" target="_blank">
        <img src="http://www.perfect.org/github/Perfect_GH_button_3_twit.jpg" alt="Follow Perfect on Twitter" />
    </a>  
    <a href="http://perfect.ly" target="_blank">
        <img src="http://www.perfect.org/github/Perfect_GH_button_4_slack.jpg" alt="Join the Perfect Slack" />
    </a>
</p>

<p align="center">
    <a href="https://developer.apple.com/swift/" target="_blank">
        <img src="https://img.shields.io/badge/Swift-3.0-orange.svg?style=flat" alt="Swift 3.0">
    </a>
    <a href="https://developer.apple.com/swift/" target="_blank">
        <img src="https://img.shields.io/badge/Platforms-OS%20X%20%7C%20Linux%20-lightgray.svg?style=flat" alt="Platforms OS X | Linux">
    </a>
    <a href="http://perfect.org/licensing.html" target="_blank">
        <img src="https://img.shields.io/badge/License-Apache-lightgrey.svg?style=flat" alt="License Apache">
    </a>
    <a href="http://twitter.com/PerfectlySoft" target="_blank">
        <img src="https://img.shields.io/badge/Twitter-@PerfectlySoft-blue.svg?style=flat" alt="PerfectlySoft Twitter">
    </a>
    <a href="http://perfect.ly" target="_blank">
        <img src="http://perfect.ly/badge.svg" alt="Slack Status">
    </a>
</p>

## Perfect Web Redirects Demo

This demo shows the usage, and working of the [Perfect WebRedirects](https://github.com/PerfectlySoft/Perfect-WebRedirects) module.

The Perfect WebRedirects module will filter for specified routes (including trailing wildcard routes) and perform redirects as instructed if a match is found.

## Configuration file

The configuration for these routes is included in a JSON file at `/config/redirect-rules/config.json` in the form:

```
{

  "/test/no": {
	"code": 302,
	"destination": "/test/yes"
  },

	"/test/no301": {
		"code": 301,
		"destination": "/test/yes"
  },
  
	"/test/wild/*": {
		"code": 302,
		"destination": "/test/wildyes"
  },

	"/test/wilder/*": {
		"code": 302,
		"destination": "/test/wilding/*"
  }

}
```

Note that multiple JSON files can exist in this directory - all will be loaded the first time the filter is invoked.

## Compatibility with Swift

The master branch of this project currently compiles with **Xcode 8.2** or the **Swift 3.0.2** toolchain on Ubuntu.

## Building & Running

The following will clone and build an empty starter project and launch the server on port 8181.

```
git clone https://github.com/PerfectExamples/Perfect-WebRedirects-Demo.git
cd Perfect-WebRedirects-Demo
swift build
.build/debug/Perfect-WebRedirects-Demo
```

You should see the following output:

```
[INFO] Starting HTTP server localhost on 0.0.0.0:8181
```

This means the servers are running and waiting for connections. Access [http://localhost:8181/](http://127.0.0.1:8080/) to see the greeting. Hit control-c to terminate the server.

NOTE: If run from within Xcode, please make sure that the executable target has the appropriate "working directory" specified, otherwise the config file will not be found and the demo will fail to work as intended.

## Testing Functionality

in the browser, http://localhost:8181 will display the current route plus four links, two of which have random strings to demonstrate wildcard behaviour.

Click the links and see the behaviour - the redirects with the appropriate 302 or 302 HTTP status code will be performed as specified in the configuration file.

## Issues

We are transitioning to using JIRA for all bugs and support related issues, therefore the GitHub issues has been disabled.

If you find a mistake, bug, or any other helpful suggestion you'd like to make on the docs please head over to [http://jira.perfect.org:8080/servicedesk/customer/portal/1](http://jira.perfect.org:8080/servicedesk/customer/portal/1) and raise it.

A comprehensive list of open issues can be found at [http://jira.perfect.org:8080/projects/ISS/issues](http://jira.perfect.org:8080/projects/ISS/issues)



## Further Information
For more information on the Perfect project, please visit [perfect.org](http://perfect.org).
