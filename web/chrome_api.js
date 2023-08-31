async function getUrl() {
    let queryOptions = { active: true, currentWindow: true };
    let [tab] = await chrome.tabs.query(queryOptions);
    return tab.url;
}

async function getTabs() {
    let tabs = await chrome.tabs.query({});
    let data = tabs.map(tab => {
        return {
            active: tab.active,
            favIconUrl: tab.favIconUrl,
            groupId: tab.groupId,
            id: tab.id,
            index: tab.index,
            title: tab.title,
            url: tab.url,
        };
    });

    return JSON.stringify(data);
}
