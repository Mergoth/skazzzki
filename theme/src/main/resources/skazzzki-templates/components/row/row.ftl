[#assign containersType = ctx.containersType]
[#if content.containersType?has_content && !content.containersType?contains("default")]
    [#assign containersType = content.containersType]
[/#if]

[#if content.divClass?has_content]
    [#assign divClass = content.divClass]
[/#if]

[#-- containerType (change default in config /modules/twitter-bootstrap/templates/pages/tbDefault/parameters@containersType) --]
<div class="${containersType} ${divClass!}" role="main">
    <div class="row">
        [#if content.title?has_content]
            <div class="col-lg-12">
                <h2 class="row-header">${content.title!""}</h2>
            </div>
        [/#if]
        [@cms.area name="row" contextAttributes={"maxCols":content.maxCols!"1"} /]
        [#if cmsfn.editMode && (cmsfn.children(content.row)?size=0)]
            <div class="mgnlEditorBar text-center">Empty row placeholder. Click here and start to add components.</div>
        [/#if]
    </div>
</div>
