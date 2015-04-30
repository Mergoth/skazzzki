package info.magnolia.twitterBootstrap.setup;

import info.magnolia.repository.RepositoryConstants;
import info.magnolia.twitterBootstrap.setup.tasks.FolderBootstrapTask;
import info.magnolia.module.InstallContext;
import info.magnolia.module.delta.BootstrapSingleModuleResource;
import info.magnolia.module.delta.BootstrapSingleResource;
import info.magnolia.module.delta.Delta;
import info.magnolia.module.delta.DeltaBuilder;
import info.magnolia.module.delta.PartialBootstrapTask;
import info.magnolia.module.delta.RemoveNodeTask;
import info.magnolia.module.delta.Task;
import info.magnolia.module.delta.WarnTask;
import info.magnolia.module.inplacetemplating.setup.TemplatesInstallTask;
import info.magnolia.module.model.Version;
import info.magnolia.module.resources.setup.InstallBinaryResourcesTask;
import info.magnolia.module.templatingkit.setup.ThemeVersionHandler;

import java.util.ArrayList;
import java.util.List;

/**
 * This class is optional and lets you manager the versions of your module,
 * by registering "deltas" to maintain the module's configuration, or other type of content.
 * If you don't need this, simply remove the reference to this class in the module descriptor xml.
 */
public class TwitterBootstrapVersionHandler extends ThemeVersionHandler {
    
    public TwitterBootstrapVersionHandler () {
        final Delta deltaFor11 = DeltaBuilder.update("1.1", "All updates for 1.1")
                .addTask(new BootstrapSingleModuleResource("SizeUp option in dialog","", "/mgnl-bootstrap/twitter-bootstrap/dialogs/generic/config.modules.twitter-bootstrap.dialogs.generic.sizeUp.xml"))
                .addTask(new PartialBootstrapTask("Add styles tab to tbHTML component dialog", "","/mgnl-bootstrap/twitter-bootstrap/dialogs/components/content/config.modules.twitter-bootstrap.dialogs.components.content.tbHTML.xml", "tbHTML/form/tabs/tabStyles"))
                .addTask(new RemoveNodeTask("Remove old dialog for tbImage", "", RepositoryConstants.CONFIG, "/modules/twitter-bootstrap/dialogs/components/content/tbImage"))
                .addTask(new BootstrapSingleModuleResource("Bootstrap new dialog for tbImage","", "/mgnl-bootstrap/twitter-bootstrap/dialogs/components/content/config.modules.twitter-bootstrap.dialogs.components.content.tbImage.xml"))
                .addTask(new RemoveNodeTask("Remove old dialog for tbLink", "", RepositoryConstants.CONFIG, "/modules/twitter-bootstrap/dialogs/components/content/tbLink"))
                .addTask(new BootstrapSingleModuleResource("Bootstrap new dialog for tbLink","", "/mgnl-bootstrap/twitter-bootstrap/dialogs/components/content/config.modules.twitter-bootstrap.dialogs.components.content.tbLink.xml"))
                .addTask(new RemoveNodeTask("Remove old dialog for tbTeaser", "", RepositoryConstants.CONFIG, "/modules/twitter-bootstrap/dialogs/components/content/tbTeaser"))
                .addTask(new BootstrapSingleModuleResource("Bootstrap new dialog for tbTeaser","", "/mgnl-bootstrap/twitter-bootstrap/dialogs/components/content/config.modules.twitter-bootstrap.dialogs.components.content.tbTeaser.xml"))
                .addTask(new RemoveNodeTask("Remove old dialog for tbTextImage", "", RepositoryConstants.CONFIG, "/modules/twitter-bootstrap/dialogs/components/content/tbTextImage"))
                .addTask(new BootstrapSingleModuleResource("Bootstrap new dialog for tbTextImage","", "/mgnl-bootstrap/twitter-bootstrap/dialogs/components/content/config.modules.twitter-bootstrap.dialogs.components.content.tbTextImage.xml"))
                .addTask(new BootstrapSingleModuleResource("Bootstrap dialogs/generic/icon","", "/mgnl-bootstrap/twitter-bootstrap/dialogs/generic/config.modules.twitter-bootstrap.dialogs.generic.icon.xml"))
                .addTask(new BootstrapSingleModuleResource("Bootstrap dialogs/generic/imageOrIcon","", "/mgnl-bootstrap/twitter-bootstrap/dialogs/generic/config.modules.twitter-bootstrap.dialogs.generic.imageOrIcon.xml"))
                .addTask(new RemoveNodeTask("Remove old tbRow", "", RepositoryConstants.CONFIG, "/modules/twitter-bootstrap/templates/components/row/tbRow"))
                .addTask(new BootstrapSingleModuleResource("Bootstrap new tbRow","", "/mgnl-bootstrap/twitter-bootstrap/templates/components/row/config.modules.twitter-bootstrap.templates.components.row.tbRow.xml"))
                .addTask(new BootstrapSingleModuleResource("Bootstrap new tbGroup","", "/mgnl-bootstrap/twitter-bootstrap/templates/components/row/config.modules.twitter-bootstrap.templates.components.row.tbGroup.xml"))
                .addTask(new BootstrapSingleModuleResource("Bootstrap dialog for new tbGroup","", "/mgnl-bootstrap/twitter-bootstrap/dialogs/components/row/config.modules.twitter-bootstrap.dialogs.components.row.tbGroup.xml"));
        register(deltaFor11);
        
        final Delta deltaFor12 = DeltaBuilder.update("1.2", "All updates for 1.2")
                .addTask(new RemoveNodeTask("Remove old tbDefault page", "", RepositoryConstants.CONFIG, "/modules/twitter-bootstrap/templates/pages/tbDefault"))
                .addTask(new BootstrapSingleModuleResource("Bootstrap new tbDefault page","", "/mgnl-bootstrap/twitter-bootstrap/templates/pages/config.modules.twitter-bootstrap.templates.pages.tbDefault.xml"))
                .addTask(new RemoveNodeTask("Remove old tbGroup dialog", "", RepositoryConstants.CONFIG, "/modules/twitter-bootstrap/dialogs/components/row/tbGroup"))
                .addTask(new BootstrapSingleModuleResource("Bootstrap new tbGroup dialog","", "/mgnl-bootstrap/twitter-bootstrap/dialogs/components/row/config.modules.twitter-bootstrap.dialogs.components.row.tbGroup.xml"));
        register(deltaFor12);
    }
    
