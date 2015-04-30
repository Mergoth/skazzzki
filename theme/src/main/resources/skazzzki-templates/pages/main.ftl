<!DOCTYPE html>
[#-- containerType (change default in config /modules/twitter-bootstrap/templates/pages/tbDefault/parameters@containersType) --]
[#if def.containersType?has_content]
    [#assign containersType = def.containersType]
[#else]
    [#assign containersType = "container"]
[/#if]
<html xml:lang="${cmsfn.language()}" lang="${cmsfn.language()}">
    <head>
        [@cms.init /]
        [@cms.area name="htmlHeader"/]
    </head>

    [#assign bodyID = '']
    [#if def.bodyID?has_content]
        [#assign bodyID = 'id="${def.bodyID}"']
    [/#if]
    [#assign bodyClass = '']
    [#if content.bodyClass?has_content]
        [#assign bodyClass = content.bodyClass]
    [/#if]
    [#if cmsfn.editMode]
        [#assign bodyClass = bodyClass+" editMode"]
    [/#if]
    <body ${bodyID} class="${bodyClass}" role="document">
    [@cms.area name="bodyBeginScripts"/]

    <!-- Navigation -->
    <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
        <div class="${containersType}">
            [@cms.area name="branding"/]
            [#include def.navigation.horizontal.template]
        </div>
        <!-- /.container -->
    </nav>

    <!-- Page Content -->
    [@cms.area name="main" contextAttributes={"containersType":containersType}/]
    [@cms.area name="footer" contextAttributes={"containersType":containersType}/]
    <!-- /.container -->
    
    [@cms.area name="bodyEndScripts"/]
    </body>
</html>
