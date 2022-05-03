// ==UserScript==
// @name         replace href
// @namespace    http://tampermonkey.net/
// @version      0.1
// @description  try to take over the world!
// @author       You
// @grant        none
// ==/UserScript==

window.addEventListener(
  "load",
  function () {
    //   // Your code here...
    const targetNode = document.querySelector(
      ".columns-area.columns-area--mobile > div[aria-label]"
    );
    // console.log(targetNode);
    const pattern = /https:\/\/mastodon\.com\/@.+\/(\d+)/;

    const observer = new MutationObserver((mutations) => {
      mutations.forEach((mutation) => {
        // 何かしたいこと
        if (mutation.target.matches(".status__wrapper")) {
          const aTag = mutation.target.querySelector(
            "div.status__info > a.status__relative-time"
          );
          if (aTag) {
            aTag.removeAttribute("target");
            const href = aTag.getAttribute("href");
            aTag.setAttribute(
              "href",
              href.replace(pattern, "https://mastodon.com/web/statuses/$1")
            );
            console.log("modified");
          }
        }
      });
    }).observe(targetNode, {
      childList: true,
      subtree: true,
    });
    console.log("observing");
  },
  false
);
