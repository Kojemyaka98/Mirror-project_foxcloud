/*! normalize.css v5.0.0 | MIT License | github.com/necolas/normalize.css */
button,hr,input{overflow:visible}audio,canvas,progress,video{display:inline-block}progress,sub,sup{vertical-align:baseline}html{font-family:sans-serif;line-height:1.15;-ms-text-size-adjust:100%;-webkit-text-size-adjust:100%}body{margin:0} menu,article,aside,details,footer,header,nav,section{display:block}h1{font-size:2em;margin:.67em 0}figcaption,figure,main{display:block}figure{margin:1em 40px}hr{box-sizing:content-box;height:0}code,kbd,pre,samp{font-family:monospace,monospace;font-size:1em}a{background-color:transparent;-webkit-text-decoration-skip:objects}a:active,a:hover{outline-width:0}abbr[title]{border-bottom:none;text-decoration:underline;text-decoration:underline dotted}b,strong{font-weight:bolder}dfn{font-style:italic}mark{background-color:#ff0;color:#000}small{font-size:80%}sub,sup{font-size:75%;line-height:0;position:relative}sub{bottom:-.25em}sup{top:-.5em}audio:not([controls]){display:none;height:0}img{border-style:none}svg:not(:root){overflow:hidden}button,input,optgroup,select,textarea{font-family:sans-serif;font-size:100%;line-height:1.15;margin:0}button,input{}button,select{text-transform:none}[type=submit], [type=reset],button,html [type=button]{-webkit-appearance:button}[type=button]::-moz-focus-inner,[type=reset]::-moz-focus-inner,[type=submit]::-moz-focus-inner,button::-moz-focus-inner{border-style:none;padding:0}[type=button]:-moz-focusring,[type=reset]:-moz-focusring,[type=submit]:-moz-focusring,button:-moz-focusring{outline:ButtonText dotted 1px}fieldset{border:1px solid silver;margin:0 2px;padding:.35em .625em .75em}legend{box-sizing:border-box;color:inherit;display:table;max-width:100%;padding:0;white-space:normal}progress{}textarea{overflow:auto}[type=checkbox],[type=radio]{box-sizing:border-box;padding:0}[type=number]::-webkit-inner-spin-button,[type=number]::-webkit-outer-spin-button{height:auto}[type=search]{-webkit-appearance:textfield;outline-offset:-2px}[type=search]::-webkit-search-cancel-button,[type=search]::-webkit-search-decoration{-webkit-appearance:none}::-webkit-file-upload-button{-webkit-appearance:button;font:inherit}summary{display:list-item}[hidden],template{display:none};

/*------------------------------------*\
    Apaxy
    by @adamwhitcroft

    Theme name: Apaxy
    Theme author: @adamwhitcroft
\*------------------------------------*/

* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
  -moz-box-sizing: border-box;
  -webkit-box-sizing: border-box;
}

html {
  min-height: 100%;
  color: #61666c;
  background-color: #232323;
  font-weight: 400;
  font-size: 1em;
  font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Helvetica, Arial, sans-serif, "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol";
  line-height: 2em;
}
@media (prefers-color-scheme: dark) {
  html {
    background-color: #232323;
  }
}

body {
  padding: 20px;
  -webkit-backface-visibility: hidden;
}

code {
  font-family: consolas,monospace;
}

a {
  color: #000;
  text-decoration: none;
}
@media (prefers-color-scheme: dark) {
  a {
    color: #e9e9e9;
  }
}

a, img {
  border: none;
  outline: none;
}

a > img:hover {
  opacity: 0.4;
}

a:hover {
  color: #bababa;
}
@media (prefers-color-scheme: dark) {
  a:hover {
    color: #696969;
  }
}

/*------------------------------------*\
    Wrapper
\*------------------------------------*/

.wrapper {
  margin: 0 auto;
  padding-top: 20px;
  max-width: 80%;
}

/*------------------------------------*\
    Filter (search box)
\*------------------------------------*/
#filter {
  background-color: rgba(0, 0, 0, 0.04);
  float: right;
  font-size:.75em;
  padding: .5em;
  margin-bottom: .5em;
  border: 1px solid rgba(0, 0, 0, 0.15);
  border-radius: .25em;
  width: 10em;
  transition: width 0.25s ease;
}
@media (prefers-color-scheme: dark) {
  #filter {
    background-color: rgba(255, 255, 255, 0.07);
    border-color: rgba(255, 255, 255, 0.15);
    color: white;
  }
}
#filter:focus {
  width: 14em;
}

/*------------------------------------*\
    Demo block
\*------------------------------------*/

.block {
  font-size: .875em;
  margin: 20px 0;
  padding: 20px;
  color: #9099A3;
}

