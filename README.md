# Kuali Open Library Environment
http://www.kuali.org/ole
- - -
## OLE QA Testing Framework
- - -

### Open Library Environment Quality Assurance Testing Framework
- - -
This is a testing framework for the Kuali Open Library environment.  It
is be used to define OLE pages and screen elements for OLE regression
testing scripts and the OLE Smoketest application.

### Configuration

Options can be set in the file config/options.yml.  Here is a list of the
options hash keys and their meanings:

- :url:
    - The URL of the main OLE installation you will be testing.
- :docstore_url:
    - The URL of the OLE Document Store installation.
- :headless?:
    - If set to true, the testing session will be run headlessly
    in an XVFB session handled by the Headless gem.
-  :implicit_wait:
    - Used to set Selenium Webdriver's default wait period.
- :explicit_wait:
    - Used to set the Watir Webdriver default wait period.
- :doc_wait:
    - Used to set the maximum timeout for an OLE eDocument
    to finish routing to the next step in its workflow.
-  :browser:
    - Pass an active instance of Watir Webdriver if you want to start
    an OLE Framework session with an already-running browser.

These options can be set manually, or using the Rake configurator task.
Use the Rake show_config task to see the current options settings at any time.