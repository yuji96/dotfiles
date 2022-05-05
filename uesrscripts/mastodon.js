// ==UserScript==
// @name         replace href
// @namespace    http://tampermonkey.net/
// @version      1.0
// @description  try to take over the world!
// @author       You
// @match        https://mastodon.com/*
// @grant        none
// ==/UserScript==

// FIXME: Replace `mastodon` with your host

(function () {
  "use strict";

  // Your code here...
  const replaceHref = (aTag) => {
    aTag.removeAttribute("target");
    const replaced = aTag
      .getAttribute("href")
      .replace(
        /https:\/\/mastodon\.com\/@.+\/(\d+)/,
        "https://mastodon.com/web/statuses/$1"
      );
    aTag.setAttribute("href", replaced);
    console.log(replaced);
  };

  document.body.onclick = () => {
    [...document.querySelectorAll("a.status__relative-time")].map(replaceHref);
  };
})();
