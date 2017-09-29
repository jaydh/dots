var isWhitelist = false,
    streamInput = [],
    openOffline = true;
    isMatched = false;



//checks if current stream is in whitelist/blacklistarray
function checkifStreamMatches() {
    var currentStream = getStreamName();
    isMatched = false;
    for (i = 0; i < streamInput.length; i++) {
        if (streamInput[i] == currentStream) {
            isMatched = true;
        }
    }
}
//trims the url to the channel name
function getStreamName() {
    var temp = document.URL;
    temp = temp.replace("http://www.twitch.tv/", '');
    var extraIndex = temp.indexOf("#");
    if (extraIndex !== -1)
        temp = temp.substring(0, extraIndex);
    return temp.trim();
}
function openTheater() {
    if (typeof isWhitelist === 'undefined') {
        isWhitelist = false;
    };
    window.console.log("in openTheater after first check isWhitelist:" + isWhitelist)
    if (isWhitelist == false && isMatched == false) {
        jQuery("a[original-title='Theater Mode']")[0].click();
        window.console.log("iswhitelist is false, no match for stream on " + document.URL);
    } else if (isWhitelist == true && isMatched == true) {
        jQuery("a[original-title='Theater Mode']")[0].click();
        window.console.log("iswhitelist is true, match for stream on " + document.URL);
    } else if (isWhitelist == true && isMatched == false) {
        window.console.log("iswhitelist is true, no match for stream on " + document.URL);
    }
}
window.onload = function() {

   
    chrome.storage.local.get(function(e) {
        if (typeof e.isWhitelist !== 'undefined') {
            isWhitelist = e.isWhitelist;
        };
        if (typeof e.savedStreams !== 'undefined') {
            streamInput = e.savedStreams.split(',');
        };
        if (typeof e.openOffline !== 'undefined') {
            openOffline = e.openOffline;
        };

        if (openOffline || document.getElementsByClassName("ember-view live-count stat").length > 0){
            checkifStreamMatches();
            openTheater();
        }
       
    });

}