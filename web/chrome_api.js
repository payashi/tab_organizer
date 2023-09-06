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