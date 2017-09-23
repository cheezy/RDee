# RDee

RDee is a gem that makes it easy to switch between different browsers when you are using
Selenium or Watir as your driver.  You can also easily switch between running on a local
browser or a browser that is part of a Selenium Grid on on Sauce Labs.

## Usage

RDee was designed to make it easy for your tests to switch between different browsers.  It
can select browsers that are running on your local machine or on a Selenium Grid.  The way
you select a browser is by calling one of the following methods:

````ruby
RDee.selenium_browser(target = :chrome, options = {})
# or
RDee.watir_browser(target = :chrome, options = {})
````

These methods take two optional parameters.  The first is the target browser.  The second
is options that can be passed to that browser when it is started.

### Specifying the target browser

As we saw in the previous section, you can specify the target browser by passing a symbol
to the `selenium_browser` or `watir_browser` methods.  The problem with this is that you
would have to change the code if you wanted to use a different browser.  RDee has made
this simpler by allowing you to set the target browser using an environment variable.
The environment variable is named `RDEE_BROWSER`.  A couple of typical usage patterns
are to set this in the `cucumber.yml` file for specific profiles or to simply set this
on the command-line when running the tests.  Here is an example of a `cucumber.yml` file:

````yml
default: RDEE_BROWSER=firefox --format pretty --color
chrome: RDEE_BROWSER=chrome --format pretty --color
safari: RDEE_BROWSER=safari --format pretty --color
````

From the command-line you could simply do this:

````
RDEE_BROWSER=chrome bundle exec cucumber
````

The format of the target passed to the methods or set in the environment variable determines
what browser, version, and host os you get.  The format follows the following pattern:

````
firefox30_win8
````

The first part of the target determines what browser to use.  At the current time you can
specify `firefox`, `chrome`, `ie`, `safari`, `phantomjs` or `ios`.  In the near future we will be supporting more
mobile platforms so stay tuned.

Immediately following the browser is the version.  This is optional and if you do not specify
it will select whatever version is available.  It is up to you to make sure that the browser
and version combination are valid.

For mobile the version is the version of the OS you require replacing the
dot with an underscore.  For example, `:ios10_2` will use iOS 10.2 and `:android4_4`
will use Android 4.4.  You will provide the additional information like the device type as 
additional values.  See below.

Following the version there is an underscore followed by the host os.  This value is also
optional.  Currently the following host os values are available:


| host | description |
| --- | --- |
| win10 | Windows 10 |
| win81 | Windows 8.1 |
| win8 | Windows 8 |
| win7 | Windows 7 |
| winxp | Windows XP |
| mountain_lion | OS X 10.8 |
| mavricks | OS X 10.9 |
| yosemite | OS X 10.10 |
| el_capitan | OS X 10.11 |
| sierra | macOS 10.12 |
| linux | Linux |
| ios | 'iOS' |
| android | 'Android' |

The host os value is typically used when running the tests on a Selenium Grid.  It is up to
you to ensure that the host and requested browser combination exist on your grid.

### Additional Configurations

Additional parameters can be set by calling the configure method on the RDee module.  First
of all, you can set the `url` value.  If the `url` is set RDee will attempt to make a remote
connect to the grid specified by the `url`.  Additionaly you can specify whether it should
use a persistent http connection as well as specify additional parameters that should be
sent to a specific type of browser when it is used.  Here are examples:

````ruby
RDee.configure do | config |
  config.url = 'http://path.to.selenium.grid/wd/hub'
  config.persistent_http = true
  config.chrome_options = { :switches => %w[--disable-extensions] }
  config.firefox_options = { :switches => %w[--disable-popups] }
  config.ie_options = { :switches => %w[--disable-popups] }
  config.safari_options = { :switches => %w[--disable-popups] }
  config.ios_options = { :switches => %w[--disable-popups] }
  config.android_options = { :switches => %w[--disable-popups] }
end
````

### Mobile Specific Additional Settings
Mobile is more complex that the standard desktop browsers.  In order to get everything
to work properly on a mobile platform you will need to provide some additional information.
Here is an example:

````ruby
mobile_capabilities = {
  appiumVersion: '1.6.4',
  deviceName: 'iPhone Simulator',
  deviceOrientation: 'portrait'
}
RDee.watir_browser(target = :ios10_2, desired_capabilities: mobile_capabilities)
````

For Android it is extremely simular:

````ruby
mobile_capabilities = {
  appiumVersion: '1.6.4',
  deviceName: 'Google Nexus 7 HD Emulator',
  deviceOrientation: 'portrait'
}
RDee.watir_browser(target = :android4_4, desired_capabilities: mobile_capabilities)
````


Another way to specify these additional capabilities is to specify them in the configure
block like this:

````ruby
RDee.configure do | config |
  config.url = 'http://path.to.selenium.grid/wd/hub'
  config.ios_capabilities = {
    appiumVersion:      '1.6.4',
    deviceName:         'iPhone Simulator',
    deviceOrientation:  'portrait'
  }
  config.android_capabilities = {
    appiumVersion:      '1.6.4',
    deviceName:         'Google Nexus 7 HD Emulator',
    deviceOrientation:  'portrait'
  }
end
````

Using the config allows us to set the values via environment variables without changing code.

````ruby
RDee.configure do | config |
  config.url = 'http://path.to.selenium.grid/wd/hub'
  config.ios_capabilities = {
    appiumVersion:      ENV['ios_appiumVersion'],
    deviceName:         ENV['ios_deviceName'],
    deviceOrientation:  ENV['ios_deviceOrientation']
  }
  config.android_capabilities = {
    appiumVersion:      ENV['android_appiumVersion'],
    deviceName:         ENV['android_deviceName'],
    deviceOrientation:  ENV['android_deviceOrientation']
  }
end
````

To see what options you should use please look at the
[Sauce Labs Configurator](https://wiki.saucelabs.com/display/DOCS/Platform+Configurator#/).


## Installation

Add this line to your application's Gemfile:

    gem 'RDee'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install RDee


## Contributing

1. Fork it ( https://github.com/[my-github-username]/rd/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
