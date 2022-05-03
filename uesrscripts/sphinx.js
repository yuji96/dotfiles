// ==UserScript==
// @name         enable use select all in sphinx
// @namespace    http://tampermonkey.net/
// @version      0.1
// @description  try to take over the world!
// @author       You
// @match        https://scikit-learn.org/*
// @match        https://docs.scipy.org/*
// @icon         https://www.sphinx-doc.org/ja/master/_static/favicon.svg
// @grant        none
// ==/UserScript==

(function () {
  "use strict";

  // Your code here...
  [...document.querySelectorAll("dt > strong")].map(
    (node) => (node.style["userSelect"] = "all")
  );
  console.log("done");
})();
