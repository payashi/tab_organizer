async function queryTabs(options) {
    let tabs = await chrome.tabs.query(options);
    let data = tabs.map(tab => {
        return {
            active: tab.active,
            favIconUrl: tab.favIconUrl,
            groupId: tab.groupId,
            id: tab.id,
            index: tab.index,
            title: tab.title,
            url: tab.url,
            windowId: tab.windowId,
        };
    });

    return JSON.stringify(data);
}

chrome.tabs.onUpdated.addListener(function (tabId, changeInfo, tab) {
    const data = {
        trigger: 'chrome.tabs.onUpdated',
        tabId: tabId,
        changeInfo: changeInfo,
        tab: tab,
    };
    if (changeInfo.status == 'complete') {
        const event = new CustomEvent('tabUpdated', {
            'detail': JSON.stringify(data),
        });
        document.dispatchEvent(event);
    }
});

chrome.tabs.onRemoved.addListener(function (tabId, removeInfo) {
    const data = {
        trigger: 'chrome.tabs.onRemoved',
        tabId: tabId,
        removeInfo: removeInfo,
    };

    const event = new CustomEvent('tabUpdated', {
        'detail': JSON.stringify(data),
    });
    document.dispatchEvent(event);
});

