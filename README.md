
HTTP Transport Authentication
-----------------------------

https://www.ietf.org/archive/id/draft-schinazi-httpbis-transport-auth-05.html


There is a Vagrant setup that does all the setup.  To use it:

```console
$ git clone https://github.com/guardianproject/HTTPTransportAuthentication.git
$ cd HTTPTransportAuthentication/TransportAuthVM/
$ vagrant up
$ vagrant ssh
vagrant@TransportAuthVM:~$ 
vagrant@TransportAuthVM:~$ cd HTTPTransportAuthentication/
vagrant@TransportAuthVM:~/HTTPTransportAuthentication$ ./runTransportAuthServer.sh
```

Then in a separate terminal:

```console
$ cd HTTPTransportAuthentication/TransportAuthVM/
$ vagrant ssh
vagrant@TransportAuthVM:~$ cd HTTPTransportAuthentication/
vagrant@TransportAuthVM:~/HTTPTransportAuthentication$ ./runTransportAuthJavaClientWithHMAC.sh 
```
