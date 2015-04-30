[#include "/twitter-bootstrap-templates/components/includes/column_manager.ftl"]

[#if content.divClass?has_content]
    [#assign divClass = content.divClass]
[/#if]

<div class="groupInOneColumn ${colDivClass} ${divClass!}" role="main">
        [#if content.title?has_content]
            <div class="">
                <h3 class="group-header">${content.title!""}</h2>
            </div>
        [/#if]
    [@cms.area name="group" contextAttributes={"maxCols":"inGroup"} /]
    [#if cmsfn.editMode && (cmsfn.children(content.group)?size=0)]
        <div class="mgnlEditorBar text-center">Empty group placeholder. Click here and start to add components.</div>
    [/#if]
</div>
