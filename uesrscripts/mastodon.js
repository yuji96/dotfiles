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

const sleep = (ms) => new Promise((resolve) => setTimeout(resolve, ms));

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

const observer = new MutationObserver((mutations) => {
  mutations.forEach((mutation) => {
    // 何かしたいこと
    if (mutation.target.matches(".status__wrapper")) {
      const aTag = mutation.target.querySelector(
        "div.status__info > a.status__relative-time"
      );
      if (aTag) {
        replaceHref(aTag);
      }
    }
  });
});

const observe = () => {
  const targetNode = document.querySelector(
    ".columns-area.columns-area--mobile > div[aria-label]"
  );
  console.log(targetNode);

  [
    ...targetNode.querySelectorAll("div.status__info > a.status__relative-time"),
  ].map(replaceHref);
  console.log("initial modifying.");

  observer.observe(targetNode, {
    childList: true,
    subtree: true,
  });
  console.log("observing");
};

window.addEventListener(
  "load",
  async (event) => {
    await sleep(750);
    observe();
    document.querySelector(".navigation-panel").onclick = async () => {
      console.log("clicked.");
      await sleep(750);
      observe();
    };
  },
  false
);
