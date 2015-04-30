[#include "/twitter-bootstrap-templates/components/includes/column_manager.ftl"]

[#assign tbImageClass = "img-rounded"]
[#if content.tbImageClass?has_content]
    [#assign tbImageClass = content.tbImageClass]
[/#if]

[#if tbImageClass = "img-circle"]
    [#assign renderer = renderer+"-square"]
[/#if]

[#if content.divClass?has_content]
    [#assign divClass = content.divClass]
[/#if]

[#assign lightbox = false]
[#if content.lightbox?has_content]
    [#assign lightbox = content.lightbox]
[/#if]

[#if content.image?has_content]
    [#assign imageLink = damfn.getAssetLink(content.image,renderer)]
    [#assign target = damfn.getAsset(content.image)]
    [#assign link = target.link]
    [#assign assetMap = damfn.getAssetMap(target)]
    [#assign altText = assetMap.title!assetMap.name!"Image"]
[#else]
    [#assign imageLink = "${stkfn.homeLink(content)}resources/templating-kit/themes/twitter-bootstrap/img/placeholder.jpg"]
    [#assign altText = "placeholder"]
    [#assign lightbox = false]
[/#if]



<div class="textImage ${colDivClass} ${divClass!}">
   [#if (lightbox = true) && !cmsfn.editMode]<a  data-toggle="modal" data-target="#myModal_${content.image?replace(":","")}">[/#if]
    <img class='img-responsive ${tbImageClass}' src='${imageLink}' alt='${altText}'>
   [#if (lightbox = true) && !cmsfn.editMode]</a>[/#if]
   
</div>
[#if (lightbox = true) && !cmsfn.editMode]
<div class="modal fade" id="myModal_${content.image?replace(":","")}" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
        <h4 class="modal-title" id="myModalLabel">${altText}</h4>
      </div>
      <div class="modal-body">
        <img src="${link}" class='img-responsive'>
      </div>
    </div>
  </div>
</div>
[/#if]