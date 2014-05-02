# ProcessingJS and Csound PNaCl Example

This is an example of using [ProcessingJS](http://processingjs.org) and [Csound PNaCl](http://vlazzarini.github.io) to create a fully client-side browser based music application. The Processing PDE sketch file is run by ProcessingJS, and Csound ORC code is run by Csound PNaCl. 

## Notes

This example began using the Processing IDE and using the processingjs_example/processingjs_example.pde sketch file.  The settings in thse IDE were set to output to Javascript. When testing within the Processing IDE, it will generate an index.html and export a copy of the pde into a web-export folder for testing.  

From there, the generated index.html file was taken as a starting point and moved to the root of this project's repository. It was modified to add csound.js, which brings in Csound PNaCl into the project.  The Processing sketch was then modified to add a bindCsound() function which is passed in from the web page.  Once Processing has the Csound object, it can call methods to send notes and values over Csound's control channels.

From the stand point of Csound, the first thing that happens is that the Csound PNaCl object needs to load. Once loaded, it will callback to the page to signal it is done. When this happen, the object is bound to the Processing sketch. After that, the web page will start Csound and then compile the orchestra that is embedded in the index.html page.  (The Csound ORC code was embedded into the HTML page because Javascript does not have multi-line strings.  The code was then embedded into a textarea that was styled as hidden by CSS.  This allows easy writing of Csound code in the page that can be read through the DOM, but it is also not visible to the user.) 

To run this application, it requires that the page be loaded from a URL and not from the file system. An easy way to serve up the page locally is use Python. To do this, go into the project's root folder and enter:

`python -m SimpleHTTPServer 8080`

Afterwards, load the following URL in Chrome/Chromium/ChromeOS browsers:

`http://localhost:8080`
