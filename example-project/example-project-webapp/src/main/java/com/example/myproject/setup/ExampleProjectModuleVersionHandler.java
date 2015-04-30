/**
 * This file Copyright (c) 2014 Magnolia International
 * Ltd.  (http://www.magnolia-cms.com). All rights reserved.
 *
 *
 * This file is licensed under the MIT License (MIT)
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 *
 */
package com.example.myproject.setup;

import info.magnolia.module.DefaultModuleVersionHandler;
import info.magnolia.module.InstallContext;
import info.magnolia.module.delta.SetPropertyTask;
import info.magnolia.module.delta.Task;
import info.magnolia.repository.RepositoryConstants;

import java.util.ArrayList;
import java.util.List;

/**
 * This class sets up our great example project.
 */
public class ExampleProjectModuleVersionHandler extends DefaultModuleVersionHandler {


//    public ExampleProjectModuleVersionHandler() {
//        register(DeltaBuilder.update("1.1", "Example project 1.1 has a bunch of cool new features.")
//                .addTask(new CheckAndModifyPropertyValueTask(
//                        "Set new rootFolder property.",
//                        "Setting new rootFolder property.",
//                        RepositoryConstants.CONFIG, "/modules/fs-browser-app/apps/fs-browser/subApps/browser/contentConnector",
//                        "rootFolder", "/your-mounted-nas-drive/current-work/magnolia/", "/another-mounted-drive/another-directory/"))
//        );
//    }

    @Override
    protected List<Task> getExtraInstallTasks(InstallContext installContext) {
        ArrayList<Task> tasks = new ArrayList<Task>();
        SetPropertyTask setPropertyTask = new SetPropertyTask(
                "Change the rootFolder property of fs-browser-app contentConnector.",
                RepositoryConstants.CONFIG, "/modules/fs-browser-app/apps/fs-browser/subApps/browser/contentConnector",
                "rootFolder", "C:/repo");
        tasks.add(setPropertyTask);
        return tasks;
    }
}
