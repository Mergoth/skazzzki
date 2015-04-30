/**
 * This file Copyright (c) 2013-2015 Magnolia International
 * Ltd.  (http://www.magnolia-cms.com). All rights reserved.
 *
 *
 * This program and the accompanying materials are made
 * available under the terms of the Magnolia Network Agreement
 * which accompanies this distribution, and is available at
 * http://www.magnolia-cms.com/mna.html
 *
 * Any modifications to this file must keep this entire header
 * intact.
 *
 */
package ru.skzzzzki.site.tasks;

import info.magnolia.module.InstallContext;
import info.magnolia.module.delta.BootstrapResourcesTask;

import javax.jcr.ImportUUIDBehavior;

/**
 * A task to bootstrap a folder.
 *
 * @author V.Vorobev
 */
public class FolderBootstrapTask extends BootstrapResourcesTask {

    private String folderName;

    public FolderBootstrapTask(String folderName) {
        super("Bootstrap folder", "Bootstraps content under folder " + folderName, ImportUUIDBehavior.IMPORT_UUID_CREATE_NEW);
        this.folderName = folderName;
    }

    /**
     * Accepts any resource under "/mgnl-bootstrap/*folderName*" including any subfolders.
     */
    @Override
    protected boolean acceptResource(InstallContext ctx, String resourceName) {

        return resourceName.startsWith("/mgnl-bootstrap") && resourceName.endsWith(".xml") && resourceName.contains(folderName);
    }
}