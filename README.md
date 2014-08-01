# Mesa Verde Condo Website

## Repo Setup

You must have update rights on the repo.

    git clone git@github.com:andyl/mvcondo.git    # clone the repo
    git branches -a                               # show all branches
    git checkout -b gh-pages origin/gh-pages      # make a local copy of the 'gh-pages' branch

## Support Software

This project is built using an old version of `webgen`, which only
runs on Ruby 1.8.7.

    ruby-install ruby 1.8.7
    cd <dir>/mvcondo
    gem install bundler
    bundle

## Editing and Building the Site

Project input is read from the `src` directory.

To run the generator:

    cd <dir>/mvcondo
    webgen

Project output is written to the `output` directory.

## Deploying the Site

The project is hosted on github pages.  Output HTML is stored on the
`gh-pages` branch.

To deploy:

    cd <dir>/mvcondo
    rm -rf /tmp/output
    cp -r output /tmp
    git checkout gh-pages
    rm -rf .
    cp -r /tmp/output/* .
    git add .
    git commit -am'update website'
    git push
    git checkout master

See `Github Pages` to learn more.

## Rake Tasks

    rake build        # run the build command
    rake deploy       # run the deploy script 

  