    @Override
    protected List<Task> getExtraInstallTasks(InstallContext installContext) {
        final List<Task> installTasks = new ArrayList<Task>();
        installTasks.add(new InstallBinaryResourcesTask("Install fonts", "", "/templating-kit/themes/twitter-bootstrap/fonts/.*", false, false));
        installTasks.add(new BootstrapSingleResource("Install bootstrap Theme", "", "/mgnl-bootstrap/theme/config.modules.standard-templating-kit.config.themes.twitter-bootstrap.xml"));
        installTasks.add(new BootstrapSingleResource("Install bootstrap Site Definition", "", "/mgnl-bootstrap/site-definition/config.modules.multisite.config.sites.twitter-bootstrap.xml"));
        installTasks.add(new FolderBootstrapTask("/twitter-bootstrap/templates"));
        installTasks.add(new FolderBootstrapTask("/twitter-bootstrap/dialogs"));
        installTasks.add(new FolderBootstrapTask("/demo-websites"));
        installTasks.add(new FolderBootstrapTask("/demo-assets"));
        installTasks.add(new TemplatesInstallTask("/twitter-bootstrap-templates/.*\\.ftl", true));
        installTasks.add(new WarnTask("","INSTALLED. In Admincetral navigate to PAGES and start with 'twitter-bootstrap-demo'."));
        installTasks.addAll(super.getExtraInstallTasks(installContext));
        return installTasks;
    }

    @Override
    protected List<Task> getDefaultUpdateTasks(Version forVersion) {
        final List<Task> tasks = new ArrayList<Task>();
        tasks.addAll(super.getDefaultUpdateTasks(forVersion));
        return tasks;
    }

}
