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
    // TODO: Add onCreated and onRemoved listener
    // TODO: Prevent dispatching when the status is loading
    const data = {
        tabId: tabId,
        changeInfo: changeInfo,
        tab: tab,
    };
    const event = new CustomEvent('tabUpdated', {
        'detail': JSON.stringify(data),
    });
    document.dispatchEvent(event);
});