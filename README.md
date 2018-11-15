# docker-global-protect-vpn

Dockerized VPN with global protect

Remote Desktop
==============

There are many, many VPNs in this world and many, many different ways of making them work. None of them are great, this one included. Hopefully this one is less not great than most.

What is this?
-------------

This is a containerized VPN client that will:

 - Connect to a Remote machine;
 - Let you connect to a remote desktop there from your own desktop.

Um, how?
--------

1. Start it up: `./run-local`
2. When prompted enter your:

    1. Username;
    2. Password;
    3. 2FA authentication code.

3. Start your _Remote Desktop Client_.
4. Connect to `localhost`, accepting blindly any certificate prompts in the all-familiar way.  

By default you will be connected to `host.example.com`. This can be changed by setting `REMOTEDESKTOP_HOST` in the environment when invoking the `./run-local` script.
Also the VPN endpoint can be changed with the `GLOBALPROTECT_PORTAL` setting. The deafult will be `some.vpn.host.example.com`

Remote Desktop Clients
----------------------

* _macOS_: Use [Microsoft Remote Desktop 8.0](https://itunes.apple.com/nl/app/microsoft-remote-desktop-8-0/id715768417?l=en&mt=12). (Don't use version 10: it doesn't work properly with some remote machines.)
* _Linux_: Try [Remmina](https://www.remmina.org/wp/).
* _Windows_: Use the built in _Remote Desktop_.
