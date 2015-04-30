[#include "/twitter-bootstrap-templates/components/includes/column_manager.ftl"]

[#assign target = model.target!]
[#assign hasTarget = target?has_content]

[#assign title = content.teaserTitle!target.title!target.@name]
[#assign text = content.teaserAbstract!target.abstract!]
[#assign teaserLink = model.teaserLink!]

[#assign orientation = "imageOnLeft"]
[#if content.orientation?has_content]
    [#assign orientation = content.orientation]
[/#if]

[#assign tbImageClass = "img-rounded"]
[#if content.tbImageClass?has_content]
    [#assign tbImageClass = content.tbImageClass]
[/#if]

[#if tbImageClass = "img-circle"]
    [#assign renderer = renderer+"-square"]
[/#if]
[#if (orientation = "imageOnLeft" && renderer = "full") || (orientation = "imageOnRight" && renderer = "full")]
    [#assign renderer = "half"]
[/#if]

[#if content.divClass?has_content]
    [#assign divClass = content.divClass]
[/#if]

[#assign imageLink = "http://placehold.it/700x450"]
[#if content.teaserImg?has_content]
    [#assign imageLink = damfn.getAssetLink(content.teaserImg,renderer)]
[#elseif model.image?has_content]
    [#assign imageLink = (model.image!).link!]
[/#if]

[#assign teaserStyle = "textImage"]
[#if content.teaserStyle?has_content]
    [#assign teaserStyle = content.teaserStyle]
[/#if]


[#if hasTarget]
    [#if teaserStyle = "panel"]
        [#-- PANEL LAYOUT --]
        <div class="${colDivClass}">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h4><i class="${content.iClass!""}"></i> ${title}</h4>
                </div>
                <div class="panel-body">
                    [#assign imageHTML = "<img class='img-responsive "+tbImageClass+"' src='"+imageLink+"' alt='"+title+"'>"]
                    [#assign textHTML = "<p>"+(text!"")+"</p><a href='"+model.teaserLink+"'  class='btn "+(content.linkStyle!"btn-default")+"' role='button'>"+i18n['link.readon']+" "+title+"</a>"]
                    [#include "/twitter-bootstrap-templates/components/includes/textImageLayout.ftl"]
                </div>
            </div>
        </div>
    [#else]
        [#-- TEXTIMAGE LAYOUT --]
        [#assign imageHTML = "<img class='img-responsive "+tbImageClass+"' src='"+imageLink+"' alt='"+title+"'>"]
        [#assign textHTML = "<h3><a href="+model.teaserLink+">"+title+"</a></h3><p>"+(text!"")+"</p><p><a href='"+model.teaserLink+"' class='btn "+(content.linkStyle!"btn-default")+"' role='button'>"+i18n['link.readon']+" "+title+"</a></p>"]
        <div class="textImage ${colDivClass} ${divClass!}">
            [#include "/twitter-bootstrap-templates/components/includes/textImageLayout.ftl"]
        </div>
    [/#if]

[/#if]
