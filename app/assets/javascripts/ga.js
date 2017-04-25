// FROM: GA set up pages

  // (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  // (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  // m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  // })(window,document,'script','https://www.google-analytics.com/analytics.js','ga');

  // ga('create', 'UA-98079940-1', 'auto');
  // ga('send', 'pageview');

// FROM: https://gist.github.com/sivicencio/4e8465a7eca1c9a39604

// JavaScript implementation of @reed Google Analytics Turbolinks compatibility
// Original CoffeeScript version: http://reed.github.io/turbolinks-compatibility/google_analytics.html
// Prefer Universal Analytics if you can, as Google recommends

var googleAnalytics = {
  load: function() {
    var firstScript;
    window._gaq = [];
    window._gaq.push(["_setAccount", googleAnalytics.analyticsId()]);

    ga = document.createElement("script");
    ga.type = "text/javascript";
    ga.async = true;
    ga.src = (document.location.protocol === "https:" ? "https://ssl" : "http://www") + ".google-analytics.com/ga.js";
    firstScript = document.getElementsByTagName("script")[0];
    firstScript.parentNode.insertBefore(ga, firstScript);

    if(typeof(Turbolinks) !== undefined && Turbolinks.supported) {
      document.addEventListener("page:change", function() {
        googleAnalytics.trackPageview();
      }, true)
    }
    else {
      googleAnalytics.trackPageview();
    }
  },
  trackPageview: function(url) {
    if ( !googleAnalytics.isLocalRequest() ) {
      if (url) {
        window._gaq.push(["_trackPageview", url]);
      }
      else {
        window._gaq.push(["_trackPageview"]);
      }
      window._gaq.push(["_trackPageLoadTime"]);
    }
  },
  isLocalRequest: function() {
    return googleAnalytics.documentDomainIncludes("local");
  },
  documentDomainIncludes: function(str) {
    return document.domain.indexOf(str) !== -1;
  },
  analyticsId: function() {
    return 'UA-98079940-1';
  }
};

googleAnalytics.load();
