(function(PKT_EXT) {
    var passedtab = null;

/*==========================================================================
 TOOLBAR ICON MANIPULATION: LIFTED FROM BACKGROUND.JS
===========================================================================*/

    function showToolbarIcon(tabId, iconName) {
        // Change toolbar icon to new icon
        var smallIconPath, bigIconPath

        if(isEdge()){

            smallIconPath = 'app/images/' + iconName + '-20.png'
            bigIconPath = 'app/images/' + iconName + '-40.png'
            chrome.browserAction.setIcon({
                tabId: tabId,
                path: {
                    '20': smallIconPath,
                    '40': bigIconPath
                }
            })

        }else{
            smallIconPath = 'app/images/' + iconName + '-19.png'
            bigIconPath = 'app/images/' + iconName + '-38.png'
            chrome.browserAction.setIcon({
                tabId: tabId,
                path: {
                    '19': smallIconPath,
                    '38': bigIconPath
                }
            })

        }

    }

    function showNormalToolbarIcon(tabId) {
        showToolbarIcon(tabId, 'browser-action-icon')
    }

    function showSavedToolbarIcon(tabId) {
        showToolbarIcon(tabId, 'browser-action-icon-added')
    }

/*==========================================================================

===========================================================================*/

    function getList() {
        PKT_EXT.API.getList({
            success: function(data) {
                chrome.tabs.sendMessage(passedtab.id, {status: 'expermiment', type: 'getList', data: data })
            },
            error: function(data) {
                console.log('getList error')
            }
        });
    }

    function getArticleInfo(url) {
        PKT_EXT.API.getArticleInfo({
            url: url,
            success: function(data) {
                chrome.tabs.sendMessage(passedtab.id, {status: 'expermiment', type: 'getArticleInfo', data: data });
            },
            error: function(data) {
                console.log('getArticleInfo error')
            }
        });
    }

    function twoClickSaveArticle(tab, options, featureSet) {
        var title           = options.title || tab.title || ''
        var url             = options.url || tab.url  || ''
        var saveType        = options.saveType || 'page'
        var showSavedIcon   = (typeof options.showSavedIcon !== 'undefined') ? options.showSavedIcon : true

        featureSet.url = url

        // Add the url to Pocket
        PKT_EXT.API.add(title, url, {
            actionInfo: options.actionInfo,
            success: function(data) {
                var itemid = null
                if (typeof data.action_results
                    && data.action_results.length
                    && typeof data.action_results[0]) {
                    itemid = data.action_results[0].item_id
                }

                onSaveSuccess(tab, showSavedIcon, itemid, saveType, featureSet)
            },
            error: function(status, xhr) {
                // Not authorized
                if (status === 401) {
                    sendMessageToTab(tab, {'status': 'unauthorized'})
                    authentication.showLoginWindow(function() { twoClickSaveArticle(tab, options) })
                    return
                }

                // Handle error message
                console.log('onsaveError ')
                // onSaveError(tab, xhr)

                // Error callback
                if (options.error) { options.error(status, xhr) }
            }
        })
    }

    function onSaveSuccess(tab, showToolbarIcon, itemId, saveType, featureSet) {
        if (typeof showToolbarIcon !== 'undefined' && showToolbarIcon === true) {
            showSavedToolbarIcon(tab.id)
        }

        featureSet.savecount += 1
        setSetting('saveCount', featureSet.savecount)

        // An experiment, so recs shouldn't load;
        featureSet.recs = false;
        featureSet.exp_showlist = true;

        // featureSet.recs = (getSetting('recommendations') === 'true' && getSetting('show_recs') === 'true')

        chrome.tabs.sendMessage(tab.id, {status: 'success', item_id: itemId, features: featureSet, saveType: saveType })
    }

    function twoClickExperiement(url) {
        // Verify if part of experiement
        getArticleInfo(url);
        getList();
    }

/*===============================
=            Actions            =
===============================*/

    function checkForExperiment(stage, tab) {
        passedtab = tab;

        switch(stage) {
            case 'saveLinkToPocket':
                return twoClickExperiement;
        }
    }

    function messageHandler(request, tab, callback, featureSet) {
        passedtab = tab;

        switch(request.type) {
            case 'saveLinkToPocket':
                return twoClickSaveArticle(tab, request, featureSet)
        }
    }

    PKT_EXT.EXPERIMENT_RUNNER = {
        checkForExperiment: checkForExperiment,
        messageHandler: messageHandler,
    }

}(PKT_EXT || {}))
