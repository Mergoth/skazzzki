[#if orientation = "noImage"]
    [#-- NO IMAGE --]
    ${textHTML}
[#elseif orientation = "noText"]
    [#-- NO TEXT --]
    ${imageHTML}
[#elseif orientation = "imageOnTop"]
    [#-- IMAGE ON TOP --]
    ${imageHTML}
    ${textHTML}
[#elseif orientation = "imageOnBottom"]
    [#-- IMAGE ON BOTTOM --]
    ${textHTML}
    ${imageHTML}
[#elseif orientation = "imageOnRight"]
    [#-- IMAGE ON RIGHT --]
    <div class="pull-right" style="width:50%">${imageHTML}</div>
    ${textHTML}
[#else]
    [#-- IMAGE ON LEFT --]
    <div class="pull-left" style="width:50%">${imageHTML}</div>
    ${textHTML}
[/#if]
<div class="clear"></div>