// You can reproduce this figure in plotly.js with the following code!

// Learn more about plotly.js here: https://plot.ly/javascript/getting-started

/* Here's an example minimal HTML template
 *
 * <!DOCTYPE html>
 *   <head>
 *     <script src="https://cdn.plot.ly/plotly-latest.min.js"></script>
 *   </head>
 *   <body>
 *   <!-- Plotly chart will be drawn inside this div -->
 *   <div id="plotly-div"></div>
 *     <script>
 *     // JAVASCRIPT CODE GOES HERE
 *     </script>
 *   </body>
 * </html>
 */

var data = [
  {
    x: [0, 1, 2], 
    y: [1, 3, 2], 
    mode: "markers", 
    name: "y", 
    text: ["Text A", "Text B", "Text C"], 
    textsrc: "bhishanpdl:10:d1020b", 
    type: "scatter", 
    xsrc: "bhishanpdl:10:b1d84c", 
    ysrc: "bhishanpdl:10:c721e2"
  }
];
var layout = {title: "Hover over the points to see the text"};
Plotly.plot('plotly-div', data, layout);