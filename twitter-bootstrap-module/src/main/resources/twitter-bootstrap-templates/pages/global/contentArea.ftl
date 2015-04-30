[#list components as component]
    [@cms.component content=component contextAttributes={"containersType":ctx.containersType}/]
[/#list]

[#if cmsfn.editMode]
    <div class="teaser" id="teaser-${stkfn.count('teaser')}" cms:add="box"></div>
[/#if]