/*------------------------------------*\
    Table (directory listing)
\*------------------------------------*/

table {
  width: 100%;
  border-collapse: collapse;
  font-size: .875em;
  color: rgb(143, 143, 143);
}
@media (prefers-color-scheme: dark) {
  table {
    color: rgb(111, 111, 111);
  }
}

.odd {
  background-color: rgb(244, 244, 244);
}
@media (prefers-color-scheme: dark) {
  .odd {
    background-color: rgb(50, 50, 50);
  }
}

tr {
  outline: 0;
  border: 0;
}

th {
  text-align: left;
  font-size: .75em;
  padding-right: 20px;
}

/* 2nd Column: Filename */

th + th {
  width: 65%;
}

/* 3rd Column: Last Modified */
th + th + th {
}

/* 4th Column: Size */
th + th + th + th {
  width: 5%;
}

tr td:first-of-type {
  padding-left: 10px;
  padding-right: 10px;
}

td {
  padding: 5px 0;
  outline: 0;
  border: 0;
  vertical-align: middle;
  text-align: left;
  transition: background 300ms ease;
  -o-transition: background 300ms ease;
  -ms-transition: background 300ms ease;
  -moz-transition: background 300ms ease;
  -webkit-transition: background 300ms ease;
}
@media (prefers-color-scheme: dark) {
  td {
    border-color: #424242;
  }
}

td a {
  display: block;
}

tr.parent a[href^="/"] {
  color: #9099A3;
}

.parent a[href^="/"]:hover {
  color: #2281d0;
}

/*------------------------------------*\
    Footer
\*------------------------------------*/

.footer {
  text-align: center;
  font-size: .75em;
}

/*------------------------------------*\
    Media query for small screens
\*------------------------------------*/
@media (max-width: 768px) {
  body {
    padding: 10px;
  }
  .indexcollastmod { display: none; }
  .wrapper { max-width: 100%; }
}

/*------------------------------------*\
    Error pages
/*------------------------------------*/
/* Animation */
@-webkit-keyframes fadeDown {
  0% {
    opacity: 0;
    -webkit-transform: translateY(-20px);
  }
  100% {
    opacity: 1;
    -webkit-transform: translateY(0);
  }
}

@-moz-keyframes fadeDown {
  0% {
    opacity: 0;
    -moz-transform: translateY(-20px);
  }
  100% {
    opacity: 1;
    -moz-transform: translateY(0);
  }
}

@-ms-keyframes fadeDown {
  0% {
    opacity: 0;
    -ms-transform: translateY(-20px);
  }
  100% {
    opacity: 1;
    -ms-transform: translateY(0);
  }
}

@-o-keyframes fadeDown {
  0% {
    opacity: 0;
    -o-transform: translateY(-20px);
  }
  100% {
    opacity: 1;
    -o-transform: translateY(0);
  }
}

@keyframes fadeDown {
  0% {
    opacity: 0;
    transform: translateY(-20px);
  }
  100% {
    opacity: 1;
    transform: translateY(0);
  }
}

.fadeDown {
  -webkit-animation:fadeDown 1s ease;
     -moz-animation:fadeDown 1s ease;
      -ms-animation:fadeDown 1s ease;
       -o-animation:fadeDown 1s ease;
          animation:fadeDown 1s ease;
}

/* Center elements in error pages */
.fadeDown .center {
  text-align: center;
}

/* Error code display */
.errorCode {
  font-size: 80px;
}

/*------------------------------------*\
    Breadcrumb
\*------------------------------------*/

.breadcrumb {
  white-space: nowrap;
  padding: 0;
  margin: 0;
}

.breadcrumb li {
  color: rgb(154, 154, 154);
  display: inline-block;
  line-height: 10px;
  margin: 0 9px 20px -10px;
  padding: 0 15px;
  position: relative;
}
@media (prefers-color-scheme: dark) {
  .breadcrumb li {
    color: rgb(100, 100, 100);
  }
}

.breadcrumb li::before,
.breadcrumb li::after {
  border-right: 1.5px solid #000;
  content: '';
  display: block;
  height: 50%;
  position: absolute;
  left: 0;
  right: 0;
  top: 0;
  z-index: -1;
  transform: skewX(45deg);
}
@media (prefers-color-scheme: dark) {
  .breadcrumb li::before,
  .breadcrumb li::after {
    border-color: #fff;
  }
}

.breadcrumb li::after {
  bottom: 0;
  top: auto;
  transform: skewX(-45deg);
}

.breadcrumb li:last-of-type::before,
.breadcrumb li:last-of-type::after {
  display: none;
}

.breadcrumb li a {
  letter-spacing: -1px;
  text-decoration: none;
}
