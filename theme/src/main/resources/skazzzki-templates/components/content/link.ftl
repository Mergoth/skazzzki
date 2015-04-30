[#include "/twitter-bootstrap-templates/components/includes/column_manager.ftl"]

[#if content.divClass?has_content]
    [#assign divClass = content.divClass]
[/#if]

[#if content.link = "internal"]
    [#assign target = cmsfn.contentById(content.linkinternal)]
    [#assign link = cmsfn.link(target)]
    [#assign siteTitle = stkfn.siteTitle(target)!target.title!"link"]
[#elseif content.link = "external"]
    [#assign link = content.linkexternal]
    [#assign siteTitle = content.linkexternal!"link"]
[#elseif content.link = "dam"]
    [#assign target = damfn.getAsset(content.linkdam)]
    [#assign link = target.link]
    [#assign assetMap = damfn.getAssetMap(target)]
    [#assign siteTitle = assetMap.title!"link"]
[/#if]

[#assign icon = ""]
[#if content.icon?has_content]
    [#assign icon = "<span class='fa fa-"+content.icon?replace(" ", "")+"' aria-hidden='true'></span>&nbsp;"]
[/#if]
<div class="${colDivClass} ${divClass!}">
    [#if link?has_content]
        <a class="btn ${content.linkStyle!"btn-default"}" href="${link}" role="button">${icon}${content.label!siteTitle}</a>
    [/#if]
</div>
