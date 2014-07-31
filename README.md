# Mesa Verde Condo Website

## Building 

This project is build using 'webgen'.

webgen requires Ruby 1.8.7  (ruby-install ruby 1.8.7)

    ruby-install ruby 1.8.7
    cd <dir>/mvcondo
    gem install bundler
    bundle

Note: it is broken with the 0.5+ version of webgen.

To run the generator:

    cd <dir>/mvcondo
    webgen

Project input is read from the 'src' directory.
Project output is written to the 'output' directory.

## Deploying

The project is hosted on github pages.

Output HTML is stored on the `gh-pages` branch.

To deploy:

    cd <dir>/mvcondo
    rm -rf /tmp/output
    cp -r output /tmp
    g co gh-pages
    rm -rf .
    cp -r /tmp/output/* .
    g a .
    g c -am'update website'
    g push
    g co master

See `Github Pages` to learn more.

## Rake Tasks

    rake build        # run the build command
    rake deploy       # run the deploy script 

  
