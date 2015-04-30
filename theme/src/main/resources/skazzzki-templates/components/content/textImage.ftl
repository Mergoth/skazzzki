[#include "/twitter-bootstrap-templates/components/includes/column_manager.ftl"]

[#assign orientation = "imageOnLeft"]
[#if content.orientation?has_content]
    [#assign orientation = content.orientation]
[/#if]

[#assign tbImageClass = "img-rounded"]
[#if content.tbImageClass?has_content]
    [#assign tbImageClass = content.tbImageClass]
[/#if]

[#if (orientation = "imageOnLeft" && renderer = "full") || (orientation = "imageOnRight" && renderer = "full")]
    [#assign renderer = "half"]
[/#if]

[#if tbImageClass = "img-circle"]
    [#assign renderer = renderer+"-square"]
[/#if]

[#if content.divClass?has_content]
    [#assign divClass = content.divClass]
[/#if]

[#if content.iconSize?has_content]
    [#assign iconSize = content.iconSize]
[/#if]

[#assign imageHTML = "<img class='img-responsive "+tbImageClass+"' src='${stkfn.homeLink(content)}resources/templating-kit/themes/twitter-bootstrap/img/placeholder.jpg' alt='placeholder'>"]
[#if content.imageOrIcon?has_content]
    [#if content.imageOrIcon = "image" && content.imageOrIconimage?has_content]
        [#assign imageLink = damfn.getAssetLink(content.imageOrIconimage,renderer)]
        [#assign target = damfn.getAsset(content.imageOrIconimage)]
        [#assign link = target.link]
        [#assign assetMap = damfn.getAssetMap(target)]
        [#assign altText = assetMap.title!assetMap.name!"Image"]
        [#assign imageHTML = "<img class='img-responsive "+tbImageClass+"' src='"+imageLink+"' alt='"+altText+"'>"]
    [#elseif content.imageOrIcon = "icon"]
        [#assign imageHTML = "<div class='icon ${iconSize!}'><span class='fa fa-"+content.imageOrIconicon+"' aria-hidden='true'></span></div>"]
    [/#if]
[#elseif content.image?has_content]
    [#-- content.image doesnt exist from version 1.0.1 but keep this line because of 1.0 content compatibility --]
    [#assign imageLink = damfn.getAssetLink(content.image,renderer)]
    [#assign imageHTML = "<img class='img-responsive "+tbImageClass+"' src='"+imageLink+"'>"]
[/#if]

[#assign textHTML = cmsfn.decode(content).text!""]
[#if content.title?has_content]
    [#assign textHTML = "<h3>"+(content.title!"")+"</h3>"+textHTML]
[/#if]
<div class="textImage ${colDivClass} ${divClass!}">
    [#include "/twitter-bootstrap-templates/components/includes/textImageLayout.ftl"]
</div>