# Enterprise Gateway Framework


El servicio de Enterprise Gateway Framework permite definir un punto de entrada único a DataPower para exponer múltiples servicios. La ventaja de esto es que ahorra el setup de red (VLAN, nuevos puertos, etc) a medida que crece la cantidad de servicios.
Por otro lado también facilita la definición de múltiples ambientes por aplicación.

## Implementación original

* http://www.ibm.com/developerworks/websphere/library/techarticles/1211_saddal/1211_saddal.html

## Modificaciones

* Permite la creación de múltiples gateway por dominio: DEV, QA, PROD
* No traslada el context root de la url al servicio expuesto. Ej: un request a http://gateway.pami.org.ar/servicio1/home se traslada a http://servicio1/home
