/*------------- Google Analytics -------------*/

var _gaq = _gaq || [];
_gaq.push(['_setAccount', 'UA-38846910-1']);
_gaq.push(['_trackPageview']);
(function() {
var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
})();

/*-------------  -------------*/
$(document).ready(function(){
    var user_url = "https://api.github.com/users/";
    var username = "brianchung808";
    var $dropdown = $('#github_dropdown');
    var result;
    var repos;


    $.ajax({
        url: user_url + username,
        cache: true,
        dataType: "jsonp",
        success: function(response) {
            result = response['data'];
        }
    }).then(function() {
        var LOG = false;
        /* when ready, get the repos */

        // set up info in the div
        var repos_url = result.repos_url;
        if(LOG) console.log('repos url ' + repos_url);

        $.getJSON(repos_url + "?callback=?", null, function(response) {
            repos = response['data'];
        }).then(function() {
            /* when repos ready, set the information */

            if(LOG) console.log("# public repos: " + repos.length);

            for(var i = 0; i < repos.length; i++) {
                if(LOG) console.log("Repo " + i + ": " + repos[i].name);
                if(LOG) console.log("Repo " + i + " url: " + repos[i].html_url);
                var name = repos[i].name;
                var url = repos[i].html_url;
                $dropdown.append('<li><a target="_blank" href="' +  url + '">' + name + '</a></li>')
            }

        });

    });
});
