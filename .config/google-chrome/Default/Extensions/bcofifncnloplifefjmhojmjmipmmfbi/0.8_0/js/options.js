(function() {

    var saveButton;
    var streamInput;
    var isWhitelist;
    var inputHtml = "<span style=font-weight:normal>(seperate each channel by a ',' you can also copy the url of a channel)</span></h4>";

    function save() {
        //var temp = streamInput.value;
        var tempArray = streamInput.value.split(',');
        var temp = "";
        for (var i = 0; i < tempArray.length; i++) {
            if (i >0 ) {
                temp = temp + "," + getStreamName(tempArray[i]);
            }
            else{
                temp += getStreamName(tempArray[i]);
            }
        };
        chrome.storage.local.set({
            'savedStreams': temp
        }, function() {
            // Notify that we saved.
            window.console.log('savedStreams saved');
        });
        chrome.storage.local.set({
            'isWhitelist': $('#boxid').prop("checked")
        }, function() {
            // Notify that we saved.
            window.console.log('isWhitelist saved');
        });
        chrome.storage.local.set({
            'openOffline': $('#openOffline').prop("checked")
        }, function() {
            // Notify that we saved.
            window.console.log('openOffline saved');
        });
    }

    function getStreamName(url) 
    {
        var temp = url;
        temp = temp.replace("http://www.twitch.tv/", '');
        var extraIndex = temp.indexOf("#");
        if (extraIndex !== -1)
            temp = temp.substring(0, extraIndex);
        var popoutIndex = temp.indexOf("/popout");
        if (popoutIndex !== -1)
            temp = temp.substring(0, popoutIndex);
        return temp.trim();
    }

    function initiate() {
        chrome.storage.local.get(function(e) {
            var savedStreams = e.savedStreams;
            isWhitelist = e.isWhitelist;
            openOffline = e.openOffline;

            $('#boxid').prop("checked", isWhitelist);
            $('#openOffline').prop("checked", openOffline);
            if (isWhitelist)
                $('#description').html("<h4>Whitelisted streams" + inputHtml);

            streamInput = document.getElementById("StreamInput");
            if (savedStreams) {
                streamInput.value = savedStreams;
            }
        });

    }
    $(document).ready(function() {
        initiate();
        $('#savebutton').bind("click", save);

        $('#boxid').click(function() {
            if ($(this).is(':checked')) {
                $('#description').html("<h4>Whitelisted streams" + inputHtml);
            } else {
                $('#description').html("<h4>Blacklisted streams" + inputHtml);
            }
        });
    });

}());