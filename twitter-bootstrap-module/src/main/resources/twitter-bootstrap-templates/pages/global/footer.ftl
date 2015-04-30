<div class="footer">
        <div class="${ctx.containersType}">
        [#list components as component ]
            [@cms.component content=component /]
        [/#list]
        [#if cmsfn.editMode]
            <div cms:add="box"></div>
        [/#if]

        [#if content.copyright?has_content]
            <p id="copyright">&#169; ${content.copyright}</p>
        [#else]
            <p id="copyright"> </p>
        [/#if]

        ${model.badge}
        </div>
</div>
