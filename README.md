Disclosure Backend Cookbook
=================================

This cookbook configures a backend server for the disclosure-backend python
app. The prerequisites to use this are:

1. SSH access to the server (in our case, disclosure.caciviclab.org)
2. Passwordless sudo to that server, e.g. `%opencal ALL=(ALL:ALL) NOPASSWD:ALL`

## Setup

    $ gem install berkshelf
    $ berks install


## Deploying

To run this cookbook on the server, simply run the script:

```
./run.sh
```
