---
title      : "Project Management"
date       : 2019-08-11T01:02:08+02:00
publishdate: 2019-08-12T01:02:08+02:00
draft      : false
comments   : false
weight     : 5
revision   : 0
series:
- Comparision
categories:
- productivity
- google
tags:
- management
- app-script
---


## Agile Methodologies

* [What is project management?](https://en.wikipedia.org/wiki/Project_management)
* [Critical chain project management](Critical chain project management)

- Scrum
- Kanban
<!-- more -->

{{% warning %}}
We all have only $$1440 minutes$$ everyday!
{{% /warning %}}

Management could focus on niche area like

1. Product
2. Process
3. Production rate


Project Name | FREE | Reporting
-------------|------|----------
[Project Open](http://www.project-open.com/en/install-ubuntu-xenial-xerus) | y | y
[Open Project](https://www.openproject.org/download-and-installation/) | y | ?
[Taiga](https://tree.taiga.io/project/avimehenwal-project-life/admin/project-profile/details) | y | n
`todoist` | y | y

## Task analysis

is the analysis of how a task is accomplished

1. including a detailed description of both manual and mental activities
2. task and element duration's
3. task frequency,
4. task allocation,
5. task complexity,
6. environmental conditions,
7. necessary clothing and equipment,

and any other unique factors involved in or required for one or more people to perform a given task.[1]

{{% note %}}
Open Source Isn't A Business Model, It's A Market Strategy
{{% /note %}}

## Implementation

* [Using Gantt chart for timelines and dependency]({{< relref "blog/gantt-chart/index.md" >}})
* [Google Sheet and Calender's Integration using `app script`](https://www.youtube.com/watch?v=qXG-i_sG8CI)

## App Script

{{% note %}}
Provides power to use google tools like Apps
{{% /note %}}

* Apps Script services provide ways for your script to easily access data on Google and external systems.
* Server side JS that runs on google cloud, giving your apps data from Gcloud
* App Script is **Serverless**
* *Built-In* with in GSuite
  * docs/sheets, slides
* *Advanced service* uses HTTP REST API
  * Big query
  * YouTube
* Is NOT client side and does not run on browser
* JavaScript syntax, to automate various workflows b/w google projects
* *Tools* --> *App Script Editor*
* Application (sheets) have data (sheets-files) with ranges and cells
* Use breakpoints and debug functions to list app available google provided classes in `this` object
* Google provides **Google script Dashboard** to list and audit all scripts which were run with status.
* Can use services like `YouTube`, `analytic`, `translate`, `bigquery`
* Types os app scripts
  * Standalone
  * Add-Ons (docs, sheets, Forms), document bound scripts
  * Simple web apps & site bounding gadgets
* Save App Scripts in your google drive
* Google App Maker uses app scripts in the back-end
* AppScript Apps will prompt user for OAuth prompt.

### Use cases

* send emails from spread sheet trackers
* Plan visits to all addresses from spreadsheet
* Video statistics from YouTube in sheets for analysis and research purposes
* Run App scripts from anywhere using `AppScript Execution API`
* Auto generating google forms (standalone app script)
* Put data from multiple Forms in one spreadsheet/doc or external database
* Pragmatically create slides
* Scan data, title, amount, vendor from expense sheet and auto-fill in form, to transfer it to google sheets without ever leaving the Gmail
* Develop chatbots for Hangout call
* [Commandline App script Projects](https://github.com/google/clasp)
* Sending SMS on meeting using Google colander
* [Custom Menu to run App Scripts](https://medium.com/@dontmesswithjo/custom-menus-94d8e4325b0d)
* [Google sheets to Gcal Sync](https://cloud.google.com/blog/products/g-suite/g-suite-pro-tip-how-to-automatically-add-a-schedule-from-google-sheets-into-calendar)
* Send email on a link click on page
* Google Apps Script can interact with APIs from all over the web like *github* etc.
* Make full fledged web-applications out of sheets with UI and appscript as business Logic.
* Google internally uses a AppScript based project management tool for Drive and docs team
*


{{< code numbered="true">}}
function myFunction() {
  var sheet = SpreadsheetApp.getActiveSheet();
  var address = sheet.getRange("A1").getValue();

  var map = Maps.newStaticMap().addMarker(address);
  Logger.log(map.getMapUrl());
  sheet.getRange("B1").setValue(map.getMapUrl());

  MailApp.sendEmail("email@addr", "Subject", "body map.getMapUrl()");
}
{{< /code >}}

## Building your own PM solution

* Use all the power provided by google Suite, `adwords`, `sheets`, `analytics`, `search`
* inbuilt sharing capabilities
* 4 Google sheets Files, which talks amongst themselves using push/pull
  * Central Tracker
  * Content Tracker
  * Outreach Tracker
  * Client Tracker
* Never touch Client Files, updated TRACKERS and client files are automatically updated
* [Use google sheets as database to your website](https://medium.com/@jaejohns/how-to-use-google-sheets-as-your-website-database-b0f2f13d0396)
* Something like [WOrkep](https://app.workep.co)
* One Google Drive Folder per project where you put your competitive analysis, research etc.
  * Project Files could me sheets/docs/slides, videos, audio notes, `github-integration`, time-tracking etc.
* How to keep associated links for a project together, capture and present them, GKeep?
* [data-studio](https://www.youtube.com/watch?v=gug-XQ0IJA8) for creating [dashboards](https://datastudio.google.com)
* Able to generate reports that no tool can do
* [Google OAUTH PLaygroubd](https://developers.google.com/oauthplayground/)

### Google sheets functions

1. sparklines
2. query
3. Join
4. textjoin
5. concatinate &
6. pivot table
   1. Protect range
   2. `sum` and `sumif` functions
   3.
7. Geo charts

## Footnotes

[^1]: [Google Codelab Tutorial](https://codelabs.developers.google.com/codelabs/apps-script-intro/#0)
[^2]: [Google codelabs](https://codelabs.developers.google.com/)
[gsuitedevs/apps-script-samples](https://github.com/gsuitedevs/apps-script-samples)