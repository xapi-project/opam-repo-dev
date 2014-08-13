xapi-project source packages
============================

To build the xapi-project toolstack components from source:

First install common development tools and headers:
```
apt-get install build-essential libxen-dev libvirt-dev autoconf m4
```

Second install the [opam](http://opam.ocaml.org/) source package manager.

Initialise an opam configuration and add this repo: (note this will install the OCaml compiler from source,
so you don't need to worry about distro package versions)
```
opam init --comp=4.01.0
eval `opam config env`
opam remote add xapi-project git://github.com/xapi-project/opam-repo-dev
```

To build xapi:
```
opam install xapi
```

Testing a code change
---------------------

If you want to change some library code, then you should recompile all
the components that depend on that library -- opam handles this for you
automatically.

Consider making a change to stdext. First clone the relevant branch and make
your change:
```
git clone git://github.com/xapi-project/stdext
```
Next tell opam to use the custom version:
```
opam remove stdext
opam pin stdext stdext
```
Next install the component you want to test:
```
opam install xapi
```
After making new changes to stdext, it sufficies to:
```
opam update
opam upgrade
```

How does this relate to [xenserver/buildroot]?
----------------------------------------------

The [xenserver/buildroot] repo creates binary packages of released software, easily installable
via a distro's native package manager. These binary packages are intended for users.

Source packages built from this repo are intended for developers: quickly making changes, recompiling and
testing.
