
[#-- Assigns: Get Content --]
[#assign title = content.title!content.@name]
[#assign kicker = content.abstract!]

[#-- Assigns: Is Content Available --]
[#assign hasTitle = title?has_content]
[#assign hasKicker = kicker?has_content]

[#-------------- RENDERING PART --------------]
[#-- Rendering: Main Area Intro --]

[#if hasTitle]
<div class="${ctx.containersType} pageHeaderContainer" role="main">
    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">
                ${title}
                [#if hasKicker]<small>${kicker}</small>[/#if]
            </h1>
        </div>
    </div>
</div>
[/#if]

